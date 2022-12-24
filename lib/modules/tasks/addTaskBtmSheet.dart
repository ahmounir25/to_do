import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/shared/components/UI_Utilies.dart';
import 'package:to_do/shared/network/local/fireBase_Utilities.dart';
import 'package:to_do/shared/styles/colors.dart';
import 'package:to_do/shared/styles/myThemeData.dart';

class addTaskSheet extends StatefulWidget {
  @override
  State<addTaskSheet> createState() => _addTaskSheetState();
}

class _addTaskSheetState extends State<addTaskSheet> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Add New Task ",
              style: myThemeData.lightTheme.textTheme.headline2,
            ),
            Form(
              key: formKey,
              child: Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: 1,
                      decoration: InputDecoration(
                          labelText: 'Title',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      controller: titleController,
                      validator: (txt) {
                        if (txt != null && txt.isEmpty) {
                          return "Please Enter Title ";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      controller: descriptionController,
                      validator: (txt) {
                        if (txt != null && txt.isEmpty) {
                          return "Please Enter Description";
                        }
                        return null;
                      },
                    )
                  ],
                ),
              ),
            ),
            Text(
              "Select Date",
              style: myThemeData.lightTheme.textTheme.headline2
                  ?.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: 5,
            ),
            InkWell(
              onTap: () {
                selectDate();
              },
              child: Text(
                "${selectedDate.day} / ${selectedDate.month} / ${selectedDate.year}",
                style: myThemeData.lightTheme.textTheme.headline2,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: blueColor, fixedSize: Size(150, 50)),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Task task = Task(
                        title: titleController.text,
                        description: descriptionController.text,
                        date: DateUtils.dateOnly(selectedDate)
                            .microsecondsSinceEpoch);
                    showLoading("Loading..", context);
                    addTaskToFireStore(task).then((value) {
                      hideLoading(context);
                      showMessage('Task Aded Successfully', context, 'Ok', () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      });
                    }).catchError((error) {
                      print(error);
                    });
                    // hideLoading(context);
                    setState(() {});
                    // Navigator.pop(context);
                    // print("Done Successfully");
                  }
                },
                child: Text("Add Task"))
          ],
        ),
      ),
    );
  }

  void selectDate() async {
    DateTime? Date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (Date != null) {
      selectedDate = DateUtils.dateOnly(Date);
      setState(() {});
    }
  }
}
