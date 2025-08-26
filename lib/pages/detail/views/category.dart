import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  List<String> genres;
  Category({super.key, required this.genres});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        // ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: genres.length,
        //   itemBuilder: (context, index) {
        //     return Row(
        //       children: [
        //         CategoryBox(genres: genres[index]),
        //         index == genres.length - 1
        //             ? SizedBox.shrink()
        //             : SizedBox(width: 3),
        //       ],
        //     );
        //   },
        // ),
        SizedBox(height: 5),
      ],
    );
  }
}

class CategoryBox extends StatelessWidget {
  String genres;
  CategoryBox({required this.genres});

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
          style: TextStyle(color: Colors.indigoAccent),
        ),
      ),
    );
  }
}
