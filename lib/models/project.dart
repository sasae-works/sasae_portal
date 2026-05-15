import 'package:flutter/material.dart';

/// Represents a software project or application developed by Sasae Works.
class Project {
  const Project({
    required this.title,
    required this.icon,
    required this.description,
    required this.techStack,
    required this.contentsText, // Background/Reason for development
    required this.attentionToDetail, // Key features and design focus

    // TODO: Update links if ownership is transferred
    required this.googlePlayLink, // Link to Google Play Store
    required this.appStoreLink, // Link to Apple App Store
    required this.createDate, // Initial release date
    required this.updateDate, // Last updated date
    required this.version, // Current application version
  });

  /// The name of the project.
  final String title;

  /// The icon representing the project.
  final IconData icon;

  /// A brief description of the project.
  final String description;

  /// Detailed background information about the project.
  final String contentsText;

  /// Specific details and highlights of the project's implementation.
  final String attentionToDetail;

  /// The technology stack used for the project.
  final String techStack;

  /// The URL to the project's page on the Google Play Store.
  final String googlePlayLink;

  /// The URL to the project's page on the Apple App Store.
  final String appStoreLink;

  /// The date when the project was first released.
  final String createDate;

  /// The date when the project was last updated.
  final String updateDate;

  /// The current version of the project.
  final String version;

  /// Returns a list of individual technologies from the [techStack] string.
  List<String> get techTags =>
      techStack.split(' / ').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
}
