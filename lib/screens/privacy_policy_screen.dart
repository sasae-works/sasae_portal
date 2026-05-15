import 'package:flutter/material.dart';

/// A screen that displays the privacy policy for Sasae Works applications.
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('プライバシーポリシー'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
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
                    const SizedBox(height: 16),
                    const Text('Sasae Works（以下、「当方」といいます）は、提供するアプリケーション（以下、「本アプリ」といいます）におけるユーザー情報の取扱いについて、以下の通りプライバシーポリシーを定めます。'),
                    const SizedBox(height: 32),

                    _Section(
                      title: '1. 個人情報の収集・送信について',
                      content: '本アプリでは、氏名やメールアドレスなどの個人情報をサーバーへ送信・収集することはありません。アプリ内に入力されたデータは、すべてユーザーの端末内にのみ保存されます。',
                      scheme: scheme,
                      textTheme: textTheme,
                    ),

                    // --- 追加：カメラ権限に関する項目 ---
                    _Section(
                      title: '2. カメラ機能の利用について',
                      content: '本アプリの一部機能（焼肉の判定機能等）において、カメラを使用する場合があります。取得した画像データはリアルタイムの解析処理にのみ使用され、当方が当該画像データを収集、保存、または外部サーバーへ送信することはありません。',
                      scheme: scheme,
                      textTheme: textTheme,
                    ),

                    _Section(
                      title: '3. データの管理',
                      content: '本アプリのデータは端末内に保存されているため、アプリを削除すると全てのデータが消去されます。当方がユーザーのデータを保持することはないため、復元等の依頼には応じかねます。',
                      scheme: scheme,
                      textTheme: textTheme,
                    ),

                    _Section(
                      title: '4. 免責事項',
                      content: '本アプリはセルフケアの支援を目的としたものであり、医学的な診断や治療を代替するものではありません。利用によって生じた損害やトラブルについて、当方は一切の責任を負いません。',
                      scheme: scheme,
                      textTheme: textTheme,
                    ),

                    _Section(
                      title: '5. お問い合わせ窓口',
                      content: 'ご質問等は、下記のメールアドレスまでご連絡ください。\n\nSasae Works 運営窓口\nE-mail: sasae.works@gmail.com',
                      scheme: scheme,
                      textTheme: textTheme,
                    ),

                    const SizedBox(height: 40),
                    const Divider(),
                    const SizedBox(height: 20),
                    Text(
                      '制定日：2026年4月14日', // 日付を更新
                      style: textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 60),
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
      padding: const EdgeInsets.only(bottom: 32),
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
          const SizedBox(height: 12),
          Text(
            content,
            style: textTheme.bodyLarge?.copyWith(
              height: 1.7,
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}