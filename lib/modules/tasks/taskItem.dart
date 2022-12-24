import 'package:flutter/material.dart';
import 'package:to_do/models/task.dart';
import 'package:to_do/shared/styles/colors.dart';
import 'package:to_do/shared/styles/myThemeData.dart';

class taskItem extends StatelessWidget {
  Task? task;
  taskItem(this.task);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.all(12),
      margin: EdgeInsetsDirectional.all(12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 4,
            height: 80,
            color: blueColor,
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${task?.title}",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 25,
                      ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("${task?.description}")
              ],
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: blueColor),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.done,
                    size: 30,
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
