import 'package:flutter/material.dart';
import 'package:tugasbesar2/five_page.dart';
import 'package:tugasbesar2/third_page.dart';
import 'package:tugasbesar2/koneksi.dart';

class FourPage extends StatefulWidget {
  const FourPage({super.key});

  @override
  _FourPageState createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  bool _isPasswordVisible = false; // Untuk mengontrol visibilitas kata sandi
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _register() async {
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
    bool success = await koneksi.register(
      _emailController.text.trim(),
      _passwordController.text,
    );

    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ThirdPage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Gagal"),
          content: Text("Pendaftaran gagal. Silakan coba lagi."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A), // Background gelap
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo Sleepy Panda
              Image.asset(
                'images/Picture1.png',
                height: 150,
              ),
              const SizedBox(height: 20),

              // Judul login
              const Text(
                'Daftar menggunakan email yang valid',
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
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: const Color(0xFF1B263B),
                  prefixIcon:
                      const Icon(Icons.email_outlined, color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),

              // Input Kata Sandi
              TextField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: const Color(0xFF1B263B),
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Colors.white70),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.white70,
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
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),

              // Teks lupa password
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
                  },
                  child: const Text(
                    'Lupa password?',
                    style: TextStyle(color: Colors.tealAccent),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Daftar
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00BFA5), // Warna tombol
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: _register,
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Teks sudah memiliki akun
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sudah memiliki akun?',
                    style: TextStyle(color: Colors.white70),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ThirdPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Masuk sekarang',
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
