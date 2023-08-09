import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// shimmer package ko pubspec.yaml file me add kiya jata hai

class shimmer_effect extends StatefulWidget {
  const shimmer_effect({super.key});

  @override
  State<shimmer_effect> createState() => _shimmer_effectState();
}

class _shimmer_effectState extends State<shimmer_effect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer Effect'),
      ),
      body: Center(
        child: Container(
          child: Shimmer.fromColors(
            direction: ShimmerDirection.btt, // direction bottom to top
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Container(
                  child: Center(child: Text(index.toString())),
                  margin: EdgeInsets.all(10),
                  height: 100,
                  width: 400,
                  color: Colors.red,
                );
              },
            ),

            /*
            child: Text(
              'Subscribe',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            */
            // baseColor: Colors.teal,
            highlightColor: Colors.teal, baseColor: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
