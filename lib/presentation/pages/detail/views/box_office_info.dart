import 'package:assignment5_movie_info_app/domain/entity/movie_detail.dart';
import 'package:flutter/material.dart';

/// 흥행 정보를 나타내는 리스트
class BoxOfficeInfo extends StatelessWidget {
  MovieDetail state;
  BoxOfficeInfo({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Box(officeInfo: state.voteAverage, score: '평점'),
          SizedBox(width: 10),
          Box(officeInfo: state.voteCount, score: '평점투표수'),
          SizedBox(width: 10),
          Box(officeInfo: state.popularity, score: '인기점수'),
          SizedBox(width: 10),
          Box(officeInfo: state.budget, score: '예산'),
          SizedBox(width: 10),
          Box(officeInfo: state.revenue, score: '수익'),
        ],
      ),
    );
  }
}

/// 흥행 정보 박스
class Box extends StatelessWidget {
  String score;
  String officeInfo;
  Box({
    super.key,
    required this.score,
    required this.officeInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[800]!, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(score), Text(officeInfo)],
      ),
    );
  }
}
