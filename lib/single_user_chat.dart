import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SingleUserMessageView extends StatefulWidget {
  const SingleUserMessageView({super.key, required this.title});

  final String title;

  @override
  State<SingleUserMessageView> createState() => _SingleUserMessageViewState();
}

class _SingleUserMessageViewState extends State<SingleUserMessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StreamChannelHeader(
        centerTitle: true,
        title: Text("Chat"),
        onBackPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.pop(context);
        },
      ),
      body: Column(
        children: [
          Expanded(child: StreamMessageListView()),
          StreamMessageInput(onMessageSent: (message){
            FocusManager.instance.primaryFocus?.unfocus();
          },),
        ],
      ),
    );
  }
}