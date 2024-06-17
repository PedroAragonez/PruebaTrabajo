
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/SearchTab.dart';
import '../styles/colors.dart';

class Home extends StatefulWidget {
   Home({Key ? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

List<Map> navigationBarItems = [
  {'icon': CupertinoIcons.home, 'index': 0},
  {'icon': CupertinoIcons.bag, 'index': 0},
  {'icon': CupertinoIcons.search, 'index': 0},
  {'icon': CupertinoIcons.heart, 'index': 1},
  {'icon': CupertinoIcons.profile_circled, 'index': 2},
];

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void goToSchedule() {
    setState(() {
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> screens = [
      SearchTab(
      ),
      SearchTab(
      ),
      SearchTab(
      ),
      SearchTab(
      ),
      SearchTab(
      ),
      SearchTab(
      ),

    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(MyColors.primary),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        selectedItemColor: Color(MyColors.primary),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          for (var navigationBarItem in navigationBarItems)
            BottomNavigationBarItem(
              icon: Container(
                height: 55,

                child: Icon(
                  navigationBarItem['icon'],
                  color: _selectedIndex == 0
                      ? Colors.grey
                      : Colors.grey,
                ),
              ),
              label: '',
            ),
        ],
        currentIndex: _selectedIndex,
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
      ),
    );
  }
}
