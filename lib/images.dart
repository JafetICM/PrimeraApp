//images.dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Images App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImagesPage(),
    );
  }
}

class ImagesPage extends StatelessWidget {
  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Images'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Image from the Internet:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Image.network('https://picsum.photos/250?image=9'),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Image with Fade-in Placeholder:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Stack(
            children: <Widget>[
              const Center(child: CircularProgressIndicator()),
              Center(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/placeholder.png',
                  image: 'https://picsum.photos/250?image=10',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Image with Asset Placeholder:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          FadeInImage.assetNetwork(
            placeholder: 'assets/loading.gif',
            image: 'https://picsum.photos/250?image=11',
          ),
        ],
      ),
    );
  }
}