import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Komunikasi - Group',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GroupContactsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class GroupContactsPage extends StatefulWidget {
  const GroupContactsPage({Key? key}) : super(key: key);

  @override
  State<GroupContactsPage> createState() => _GroupContactsPageState();
}

class _GroupContactsPageState extends State<GroupContactsPage> {
  bool isC1Selected = true;
  bool isC2Selected = false;

  // Sample group data with different names
  final List<GroupInfo> groupList = [
    GroupInfo(
      name: "2025_Mobile Development",
      lastMessage: "Ahmad: Tugas sudah dikumpul belum?",
      time: "16.45",
    ),
    GroupInfo(
      name: "Algoritma & Pemrograman",
      lastMessage: "Budi: Ada yang tau jawaban nomor 3?",
      time: "16.30",
    ),
    GroupInfo(
      name: "UX Research Team",
      lastMessage: "Cindy: Kita meeting besok jam 9",
      time: "15.20",
    ),
    GroupInfo(
      name: "2025_Big Data Platform",
      lastMessage: "Julian: Kita bisa, bisa tepar",
      time: "14.53",
    ),
    GroupInfo(
      name: "Kelas Machine Learning",
      lastMessage: "Dodi: Link meet ada di grup Discord",
      time: "14.25",
    ),
    GroupInfo(
      name: "Project Capstone",
      lastMessage: "Eka: Deadline-nya tanggal 25 ya",
      time: "13.15",
    ),
    GroupInfo(
      name: "Web Programming",
      lastMessage: "Faisal: Framework yang dipakai apa ya?",
      time: "12.40",
    ),
    GroupInfo(
      name: "Artificial Intelligence",
      lastMessage: "Gita: Paper-nya udah dibaca semua?",
      time: "10.32",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Komunikasi - Group',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              children: [
                FilterChip(
                  label: const Text('C1'),
                  selected: isC1Selected,
                  checkmarkColor: Colors.purple,
                  selectedColor: Colors.purple.withOpacity(0.1),
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  onSelected: (bool selected) {
                    setState(() {
                      isC1Selected = selected;
                    });
                  },
                ),
                const SizedBox(width: 10),
                FilterChip(
                  label: const Text('C2'),
                  selected: isC2Selected,
                  checkmarkColor: Colors.purple,
                  selectedColor: Colors.purple.withOpacity(0.1),
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  onSelected: (bool selected) {
                    setState(() {
                      isC2Selected = selected;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: groupList.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return GroupListTile(group: groupList[index]);
              },
            ),
          ),
          Container(
            height: 60,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle, color: Colors.purple),
                    Text('Mahasiswa', style: TextStyle(color: Colors.purple)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_add, color: Colors.grey),
                    Text('Dosen', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GroupInfo {
  final String name;
  final String lastMessage;
  final String time;

  GroupInfo({
    required this.name,
    required this.lastMessage,
    required this.time,
  });
}

class GroupListTile extends StatelessWidget {
  final GroupInfo group;

  const GroupListTile({
    Key? key,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Triangle
            CustomPaint(
              size: const Size(24, 24),
              painter: TrianglePainter(color: Colors.grey),
            ),
            // Square
            Positioned(
              left: 12,
              bottom: 12,
              child: Container(
                width: 10,
                height: 10,
                color: Colors.grey,
              ),
            ),
            // Circle
            Positioned(
              right: 12,
              bottom: 12,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
      title: Text(
        group.name,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        group.lastMessage,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Text(
        group.time,
        style: const TextStyle(
          color: Colors.black54,
          fontSize: 12,
        ),
      ),
      onTap: () {},
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