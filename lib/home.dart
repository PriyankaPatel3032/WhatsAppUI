import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:whatsupflutter/home/contacts.dart';
import 'package:whatsupflutter/home/tabs/calls.dart';
import 'package:whatsupflutter/home/tabs/chat/chats.dart';
import 'package:whatsupflutter/home/tabs/status.dart';

class home extends StatefulWidget {
  var loginUserName;

  home({Key? key, required this.loginUserName}) : super(key: key);

  @override
  State<home> createState() => home_state();
}

class home_state extends State<home> {
  @override
  Widget build(BuildContext context) {
    double orjWidth = MediaQuery.of(context).size.width;

    final _tabs = [
      Container(width: 20, child: Icon(Icons.camera_alt)),
      Container(
        width: orjWidth * 0.2,
        child: Row(
          children: [
            Tab(text: "CHATS"),
            SizedBox(
              width: 5,
            ),
            Tab(
                icon: CircleAvatar(
              radius: 9,
              backgroundColor: Colors.white,
              child: Text(
                "5",
                style: TextStyle(fontSize: 8, color: Colors.blue),
              ),
            )),
          ],
        ),
      ),
      Container(
        width: orjWidth * 0.2,
        child: Row(
          children: [
            Tab(text: 'STATUS'),
            SizedBox(
              width: 5,
            ),
            Tab(
              child: Icon(Icons.brightness_1, size: 9),
            ),
          ],
        ),
      ),
      Container(
        width: orjWidth * 0.2,
        child: Tab(text: 'CALLS'),
      ),
    ];

    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          actions: [
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(child: Text("New Group")),
                PopupMenuItem(child: Text("New broadcast")),
                PopupMenuItem(child: Text("Linked devices")),
                PopupMenuItem(child: Text("Starred messages")),
                PopupMenuItem(child: Text("Payments")),
                PopupMenuItem(child: Text("Settings")),
              ];
            })
          ],
          bottom: TabBar(isScrollable: true, tabs: _tabs),
        ),
        body: TabBarView(
          children: [
            Container(),
            Chats(loginUserName: widget.loginUserName),
            Status(),
            Calls()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigationToContacts(context);
          },
          backgroundColor: Colors.teal,
          child: const Icon(Icons.message),
        ),
      ),
    );
  }

  void navigationToContacts(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Contacts()));
  }
}
