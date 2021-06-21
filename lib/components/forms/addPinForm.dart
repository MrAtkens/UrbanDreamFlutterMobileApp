import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:urbandreamuser/components/uploadImages/main.dart';
import 'package:urbandreamuser/stores/authStore.dart';
import 'package:urbandreamuser/stores/mapStore.dart';

class AddPinForm extends StatefulWidget {
  const AddPinForm(this.onClose);

  final void Function() onClose;
  @override
  _AddPinFormState createState() => _AddPinFormState();
}

class _AddPinFormState extends State<AddPinForm> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final List<String> _tags = [];

  GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authStore = context.read<AuthStore>();
    final mapStore = context.read<MapStore>();

    void _validate() {
      _form.currentState!.validate();
      mapStore.addPin(title: _titleController.text, description: _descriptionController.text,
      userId: authStore.user.id, tags: _tags, );
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _form,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Hero(
                      tag: "OFGOSDFG",
                      child: ImagePickerWidget(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    controller: _titleController,
                    validator: ValidationBuilder().minLength(10).maxLength(40).build(),
                    autofocus: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                        hintText: 'Description must be more than 10 characters'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _descriptionController,
                    autofocus: false,
                    validator: ValidationBuilder().minLength(40).maxLength(500).build(),
                    keyboardType: TextInputType.multiline,
                    minLines: 2,
                    maxLines: 40,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Description',
                        hintText: 'Description must be more than 40 characters'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child:   TextFieldTags(
                      initialTags: ["Nur-Sultan"],
                      tagsStyler: TagsStyler(
                          tagTextStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                          tagDecoration: BoxDecoration(color: Colors.orange[300], borderRadius: BorderRadius.circular(8.0), ),
                          tagCancelIcon: Icon(Icons.cancel, size: 18.0, color: Colors.orange[900]),
                          tagPadding: const EdgeInsets.all(6.0)
                      ),
                      textFieldStyler: TextFieldStyler(),
                      onDelete: (tag) {
                        _tags.remove(tag);
                      },
                      onTag: (tag) {
                        _tags.add(tag);
                      },
                      validator: ValidationBuilder().minLength(4).maxLength(50).build(),
                  )
                ),
                Container(
                  height: 50,
                  width: 250,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  decoration: BoxDecoration(
                      color: Colors.orange, borderRadius: BorderRadius.circular(10)),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    onPressed: () {
                      _validate();
                    },
                    child: Text(
                      'Sing In',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}