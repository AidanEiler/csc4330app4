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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Shortened list of dog breeds
  final List<String> dogBreeds = [
    'Labrador Retriever',
    'German Shepherd',
    'Golden Retriever',
    'Bulldog',
    'Beagle',
  ];

  // Map to track the tap count for each breed
  Map<String, int> breedTapCount = {
    'Labrador Retriever': 0,
    'German Shepherd': 0,
    'Golden Retriever': 0,
    'Bulldog': 0,
    'Beagle': 0,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dog Breeds'),
      ),
      body: Column(
        children: [
          // List of dog breed buttons
          Expanded(
            child: ListView.builder(
              itemCount: dogBreeds.length,
              itemBuilder: (context, index) {
                String breed = dogBreeds[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Increment the count for the tapped breed
                        breedTapCount[breed] = breedTapCount[breed]! + 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      breed,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                );
              },
            ),
          ),
          // Counter section that shows cumulative tap counts for all breeds
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Divider(),  // Optional divider to separate counters
                const SizedBox(height: 8),
                Text(
                  'Bark counter:',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Column(
                  children: dogBreeds.map((breed) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(
                        '$breed: ${breedTapCount[breed]} Barks',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
