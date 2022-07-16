import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsupflutter/comman/commanwidget.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 60,
          child: ListTile(
              leading: const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.teal,
                foregroundColor: Colors.teal,
                backgroundImage: AssetImage("assets/images/ic_person.png"),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommanWidget.textLayout("Jack John", 14, FontWeight.bold),
                  CommanWidget.textLayout("05:30", 13, FontWeight.normal),
                ],
              ),
              subtitle: CommanWidget.textLayout(
                  "Hello there,What are you doing?", 13, FontWeight.normal)),
        );
      }),
    );
  }
}
