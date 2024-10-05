import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:dailyskincare/screens/todo_list.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
// import 'package:motion_tab_bar/MotionTabItem.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // State untuk menyimpan status checkbox
  bool _cleanserChecked = false;
  bool _moisturizerChecked = false;
  bool _sunscreenChecked = false;
  bool _serumChecked = false;

  // State untuk MotionTabBarController
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();

    // Use "MotionTabBarController" to programmatically change the tab
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 3, // Number of tabs
      vsync: this,
    );
  }

  @override
  void dispose() {
    _motionTabBarController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(const Duration(days: 140)),
        lastDate: DateTime.now(),
        accent: const Color.fromARGB(255, 195, 3, 229),
        backButton: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Routine for Today',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      leading: Checkbox(
                        value: _cleanserChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _cleanserChecked = value ?? false;
                          });
                        },
                      ),
                      title: const Text('Cleanser - Morning'),
                      subtitle: const Text('8:00 AM'),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: _moisturizerChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _moisturizerChecked = value ?? false;
                          });
                        },
                      ),
                      title: const Text('Moisturizer - Morning'),
                      subtitle: const Text('8:15 AM'),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: _sunscreenChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _sunscreenChecked = value ?? false;
                          });
                        },
                      ),
                      title: const Text('Sunscreen - Morning'),
                      subtitle: const Text('8:30 AM'),
                    ),
                    ListTile(
                      leading: Checkbox(
                        value: _serumChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _serumChecked = value ?? false;
                          });
                        },
                      ),
                      title: const Text('Serum - Night'),
                      subtitle: const Text('9:00 PM'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Implementasi MotionTabBar
      bottomNavigationBar: MotionTabBar(
        labels: const ['Home', 'To-Do List', 'Notifications'],
        initialSelectedTab: 'Home',
        tabIconColor: Colors.purple,
        tabSelectedColor: Colors.purpleAccent,
        onTabItemSelected: (int index) {
          // print(index);
          _onItemTapped(index);
          print(_motionTabBarController?.index);
          // setState(() {
          //   _motionTabBarController!.index = index;
          // });
        },
        icons: const [Icons.home, Icons.list, Icons.notifications],
        textStyle: const TextStyle(color: Colors.black),
      ),
    );
  }

  // Method untuk mengubah halaman berdasarkan index yang dipilih
  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _motionTabBarController?.index = index;
    });

    // Navigasi ke halaman yang sesuai
    // switch (index) {
    //   case 0:
    //     // Kembali ke Home
    //     Navigator.push(context,
    //      MaterialPageRoute(builder: (context) => const HomePage())
    //      );
    //     break;
    //   case 1:
    //     // Navigasi ke halaman To-Do List
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => ToDoListPage()),
    //     );
    //     break;
    //   case 2:
    //     // Tambahkan logika untuk Notifications jika diperlukan
    //     break;
    // }
  }
}
