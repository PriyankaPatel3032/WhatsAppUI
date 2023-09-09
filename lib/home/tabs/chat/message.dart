import 'dart:developer';

import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  String chatUserName;

  Message({Key? key, required this.chatUserName}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final List<ChatMessage?> _messageList = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    getMessages();
    _addChatListener();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
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
                    width: 3,
                  ),
                  Icon(
                    (Icons.account_circle),
                    size: 35,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(widget.chatUserName,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.video_call,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.call,
                    size: 25,
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
        Flexible(
          child: ListView.builder(
              itemCount: _messageList.length,
              itemBuilder: (_, index) {
                var messageData = _messageList[index];

                return Container(
                  alignment: messageData!.to.toString() == widget.chatUserName
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 2),
                    child: Text(
                      messageData.body.toJson()["content"],
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                );
              }),
        ),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.teal,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              margin: EdgeInsets.all(3),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: MediaQuery.of(context).size.width - 50,
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    hintText: "Enter message",
                  ),
                ),
              ),
            ),
            ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: CircleAvatar(
                  child: IconButton(
                    alignment: Alignment.center,
                    icon: Icon(
                      Icons.send,
                      size: 20,
                    ),
                    onPressed: () {
                      _sendMessage();
                    },
                  ),
                )),
          ],
        )
      ],
    )));
  }

  void _sendMessage() async {
    var msg = ChatMessage.createTxtSendMessage(
      targetId: widget.chatUserName,
      content: controller.text,
    );
    msg.chatType = ChatType.Chat;

    ChatClient.getInstance.chatManager.sendMessage(msg).then((value) {
      setState(() {
        _messageList.add(value);
        controller.clear();
      });
    });
  }

  Future<void> getMessages() async {
    try {
      // The conversation ID.
      String? convId = widget.chatUserName;
      // The conversation type.
      ChatConversationType convType = ChatConversationType.Chat;
      // The maximin number of messages
      int pageSize = 100;
      // The message ID from which to start retrieving
      String startMsgId = "";
      ChatCursorResult<ChatMessage?> cursor =
          await ChatClient.getInstance.chatManager.fetchHistoryMessages(
        conversationId: convId,
        type: convType,
        pageSize: pageSize,
        startMsgId: startMsgId,
      );

      _messageList.addAll(cursor.data);
      setState(() {});
    } catch (e) {}
  }

  void _addChatListener() {
    ChatClient.getInstance.chatManager.addEventHandler(
      "UNIQUE_HANDLER_ID",
      ChatEventHandler(onMessagesReceived: onMessagesReceived),
    );
  }

  void onMessagesReceived(List<ChatMessage> messages) {
    setState(() {
      _messageList.add(messages[0]);
    });
  }
}
