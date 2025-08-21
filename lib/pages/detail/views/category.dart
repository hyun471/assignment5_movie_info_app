import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Row(
          children: [
            Container(
              height: 32,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black45,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Animation',
                  style: TextStyle(color: Colors.indigoAccent),
                ),
              ),
            ),
            SizedBox(width: 3),
            Container(
              height: 32,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black45,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Adventure',
                  style: TextStyle(color: Colors.indigoAccent),
                ),
              ),
            ),
            SizedBox(width: 3),
            Container(
              height: 32,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black45,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Family',
                  style: TextStyle(color: Colors.indigoAccent),
                ),
              ),
            ),
            SizedBox(width: 3),
            Container(
              height: 32,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black45,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Comedy',
                  style: TextStyle(color: Colors.indigoAccent),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
      ],
    );
  }
}
