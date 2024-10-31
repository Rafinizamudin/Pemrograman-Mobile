import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.teal,
          body: const TabBarView(
            children: [
              HomePage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.amber,
            color: Colors.white,
            items: const [
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.people, title: 'Profile')
            ],

            onTap: (int i) => print('index page$i'),
          )),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("images/pic.png"),
          radius: 50.0,
        ),
        Text(
          'Rafi Nizamudin',
          style: GoogleFonts.pacifico(
            fontSize: 35.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          'Full Stack Developer',
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        const Text(
          'Coding & Learn a new thing!',
          style: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          color: Colors.white,
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Icon(
                  Icons.phone_android,
                  color: Colors.teal,
                )),
              Text(
                '085715619226',
                style: TextStyle(color: Colors.teal, fontSize: 20.0),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
          color: Colors.white,
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 10.0, left: 10.0),
                child: Icon(
                  Icons.email,
                  color: Colors.teal,
                )),
              Text(
                'rafi.nizamudin01@gmail.com',
                style: TextStyle(color: Colors.teal, fontSize: 20.0),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Image(
            image: AssetImage("images/logo-universitas-mercu-buana.png")));
  }  
}
