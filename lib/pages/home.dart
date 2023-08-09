import 'package:flutter/material.dart';
import 'package:squid_game/utils/constants.dart';
import 'package:squid_game/widgets/maincontent.dart';
import 'package:squid_game/widgets/navbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xffd00070), Color(0xff000000)]),
            color: Colors.pink,
            image: DecorationImage(
              image: AssetImage(bg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              NavBar(),
              SizedBox(
                height: 10,
              ),
              MainContent(),
            ],
          ),
        ),
      ),
    );
  }
}
