import 'package:flutter/material.dart';

import 'package:to_do/modules/settings/setting.dart';
import 'package:to_do/modules/tasks/addTaskBtmSheet.dart';
import 'package:to_do/modules/tasks/taskScreen.dart';
import 'package:to_do/shared/styles/myThemeData.dart';
import 'package:calendar_timeline/calendar_timeline.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<Widget> tabs = [taskScreen(), settingScreen()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do Tasks',
            style: myThemeData.lightTheme.textTheme.headline2
                ?.copyWith(color: Colors.white)),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list, size: 30), label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                label: ''),
          ],
        ),
      ),
      body: tabs[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTaskBottomSheet(context);
        },
        child: Icon(Icons.add),
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.white,
            width: 3,
          ),
        ),
        elevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void showAddTaskBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            height: MediaQuery.of(context).size.height * .7,
            child: addTaskSheet());
      },
      isScrollControlled: true,
      isDismissible: true,
    );
  }
}
