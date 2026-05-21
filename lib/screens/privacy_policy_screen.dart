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
        titleSpacing: 0,
        leadingWidth: 84,
        title: Text(
          'プライバシーポリシー',
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
                          'プライバシーポリシー',
                          style: textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              '制定日：2026年4月14日',
                              style: textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
                            ),
                            const SizedBox(width: 24),
                            Text(
                              '最終更新日：2026年4月14日',
                              style: textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Sasae Works（以下、「当方」といいます）は、提供するアプリケーション（以下、「本アプリ」といいます）におけるユーザー情報の取扱いについて、以下の通りプライバシーポリシーを定めます。',
                          style: textTheme.bodyLarge?.copyWith(
                            height: 1.8,
                            color: scheme.onSurfaceVariant,
                          ),
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '1. ユーザー情報の収集・送信について',
                          '本アプリでは、氏名、メールアドレス、電話番号など、個人を直接特定できる情報を当方のサーバーへ送信・収集することはありません。\n本アプリ内に入力されたデータは原則としてユーザーの端末内に保存されますが、ユーザーがバックアップ機能を利用する場合に限り、ユーザーご自身が指定・管理する外部クラウドストレージ（Google Drive等）に暗号化されたデータが保存されます。当方がこれらのデータを閲覧、収集, または管理することはありません。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '2. 広告配信について（Google AdMob）',
                          '本アプリでは、第三者（Google Inc.）が提供する広告配信サービス「Google AdMob」を利用しています。広告配信のために、端末の広告識別子（IDFA / AAID）、デバイスに関する情報、およびアプリ内での動作ログが、自動的にGoogleのサーバーへ送信・収集される場合があります。これらの情報は匿名の識別子であり、個人を直接特定するものではありません。\nユーザーは、端末の設定（iOSの「トラッキングの制限」、Androidの「広告のパーソナライズをオプトアウトする」等）により、これらの情報収集を制限することができます。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '3. アプリ内課金について（RevenueCat）',
                          '本アプリでは、アプリ内決済（サブスクリプションおよびアイテム購入）の管理と検証のために、外部サービス「RevenueCat」を利用しています。\n決済の処理および購入ステータスの維持を目的として、ユーザーの購入履歴情報（購入日時、プロダクトID、決済ステータス等）およびアプリが発行した匿名の識別子（App User ID）がRevenueCatのサーバーに送信され、管理されます。これらには氏名やクレジットカード番号などの金融情報は含まれません。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '4. カメラ機能の利用について',
                          '本アプリの一部機能（焼肉の判定機能等）において、カメラを使用する場合があります。取得した画像データはリアルタイムの解析処理にのみ使用され、当方が当該画像データを収集、保存、または外部サーバーへ送信することはありません。\n画像の解析はお使いの端末内でのみ完結するオンデバイス処理で行われており、インターネット接続を必要としません。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '5. データの管理',
                          '本アプリのデータは端末内（およびユーザーご自身が設定したバックアップ先）に保存されているため、アプリを削除すると端末内の全てのデータが消去されます。当方がユーザーのデータを保持・管理することはないため、当方によるデータの復元等の依頼には応じかねます。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '6. 免責事項',
                          '本アプリはセルフケアの支援や日常の利便性向上を目的としたものであり、医学的な診断や治療を代替するものではありません。本アプリの利用によって生じた損害やトラブルについて、当方は一切の責任を負いません。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '7. お問い合わせ窓口',
                          'ご質問等は、下記のメールアドレスまでご連絡ください。\n\nSasae Works 運営窓口\nE-mail: sasae.works@gmail.com',
                        ),

                        const SizedBox(height: 80),
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

  Widget _buildSection(ColorScheme scheme, TextTheme textTheme, String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(scheme, textTheme, title),
        Text(
          content,
          style: textTheme.bodyLarge?.copyWith(
            height: 1.8,
            color: scheme.onSurfaceVariant,
          ),
        ),
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
              Expanded(
                child: Text(
                  title,
                  style: textTheme.titleLarge?.copyWith(
                    color: scheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
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
}
