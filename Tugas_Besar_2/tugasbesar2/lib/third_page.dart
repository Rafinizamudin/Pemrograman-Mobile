import 'package:flutter/material.dart';
import 'package:tugasbesar2/five_page.dart';
import 'package:tugasbesar2/four_page.dart';
import 'package:tugasbesar2/koneksi.dart';
import 'package:tugasbesar2/second_page.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool _isPasswordVisible = false; // Untuk mengontrol visibilitas kata sandi
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    // Cek apakah email dan password sudah diisi
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Peringatan"),
          content: Text("Email dan password tidak boleh kosong."),
        ),
      );
      return;
    }

    final koneksi = Koneksi();
    bool success = await koneksi.login(
      _emailController.text.trim(),
      _passwordController.text,
    );
    if (success) {
      // Arahkan pengguna ke halaman berikutnya (misalnya ke halaman utama setelah login)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SecondPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Gagal"),
          content: Text("Email atau password salah."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A), // Latar belakang biru gelap
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo Sleepy Panda
              Image.asset(
                'images/Picture1.png',
                height: 150,
              ),
              const SizedBox(height: 20),

              // Judul login
              const Text(
                'Masuk menggunakan akun yang sudah kamu daftarkan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFBFD7EA), // Warna teks terang
                ),
              ),
              const SizedBox(height: 30),

              // Input Email
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1B263B),
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Color(0xFFBFD7EA)),
                  prefixIcon: const Icon(Icons.email_outlined,
                      color: Color(0xFFBFD7EA)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Input Kata Sandi
              TextField(
                controller: _passwordController,
                style: const TextStyle(color: Colors.white),
                obscureText:
                    !_isPasswordVisible, // Mengatur visibilitas kata sandi
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF1B263B),
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Color(0xFFBFD7EA)),
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Color(0xFFBFD7EA)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Color(0xFFBFD7EA),
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Teks "Lupa password?"
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FivePage(),
                      ),
                    );
                  }, // Aksi untuk lupa password
                  child: const Text(
                    'Lupa password?',
                    style: TextStyle(
                      color: Color(0xFF6FFFE9), // Warna aksen hijau terang
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Tombol Login
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00BFA5), // Warna tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: _login,
                  child: const Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Teks "Belum memiliki akun? Daftar sekarang"
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Belum memiliki akun?',
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FourPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Daftar sekarang',
                      style: TextStyle(color: Colors.tealAccent),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
