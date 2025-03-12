import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Komunikasi - Kontak',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ContactsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContactsPage extends StatefulWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  bool isC1Selected = true;
  bool isC2Selected = false;

  // Sample student data
  final List<Map<String, String>> contacts = [
    {"name": "M. Alvinza", "nim": "2304879"},
    {"name": "Zakiyah Hasanah", "nim": "2304880"},
    {"name": "Yattaqi Ahmad F.", "nim": "2304881"},
    {"name": "Aisyah Putri", "nim": "2304882"},
    {"name": "Budi Santoso", "nim": "2304883"},
    {"name": "Cahya Dewi", "nim": "2304884"},
    {"name": "Dimas Pratama", "nim": "2304885"},
    {"name": "Eka Fitriani", "nim": "2304886"},
    {"name": "Farhan Hidayat", "nim": "2304887"},
    {"name": "Gita Nuraini", "nim": "2304888"},
    {"name": "Hadi Wijaya", "nim": "2304889"},
    {"name": "Indah Sari", "nim": "2304890"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Komunikasi - Kontak',
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
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 0.8,
              ),
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ContactCard(
                  name: contacts[index]["name"]!,
                  nim: contacts[index]["nim"]!,
                );
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

class ContactCard extends StatelessWidget {
  final String name;
  final String nim;

  const ContactCard({
    Key? key,
    required this.name,
    required this.nim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Placeholder avatar with custom shapes
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.only(bottom: 8.0),
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
                  left: 10,
                  bottom: 10,
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.grey,
                  ),
                ),
                // Circle
                Positioned(
                  right: 10,
                  bottom: 10,
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
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            nim,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

// Custom painter for the triangle shape
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