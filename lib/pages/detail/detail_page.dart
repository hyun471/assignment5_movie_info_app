import 'package:assignment5_movie_info_app/pages/detail/views/category.dart';
import 'package:assignment5_movie_info_app/pages/detail/views/line.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Moana 2',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '2024-11-27',
                        style: TextStyle(color: Colors.black45),
                      ),
                    ],
                  ),
                  Text(
                    'The ocean is calling them back',
                    style: TextStyle(color: Colors.black45),
                  ),
                  Text(
                    '100분',
                    style: TextStyle(color: Colors.black45),
                  ),
                  SizedBox(height: 10),
                  line(),
                  Category(),
                  line(),
                  SizedBox(height: 5),
                  Text(
                    'After receiving an unexpected call from her wayfinding ancestors. After receiving an unexpected call from her wayfinding ancestors. After receiving an unexpected call from her wayfinding ancestors. After receiving an unexpected call from her wayfinding ancestors.',
                  ),
                  SizedBox(height: 5),
                  line(),
                  SizedBox(height: 20),
                  Text(
                    '흥행정보',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          height: 70,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black45,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Text('6.949'),
                              Text('평점'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Container(
                          width: 130,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 130,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 130,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: 130,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
