import 'package:flutter/material.dart';
import 'package:rahulandaisha/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isLargeScreen = constraints.maxWidth > 800;

          double containerWidth = isLargeScreen ? width * 0.6 : width * 0.9;
          double containerHeight = isLargeScreen ? height * 0.6 : height * 0.8;

          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: width,
                color: secondary,
              ),
              Container(
                width: containerWidth,
                height: containerHeight,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(
                      20), // This makes the corners rounded
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.12),
                        child: Text('hi aisha! click on a month :)',
                            style: TextStyle(
                                fontSize: 45,
                                color: textColor,
                                fontFamily: 'playpenSans')),
                      ),
                    ),
                    Expanded(child: SizedBox()),
                    Padding(
                      padding: EdgeInsets.only(bottom: height * 0.06),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('Feb',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                      fontFamily: 'playpenSans')),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('March',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                      fontFamily: 'playpenSans')),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('April',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                      fontFamily: 'playpenSans')),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('May',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                      fontFamily: 'playpenSans')),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('June',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                      fontFamily: 'playpenSans')),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('July',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                      fontFamily: 'playpenSans')),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Aug',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                      fontFamily: 'playpenSans')),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Sept',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                      fontFamily: 'playpenSans')),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Oct',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                      fontFamily: 'playpenSans')),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Nov',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black.withOpacity(0.5),
                                      fontFamily: 'playpenSans')),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
