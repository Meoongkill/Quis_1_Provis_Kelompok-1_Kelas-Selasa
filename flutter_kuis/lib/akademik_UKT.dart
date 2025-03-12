import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informasi Perkuliahan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const InformasiPembayaranUKTPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Payment Status class
class SemesterPayment {
  final int semester;
  final double amount;
  final String status;

  SemesterPayment({
    required this.semester,
    required this.amount,
    required this.status,
  });

  bool get isPaid => status == "Lunas";
  bool get isContracted => status != "Belum Dikontrak";
}

class InformasiPembayaranUKTPage extends StatefulWidget {
  const InformasiPembayaranUKTPage({Key? key}) : super(key: key);

  @override
  State<InformasiPembayaranUKTPage> createState() => _InformasiPembayaranUKTPageState();
}

class _InformasiPembayaranUKTPageState extends State<InformasiPembayaranUKTPage> {
  // Sample payment data
  final List<SemesterPayment> payments = [
    SemesterPayment(
      semester: 1,
      amount: 7100000,
      status: "Lunas",
    ),
    SemesterPayment(
      semester: 2,
      amount: 7100000,
      status: "Lunas",
    ),
    SemesterPayment(
      semester: 3,
      amount: 7100000,
      status: "Lunas",
    ),
    SemesterPayment(
      semester: 4,
      amount: 7100000,
      status: "Belum Lunas",
    ),
    SemesterPayment(
      semester: 5,
      amount: 7100000,
      status: "Belum Dikontrak",
    ),
    SemesterPayment(
      semester: 6,
      amount: 7100000,
      status: "Belum Dikontrak",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: const BackButton(color: Colors.black),
        title: const Text('Informasi Perkuliahan', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Student Profile Section
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Avatar Circle
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[100],
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      'A',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Student Info
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fathan M. Putra',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '3C2 - 2304879',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Title - Informasi Pembayaran UKT
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(
              'Informasi Pembayaran UKT',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Payment Status List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: payments.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return _buildPaymentItem(payments[index]);
              },
            ),
          ),

          // Navigation Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                    },
                    icon: const Icon(Icons.star_border, color: Colors.black54),
                    label: const Text(
                      'Transkrip Nilai',
                      style: TextStyle(color: Colors.black54),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle, color: Colors.black),
                    label: const Text(
                      'UKT',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Home Indicator
          Container(
            width: 60,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(2.5),
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentItem(SemesterPayment payment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Icon
          _buildStatusIcon(payment),
          const SizedBox(width: 16),
          // Payment info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Semester ${payment.semester}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Jumlah: ${_formatCurrency(payment.amount)}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Status : ${payment.status}',
                  style: const TextStyle(
                    color: Colors.black87,
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

  Widget _buildStatusIcon(SemesterPayment payment) {
    if (payment.isPaid) {
      // Checkmark icon for paid
      return Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.check,
            size: 30,
            color: Colors.black,
          ),
        ),
      );
    } else {
      // X icon for unpaid or not contracted
      return Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.close,
            size: 30,
            color: Colors.black,
          ),
        ),
      );
    }
  }

  String _formatCurrency(double amount) {
    return amount.toStringAsFixed(0).replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }
}