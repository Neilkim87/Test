import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/nav_tab.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/post_video_button.dart';
import 'package:tiktok_clone/features/main_navigation/widgets/stf_screen.dart';

import '../../constants/gaps.dart';
import '../../constants/sizes.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  bool _isPostVideoButtonDown = false;
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onPostVideoButtonUp() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Record Video"),
        ),
      ),
      fullscreenDialog: true,
    ));
    setState(() {
      _isPostVideoButtonDown = false;
    });
  }

  void _onPostVideoButtonDown() {
    setState(() {
      _isPostVideoButtonDown = true;
    });
  }

  void _onPostVideoButtonCancel() {
    setState(() {
      _isPostVideoButtonDown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const StfScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const StfScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size16,
              horizontal: Sizes.size12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavTab(
                  text: "Home",
                  isSelected: _selectedIndex == 0,
                  icon: FontAwesomeIcons.house,
                  selectedIcon: FontAwesomeIcons.house,
                  onTapFunction: () => _onTap(0),
                ),
                NavTab(
                  text: "Discover",
                  isSelected: _selectedIndex == 1,
                  icon: FontAwesomeIcons.compass,
                  selectedIcon: FontAwesomeIcons.solidCompass,
                  onTapFunction: () => _onTap(1),
                ),
                Gaps.h24,
                GestureDetector(
                  onTapCancel: () => _onPostVideoButtonCancel(),
                  onTapDown: (details) => _onPostVideoButtonDown(),
                  onTapUp: (details) => _onPostVideoButtonUp(),
                  child: PostVideoButton(onTapDown: _isPostVideoButtonDown),
                ),
                Gaps.h24,
                NavTab(
                  text: "Inbox",
                  isSelected: _selectedIndex == 3,
                  icon: FontAwesomeIcons.message,
                  selectedIcon: FontAwesomeIcons.solidMessage,
                  onTapFunction: () => _onTap(3),
                ),
                NavTab(
                  text: "Profile",
                  isSelected: _selectedIndex == 4,
                  icon: FontAwesomeIcons.user,
                  selectedIcon: FontAwesomeIcons.solidUser,
                  onTapFunction: () => _onTap(4),
                ),
              ],
            ),
          )),
    );
  }
}
