import 'package:flutter/material.dart';
import 'package:dailyskincare/screens/home_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ToDoListPage(),
    );
  }
}

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  final List<String> _yesterdayRoutines = ['Cleanser - Morning', 'Moisturizer - Morning'];
  final List<String> _todayRoutines = ['Sunscreen - Morning', 'Serum - Night'];

  int _selectedIndex= 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi ke halaman yang sesuai
    switch (index) {
      case 0:
        // Kembali ke Home
        Navigator.push(context,
         MaterialPageRoute(builder: (context) => const HomePage())
         );
        break;
      case 1:
        // Navigasi ke halaman To-Do List
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ToDoListPage()),
        );
        break;
      case 2:
        // Tambahkan logika untuk Notifications jika diperlukan
        break;
    }
  }

  void _editRoutine(int index, bool isToday) {
    // Logic to edit routine
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController _textController = TextEditingController();
        _textController.text = isToday ? _todayRoutines[index] : _yesterdayRoutines[index];

        return AlertDialog(
          title: Text('Edit Routine'),
          content: TextField(
            controller: _textController,
            decoration: InputDecoration(hintText: 'Enter new routine name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (isToday) {
                  setState(() {
                    _todayRoutines[index] = _textController.text;
                  });
                } else {
                  setState(() {
                    _yesterdayRoutines[index] = _textController.text;
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _removeRoutine(int index, bool isToday) {
    setState(() {
      if (isToday) {
        _todayRoutines.removeAt(index);
      } else {
        _yesterdayRoutines.removeAt(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List Routines"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Yesterday\'s Routines',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ..._yesterdayRoutines.map((routine) {
                    int index = _yesterdayRoutines.indexOf(routine);
                    return ListTile(
                      title: Text(routine),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editRoutine(index, false),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeRoutine(index, false),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Today\'s Routines',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ..._todayRoutines.map((routine) {
                    int index = _todayRoutines.indexOf(routine);
                    return ListTile(
                      title: Text(routine),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () => _editRoutine(index, true),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _removeRoutine(index, true),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                // Logic to add a new routine
              },
              icon: const Icon(Icons.add),
              label: const Text('Add New Routine'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50), // Make button full width
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'To-Do List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 243, 8, 208),
        onTap: _onItemTapped,
        ),
    );
  }
}
