import 'package:assignment5_movie_info_app/pages/detail/detail_page.dart';
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
    return GestureDetector(
      onTap: () {
        // TODO 나중에 수정
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage()),
        );
      },
      child: Container(
        width: thumbnailWidth,
        height: thumbnailHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
