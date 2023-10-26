import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'coursedetailScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Software courses"),
        backgroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, 'login');
            },
            child: Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Welcome User!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildCourseCard(context, 'C', 'assets/images/c.png'),
                  _buildCourseCard(context, 'C++', 'assets/images/c++.png'),
                  _buildCourseCard(
                      context, 'Flutter', 'assets/images/flutter.png'),
                  _buildCourseCard(
                      context, 'Python', 'assets/images/python.png'),
                  _buildCourseCard(
                      context, 'Angular', 'assets/images/angular.png'),
                  _buildCourseCard(context, 'Css', 'assets/images/css.png'),
                  _buildCourseCard(
                      context, 'JavaScript', 'assets/images/javascript.png'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(
      BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, // Use the context parameter directly
          MaterialPageRoute(
            builder: (context) =>
                CourseDetailScreen(title: title, imagePath: imagePath),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
