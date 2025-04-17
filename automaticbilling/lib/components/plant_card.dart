import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String category;
  final String description;
  final VoidCallback onDetailsPressed;
  final VoidCallback onBuyPressed;

  PlantCard({
    required this.imageUrl,
    required this.name,
    required this.category,
    required this.description,
    required this.onDetailsPressed,
    required this.onBuyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(
            imageUrl,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Category: $category',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: onDetailsPressed,
                      child: Text('Details'),
                    ),
                    ElevatedButton(
                      onPressed: onBuyPressed,
                      child: Text('Buy'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Plant Cards'),
      ),
      body: ListView(
        children: <Widget>[
          PlantCard(
            imageUrl:
            'https://example.com/plant1.jpg',
            name: 'Plant 1',
            category: 'Indoor',
            description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean a libero et urna placerat tristique.',
            onDetailsPressed: () {
              // Handle Details button press
            },
            onBuyPressed: () {
              // Handle Buy button press
            },
          ),
          PlantCard(
            imageUrl:
            'https://example.com/plant2.jpg',
            name: 'Plant 2',
            category: 'Outdoor',
            description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean a libero et urna placerat tristique.',
            onDetailsPressed: () {
              // Handle Details button press
            },
            onBuyPressed: () {
              // Handle Buy button press
            },
          ),
          // Add more PlantCard widgets as needed
        ],
      ),
    ),
  ));
}
