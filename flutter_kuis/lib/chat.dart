import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messaging App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [
    Message(
      sender: 'other',
      text: 'Halo, apa kabar?',
      time: '09:15',
    ),
    Message(
      sender: 'other',
      text: 'Sudah mengerjakan tugas Flutter?',
      time: '09:16',
    ),
    Message(
      sender: 'other',
      text: 'Aku sudah selesai',
      time: '09:17',
    ),
    Message(
      sender: 'self',
      text: 'Tugas UI saya sudah selesai juga',
      time: '09:20',
      attachment: true,
    ),
    Message(
      sender: 'other',
      text: 'Bagus sekali hasilnya',
      time: '09:22',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.attach_file, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return MessageBubble(message: message);
              },
            ),
          ),
          // Quick reply options
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        QuickReplyChip(text: 'Terima kasih'),
                        const SizedBox(width: 8),
                        QuickReplyChip(text: 'OK'),
                        const SizedBox(width: 8),
                        QuickReplyChip(text: 'Baik'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Message input field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.sentiment_satisfied_alt),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.text_format),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Pesan',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.mic),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final String time;
  final bool attachment;

  Message({
    required this.sender,
    required this.text,
    required this.time,
    this.attachment = false,
  });
}

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelf = message.sender == 'self';

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isSelf) _buildAvatar(),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: isSelf ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: isSelf ? const Color(0xFF5D5B8D) : const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.text,
                        style: TextStyle(
                          color: isSelf ? Colors.white : Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      if (message.attachment)
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: _buildAttachment(),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isSelf) const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Triangle
          CustomPaint(
            size: const Size(20, 20),
            painter: TrianglePainter(color: Colors.grey),
          ),
          // Square and circle
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              width: 8,
              height: 8,
              color: Colors.grey,
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachment() {
    return Container(
      width: 200,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Triangle, square, circle emblem
          Container(
            width: 80,
            height: 80,
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Triangle
                CustomPaint(
                  size: const Size(40, 40),
                  painter: TrianglePainter(color: Colors.grey),
                ),
                // Square
                Positioned(
                  left: 15,
                  bottom: 15,
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.grey,
                  ),
                ),
                // Circle
                Positioned(
                  right: 15,
                  bottom: 15,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 120,
            height: 8,
            color: Colors.grey.withOpacity(0.5),
            margin: const EdgeInsets.only(bottom: 8.0),
          ),
          Container(
            width: 80,
            height: 8,
            color: Colors.grey.withOpacity(0.5),
          ),
          const SizedBox(height: 16.0),
          Container(
            width: 160,
            height: 12,
            decoration: BoxDecoration(
              color: const Color(0xFF5D5B8D),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ],
      ),
    );
  }
}

class QuickReplyChip extends StatelessWidget {
  final String text;

  const QuickReplyChip({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(text),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();
    path.moveTo(size.width / 2, 0); // Top center
    path.lineTo(0, size.height); // Bottom left
    path.lineTo(size.width, size.height); // Bottom right
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}