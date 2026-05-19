import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sasae_portal/common/store_link_button_widget.dart';
import 'package:sasae_portal/models/project.dart';
import 'package:sasae_portal/value/announcements_list.dart';

/// A screen that displays detailed information about a specific [Project].
class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Filter announcements for this project
    final projectAnnouncements = announceAppList.where((a) => a.createdAPP == project.appType).toList();

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 84, // 戻るボタン付近の余白を拡大
        title: Text(
          project.title,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      body: SelectionArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 64), // 上下余白を増やして「空気感」を醸成
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
                            height: 1.6, // 行間を微調整
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Store Links
                        StoreLinkButtonWidget(googlePlayLink: project.googlePlayLink, appStoreLink: project.appStoreLink),

                        const SizedBox(height: 40),

                        _buildSectionTitle(scheme, textTheme, '概要'),
                        Text(
                          project.recommendedText,
                          style: textTheme.bodyLarge?.copyWith(
                            color: scheme.onSurfaceVariant,
                            height: 1.8,
                          ),
                        ),

                        if (project.mainText.isNotEmpty) ...[
                          _ExpandableMainText(
                            title: '機能と特徴の詳細',
                            content: project.mainText,
                            scheme: scheme,
                            textTheme: textTheme,
                          ),
                        ],

                        if (project.jpImageList.isNotEmpty) ...[
                          const SizedBox(height: 40),
                          _buildSectionTitle(scheme, textTheme, 'スクリーンショット'),
                          const SizedBox(height: 16),
                          Scrollbar(
                            thumbVisibility: true,
                            child: ScrollConfiguration(
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
                          ),
                        ],

                        const SizedBox(height: 32),

                        // Development Background
                        _buildSectionTitle(scheme, textTheme, '開発の背景'),
                        Text(
                          project.contentsText,
                          style: textTheme.bodyLarge?.copyWith(
                            color: scheme.onSurfaceVariant,
                            height: 1.8,
                          ),
                        ),

                        const SizedBox(height: 32),

                        // Attention to Detail
                        _buildSectionTitle(scheme, textTheme, 'こだわったポイント'),
                        Text(
                          project.attentionToDetail,
                          style: textTheme.bodyLarge?.copyWith(
                            color: scheme.onSurfaceVariant,
                            height: 1.8,
                          ),
                        ),

                        if (projectAnnouncements.isNotEmpty) ...[
                          _ExpandableReleaseNotes(
                            announcements: projectAnnouncements,
                            scheme: scheme,
                            textTheme: textTheme,
                          ),
                        ],

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
      padding: const EdgeInsets.only(top: 48, bottom: 16), // 上部の余白を増やしてセクションの区切りを明確に
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // 装飾用の縦棒を少し強調
              Container(
                width: 6,
                height: 24,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 14),
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  color: scheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 20, // 20pxに拡大して強調
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(
            color: scheme.outlineVariant.withValues(alpha: 0.6), // 区切り線を少し強調
            thickness: 1,
            height: 1,
          ),
        ],
      ),
    );
  }
}

/// A widget that displays release notes with an option to expand historical updates.
class _ExpandableReleaseNotes extends StatefulWidget {
  const _ExpandableReleaseNotes({
    required this.announcements,
    required this.scheme,
    required this.textTheme,
  });

  final List<announceUpdateApp> announcements;
  final ColorScheme scheme;
  final TextTheme textTheme;

  @override
  State<_ExpandableReleaseNotes> createState() => _ExpandableReleaseNotesState();
}

class _ExpandableReleaseNotesState extends State<_ExpandableReleaseNotes> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final first = widget.announcements.first;
    final remaining = widget.announcements.skip(1).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(widget.scheme, widget.textTheme, 'リリースノート'),
        const SizedBox(height: 8),
        _buildAnnouncementItem(first),
        if (remaining.isNotEmpty) ...[
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Column(
              children: remaining.map((a) => _buildAnnouncementItem(a)).toList(),
            ),
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
          const SizedBox(height: 16),
          Center(
            child: TextButton.icon(
              onPressed: () => setState(() => _isExpanded = !_isExpanded),
              icon: Icon(_isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded),
              label: Text(_isExpanded ? '過去の履歴を閉じる' : '過去の履歴をすべて見る'),
              style: TextButton.styleFrom(
                foregroundColor: widget.scheme.primary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: widget.scheme.primary.withValues(alpha: 0.2)),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSectionTitle(ColorScheme scheme, TextTheme textTheme, String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 6,
                height: 24,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: 14),
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  color: scheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Divider(
            color: scheme.outlineVariant.withValues(alpha: 0.6),
            thickness: 1,
            height: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementItem(announceUpdateApp announcement) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                announcement.date,
                style: widget.textTheme.labelLarge?.copyWith(
                  color: widget.scheme.primary,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: widget.scheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'v${announcement.version}',
                  style: widget.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...announcement.contents.map((content) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                content,
                style: widget.textTheme.bodyMedium?.copyWith(
                  color: widget.scheme.onSurfaceVariant,
                  height: 1.6,
                ),
              ),
            );
          }),
          const Divider(height: 32),
        ],
      ),
    );
  }
}

/// A widget that displays a collapsed text section with a "Read More" button.
class _ExpandableMainText extends StatefulWidget {
  const _ExpandableMainText({
    required this.title,
    required this.content,
    required this.scheme,
    required this.textTheme,
  });

  final String title;
  final String content;
  final ColorScheme scheme;
  final TextTheme textTheme;

  @override
  State<_ExpandableMainText> createState() => _ExpandableMainTextState();
}

class _ExpandableMainTextState extends State<_ExpandableMainText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 24,
                    decoration: BoxDecoration(
                      color: widget.scheme.primary,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Text(
                    widget.title,
                    style: widget.textTheme.titleLarge?.copyWith(
                      color: widget.scheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      letterSpacing: 0.5,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Divider(
                color: widget.scheme.outlineVariant.withValues(alpha: 0.6),
                thickness: 1,
                height: 1,
              ),
            ],
          ),
        ),
        AnimatedCrossFade(
          firstChild: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 160),
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.black, Colors.transparent],
                  stops: const [0.0, 0.6, 1.0],
                ).createShader(rect);
              },
              blendMode: BlendMode.dstIn,
              child: Text(
                widget.content,
                style: widget.textTheme.bodyLarge?.copyWith(
                  color: widget.scheme.onSurfaceVariant,
                  height: 1.8,
                ),
              ),
            ),
          ),
          secondChild: Text(
            widget.content,
            style: widget.textTheme.bodyLarge?.copyWith(
              color: widget.scheme.onSurfaceVariant,
              height: 1.8,
            ),
          ),
          crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 300),
        ),
        const SizedBox(height: 16),
        Center(
          child: TextButton.icon(
            onPressed: () => setState(() => _isExpanded = !_isExpanded),
            icon: Icon(_isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded),
            label: Text(_isExpanded ? '詳細を閉じる' : '詳細をすべて見る'),
            style: TextButton.styleFrom(
              foregroundColor: widget.scheme.primary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: widget.scheme.primary.withValues(alpha: 0.2)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
