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
      home: const InformasiPerkuliahanPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Course class to store course information
class Course {
  final String name;
  final String lecturer;
  final double score;
  final String grade;
  final int semester;

  Course({
    required this.name,
    required this.lecturer,
    required this.score,
    required this.grade,
    required this.semester,
  });
}

class InformasiPerkuliahanPage extends StatefulWidget {
  const InformasiPerkuliahanPage({Key? key}) : super(key: key);

  @override
  State<InformasiPerkuliahanPage> createState() => _InformasiPerkuliahanPageState();
}

class _InformasiPerkuliahanPageState extends State<InformasiPerkuliahanPage> {
  int _selectedSemester = 1;
  
  // Sample course data with variations
  final List<Course> allCourses = [
    // Semester 1
    Course(
      name: 'Algoritma Pemograman 1',
      lecturer: 'Rosa Ariani Sukamto, M.T.',
      score: 7.40,
      grade: 'A',
      semester: 1,
    ),
    Course(
      name: 'Kalkulus 1',
      lecturer: 'Dr. Ahmad Fauzi',
      score: 7.20,
      grade: 'A',
      semester: 1,
    ),
    Course(
      name: 'Fisika Dasar',
      lecturer: 'Prof. Dr. Budi Santoso',
      score: 6.80,
      grade: 'B+',
      semester: 1,
    ),
    Course(
      name: 'Bahasa Inggris',
      lecturer: 'Sarah Johnson, M.A.',
      score: 7.50,
      grade: 'A',
      semester: 1,
    ),
    
    // Semester 2
    Course(
      name: 'Algoritma Pemograman 2',
      lecturer: 'Rosa Ariani Sukamto, M.T.',
      score: 7.30,
      grade: 'A',
      semester: 2,
    ),
    Course(
      name: 'Kalkulus 2',
      lecturer: 'Dr. Ahmad Fauzi',
      score: 6.70,
      grade: 'B+',
      semester: 2,
    ),
    Course(
      name: 'Struktur Data',
      lecturer: 'Dr. Indra Kusuma',
      score: 7.10,
      grade: 'A',
      semester: 2,
    ),
    Course(
      name: 'Sistem Digital',
      lecturer: 'Prof. Dr. Diana Putri',
      score: 6.50,
      grade: 'B',
      semester: 2,
    ),
    
    // Semester 3
    Course(
      name: 'Basis Data',
      lecturer: 'Dr. Maya Sari, M.Kom.',
      score: 7.60,
      grade: 'A',
      semester: 3,
    ),
    Course(
      name: 'Pemrograman Web',
      lecturer: 'Agus Hermawan, M.T.',
      score: 7.40,
      grade: 'A',
      semester: 3,
    ),
    Course(
      name: 'Sistem Operasi',
      lecturer: 'Dr. Reza Pratama',
      score: 6.90,
      grade: 'B+',
      semester: 3,
    ),
    Course(
      name: 'Grafika Komputer',
      lecturer: 'Prof. Dr. Hadi Wijaya',
      score: 6.40,
      grade: 'B',
      semester: 3,
    ),
    
    // Semester 4
    Course(
      name: 'Kecerdasan Buatan',
      lecturer: 'Dr. Rina Anggraini, M.Sc.',
      score: 7.80,
      grade: 'A',
      semester: 4,
    ),
    Course(
      name: 'Jaringan Komputer',
      lecturer: 'Dr. Tono Haryanto',
      score: 7.20,
      grade: 'A',
      semester: 4,
    ),
    Course(
      name: 'Rekayasa Perangkat Lunak',
      lecturer: 'Prof. Dr. Nina Wati',
      score: 7.30,
      grade: 'A',
      semester: 4,
    ),
    Course(
      name: 'Pemrograman Mobile',
      lecturer: 'Andi Saputra, M.Kom.',
      score: 6.60,
      grade: 'B+',
      semester: 4,
    ),
  ];

  // Get courses for selected semester
  List<Course> get filteredCourses {
    return allCourses.where((course) => course.semester == _selectedSemester).toList();
  }

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

          // Transkrip Nilai Text
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Text(
              'Transkrip Nilai',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Semester Selection
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSemesterButton(1),
                _buildSemesterButton(2),
                _buildSemesterButton(3),
                _buildSemesterButton(4),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Course List
          Expanded(
            child: filteredCourses.isEmpty
                ? const Center(child: Text('Tidak ada mata kuliah untuk semester ini'))
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredCourses.length,
                    separatorBuilder: (context, index) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      return _buildCourseItem(filteredCourses[index]);
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
                    onPressed: () {},
                    icon: const Icon(Icons.star, color: Colors.black),
                    label: const Text(
                      'Transkrip Nilai',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_circle_outline, color: Colors.black54),
                    label: const Text(
                      'UKT',
                      style: TextStyle(color: Colors.black54),
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

  Widget _buildSemesterButton(int semester) {
    bool isSelected = _selectedSemester == semester;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedSemester = semester;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.deepPurple[100] : Colors.white,
        foregroundColor: isSelected ? Colors.deepPurple : Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Colors.deepPurple : Colors.grey[300]!,
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Text('Semester $semester'),
    );
  }

  Widget _buildCourseItem(Course course) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Grade
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                course.grade,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // Course info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Dosen : ${course.lecturer}',
                  style: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Mutu : ${course.score.toStringAsFixed(2)}',
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
}