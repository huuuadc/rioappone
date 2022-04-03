import 'package:flutter/material.dart';
import 'package:rioappone/screens/home/components/body.dart';
import 'package:rioappone/screens/menudrawer/memudrawer_screen.dart';
import 'package:rioappone/screens/searchqr/searchqr_screen.dart';
import 'package:rioappone/screens/setting/setting_screen.dart';

class Background extends StatefulWidget {
  const Background({Key? key}) : super(key: key);

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  int _selectedIndex = 0;
  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    const Body(),
    const Text("B"),
    const SearchQR_Screen(),
    const Text("D"),
    const Setting_Screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.blue,
            //elevation: 20.0,
            //dismissDirection: DismissDirection.horizontal,
            content: Center(
              child: Text(
                'Không Thể Trở Về',
              ),
              heightFactor: 2.0,
            )));
        return false;
      },
      // child: const BottomAppBar(
      //   shape: CircularNotchedRectangle(),

      // ),

      child: Scaffold(
        drawer: const MenuDrawer_Screen(),
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: _GooglePlayAppBar(),
          ),
          actions: [
            IconButton(
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _selectedIndex = 4;
                  });
                })
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'Note',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
              backgroundColor: Colors.blue,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white54,
          onTap: _onItemTapped,
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Add your onPressed code here!
        //   },
        //   backgroundColor: Colors.green,
        //   child: const Icon(Icons.navigation),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // extendBody: true,
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget _GooglePlayAppBar() {
  return Container(
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // ignore: avoid_unnecessary_containers
        Container(
          child: const IconButton(
            icon: Icon(Icons.star, color: Colors.white),
            onPressed: (null),
          ),
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          child: const Text(
            'RioAppOne',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        //ignore: avoid_unnecessary_containers
        Container(
          child: const IconButton(
              icon: Icon(
                Icons.star,
                color: Colors.white,
              ),
              onPressed: null),
        ),
      ],
    ),
  );
}
