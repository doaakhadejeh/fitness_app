import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      appBar: AppBar(
        backgroundColor: Colors.purple.shade50,
        title: Text(
          "About Us",
          style: TextStyle(color: Colors.deepPurple[100], fontSize: 17),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 20,
            ),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.deepPurple.shade200,
              child: const Icon(
                Icons.fitness_center,
                size: 60,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),

            // عنوان
            const Text(
              "Welcome to Fitness App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            const Text(
              "fitness is your companion to achieve a healthier and more active lifestyle. "
              "With a variety of exercises, customized plans, and progress tracking, "
              "we are here to help you reach your goals!",
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialIcon(Icons.email, "support@fitness.com"),
                _buildSocialIcon(Icons.web, "www.fitness.com"),
                _buildSocialIcon(Icons.phone, "+1234567890"),
              ],
            ),

            const SizedBox(height: 30),

            // نص حقوق
            Text(
              "© 2025 fitness Team. All rights reserved.",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.deepPurple.shade300,
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 100,
          child: Text(
            label,
            style: const TextStyle(fontSize: 10),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
