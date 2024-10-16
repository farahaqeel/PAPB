import 'package:flutter/material.dart';

// void main() => runApp(NotificationPage());

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final List<Map<String, dynamic>> routines = [
    {
      'title': 'Cleanser - Pagi',
      'days': 'Setiap Hari',
      'time': DateTime.now().add(const Duration(minutes: 10)),
      'status': 'Complete'
    },
    {
      'title': 'Sunscreen - Pagi',
      'days': 'Senin - Jumat',
      'time': DateTime.now().add(const Duration(minutes: 30)),
      'status': 'Complete'
    },
    {
      'title': 'Serum - Malam',
      'days': 'Minggu, Rabu, Jumat',
      'time': DateTime.now().add(const Duration(hours: 6)),
      'status': 'Complete'
    },
  ];

  String formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifikasi",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 195, 3, 229),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true, // Makes ListView take only as much space as needed
              physics: const NeverScrollableScrollPhysics(), // Disables ListView scrolling
              itemCount: routines.length,
              itemBuilder: (context, index) {
                final routine = routines[index];
                final remainingTime = routine['time'].difference(DateTime.now());

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 246, 215, 252), // Background color
                    borderRadius: BorderRadius.circular(12), // Rounded corners
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12, // Shadow color
                        blurRadius: 6, // Amount of blur for the shadow
                        offset: Offset(2, 2), // Shadow position
                      ),
                    ],
                  ),
                  child: ListTile(
                    leading: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white, // White background for the icon
                        shape: BoxShape.circle, // Circular shape
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8), // Adjust size of the circle
                      child: const Icon(
                        Icons.notifications_active,
                        color: Color.fromARGB(255, 228, 4, 249),
                      ),
                    ),
                    title: Text(routine['title']),
                    subtitle: Text(
                      'Hari: ${routine['days']}\nWaktu: ${formatTime(routine['time'])} (${remainingTime.inMinutes} minutes left)',
                    ),
                    trailing: Text(routine['status']),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
