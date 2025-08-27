import 'package:flutter/material.dart';

/// 장르 리스트 위젯
class Category extends StatelessWidget {
  List<String> genres;
  Category({super.key, required this.genres});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genres.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  CategoryBox(genres: genres[index]),
                  index == genres.length - 1
                      ? SizedBox.shrink()
                      : SizedBox(width: 5),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }
}

/// 장르 박스 위젯
class CategoryBox extends StatelessWidget {
  String genres;
  CategoryBox({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[800]!, width: 1),
      ),
      child: Center(
        child: Text(
          genres,
          style: TextStyle(color: Colors.blueAccent),
        ),
      ),
    );
  }
}
