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
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      ),
      home: const CourseDetailScreen(),
    );
  }
}

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const BackButton(),
                  const SizedBox(width: 8),
                  const Text(
                    'Elearning : Sistem Operasi',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 16,
                    height: 16,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),

            // E-Learning Banner
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFF4AAA8C),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Stack(
                  children: [
                    // Background illustrations would be here in a real app
                    Center(
                      child: Image.asset(
                        'assets/elearning_illustration.png', // You would need this asset
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: const Color(0xFF4AAA8C),
                            child: const Center(
                              child: Text(
                                'E-LEARNING',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFD700),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Pertemuan Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Pertemuan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Meetings List
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildMeetingItem(
                    'Pertemuan 1',
                    'Mahasiswa mengenal SO secara umum dan aturan perkuliahan',
                  ),
                  const Divider(height: 1),
                  _buildMeetingItem(
                    'Pertemuan 2',
                    'Mengenalkan kosep dan struktur dasar Sistem Operasi',
                  ),
                  const Divider(height: 1),
                  _buildMeetingItem(
                    'Pertemuan 3',
                    'Mahasiswa mengetahui proses pada Sistem Operasi',
                  ),
                  const Divider(height: 1),
                  _buildMeetingItem(
                    'Pertemuan 3',
                    'Mahasiswa mengetahui proses pada Sistem Operasi',
                  ),
                  const Divider(height: 1),
                  _buildMeetingItem(
                    'Pertemuan 4',
                    'Mengetahui konsep dan teknik pengelolaan memori pada Sistem Operasi',
                  ),
                ],
              ),
            ),

            // Bottom Navigation Indicator
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetingItem(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Meeting Icon/Avatar
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_drop_up, color: Colors.grey.shade500),
                Icon(Icons.stop, color: Colors.grey.shade500, size: 12),
                Icon(Icons.circle, color: Colors.grey.shade500, size: 12),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Meeting Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 14,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
