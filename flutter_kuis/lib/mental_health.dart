import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'Roboto',
      ),
      home: const MentalHealthScreen(),
    );
  }
}

class MentalHealthScreen extends StatelessWidget {
  const MentalHealthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Mental Health Help',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEmergencyHotline(),
              const SizedBox(height: 24),
              const Text(
                'Deskripsi Layanan',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Kesehatan mental sama pentingnya dengan kesehatan fisik. Sebagai mahasiswa, Anda mungkin menghadapi berbagai tekanan akademis, sosial, dan pribadi. Layanan kesehatan mental kami hadir untuk mendukung perjalanan Anda selama masa perkuliahan.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tim konselor profesional kami siap membantu Anda mengatasi stres, kecemasan, depresi, atau masalah kesehatan mental lainnya. Semua layanan bersifat rahasia dan dirancang khusus untuk kebutuhan mahasiswa.',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
              _buildCounselingServices(),
              const SizedBox(height: 16),
              _buildServiceCard(
                'Konseling Individual',
                'Sesi konseling one-on-one dengan konselor profesional untuk membantu...',
              ),
              const SizedBox(height: 12),
              _buildServiceCard(
                'Kelompok Dukungan',
                'Bergabunglah dengan kelompok mahasiswa lain yang menghadapi tantangan serupa...',
              ),
              const SizedBox(height: 12),
              _buildServiceCard(
                'Workshop Kesehatan Mental',
                'Ikuti workshop reguler tentang manajemen stres, teknik relaksasi, dan...',
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmergencyHotline() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 20,
                  child: Container(
                    width: 30,
                    height: 26,
                    decoration: const BoxDecoration(
                      color: Color(0xFFA0A0A0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  child: ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
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
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6750A4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  child: const Text('Kontak Sekarang',
                      style: TextStyle(color: Colors.white),
                  )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCounselingServices() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Layanan Konseling',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(Icons.arrow_forward, size: 20),
      ],
    );
  }

  Widget _buildServiceCard(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 20,
                  child: ClipPath(
                    clipper: TriangleClipper(),
                    child: Container(
                      width: 30,
                      height: 30,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    width: 20,
                    height: 20,
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Color(0xFFA0A0A0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
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
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(Icons.play_arrow),
        ],
      ),
    );
  }
}

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