import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:squid_game/utils/constants.dart';
// add responsive_builder package in pubspec file

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileNavBar(),
      desktop: DesktopNavBar(),
    );
  }
}

Widget MobileNavBar() {
  return Container(
    // color: Colors.yellow,
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.menu),
        navLogo(),
      ],
    ),
  );
}

Widget DesktopNavBar() {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),
    // color: Colors.yellow,
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu),
        Row(
          children: [
            NavButton('Home'),
            NavButton('About'),
            NavButton('Cast'),
            NavButton('Trailor'),
          ],
        ),
        navLogo(),
      ],
    ),
  );
}

Widget navLogo() {
  return Container(
    // color: Colors.blue,
    height: 60,
    width: 180,
    child: Image.asset(netflix),
  );
}

Widget NavButton(String T1) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20,),
    child: TextButton(
      child: Text(
        T1,
        style: TextStyle(
          fontSize: 18,
          color: T1 == 'Home' ? Colors.red : Colors.white,
        ),
      ),
      onPressed: () {},
    ),
  );
}
