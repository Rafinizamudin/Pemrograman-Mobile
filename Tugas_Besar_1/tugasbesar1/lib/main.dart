import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/Background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Gambar-gambar di belakang botol
            Positioned(
              bottom: -150,
              left: 200,
              right: 0,
              child: Image.asset(
                'images/Picture1.png',
                height: 400,
              ),
            ),
            Positioned(
              bottom: -140,
              left: 200,
              right: 0,
              child: Image.asset(
                'images/Picture2.png',
                height: 400,
              ),
            ),
            Positioned(
              bottom: -130,
              left: 0,
              right: 0,
              child: Image.asset(
                'images/Picture3.png',
                height: 400,
              ),
            ),
            Positioned(
              bottom: -135,
              left: 0,
              right: 0,
              child: Image.asset(
                'images/Picture7.png',
                height: 400,
              ),
            ),
            Positioned(
              bottom: -135,
              left: 130,
              right: 0,
              child: Image.asset(
                'images/Picture8.png',
                height: 400,
              ),
            ),

            // Gambar botol di atas gambar-gambar lain
            Positioned(
              bottom: -150,
              left: 0,
              right: 0,
              child: Image.asset(
                'images/bottle.png',
                height: 400,
              ),
            ),

            // Logo Aqua
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: Image.asset(
                'images/logo.png',
                height: 200,
              ),
            ),

            // Teks utama
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 0,
              right: 0,
              child: const Column(
                children: [
                  Text(
                    'KEBAIKAN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'BERAWAL',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'DARI SINI',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Terpercaya lebih',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'dari 45 tahun',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Tombol panah di bagian tengah
            Positioned(
              top: MediaQuery.of(context).size.height * 0.55,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.8),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // Action yang ingin dilakukan saat tombol ditekan
                    },
                    icon: const Icon(Icons.arrow_forward,
                        size: 40, color: Colors.blue),
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
