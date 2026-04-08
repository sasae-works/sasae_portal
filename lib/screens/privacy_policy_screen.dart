import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('プライバシーポリシー'),
      ),
      body: SelectionArea(
        child: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'プライバシーポリシー',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: scheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 32),
                    _Section(
                      title: '1. 個人情報の収集',
                      content: '当プロジェクトのアプリでは、ユーザーの個人情報を直接収集することはありません。アプリ内データはローカルストレージ（Drift等）に保存され、外部サーバーに送信されることはありません。',
                      scheme: scheme,
                      textTheme: textTheme,
                    ),
                    _Section(
                      title: '2. データの利用目的',
                      content: 'アプリ内で入力されたデータは、ユーザー自身のセルフケアや振り返りのためにのみ使用されます。',
                      scheme: scheme,
                      textTheme: textTheme,
                    ),
                    _Section(
                      title: '3. 第三者への提供',
                      content: '当プロジェクトがユーザーのデータを第三者に提供することはありません。',
                      scheme: scheme,
                      textTheme: textTheme,
                    ),
                    _Section(
                      title: '4. 免責事項',
                      content: '本アプリの利用によって生じた損害について、開発者は一切の責任を負いません。本アプリは医療機器ではなく、医学的な助言を提供するものではありません。',
                      scheme: scheme,
                      textTheme: textTheme,
                    ),
                    _Section(
                      title: '5. お問い合わせ',
                      content: 'プライバシーポリシーに関するお問い合わせは、プロジェクトの窓口までご連絡ください。',
                      scheme: scheme,
                      textTheme: textTheme,
                    ),
                    const SizedBox(height: 40),
                    Text(
                      '制定日：2024年1月1日',
                      style: textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: scheme.primary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: textTheme.bodyLarge?.copyWith(
              height: 1.6,
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
