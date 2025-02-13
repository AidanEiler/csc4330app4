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
  final List<String> dogBreeds = [
    'Labrador Retriever',
    'German Shepherd',
    'Golden Retriever',
    'Bulldog',
    'Beagle',
  ];

  final Map<String, String> breedImages = {
    'Labrador Retriever': 'assets/pictures/lab.jpg',
    'German Shepherd': 'assets/pictures/german.jpg',
    'Golden Retriever': 'assets/pictures/golden.jpg',
    'Bulldog': 'assets/pictures/bull.jpg',
    'Beagle': 'assets/pictures/beagle.jpg',
  };

  Map<String, int> breedTapCount = {
    'Labrador Retriever': 0,
    'German Shepherd': 0,
    'Golden Retriever': 0,
    'Bulldog': 0,
    'Beagle': 0,
  };

  String? selectedBreedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Dog Breeds'),
      ),
      body: Column(
        children: [
          // Dog breed buttons with reduced size
          SizedBox(
            height: 200, // Smaller height for buttons section
            child: ListView.builder(
              itemCount: dogBreeds.length,
              itemBuilder: (context, index) {
                String breed = dogBreeds[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        breedTapCount[breed] = breedTapCount[breed]! + 1;
                        selectedBreedImage = breedImages[breed];
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8), // Reduced padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      breed,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge, // Smaller font size
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          // Image Section (now placed in the middle)
          if (selectedBreedImage != null)
            Image.asset(
              selectedBreedImage!,
              height: 250, // Increased image size
              width: 250,
              fit: BoxFit.cover,
            ),

          const SizedBox(height: 20),

          // Bark counter now at the bottom
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Divider(),
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
            ),
          ),
        ],
      ),
    );
  }
}
