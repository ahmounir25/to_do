import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/shared/network/local/fireBase_Utilities.dart';
import 'package:to_do/shared/styles/colors.dart';
import 'taskItem.dart';

class taskScreen extends StatefulWidget {
  @override
  State<taskScreen> createState() => _taskScreenState();
}

class _taskScreenState extends State<taskScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            selectedDate = date;
            setState(() {});
          },
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.black,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: blueColor,
          dotsColor: Colors.white,
          // selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
        Expanded(
            child: FutureBuilder<QuerySnapshot<Task?>>(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Text("Some Thing Went Wrong .."),
              );
            }
            var tasks = snapshot.data?.docs.map((e) => e.data()).toList();
            return ListView.builder(
              itemBuilder: (context, index) => taskItem(tasks?[index]),
              itemCount: tasks?.length ?? 0,
            );
          },
          future: getTaskFromFireStore(selectedDate),
        ))
      ],
    );
  }
}
