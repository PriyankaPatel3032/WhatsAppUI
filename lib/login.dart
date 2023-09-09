import 'package:agora_chat_sdk/agora_chat_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'agora_config.dart';
import 'home.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<String> _logText = [];
  ScrollController scrollController = ScrollController();
  bool isSignIn = false;
  String? loginID;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agora Chat"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 10),
              Text(
                "Login User",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "${AgoraChatConfig.userId}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: _signIn,
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.teal),
                      ),
                      child: Text("SIGN IN"),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TextButton(
                      onPressed: () {
                        _signOut();
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(Colors.teal),
                      ),
                      child: Text(
                        "SIGN OUT",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Flexible(
                child: ListView.builder(
                    controller: scrollController,
                    itemCount: _logText.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Text(
                          _logText[index],
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    _initSDK();
  }

  void _initSDK() async {
    ChatOptions options = ChatOptions(
      appKey: AgoraChatConfig.appKey,
      autoLogin: false,
    );
    await ChatClient.getInstance.init(options);
  }

  void _addLogToConsole(String log) {
    _logText.add(log);
    setState(() {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  void _signIn() async {
    try {
      await ChatClient.getInstance.loginWithAgoraToken(
        AgoraChatConfig.userId,
        AgoraChatConfig.agoraToken,
      );
      _addLogToConsole("login succeed : ${AgoraChatConfig.userId}");
      isSignIn = true;
      loginID = AgoraChatConfig.userId;

      navigationToMainScreen(context, loginID!);
    } on ChatError catch (e) {
      _addLogToConsole("login failed, code: ${e.code}, desc: ${e.description}");
    }
  }

  void _signOut() async {
    try {
      await ChatClient.getInstance.logout(true);
      _addLogToConsole("sign out succeed");
      isSignIn = false;
    } on ChatError catch (e) {
      _addLogToConsole(
          "sign out failed, code: ${e.code}, desc: ${e.description}");
    }
  }

  @override
  void dispose() {
    ChatClient.getInstance.chatManager.removeEventHandler("UNIQUE_HANDLER_ID");
    super.dispose();
  }

  void navigationToMainScreen(BuildContext context, String loginID) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => home(loginUserName: loginID)));
  }

  void _sendMessage() async {
    if (!isSignIn) {
      _addLogToConsole("Please signin");
    } else if (!controller.text.isEmpty) {
      /*Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MessageList(chatUserId: controller.text),
        ),
      );*/
    } else {
      _addLogToConsole("Please enter recipient's userId");
    }
  }
}
