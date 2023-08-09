import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:squid_game/utils/constants.dart';
import 'package:squid_game/widgets/navbar.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileMainContent(),
      desktop: DesktopMainContent(),
    );
  }
}

Widget DesktopMainContent() {
  return Expanded(
    child: Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(squid_game),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(figures),
                        SizedBox(width: 20),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Life is like a Game, there are many players.\nif you don't play with them, they'll play with you.",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                    color: Colors.white, fontSize: w! / 70),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.trending_up, color: Colors.white),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Trending #1',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: w! / 70),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 42,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(20),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Color(0xffe50919),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Continue Watching',
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          NavButton('S1'),
                          NavButton('E9'),
                          NavButton('2021'),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 270,
                          ),
                          Image.asset(imdb),
                          SizedBox(
                            width: 40,
                          ),
                          NavButton('8.2'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Image.asset(squid),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget MobileMainContent() {
  return Container();
}
