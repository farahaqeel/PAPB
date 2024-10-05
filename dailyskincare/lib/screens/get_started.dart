import 'package:dailyskincare/screens/home_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(GetStarted());
}

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetStartedPage(),
    );
  }
}

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Kosongkan title untuk AppBar atau tambahkan logo kecil jika diperlukan
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Membuat seluruh item berada di tengah secara vertikal
          crossAxisAlignment: CrossAxisAlignment.center, // Membuat item berada di tengah secara horizontal
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              height: 80, // Sesuaikan ukuran gambar
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Daily Skincare!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, // Menjaga agar teks berada di tengah
            ),
            SizedBox(height: 20),
            Text(
              'Your personalized skincare routine starts here. Follow these steps to get started:',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center, // Menjaga agar teks berada di tengah
            ),
            SizedBox(height: 20),
            
            // Modifikasi ListTile untuk di tengah
            Align(
              alignment: Alignment.center, // Memusatkan ListTile
              child: Row(
                mainAxisSize: MainAxisSize.min, // Meminimalkan ukuran Row agar sesuai konten
                children: [
                  Icon(Icons.water_drop),
                  SizedBox(width: 10), // Spasi antara ikon dan teks
                  Text('Step 1: Choose your skin type'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center, // Memusatkan ListTile
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 10),
                  Text('Step 2: Set your routine schedule'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center, // Memusatkan ListTile
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.done),
                  SizedBox(width: 10),
                  Text('Step 3: Track your progress'),
                ],
              ),
            ),
            
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to next page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Mengubah bentuk menjadi kotak dengan ujung tumpul
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 228, 4, 249), // Mengubah warna teks menjadi ungu
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
