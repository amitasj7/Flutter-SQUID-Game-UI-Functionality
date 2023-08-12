import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:squid_game/utils/constants.dart';
import 'package:squid_game/widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class MainContent extends StatefulWidget {
  const MainContent({super.key});

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileMainContent(context),
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
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(figures),
                        const SizedBox(width: 20),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Life is like a Game, there are many players.\nif you don't play with them, they'll play with you.",
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: w! / 70),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.trending_up,
                                      color: Colors.white),
                                  const SizedBox(
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
                  const SizedBox(
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
                          const Color(0xffe50919),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Continue Watching',
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontSize: 20,
                          // backgroundColor: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 270,
                          ),
                          Image.asset(imdb),
                          const SizedBox(
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

Widget MobileMainContent(context) {
  Future<void> _launchURL() async {
    var url = Uri.parse('https://www.imdb.com/title/tt10919420/');

    try {
      await launchUrl(
        url,
      );

      throw 'Could not launch $url';
    } catch (e) {
      print("your error is &&& $e");
    }
  }

  return Container(
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 150,
            child: Image.asset(
              squid_game,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: MediaQuery.of(context).size.width,
            // color: Colors.teal,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    // color: Colors.pink,
                    child: Column(
                      children: [
                        SizedBox(
                          height: h! / 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(figures),
                              const SizedBox(width: 20),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.trending_up,
                                            color: Colors.white),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Trending #1',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: w! / 15),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Life is like a Game,\n there are many players.\nif you don't play with them, \nthey'll play with you.",
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                          fontSize: w! / 28),
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
                ),
                Container(
                    height: MediaQuery.of(context).size.height,
                    // color: Colors.red,
                    width: MediaQuery.of(context).size.width * 0.40,
                    child: Image(
                      fit: BoxFit.fitHeight,
                      image: AssetImage(
                        squid_mobile,
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 11, right: 11),
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: 10,),
              // height: 42,
              height: 110,
              width: w,
              // color: Colors.teal,
              child: Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(20),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xffe50919),
                    ),
                  ),
                  onPressed: _launchURL,
                  child: const Text(
                    'Continue Watching',
                    style: TextStyle(
                      // letterSpacing: 1.2,
                      fontSize: 20,
                      // backgroundColor: Colors.teal,
                    ),
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  border: Border(
                bottom: BorderSide(color: Colors.black),
              )),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              // color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            NavButton('S1'),
                            NavButton('E9'),
                            NavButton('2021'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(imdb),
                              ),
                              SizedBox(width: 40),
                              NavButton('8.0'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: h! * 0.25,
                      width: w,
                      // color: Colors.purple,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                                margin: EdgeInsets.only(right: 10),
                                height: h,
                                width: w! * 0.32,
                                // color: Colors.teal,
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: AssetImage(series_images[index]),
                                ));
                          }),
                    ),
                  ],
                ),
              ))
        ],
      ),
    ),
  );
}
