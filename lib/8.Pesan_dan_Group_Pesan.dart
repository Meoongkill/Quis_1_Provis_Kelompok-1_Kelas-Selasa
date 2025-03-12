import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        backgroundColor: Colors.purple.shade100,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                ChatBubble(isMe: false, text: "Halo!"),
                ChatBubble(isMe: false, text: "Apa kabar?"),
                ChatBubble(isMe: true, text: "Hai, aku baik!"),
                ImageBubble(),
                ChatBubble(isMe: false, text: "Bagus!"),
                ChatBubble(isMe: true, text: "Terima kasih!"),
              ],
            ),
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String text;

  ChatBubble({required this.isMe, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.purple.shade200 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(text, style: TextStyle(color: Colors.black)),
      ),
    );
  }
}

class ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(Icons.image, size: 80, color: Colors.grey.shade600),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Tulis pesan...",
                filled: true,
                fillColor: Colors.purple.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.purple),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
