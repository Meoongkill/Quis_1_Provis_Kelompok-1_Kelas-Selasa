import 'package:flutter/material.dart';

void main() {
  runApp(ChatGroupApp());
}

class ChatGroupApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatGroupScreen(),
    );
  }
}

class ChatGroupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Komunikasi - Group"),
        backgroundColor: Colors.purple.shade100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                ChoiceChip(
                    label: Text("C1"), selected: true, onSelected: (val) {}),
                SizedBox(width: 10),
                ChoiceChip(
                    label: Text("C2"), selected: false, onSelected: (val) {}),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return ChatGroupItem();
              },
            ),
          ),
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: "Mahasiswa",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Dosen",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatGroupItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey.shade300,
        child: Icon(Icons.group, color: Colors.grey.shade600),
      ),
      title: Text("2025_Big Data Platform",
          style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text("Julian : Kita bisa, bisa tepar"),
      trailing: Text("16.53", style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
