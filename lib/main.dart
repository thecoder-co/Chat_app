import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:chat/components/message_box.dart';
import 'package:chat/components/text_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.org'),
  );
  String? _text;
  List<Widget>? _messages = [];
  _send() {
    setState(() {
      _messages!.add(
        MessageBox(
          text: _text,
          home: true,
        ),
      );
    });

    _channel.sink.add(_text);
  }

  _onChange(text) {
    _text = text;
  }

  _onSubmit(text) {
    _text = text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Chat App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      StreamBuilder(
                        stream: _channel.stream,
                        initialData: Column(
                          children: _messages!,
                        ),
                        builder: (context, snapshot) {
                          _messages!.add(
                            MessageBox(
                              text: snapshot.hasData ? '${snapshot.data}' : '',
                              home: false,
                            ),
                          );
                          return Column(
                            children: _messages!,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextInput(
              onSend: _send,
              text: _text,
              onChange: _onChange,
              onSubmit: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
