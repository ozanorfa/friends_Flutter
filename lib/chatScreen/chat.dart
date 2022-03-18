import 'dart:io';
import 'package:flutter/material.dart';
import 'package:panpisler_voices/components/reusable_card.dart';
import 'package:panpisler_voices/util/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key key,
  }) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatScreen> {
  bool _isAttachmentUploading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: const Text('Chat'),
      ),
      body: ReusableCard(
        cardChild: Text("dfgdfg"),
      ),
    );
  }
}
