import 'package:flutter/material.dart';

/// 特定商取引法に基づく表記を表示する画面。
class TokushohoScreen extends StatelessWidget {
  const TokushohoScreen({super.key});

  static const String _disclosure = '請求があった場合、遅滞なく開示いたします。';

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final items = <(String, String)>[
      ('販売事業者', 'Sasae Works'),
      ('運営責任者', _disclosure),
      ('所在地', _disclosure),
      ('電話番号', _disclosure),
      (
      '連絡先メールアドレス',
      'sasae.works@gmail.com\n※所在地・電話番号等の開示をご希望の場合も、こちらまでご連絡ください。',
      ),
      ('販売価格', '各アプリ内の購入画面およびストアの商品ページに表示します。表示価格は税込です。'),
      ('商品代金以外の必要料金', 'インターネット接続に必要な通信料は、お客様のご負担となります。'),
      ('支払方法', 'App Store または Google Play の決済機能によるお支払い'),
      ('支払時期', '購入手続きの時点で、各ストアの定めに従い決済されます。'),
      ('商品の引渡時期', '決済完了後、直ちにご利用いただけます。'),
      (
      '自動更新・解約方法',
      '自動更新型サブスクリプションは、各ストアの定める方法で解約しない限り自動的に更新されます。'
          '解約はApp Store / Google Playのサブスクリプション管理画面から行ってください。'
          'アプリの削除やサインアウトだけでは解約されません。',
      ),
      (
      '返品・キャンセル',
      'デジタルコンテンツの性質上、購入後のお客様都合による返品・キャンセルはお受けできません。'
          '返金については、AppleまたはGoogleの定める手続き・規約に従います。',
      ),
      ('動作環境', '各アプリのストア説明ページに記載の対応OS・端末に準じます。'),
    ];

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 84,
        title: Text(
          '特定商取引法に基づく表記',
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
                    padding: const EdgeInsets.fromLTRB(24, 40, 24, 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '特定商取引法に基づく表記',
                          style: textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              '制定日：2026年11月21日',
                              style: textTheme.bodySmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Text(
                              '最終更新日：2026年11月21日',
                              style: textTheme.bodySmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Sasae Works が提供するアプリ内課金（有料機能・サブスクリプション等）に関する表記です。',
                          style: textTheme.bodyLarge?.copyWith(
                            height: 1.8,
                            color: scheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 32),
                        for (final item in items)
                          _buildRow(scheme, textTheme, item.$1, item.$2),
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

  Widget _buildRow(
      ColorScheme scheme,
      TextTheme textTheme,
      String label,
      String value,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: scheme.outlineVariant.withValues(alpha: 0.6),
          thickness: 1,
          height: 1,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: textTheme.titleMedium?.copyWith(
                  color: scheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: textTheme.bodyLarge?.copyWith(
                  height: 1.8,
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}