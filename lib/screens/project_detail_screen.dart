import 'package:flutter/material.dart';
import 'package:sasae_portal/common/store_link_button_widget.dart';
import 'package:sasae_portal/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

/// A screen that displays detailed information about a specific [Project].
class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // アイコンとタイトル
                        _buildHeader(scheme, textTheme),

                        const SizedBox(height: 40),

                        // --- 追加要素1: リンクボタン ---
                        StoreLinkButtonWidget(googlePlayLink: project.googlePlayLink, appStoreLink: project.appStoreLink),

                        const SizedBox(height: 40),

                        // 概要
                        _buildSectionTitle(scheme, textTheme, '概要'),
                        Text(
                          project.description,
                          style: textTheme.bodyLarge?.copyWith(
                            color: scheme.onSurfaceVariant,
                            height: 1.65,
                          ),
                        ),

                        const SizedBox(height: 32),

                        // --- 追加要素2: 開発の背景 ---
                        _buildSectionTitle(scheme, textTheme, '開発の背景'),
                        const Text(
                          'ここに「なぜこのアプリが必要だと思ったか」というエピソードを記載します。例えば、既存のツールでは設定が複雑すぎて、もっとシンプルに記録できるものが欲しかった、といった内容です。',
                          style: TextStyle(height: 1.65),
                        ),

                        const SizedBox(height: 32),

                        // --- 追加要素3: 工夫したポイント ---
                        _buildSectionTitle(scheme, textTheme, 'こだわったポイント'),
                        _buildPointItem(scheme, 'Drift (SQLite) による高速なローカル保存'),
                        _buildPointItem(scheme, 'メンタルヘルスを考慮した、目に優しい配色とUI設計'),
                        _buildPointItem(scheme, 'ユーザーが迷わないシンプルな画面遷移'),

                        const SizedBox(height: 32),

                        // 技術スタック
                        _buildSectionTitle(scheme, textTheme, '技術スタック'),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: project.techTags.map((t) {
                            return Chip(
                              visualDensity: VisualDensity.compact,
                              label: Text(t),
                              backgroundColor: scheme.surfaceContainerHighest.withValues(alpha: 0.5),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- 共通パーツの切り出し ---

  Widget _buildHeader(ColorScheme scheme, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: scheme.primaryContainer.withValues(alpha: 0.35),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Icon(project.icon, color: scheme.primary, size: 48),
          ),
        ),
        const SizedBox(height: 28),
        Text(
          project.title,
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(ColorScheme scheme, TextTheme textTheme, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: textTheme.titleSmall?.copyWith(
          color: scheme.primary,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
        ),
      ),
    );
  }

  Widget _buildPointItem(ColorScheme scheme, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_outline, size: 20, color: scheme.primary),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(height: 1.5))),
        ],
      ),
    );
  }


}