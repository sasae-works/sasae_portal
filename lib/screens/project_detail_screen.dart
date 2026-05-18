import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sasae_portal/common/store_link_button_widget.dart';
import 'package:sasae_portal/models/project.dart';

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
                        // Icon and Title
                        _buildHeader(scheme, textTheme),

                        const SizedBox(height: 16),

                        // Summary as lead text
                        Text(
                          project.summary,
                          style: textTheme.titleMedium?.copyWith(
                            color: scheme.primary,
                            fontWeight: FontWeight.w500,
                            height: 1.5,
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Store Links
                        StoreLinkButtonWidget(googlePlayLink: project.googlePlayLink, appStoreLink: project.appStoreLink),

                        const SizedBox(height: 40),

                        // Overview
                        _buildSectionTitle(scheme, textTheme, '概要'),
                        Text(
                          project.description,
                          style: textTheme.bodyLarge?.copyWith(
                            color: scheme.onSurfaceVariant,
                            height: 1.65,
                          ),
                        ),

                        if (project.jpImageList.isNotEmpty) ...[
                          const SizedBox(height: 40),
                          _buildSectionTitle(scheme, textTheme, 'スクリーンショット'),
                          const SizedBox(height: 16),
                          ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                              dragDevices: {
                                PointerDeviceKind.touch,
                                PointerDeviceKind.mouse,
                                PointerDeviceKind.trackpad,
                              },
                            ),
                            child: SizedBox(
                              height: 500,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                itemCount: project.jpImageList.length,
                                separatorBuilder: (context, index) => const SizedBox(width: 16),
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(vertical: 12),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.1),
                                          blurRadius: 20,
                                          offset: const Offset(0, 8),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        project.jpImageList[index],
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],

                        const SizedBox(height: 32),

                        // Development Background
                        _buildSectionTitle(scheme, textTheme, '開発の背景'),
                        Text(
                          project.contentsText,
                          style: const TextStyle(height: 1.65),
                        ),

                        const SizedBox(height: 32),

                        // Attention to Detail
                        _buildSectionTitle(scheme, textTheme, 'こだわったポイント'),
                        Text(
                          project.attentionToDetail,
                          style: const TextStyle(height: 1.65),
                        ),

                        const SizedBox(height: 32),

                        // Tech Stack
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

  Widget _buildHeader(ColorScheme scheme, TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(project.icon, width: 80, height: 80, fit: BoxFit.cover),
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
}
