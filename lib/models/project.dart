import 'package:flutter/material.dart';

class Project {
  const Project({
    required this.title,
    required this.icon,
    required this.description,
    required this.techStack,
    required this.contentsText,//開発の背景
    required this.attentionToDetail,//こだわり

    //TODO もし移管できたならリンクは修正すべき
    required this.googlePlayLink,//Googleリンク
    required this.appStoreLink,//AppStoreリンク
    required this.createDate,//公開日
    required this.updateDate,//アップデート日
    required this.version,//最新バージョン
  });

  final String title;
  final IconData icon;
  final String description;
  final String contentsText;
  final String attentionToDetail;
  final String techStack;
  final String googlePlayLink;
  final String appStoreLink;
  final String createDate;
  final String updateDate;
  final String version;


  List<String> get techTags =>
      techStack.split(' / ').map((s) => s.trim()).where((s) => s.isNotEmpty).toList();
}
