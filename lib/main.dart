import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog Breeds',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(), // Removed const here
    );
  }
}

class MyHomePage extends StatelessWidget {
  // Removed the 'const' here
  MyHomePage({super.key});

  // Shortened list of dog breeds
  final List<String> dogBreeds = [
    'Labrador Retriever',
    'German Shepherd',
    'Golden Retriever',
    'Bulldog',
    'Beagle',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dog Breeds'),
      ),
      body: ListView.builder(
        itemCount: dogBreeds.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                // You can add functionality for each dog breed here
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You tapped on ${dogBreeds[index]}')),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                dogBreeds[index],
                style: Theme.of(context).textTheme.headlineMedium, // Replaced headline6 with headlineMedium
              ),
            ),
          );
        },
      ),
    );
  }
}
