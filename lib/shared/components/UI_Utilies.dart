import 'package:flutter/material.dart';

void showLoading(String txt, BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            actions: [
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text(txt), CircularProgressIndicator()],
                ),
              ),
            ],
          ));
}

showMessage(String txt, BuildContext context,String posBtn,VoidCallback posAction) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title:Text('$txt',style: TextStyle(fontSize:15),) ,
      actions: [
        TextButton(onPressed:posAction, child: Text(posBtn)),
      ],
    ),
  );
}

void hideLoading(BuildContext context) {
  Navigator.pop(context);
}
