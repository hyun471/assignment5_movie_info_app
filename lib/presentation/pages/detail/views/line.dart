import 'package:flutter/material.dart';

/// 디테일 페이지 구분선 위젯
class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[800],
    );
  }
}
