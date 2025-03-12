import 'package:flutter/material.dart';
import '0.Halaman_Utama.dart'; // Import semua file halaman
import '1.Mental_Health_Utama.dart';
import '2.Mental_Health_Book.dart';
import '3.Akademik_Transkrip_Nilai.dart';
import '4.Akademik_UKT.dart';
import '5.Elearning_Utama.dart';
import '6.Elearning_Mata_Kuliah.dart';
import '7.Pesan_dan_Group_Kontak.dart';
import '8.Pesan_dan_Group_Pesan.dart';
import '9.Pesan_dan_Group_Grup.dart';
import '10.Media_Sosial.dart';
import '11.Keuangan.dart';
import '12.Notifikasi.dart';
import '13.Jadwal_Todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Utama',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HalamanUtama(), // Halaman utama saat aplikasi dibuka
      routes: {
        // Daftar semua rute di sini
        '/halaman_utama': (context) => HalamanUtama(),
        '/mental_health_utama': (context) => MentalHealthUtama(),
        '/mental_health_book': (context) => MentalHealthBook(),
        '/akademik_transkrip_nilai': (context) => AkademikTranskripNilai(),
        '/akademik_ukt': (context) => AkademikUKT(),
        '/elearning_utama': (context) => ElearningUtama(),
        '/elearning_mata_kuliah': (context) => ElearningMataKuliah(),
        '/pesan_dan_group_kontak': (context) => PesanDanGroupKontak(),
        '/pesan_dan_group_pesan': (context) => PesanDanGroupPesan(),
        '/pesan_dan_group_grup': (context) => PesanDanGroupGrup(),
        '/media_sosial': (context) => MediaSosial(),
        '/keuangan': (context) => Keuangan(),
        '/notifikasi': (context) => Notifikasi(),
        '/jadwal_todo': (context) => JadwalTodo(),
      },
    );
  }
}

class HalamanUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Mental Health Utama'),
            onTap: () {
              Navigator.pushNamed(context, '/mental_health_utama');
            },
          ),
          ListTile(
            title: Text('Mental Health Book'),
            onTap: () {
              Navigator.pushNamed(context, '/mental_health_book');
            },
          ),
          ListTile(
            title: Text('Akademik Transkrip Nilai'),
            onTap: () {
              Navigator.pushNamed(context, '/akademik_transkrip_nilai');
            },
          ),
          ListTile(
            title: Text('Akademik UKT'),
            onTap: () {
              Navigator.pushNamed(context, '/akademik_ukt');
            },
          ),
          ListTile(
            title: Text('E-learning Utama'),
            onTap: () {
              Navigator.pushNamed(context, '/elearning_utama');
            },
          ),
          ListTile(
            title: Text('E-learning Mata Kuliah'),
            onTap: () {
              Navigator.pushNamed(context, '/elearning_mata_kuliah');
            },
          ),
          ListTile(
            title: Text('Pesan dan Group Kontak'),
            onTap: () {
              Navigator.pushNamed(context, '/pesan_dan_group_kontak');
            },
          ),
          ListTile(
            title: Text('Pesan dan Group Pesan'),
            onTap: () {
              Navigator.pushNamed(context, '/pesan_dan_group_pesan');
            },
          ),
          ListTile(
            title: Text('Pesan dan Group Grup'),
            onTap: () {
              Navigator.pushNamed(context, '/pesan_dan_group_grup');
            },
          ),
          ListTile(
            title: Text('Media Sosial'),
            onTap: () {
              Navigator.pushNamed(context, '/media_sosial');
            },
          ),
          ListTile(
            title: Text('Keuangan'),
            onTap: () {
              Navigator.pushNamed(context, '/keuangan');
            },
          ),
          ListTile(
            title: Text('Notifikasi'),
            onTap: () {
              Navigator.pushNamed(context, '/notifikasi');
            },
          ),
          ListTile(
            title: Text('Jadwal dan To-Do'),
            onTap: () {
              Navigator.pushNamed(context, '/jadwal_todo');
            },
          ),
        ],
      ),
    );
  }
}
