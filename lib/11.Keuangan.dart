import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tracking Keuangan'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rp. 250.000',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  '(21 Mar 2025)',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  '+50.000',
                  style: TextStyle(fontSize: 16, color: Colors.green),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Jan'),
                    Text('Feb'),
                    Text('Mar'),
                    Text('Apr'),
                    Text('May'),
                    Text('Jun'),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pemasukan Terbesar',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '+Rp. 100.000',
                          style: TextStyle(fontSize: 16, color: Colors.green),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pengeluaran Terbesar',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          '-Rp. 500.000',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rasio Keuangan',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '27,10%',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Bulan ini',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Rp. 2.500.000',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jenis Keuangan',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Tabungan Mandiri',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Kesehatan Keuangan',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Tinggi',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
                Divider(),
                Text(
                  'Target Bulan Ini',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tabungan',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '± Rp. 300.000',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jajan',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '± Rp. 200.000',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Dana Darurat',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '± Rp. 100.000',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                Divider(),
                Text(
                  '*Jangan menabung apa yang tersisa setelah berbelanja, tetapi belanjakan apa yang tersisa setelah menabung: - Warren Buffett*',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
