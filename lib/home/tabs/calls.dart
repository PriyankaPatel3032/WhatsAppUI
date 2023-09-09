import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsupflutter/comman/commanwidget.dart';

class Calls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Container(
            height: 60,
            child: Center(
              child: ListTile(
                leading: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.teal,
                  backgroundImage: AssetImage("assets/images/ic_person.png"),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: CommanWidget.textLayout(
                                "Jack John", 14, FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.call_missed_outlined,
                                size: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: CommanWidget.textLayout(
                                    "yesterday", 13, FontWeight.normal),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: CommanWidget.textLayout(
                                    "05:30", 13, FontWeight.normal),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Center(child: Icon(Icons.video_call)),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
