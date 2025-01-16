import 'package:flutter/material.dart';
import 'package:tugasbesar2/koneksi.dart';

class FivePage extends StatefulWidget {
  const FivePage({super.key});

  @override
  _FivePageState createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {
  final TextEditingController _emailController = TextEditingController();

  // Fungsi untuk memeriksa email apakah ada di database atau tidak
  Future<void> _checkEmailAndResetPassword(String email) async {
    final koneksi = Koneksi();

    // Cek apakah email ada di database
    bool emailExists = await koneksi.checkEmail(email);

    if (emailExists) {
      // Jika email ada, lanjutkan dengan reset password
      bool resetSuccess = await koneksi.resetPassword(email);

      if (resetSuccess) {
        // Tampilkan dialog sukses jika berhasil reset
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Reset Password'),
            content: Text(
              'Instruksi reset password telah dikirim ke email Anda.',
            ),
          ),
        );
      } else {
        // Tampilkan dialog gagal jika reset password gagal
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Gagal Reset Password'),
            content: Text('Terjadi kesalahan saat mereset password.'),
          ),
        );
      }
    } else {
      // Tampilkan dialog jika email tidak ditemukan
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Email Tidak Ditemukan'),
          content: Text(
            'Email yang Anda masukkan tidak terdaftar.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1B2A), // Latar belakang biru gelap
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Lupa password?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Instruksi untuk melakukan reset password akan dikirim melalui email yang kamu gunakan untuk mendaftar.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFFBFD7EA),
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
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon:
                      const Icon(Icons.email_outlined, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Tombol Reset Password
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
                  onPressed: () {
                    // Ambil email dari input
                    String email = _emailController.text.trim();
                    if (email.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email)) {
                      // Tampilkan pesan error jika email tidak valid
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Text('Email Tidak Valid'),
                          content:
                              Text('Format email yang Anda masukkan salah.'),
                        ),
                      );
                    } else {
                      _checkEmailAndResetPassword(email);
                    }
                  },
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
