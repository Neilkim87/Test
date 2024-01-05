import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ButtonNavigationBarExample extends StatefulWidget {
  const ButtonNavigationBarExample({super.key});

  @override
  State<ButtonNavigationBarExample> createState() =>
      _ButtonNavigationBarExampleState();
}

class _ButtonNavigationBarExampleState
    extends State<ButtonNavigationBarExample> {
  int _selectedIndex = 0;

  final screens = [
    const Center(
      child: Text('Home'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Search'),
    ),
    const Center(
      child: Text('Search'),
    ),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTap,
        currentIndex: _selectedIndex,
        //selectedItemColor: Theme.of(context).primaryColor,
        //unselectedItemColor: Colors.grey.shade400,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.house,
            ),
            label: "Home",
            tooltip: "What is this?",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
            label: "Search",
            tooltip: "What is this?",
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
            label: "Search",
            tooltip: "What is this?",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
            label: "Search",
            tooltip: "What is this?",
            backgroundColor: Colors.amber,
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
            ),
            label: "Search",
            tooltip: "What is this?",
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
