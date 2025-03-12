import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health Help',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        fontFamily: 'Roboto',
      ),
      home: const MentalHealthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MentalHealthPage extends StatelessWidget {
  const MentalHealthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF7F3FA),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              // App Bar with time and status icons
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '9:30',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 100),
                        const Icon(Icons.signal_wifi_4_bar,
                            color: Colors.grey, size: 16),
                        const SizedBox(width: 4),
                        const Icon(Icons.battery_full,
                            color: Colors.grey, size: 16),
                      ],
                    ),
                  ],
                ),
              ),

              // Header with back button and title
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {},
                    ),
                    const Text(
                      'Mental Health Help',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Main content - scrollable
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Emergency Hotline Card
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              // Placeholder image with shapes
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      top: 15,
                                      child: ClipPath(
                                        clipper: TriangleClipper(),
                                        child: Container(
                                          width: 30,
                                          height: 25,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      left: 20,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 15,
                                      right: 20,
                                      child: Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[400],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              // Text content
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Emergency Hotline',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      'Kontak Hotline darurat Bunuh Diri!',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                        horizontal: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF5C5895),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        'Kontak Sekarang',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 16),
                        // Service Description
                        const Text(
                          'Deskripsi Layanan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Kesehatan mental sama pentingnya dengan kesehatan fisik. Sebagai mahasiswa, Anda mungkin menghadapi berbagai tekanan akademis, sosial, dan pribadi. Layanan kesehatan mental kami hadir untuk mendukung perjalanan Anda selama masa perkuliahan.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Tim konselor profesional kami siap membantu Anda mengatasi stres, kecemasan, depresi, atau masalah kesehatan mental lainnya. Semua layanan bersifat rahasia dan dirancang khusus untuk kebutuhan mahasiswa.',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 24),
                        // Counseling Services
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Layanan Konseling',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.arrow_forward),
                              onPressed: () {},
                              iconSize: 20,
                            ),
                          ],
                        ),

                        const SizedBox(height: 8),
                        // Individual Counseling
                        _buildServiceCard(
                          title: 'Konseling Individual',
                          description:
                              'Sesi konseling one-on-one dengan konselor profesional untuk membah...',
                          onTap: () {},
                        ),

                        const SizedBox(height: 12),
                        // Support Group
                        _buildServiceCard(
                          title: 'Kelompok Dukungan',
                          description:
                              'Bergabunglah dengan kelompok mahasiswa lain yang menghadapi ta...',
                          onTap: () {},
                        ),

                        const SizedBox(height: 12),
                        // Workshop
                        _buildServiceCard(
                          title: 'Workshop Kesehatan Mental',
                          description:
                              'Ikuti workshop reguler tentang manajemen stres, teknik relaksasi, d...',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Bottom navigation indicator
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard({
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Placeholder image with shapes
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 10,
                      child: ClipPath(
                        clipper: TriangleClipper(),
                        child: Container(
                          width: 24,
                          height: 20,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 15,
                      child: Container(
                        width: 15,
                        height: 15,
                        color: Colors.grey[400],
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 15,
                      child: Container(
                        width: 15,
                        height: 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black87,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: onTap,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom clipper for triangle shape
class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
