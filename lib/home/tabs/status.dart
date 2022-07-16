import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsupflutter/comman/commanwidget.dart';

class Status extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: [
      Scaffold(
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: FloatingActionButton(
                  mini: true,
                  elevation: 0,
                  backgroundColor: Colors.black12,
                  onPressed: () {},
                  child: const Icon(
                    Icons.edit,
                    color: Colors.blueGrey,
                    size: 20,
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.teal,
                  child: Icon(
                    Icons.camera_alt,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Stack(children: const [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.teal,
                    backgroundImage: AssetImage("assets/images/ic_person.png"),
                  ),
                  Positioned(
                      top: 22,
                      left: 22,
                      child: CircleAvatar(
                        radius: 7,
                        child: Icon(
                          Icons.add,
                          size: 12,
                        ),
                      ))
                ]),
                title:
                    CommanWidget.textLayout("My status", 14, FontWeight.bold),
                subtitle: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: CommanWidget.textLayout(
                        "Tap to add status update", 12, FontWeight.normal)),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: CommanWidget.textLayoutWithColor(
                      "Recent updates", 12, FontWeight.normal, Colors.grey)),
              ListTile(
                leading: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.teal,
                  backgroundImage: AssetImage("assets/images/ic_person.png"),
                ),
                title:
                    CommanWidget.textLayout("Jack John", 14, FontWeight.bold),
                subtitle: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: CommanWidget.textLayout(
                        "38 minuts ago", 12, FontWeight.normal)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "Viewed updates",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.teal,
                  backgroundImage: AssetImage("assets/images/ic_person.png"),
                ),
                title:
                    CommanWidget.textLayout("Andy Rubin", 14, FontWeight.bold),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: CommanWidget.textLayout(
                      "Today, 12:16 pm", 12, FontWeight.normal),
                ),
              )
            ],
          )),
    ]);
  }
}
/*

*/
