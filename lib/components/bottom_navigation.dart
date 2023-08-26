import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
 int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: calls',
      style: optionStyle,
    ),
    Text(
      'Index 1: locations',
      style: optionStyle,
    ),
    Text(
      'Index 2: chats',
      style: optionStyle,
    ),
    Text(
      'Index 2: settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: 'Locations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_rounded),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline_rounded),
            label: 'Hidden',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
      );
  
  }
}