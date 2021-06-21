import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:form_validator/form_validator.dart';
import 'package:urbandreamuser/stores/authStore.dart';
import 'package:urbandreamuser/stores/mapStore.dart';

import '../components/map.dart';
import '../components/searchBottom.dart';

class RegistrationPage extends StatefulWidget {
  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _secondNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegExp regExp = new RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  GlobalKey<FormState> _form = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authStore = context.read<AuthStore>();

    void _validate() {
      _form.currentState!.validate();
      authStore.registration(context, _firstNameController.text, _secondNameController.text, _emailController.text, _passwordController.text);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _form,
        child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/images/UrbanDream.png')),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                controller: _firstNameController,
                validator: ValidationBuilder().minLength(1).maxLength(50).build(),
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First name',
                    hintText: 'Enter your first name'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: _secondNameController,
                validator: ValidationBuilder().minLength(1).maxLength(50).build(),
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Second name',
                    hintText: 'Enter your second name'),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 15, bottom: 0),
              child: TextFormField(
                controller: _emailController,
                validator: ValidationBuilder().email().maxLength(50).build(),
                autofocus: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25.0, right: 25.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: _passwordController,
                autofocus: false,
                validator: ValidationBuilder().regExp(regExp, "Password must be 1 uppercase, 1 lowercase, 1 numeric, 1 special character")
                .minLength(8).build(),
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.orange, borderRadius: BorderRadius.circular(20)),
              // ignore: deprecated_member_use
              child: FlatButton(
                onPressed: () {
                  _validate();
                },
                child: Text(
                  'Sing Up',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text('Already have an account? Sing In')
            )
          ],
        ),
      ),
    )
    );
  }


}

