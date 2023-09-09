import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whatsupflutter/comman/commanwidget.dart';
import 'package:whatsupflutter/home/tabs/chat/message.dart';

class Chats extends StatefulWidget {
  var loginUserName;

  Chats({Key? key, required this.loginUserName}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<String> list = ['john', 'wonda', 'priyanka', 'conor', 'helen', 'james'];

  @override
  void initState() {
    list.remove(widget.loginUserName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return Container(
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Message(chatUserName: item.toString()),
                      ),
                    );
                  },
                  leading: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.teal,
                    backgroundImage: AssetImage("assets/images/ic_person.png"),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommanWidget.textLayout(item, 14, FontWeight.bold),
                      CommanWidget.textLayout("05:30", 13, FontWeight.normal),
                    ],
                  ),
                  subtitle: CommanWidget.textLayout(
                      "Hello there,What are you doing?",
                      13,
                      FontWeight.normal)),
            );
          }),
    );
  }
}
