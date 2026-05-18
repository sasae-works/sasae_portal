import 'package:flutter/material.dart';

/// Represents a software project or application developed by Sasae Works.
class Project {
  const Project({
    required this.title,
    required this.icon,
    required this.summary,//最初のページで出す要約テキスト
    required this.recommendedText,//このアプリがおすすめな人みたいなテキスト
    required this.mainText,//凄く長いストアに出してる詳細なテキスト
    required this.techStack,
    required this.contentsText,
    required this.attentionToDetail,
    required this.jpImageList,
    required this.enImageList,
    required this.googlePlayLink,
    required this.appStoreLink,
    required this.createDate,
    required this.updateDate,
    required this.version,
  });

  /// The name of the project.
  final String title;

  /// The asset path to the icon representing the project.
  final String icon;

  /// A summary of the project.
  final String summary;

  /// A brief description of the project.
  final String recommendedText;

  /// A brief description of the project.
  final String mainText;

  /// Detailed background information about the project.
  final String contentsText;

  /// Specific details and highlights of the project's implementation.
  final String attentionToDetail;

  /// List of Japanese screenshot asset paths.
  final List<String> jpImageList;

  /// List of English screenshot asset paths.
  final List<String> enImageList;

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
