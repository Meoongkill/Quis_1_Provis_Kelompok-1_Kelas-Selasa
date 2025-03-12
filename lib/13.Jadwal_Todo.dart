import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScheduleScreen(),
    );
  }
}

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<bool> isChecked = [false, false, false, false, true, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
        title: Text("Jadwal",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.calendar_today, size: 32),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  scheduleCard("Senin", ["Big Data", "Prak. Big Data", "DPBO"]),
                  scheduleCard("Selasa", ["Provis", "Andal"]),
                  scheduleCard("Rabu", ["Prak. SMBD C1", "Prak. SMBD C2"]),
                  scheduleCard("Kamis", ["Metpen", "Prokon", "Sisop"]),
                  scheduleCard("Jumat", ["Prak DPBO"]),
                  scheduleCard("Sabtu", ["Login Genshin"]),
                  scheduleCard("Minggu", ["Speedrun Tugas + Belajar"]),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 32),
                  SizedBox(width: 8),
                  Text("To Do",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey[200],
                ),
                child: Column(
                  children: List.generate(isChecked.length, (index) {
                    return CheckboxListTile(
                      title: Text("Ini List To Do"),
                      value: isChecked[index],
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked[index] = value!;
                        });
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget scheduleCard(String day, List<String> tasks) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 24,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(day,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          ...tasks.map((task) => Text("• $task")).toList(),
        ],
      ),
    );
  }
}
