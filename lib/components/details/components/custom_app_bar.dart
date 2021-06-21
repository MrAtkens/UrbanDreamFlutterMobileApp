import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final double rating;
  final int viewCount;

  CustomAppBar({required this.rating, required this.viewCount}) : super(
      child: AppBar(),
      preferredSize: Size.fromHeight(AppBar().preferredSize.height)
  );

  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back, size: 20)
                ),
              ),
              Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Text(
                      "$viewCount",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(Icons.remove_red_eye, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      "$rating",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(Icons.star, size: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
