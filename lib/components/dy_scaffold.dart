import 'package:flutter/material.dart';
import 'package:dyvision/theme/colors.dart';
import 'package:dyvision/components/dy_bottom_app_bar.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:dyvision/pages/home_page.dart';
import 'package:dyvision/pages/lessons_page.dart';
import 'package:dyvision/pages/cloud_page.dart';
import 'package:dyvision/pages/profile_page.dart';

class DyScaffold extends StatefulWidget {
  DyScaffold({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<DyScaffold> {
  PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  List<Widget> pages = [
    HomePage(),
    LessonsPage(),
    CloudPage(),
    ProfilePage(),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          children: pages,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (_index) {
            setState(() {
              index = _index;
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          height: 23,
          width: 23,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: DyBottomAppBar(
        selectedIndex: index,
        onTabSelected: (index) {
          setState(() {
            this.index = index;
            _pageController.jumpToPage(
              index,
            );
          });
        },
        selectedColor: DyColors.primary,
        items: [
          DyBottomAppBarItem(
            iconData: OMIcons.home,
            text: "Home",
          ),
          DyBottomAppBarItem(
            iconData: OMIcons.book,
            text: "Learn",
          ),
          DyBottomAppBarItem(
            iconData: OMIcons.timeline,
            text: "Stats",
          ),
          DyBottomAppBarItem(
            iconData: OMIcons.person,
            text: "Profile",
          ),
        ],
      ),
    );
  }
}
