import 'package:flutter/material.dart';
import 'akademik_UKT.dart';
import 'akademik_nilai.dart';
import 'chat.dart';
import 'elearning.dart';
import 'keuangan.dart';
import 'kontak.dart';
import 'kontak_grup.dart';
import 'mental_health.dart';
import 'notifikasi.dart';
import 'sosmed.dart';
import 'to_do.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelompok 1'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Akademik UKT'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InformasiPembayaranUKTPage()),
              );
            },
          ),
          ListTile(
            title: Text('Akademik Nilai'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InformasiPerkuliahanPage()),
              );
            },
          ),
          ListTile(
            title: Text('Chat'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
            },
          ),
          ListTile(
            title: Text('E-Learning'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ElearningPage()),
              );
            },
          ),
          ListTile(
            title: Text('Keuangan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackingKeuanganPage()),
              );
            },
          ),
          ListTile(
            title: Text('Kontak'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Kontak Grup'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupContactsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Mental Health'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MentalHealthScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Notifikasi'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Sosial Media'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SocialMediaPage()),
              );
            },
          ),
          ListTile(
            title: Text('To-Do'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JadwalToDoPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}