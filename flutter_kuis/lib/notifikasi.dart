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
        fontFamily: 'Roboto',
      ),
      home: const NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          // Time and Date display
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: const [
                Text(
                  '9.30',
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Senin, 25 Maret 2025',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          
          // Notifications List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildNotificationItem(
                  icon: Icons.school,
                  iconBackground: Colors.blue,
                  category: 'Akademik',
                  title: 'Transkrip Nilai',
                  message: 'Silahkan check IPK anda, sudah kami update - BAAK',
                  time: '10.00',
                ),
                _buildNotificationItem(
                  icon: Icons.account_balance_wallet,
                  iconBackground: Colors.purple,
                  category: 'Keuangan',
                  title: 'Tabungan',
                  message: 'Tabungan anda saat ini masih di angka Rp. 150.000 - System',
                  time: '11.00',
                ),
                _buildNotificationItem(
                  icon: Icons.account_balance_wallet,
                  iconBackground: Colors.purple,
                  category: 'Keuangan',
                  title: 'Tabungan',
                  message: 'Tabungan anda saat ini masih di angka Rp. 150.000 - System',
                  time: '11.00',
                ),
                _buildNotificationItem(
                  icon: Icons.account_balance_wallet,
                  iconBackground: Colors.purple,
                  category: 'Keuangan',
                  title: 'Tabungan',
                  message: 'Tabungan anda saat ini masih di angka Rp. 150.000 - System',
                  time: '11.00',
                ),
                _buildNotificationItem(
                  icon: Icons.account_balance_wallet,
                  iconBackground: Colors.purple,
                  category: 'Keuangan',
                  title: 'Tabungan',
                  message: 'Tabungan anda saat ini masih di angka Rp. 150.000 - System',
                  time: '11.00',
                ),
                // Add more notification items as needed
              ],
            ),
          ),
          
          // Bottom Navigation
          Container(
            height: 60,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFEEEEEE), width: 1),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.calendar_today, size: 28),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.camera_alt, size: 28),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          
          // Bottom indicator
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.only(bottom: 10, top: 5),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData icon,
    required Color iconBackground,
    required String category,
    required String title,
    required String message,
    required String time,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconBackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}