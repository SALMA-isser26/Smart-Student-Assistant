import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('À propos'),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Smart Student Assistant est une application pédagogique développée avec Flutter pour aider les étudiants dans leur environnement académique.',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge,
          ),
        ),
      ),
    );
  }
}
