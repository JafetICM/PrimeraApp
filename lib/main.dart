//main.dart
import 'package:flutter/material.dart';
import 'Navigation.dart';
import 'List.dart';
import 'images.dart';
import 'forms.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/navigation': (context) => const NavigationDemo(),
        '/list': (context) => const ListPage(),
        '/images': (context) => const ImagesPage(),
        '/forms': (context) => const FormsPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/navigation');
              },
              child: const Text('Go to Navigation Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/list');
              },
              child: const Text('Go to List Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/images');
              },
              child: const Text('Go to Images Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/forms');
              },
              child: const Text('Go to Forms Example'),
            ),
          ],
        ),
      ),
    );
  }
}
