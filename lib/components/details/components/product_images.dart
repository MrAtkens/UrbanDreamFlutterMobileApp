import 'package:flutter/material.dart';
import 'package:urbandreamuser/models/MapPin.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    required this.mapPin,
  });

  final MapPin mapPin;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.mapPin..images[selectedImage].id.toString(),
              child: Image.network(widget.mapPin.images[selectedImage].url),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.mapPin.images.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(4),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Colors.grey),
        ),
        child: Image.network(widget.mapPin.images[index].url),
      ),
    );
  }
}
