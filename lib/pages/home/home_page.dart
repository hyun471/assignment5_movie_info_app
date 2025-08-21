import 'package:assignment5_movie_info_app/pages/home/views/thumbnail_box.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  double thumbnailHeight = 150;
  double thumbnailWidth = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('가장 인기있는'),
                SizedBox(height: 5),
                Container(
                  width: double.infinity,
                  height: 500,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.amber,
                  ),
                ),
                SizedBox(height: 5),
                Text('현재 상영중'),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  height: thumbnailHeight,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          ThumbnailBox(
                            thumbnailHeight: thumbnailHeight,
                            thumbnailWidth: thumbnailWidth,
                          ),
                          index != 4
                              ? SizedBox(width: 10)
                              : SizedBox.shrink(),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),
                Text('인기 순'),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  height: thumbnailHeight,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: thumbnailWidth + 20,
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Align(
                                  alignment:
                                      Alignment.centerRight,
                                  child: ThumbnailBox(
                                    thumbnailHeight:
                                        thumbnailHeight,
                                    thumbnailWidth:
                                        thumbnailWidth,
                                  ),
                                ),
                                Positioned(
                                  left: -5,
                                  bottom: -15,
                                  child: Text(
                                    '${index + 1}',
                                    style: TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                      fontSize: 80,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          index != 4
                              ? SizedBox(width: 10)
                              : SizedBox.shrink(),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),
                Text('평점 높은순'),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  height: thumbnailHeight,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          ThumbnailBox(
                            thumbnailHeight: thumbnailHeight,
                            thumbnailWidth: thumbnailWidth,
                          ),
                          index != 4
                              ? SizedBox(width: 10)
                              : SizedBox.shrink(),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),
                Text('개봉예정'),
                SizedBox(height: 5),
                SizedBox(
                  width: double.infinity,
                  height: thumbnailHeight,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          ThumbnailBox(
                            thumbnailHeight: thumbnailHeight,
                            thumbnailWidth: thumbnailWidth,
                          ),
                          index != 4
                              ? SizedBox(width: 10)
                              : SizedBox.shrink(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
