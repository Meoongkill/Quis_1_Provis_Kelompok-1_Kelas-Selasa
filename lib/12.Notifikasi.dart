import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text("Notifikasi",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text("9.30",
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
          Text("Senin, 25 Maret 2025",
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                NotificationCard(
                  title: "Whatsapp",
                  subtitle: "Pak Nursalman",
                  message: "Saya Tunggu di Ruangan saya, jam 10.00 Besok Ya.",
                  time: "04.00",
                ),
                NotificationCard(
                  title: "Akademik",
                  subtitle: "Transkrip Nilai",
                  message: "Silahkan check IPK anda, sudah kami update - BAAK",
                  time: "10.00",
                ),
                for (int i = 0; i < 4; i++)
                  NotificationCard(
                    title: "Keuangan",
                    subtitle: "Tabungan",
                    message:
                        "Tabungan anda saat ini masih di angka Rp. 150.000 - System",
                    time: "11.00",
                  ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.calendar_today, size: 28),
              Icon(Icons.camera_alt, size: 28),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String message;
  final String time;

  NotificationCard(
      {required this.title,
      required this.subtitle,
      required this.message,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.notifications, size: 24, color: Colors.black54),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(subtitle,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700])),
                  SizedBox(height: 4),
                  Text(message,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                ],
              ),
            ),
            Text(time, style: TextStyle(fontSize: 12, color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }
}
