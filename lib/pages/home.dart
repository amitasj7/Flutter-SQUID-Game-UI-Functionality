import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:squid_game/utils/constants.dart';
import 'package:squid_game/widgets/maincontent.dart';
import 'package:squid_game/widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
     Future<void> _redirect(String link) async {
      var url = Uri.parse(link);

      try {
        await launchUrl(url);
        print("your url is open $url");
      } catch (e) {
        print("your error is : $e");
      }
    }

  
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
        print("your index value is : $index");
        if (_selectedIndex == 0 || _selectedIndex == 1) {
        } else {
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            // background color rkhta hai
            context: context,
            builder: (BuildContext context) {
              return Container(
                // color: Colors.teal,
                height: h! * 0.40,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 50, 222, 191),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    ListTile(
                      trailing: IconButton(
                        icon: Icon(Icons.arrow_drop_down),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.google),
                      title: Text("Google"),
                      onTap: () {
                        String url = "https://www.google.com/";
                        _redirect(url);
                      },
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.facebook),
                      title: Text("facebook"),
                      onTap: () {
                        String url = "https://www.facebook.com/";
                        _redirect(url);
                      },
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.instagram),
                      title: Text("instagram"),
                      onTap: () {
                        String url = "https://www.instagram.com/";
                        _redirect(url);
                      },
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.whatsapp),
                      title: Text("whatsapp"),
                      onTap: () {
                        String url = "https://web.whatsapp.com/";
                        _redirect(url);
                      },
                    ),
                    ListTile(
                      leading: Icon(MdiIcons.share),
                      title: Text("Sharemarket NEWS"),
                      onTap: () {
                        String url =
                            "https://economictimes.indiatimes.com/markets";
                        _redirect(url);
                      },
                    ),
                  ]),
                ),
              );
            },
          );
        }
      });
    }

  


  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return ScreenTypeLayout(
      mobile: MobileScreenView(),
      desktop: DesktopScreenView(),
    );
  }

  MobileScreenView() {
    // int _currentindex = 0;

    // void _onItemTapped(int index) {
    //   setState(() {
    //     _currentindex = index;
    //   });
    // }
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    void _openDrawer() {
      print("hit function for open drawer");
      scaffoldKey.currentState?.openDrawer();
    }

 

    return Scaffold(
      // drawer: Drawer(
      //     child: Column(
      //         children: [
      //           Container(
      //             height: h !* 0.25,
      //             color: Colors.teal,
      //           ),
      //         ],

      //     ),
      // ),
      // appBar: AppBar(
      //   title: Text('hello'),
      // ),
      // drawer: Drawer(backgroundColor: Colors.teal,),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                child: Container(
              color: Colors.teal,
            )),
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("account"),
                    leading: Icon(MdiIcons.account),
                  );
                }),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  // stops: [50],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(255, 190, 74, 74),
                    Color(0xff000000),
                  ]),
            ),
            child: Image(
              image: AssetImage(bg),
              fit: BoxFit.cover,
              // color: Colors.pink.shade300,
              colorBlendMode: BlendMode.clear,
            ),
          ),
          SingleChildScrollView(
            child: Wrap(
              direction: Axis.vertical,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Container(
                  width: w,
                  padding: const EdgeInsets.only(
                    top: 40,
                  ),
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        iconSize: 20,
                        onPressed: _openDrawer,
                        icon: const Icon(
                          Icons.menu_rounded,
                          color: Colors.white,
                        ),
                      ),
                      navLogo(),
                    ],
                  ),
                ),
                const MainContent(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber,
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.pink,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Trailer",
            icon: Icon(Icons.tv_outlined),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "About",
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  DesktopScreenView() {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  // Color(0xffffffff),
                  Color(0xff000000),
                  // Colors.red[600], it is wrong
                  // Color(0xffff0000),
                  Color.fromARGB(255, 190, 74, 74),
                  Color(0xff000000),
                ],

                // colors: <Color>[Color(0xffd00070), Color(0xff000000)],
              ),
              color: Colors.pink,
              image: DecorationImage(
                image: AssetImage(bg),
                fit: BoxFit.cover,
              ),
            ),
            child: const Column(
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
      ),

    );
  }
}
