// titled_page.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// Define a common interface or superclass for pages with a title property
abstract class TitledPage extends StatelessWidget {
  String get title;
}

class HomePageContent extends StatelessWidget implements TitledPage {
  @override
  final String title;

  HomePageContent({required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: PieChart(
              PieChartData(
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: [
                  for (int i = 0; i < 7; i++)
                    PieChartSectionData(
                      color: getRandomColor(),
                      value: 100 / 7,
                      title: '${i + 1}',
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Video (Dummy)'),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget implements TitledPage {
  @override
  final String title;

  ProfilePage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('$title Page Content (Dummy)'),
      ),
    );
  }
}

class PlansPage extends StatelessWidget implements TitledPage {
  @override
  final String title;

  PlansPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('$title Page Content (Dummy)'),
      ),
    );
  }
}

class RecipesPage extends StatelessWidget implements TitledPage {
  @override
  final String title;

  RecipesPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('$title Page Content (Dummy)'),
      ),
    );
  }
}

Color getRandomColor() {
  // Generate random RGB values
  final int r = (DateTime.now().millisecond % 256);
  final int g = ((DateTime.now().millisecond ~/ 256) % 256);
  final int b = ((DateTime.now().millisecond ~/ 256 ~/ 256) % 256);

  // Create a Color object using the generated RGB values
  return Color.fromRGBO(r, g, b, 1.0);
}
