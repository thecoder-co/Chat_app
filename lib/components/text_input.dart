import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String? text;
  final VoidCallback? onSend;
  final Function(String)? onSubmit;
  final Function(String)? onChange;

  TextInput({this.text, this.onSubmit, this.onChange, this.onSend});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.purple[500]),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onChange,
              onSubmitted: onSubmit,
              minLines: 1,
              maxLines: 6,
              style: TextStyle(color: Colors.white),
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                  hintText: "Enter your message"),
            ),
          ),
          IconButton(
            onPressed: onSend!,
            icon: Icon(Icons.send_rounded),
          ),
        ],
      ),
    );
  }
}
