import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elearning Platform',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: const ElearningPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Course {
  final String title;
  final String lecturer;

  Course({
    required this.title,
    required this.lecturer,
  });
}

class ElearningPage extends StatelessWidget {
  const ElearningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Static list of courses
    final List<Course> courses = [
      Course(
        title: 'Pemograman Visual Peranti Bergerak',
        lecturer: 'Dr. Yudi Wibisono, S.T., M.T.',
      ),
      Course(
        title: 'Sistem Operasi',
        lecturer: 'Herbert, S.Kom., M.T.',
      ),
      Course(
        title: 'Analisis Desain dan Algoritma',
        lecturer: 'Yaya Wihardi, S.Kom., M.Kom.',
      ),
      Course(
        title: 'Metodologi Penelitian',
        lecturer: 'Rizky Rachman Judhie Putra, M.Kom.',
      ),
      Course(
        title: 'Big Data Platform',
        lecturer: 'Prof. Dr. Lala Septem Riza, M.T.',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Elearning',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // E-Learning Banner Image
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://cdn.pixabay.com/photo/2018/09/27/09/22/online-3706563_1280.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Mata Kuliah Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Mata Kuliah',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // Course List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: courses.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                return _buildCourseItem(courses[index]);
              },
            ),
          ),

          // Bottom Navigation Indicator
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

  Widget _buildCourseItem(Course course) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_drop_up, color: Colors.grey[600]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.crop_square, size: 16, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Icon(Icons.circle, size: 16, color: Colors.grey[600]),
              ],
            ),
          ],
        ),
      ),
      title: Text(
        course.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(
          'Dosen : ${course.lecturer}',
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14,
          ),
        ),
      ),
      trailing: const Icon(Icons.more_vert),
      onTap: () {
        // This would navigate to course details in a real app
      },
    );
  }
}