import 'package:flutter/material.dart';

class ThumbnailBox extends StatelessWidget {
  ThumbnailBox({
    required this.thumbnailHeight,
    required this.thumbnailWidth,
  });
  double thumbnailHeight;
  double thumbnailWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: thumbnailWidth,
      height: thumbnailHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueAccent,
      ),
    );
  }
}
