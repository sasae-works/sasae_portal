import 'package:flutter/material.dart';

class Project {
  const Project({
    required this.title,
    required this.icon,
    required this.description,
    required this.techStack,
  });

  final String title;
  final IconData icon;
  final String description;
  final String techStack;

  List<String> get techTags =>
      techStack.split(' / ').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
}
