import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class MessageBox extends StatelessWidget {
  final String? text;
  final bool? home;

  MessageBox({this.text, this.home});

  @override
  Widget build(BuildContext context) {
    return BubbleNormal(
      textStyle: TextStyle(
        color: home == true ? Colors.white : Colors.black,
      ),
      text: text!,
      isSender: home!,
      bubbleRadius: 20,
      color: home == true ? Colors.purple[500]! : Colors.grey[350]!,
    );
  }
}
