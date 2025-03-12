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
      title: 'UPI Social Media',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const SocialMediaPage(),
    );
  }
}

class SocialMediaPage extends StatelessWidget {
  const SocialMediaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FA),
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: const Color(0xFFF6F5FA),
              child: Row(
                children: [
                  // Time
                  const Text(
                    '9:30',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  // Status Icons
                  Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.network_cell, size: 16),
                  const SizedBox(width: 4),
                  const Icon(Icons.battery_full, size: 16),
                ],
              ),
            ),
            
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // Profile Icon
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.person, color: Colors.black54),
                  ),
                  const SizedBox(width: 8),
                  // Search Bar
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, size: 20, color: Colors.black54),
                          const SizedBox(width: 8),
                          const Text(
                            'Ada Apa Dengan UPI',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Settings Icon
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.settings, color: Colors.black54),
                  ),
                ],
              ),
            ),
            
            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Featured News with Image
                    Stack(
                      children: [
                        Image.asset(
                          'assets/rector.jpg', // Replace with placeholder in real implementation
                          width: double.infinity,
                          height: 220,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: double.infinity,
                              height: 220,
                              color: Colors.blueGrey,
                              child: const Center(
                                child: Icon(Icons.image_not_supported, size: 50, color: Colors.white),
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Dari Berita Rektor',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text(
                                  'UPI Edun',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    'Live',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    // News Section Title
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        'Berita Hari Ini',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    
                    // News Cards
                    _buildNewsCard(
                      'Kerusuhan Terjadi di FPMIPA, Ketua DPM menolak hasil Mumas',
                      '13 jam yang lalu. Berita. 96k posts.',
                    ),
                    const Divider(height: 1),
                    
                    _buildNewsCard(
                      'Buka Puasa Berujung Ricuh, Puluhan Mahasiswa FPOK luka-luka',
                      '21 jam yang lalu. Berita. 81k posts.',
                    ),
                    const Divider(height: 1),
                    
                    _buildNewsCard(
                      'Karena Mati Lampu, Mahasiswa FPIPS Buka Bersama dikelas',
                      '13 jam yang lalu. Berita. 96k posts.',
                    ),
                    const Divider(height: 1),
                    
                    _buildNewsCard(
                      'Jumawa karena berisi petinggi, Ketua Kelas C2 dikabarkan Tidur Siang',
                      '13 jam yang lalu. Berita. 96k posts.',
                    ),
                    const Divider(height: 1),
                    
                    _buildNewsCard(
                      'Buka Puasa Berujung Ricuh, Puluhan Mahasiswa FPOK luka-luka',
                      '21 jam yang lalu. Berita. 81k posts.',
                    ),
                  ],
                ),
              ),
            ),
            
            // Bottom Navigation Indicator
            Container(
              height: 5,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 120),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.account_circle, size: 16, color: Colors.black54),
                    const SizedBox(width: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            children: [
              Container(
                width: 40,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                child: Icon(Icons.arrow_drop_up, color: Colors.grey[600]),
              ),
              Container(
                width: 40,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Icon(Icons.circle, size: 8, color: Colors.grey[600]),
              ),
            ],
          ),
        ],
      ),
    );
  }
}