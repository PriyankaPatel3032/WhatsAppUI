import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Container(
        color: Colors.teal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_sharp),
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text("Select contact",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    Text("123 contacts",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))
                  ],
                )
              ],
            ),
            Row(
              children: [
                Icon(
                  (Icons.search),
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  (Icons.more_vert),
                  size: 25,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        ),
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Icon(
            (Icons.account_circle),
            size: 35,
            color: Colors.white,
          ),
          Text(
            "New group",
            style: TextStyle(color: Colors.black, fontSize: 13),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        children: [
          Icon(
            (Icons.account_circle),
            size: 35,
            color: Colors.white,
          ),
          Text(
            "New contact",
            style: TextStyle(color: Colors.black, fontSize: 13),
          ),
        ],
      ),
      ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Container(
            height: 60,
            child: ListTile(
                leading: const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.teal,
                  backgroundImage: AssetImage("assets/images/ic_person.png"),
                ),
                title: Text("Jack John",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                subtitle: Text("Hello there,What are you doing?",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.black))));
      })
    ])));
  }
}
