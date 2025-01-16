import 'dart:convert';
import 'package:http/http.dart' as http;

class Koneksi {
  final String baseUrl =
      "http://127.0.0.1:8000"; // Ganti dengan URL backend Anda

  // Fungsi untuk registrasi pengguna
  Future<bool> register(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        return true; // Pendaftaran berhasil
      } else {
        print('Error: ${response.body}');
        return false; // Gagal
      }
    } catch (e) {
      print('Error: $e');
      return false; // Error saat request
    }
  }

  // Fungsi untuk login pengguna
  Future<bool> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // Memeriksa apakah login berhasil berdasarkan 'access_token'
        if (data['access_token'] != null) {
          return true; // Login berhasil
        }
      }
      return false; // Login gagal
    } catch (e) {
      print('Error login: $e');
      return false; // Error saat request
    }
  }

  // Fungsi untuk memeriksa apakah email terdaftar
  Future<bool> checkEmail(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/check-email'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email}),
      );

      if (response.statusCode == 200) {
        return true; // Email ditemukan
      } else {
        return false; // Email tidak ditemukan
      }
    } catch (e) {
      print('Error: $e');
      return false; // Error saat request
    }
  }

  // Fungsi untuk reset password (misalnya dengan mengirimkan instruksi)
  Future<bool> resetPassword(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/check-email'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email}),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return true; // Email found
    } else {
      return false; // Email not found
    }
  }
}
