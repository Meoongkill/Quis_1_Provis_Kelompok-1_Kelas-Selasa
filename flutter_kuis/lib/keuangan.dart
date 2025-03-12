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
      title: 'Tracking Keuangan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const TrackingKeuanganPage(),
    );
  }
}

class TrackingKeuanganPage extends StatelessWidget {
  const TrackingKeuanganPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Tracking Keuangan',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Balance Section
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Rp. 250.000',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '(21 Mar 2025)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Center(
                child: Text(
                  '+ 50.000',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Chart Section
              SizedBox(
                height: 200,
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 200),
                  painter: ChartPainter(),
                ),
              ),
              const SizedBox(height: 10),

              // Month Filter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMonthButton('Jan', false),
                  _buildMonthButton('Feb', false),
                  _buildMonthButton('Mar', true),
                  _buildMonthButton('Apr', false),
                  _buildMonthButton('May', false),
                  _buildMonthButton('Jun', false),
                ],
              ),
              const SizedBox(height: 20),

              // Financial Statistics Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatisticColumn(
                      'Pemasukan\nTerbesar',
                      '+Rp. 100.000',
                      Colors.green,
                    ),
                    _buildDivider(),
                    _buildStatisticColumn(
                      'Pengeluaran\nTerbesar',
                      '-Rp. 500.000',
                      Colors.red,
                    ),
                    _buildDivider(),
                    _buildStatisticColumn(
                      'Rasio\nKeuangan',
                      '27,10%',
                      Colors.black,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Monthly Total and Account Type
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoItem('Total\nBulan Ini', 'Rp. 2.500.000'),
                  _buildInfoItem('Jenis\nKeuangan', 'Tabungan Mandiri'),
                  _buildInfoItem('Kesehatan\nKeuangan', 'Tinggi'),
                ],
              ),
              const SizedBox(height: 24),

              // Monthly Target Section
              const Text(
                'Target Bulan Ini',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Target Items
              _buildTargetItem(
                Icons.account_balance,
                'Tabungan',
                'Rp. 300.000',
                true,
              ),
              _buildTargetItem(
                Icons.shopping_cart,
                'Jajan',
                'Rp. 200.000',
                false,
              ),
              _buildTargetItem(
                Icons.warning,
                'Dana\nDarurat',
                'Rp. 100.000',
                true,
              ),
              const SizedBox(height: 24),

              // Quote Section
              Container(
                padding: const EdgeInsets.all(12),
                child: const Text(
                  '"Jangan menabung apa yang tersisa setelah membelanjakan, tetapi belanjakan apa yang tersisa setelah menabung." - Warren Buffett',
                  style: TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 5,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 120),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildMonthButton(String month, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.purple.withOpacity(0.2) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        month,
        style: TextStyle(
          color: isSelected ? Colors.purple : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildStatisticColumn(String title, String value, Color valueColor) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 40,
      width: 1,
      color: Colors.grey[300],
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTargetItem(IconData icon, String title, String amount, bool isCompleted) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Icon(icon, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            '± $amount',
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(4),
              color: isCompleted ? Colors.black : Colors.white,
            ),
            child: isCompleted
                ? const Icon(
                    Icons.check,
                    size: 18,
                    color: Colors.white,
                  )
                : null,
          ),
        ],
      ),
    );
  }
}

// Custom Chart Painter
class ChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final dotPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    // Chart data points (simplified for this example)
    final points = [
      Offset(size.width * 0.05, size.height * 0.7),
      Offset(size.width * 0.2, size.height * 0.3),
      Offset(size.width * 0.35, size.height * 0.6),
      Offset(size.width * 0.5, size.height * 0.55),
      Offset(size.width * 0.65, size.height * 0.3),
      Offset(size.width * 0.8, size.height * 0.8),
      Offset(size.width * 0.95, size.height * 0.2),
    ];

    // Draw lines
    final path = Path();
    path.moveTo(points[0].dx, points[0].dy);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].dx, points[i].dy);
    }
    canvas.drawPath(path, paint);

    // Draw points
    for (var point in points) {
      canvas.drawCircle(point, 4, dotPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}