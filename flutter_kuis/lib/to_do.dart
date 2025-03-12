import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jadwal & To Do',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const JadwalToDoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DaySchedule {
  final String day;
  final List<String> activities;

  DaySchedule({
    required this.day,
    required this.activities,
  });
}

class TodoItem {
  final String task;
  bool isCompleted;

  TodoItem({
    required this.task,
    this.isCompleted = false,
  });
}

class JadwalToDoPage extends StatefulWidget {
  const JadwalToDoPage({Key? key}) : super(key: key);

  @override
  State<JadwalToDoPage> createState() => _JadwalToDoPageState();
}

class _JadwalToDoPageState extends State<JadwalToDoPage> {
  // Static schedule data
  final List<DaySchedule> weekSchedule = [
    DaySchedule(
      day: 'Senin',
      activities: ['Big Data', 'Prak. Big Data', 'DPBO'],
    ),
    DaySchedule(
      day: 'Selasa',
      activities: ['Provis', 'Andal'],
    ),
    DaySchedule(
      day: 'Rabu',
      activities: ['Prak. SMBD C1', 'Prak. SMBD C2'],
    ),
    DaySchedule(
      day: 'Kamis',
      activities: ['Metpen', 'Prokon', 'Sisop'],
    ),
    DaySchedule(
      day: 'Jumat',
      activities: ['Prak DPBO'],
    ),
    DaySchedule(
      day: 'Sabtu',
      activities: ['Login Genshin'],
    ),
    DaySchedule(
      day: 'Minggu',
      activities: ['Speedrun Tugas + Belajar'],
    ),
  ];

  // Static todo list data
  final List<TodoItem> todoItems = [
    TodoItem(task: 'Tugas Provis UI Flutter', isCompleted: false),
    TodoItem(task: 'Laporan Praktikum Big Data', isCompleted: false),
    TodoItem(task: 'Quiz DPBO Inheritance', isCompleted: false),
    TodoItem(task: 'Project Akhir Metpen', isCompleted: false),
    TodoItem(task: 'Daily Commission Genshin', isCompleted: true),
    TodoItem(task: 'Belajar Flutter Layout', isCompleted: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        title: Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.black),
            const SizedBox(width: 8),
            const Text(
              'Jadwal',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Weekly Schedule Section
            _buildWeeklySchedule(),
            
            const SizedBox(height: 16),
            
            // To Do List Section
            _buildTodoList(),
            
            // Bottom Indicator
            Center(
              child: Container(
                width: 60,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWeeklySchedule() {
    return Column(
      children: [
        // First row (Monday and Tuesday)
        Row(
          children: [
            Expanded(child: _buildDaySchedule(weekSchedule[0])),
            Expanded(child: _buildDaySchedule(weekSchedule[1])),
          ],
        ),
        // Second row (Wednesday and Thursday)
        Row(
          children: [
            Expanded(child: _buildDaySchedule(weekSchedule[2])),
            Expanded(child: _buildDaySchedule(weekSchedule[3])),
          ],
        ),
        // Third row (Friday and Saturday)
        Row(
          children: [
            Expanded(child: _buildDaySchedule(weekSchedule[4])),
            Expanded(child: _buildDaySchedule(weekSchedule[5])),
          ],
        ),
        // Fourth row (Sunday)
        _buildDaySchedule(weekSchedule[6], fullWidth: true),
      ],
    );
  }

  Widget _buildDaySchedule(DaySchedule schedule, {bool fullWidth = false}) {
    return Container(
      width: fullWidth ? double.infinity : null,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            schedule.day,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          ...schedule.activities.map((activity) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
                    Expanded(child: Text(activity)),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildTodoList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // To Do Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Icon(Icons.calendar_today, color: Colors.black),
              const SizedBox(width: 8),
              const Text(
                'To Do',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Todo Items
        ...todoItems.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: CheckboxListTile(
              title: Text(
                item.task,
                style: TextStyle(
                  decoration: item.isCompleted ? TextDecoration.lineThrough : null,
                  color: item.isCompleted ? Colors.grey : Colors.black,
                ),
              ),
              value: item.isCompleted,
              onChanged: (bool? value) {
                setState(() {
                  todoItems[index].isCompleted = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          );
        }).toList(),
        
        const SizedBox(height: 16),
      ],
    );
  }
}