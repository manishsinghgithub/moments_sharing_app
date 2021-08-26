import 'package:flutter/material.dart';
import 'package:moments/screens/homeList.dart';
import 'package:moments/screens/profile.dart';

class HomePage extends StatefulWidget {
  static String id = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _currentList = [
    HomeList(),
    //Notifications(),
    //Messages(),
    ProfilePage()
  ];
  void onTabBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xfff8b55f5),
          onPressed: () {},
          child: Icon(Icons.add),
          elevation: 10.0,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: _currentList[_currentIndex],
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.white30,
                  icon: Icon(
                    Icons.home,
                    color: Color(0xffff16fa1),
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Color(0xffff16fa1)),
                  ),
                ),
                /* BottomNavigationBarItem(
                backgroundColor: Colors.pinkAccent.shade100,
                icon: Icon(Icons.notifications),
                title: Text('Notification')),
            BottomNavigationBarItem(
                backgroundColor: Colors.pinkAccent.shade100,
                icon: Icon(Icons.message),
                title: Text('messages')),*/
                BottomNavigationBarItem(
                    backgroundColor: Colors.white30,
                    icon: Icon(
                      Icons.account_circle,
                      color: Color(0xffff16fa1),
                    ),
                    title: Text(
                      'Profile',
                      style: TextStyle(color: Color(0xffff16fa1)),
                    )),
              ],
              iconSize: 30.0,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: (value) {
                onTabBar(value);
              },
            ),
          ),
        ));
  }
}
