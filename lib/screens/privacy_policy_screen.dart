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
          'プライバシーポリシー・利用規約',
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
                          'プライバシーポリシー・利用規約',
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
                              '最終更新日：2026年7月13日',
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
                          '本アプリでは、氏名、メールアドレス、電話番号など、個人を直接特定できる情報を当方のサーバーへ送信・収集することはありません。\n本アプリ内に入力されたデータは原則としてユーザーの端末内に保存されますが、ユーザーがバックアップ機能を利用する場合に限り、ユーザーご自身が指定・管理する外部クラウドストレージサービスに暗号化されたデータが保存されます。当方がこれらのデータを閲覧、収集、または管理することはありません。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '2. 広告配信について（Google AdMob）',
                          '本アプリでは、第三者（Google LLC）が提供する広告配信サービス「Google AdMob」を利用しています。広告配信のために、端末の広告識別子（IDFA / AAID）、デバイスに関する情報、およびアプリ内での動作ログが、自動的にGoogle LLCのサーバーへ送信・収集される場合があります。これらの情報は匿名の識別子であり、個人を直接特定するものではありません。\nユーザーは、端末の設定（iOSの「トラッキングの制限」、Androidの「広告のパーソナライズをオプトアウトする」等）により、これらの情報収集を制限することができます。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '3. アプリ内課金について（RevenueCat）',
                          '本アプリでは、アプリ内決済（サブスクリプションおよびアイテム購入）の管理と検証のために、外部サービス「RevenueCat」を利用しています。\n決済の処理および購入ステータスの維持を目的として、ユーザーの購入履歴情報（購入日時、プロダクトID、決済ステータス等）およびアプリまたはRevenueCatが発行する匿名の識別子（App User ID）がRevenueCatのサーバーに送信され、管理されます。これらには氏名やクレジットカード番号などの金融情報は含まれません。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                         '4. カメラ機能の利用について',
                          '本アプリでは、一部機能においてカメラ機能または写真ライブラリへのアクセスを利用する場合があります。取得した画像データは、ユーザーが選択した機能の実行に必要な範囲でのみ利用され、当方が当該画像データを収集、保存、または外部サーバーへ送信することはありません。画像の解析処理を行う機能を提供する場合は、お使いの端末内で完結するオンデバイス処理で実施され、インターネット接続を必要としません。',
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
                          '本アプリは、日常の利便性向上、記録・管理、情報提供等を目的として提供されるものです。当方は、本アプリの内容の正確性、完全性、有用性および特定目的への適合性を保証するものではありません。本アプリの利用によって生じた損害やトラブルについて、当方の故意または重過失による場合を除き、当方は責任を負わないものとします。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '7. お問い合わせ窓口',
                          'ご質問等は、下記のメールアドレスまでご連絡ください。\n\nSasae Works 運営窓口\nE-mail: sasae.works@gmail.com',
                        ),


                        // 利用規約セクション
                        const SizedBox(height: 80),

                        Text(
                          '利用規約',
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
                              '最終更新日：2026年7月13日',
                              style: textTheme.bodySmall?.copyWith(color: scheme.onSurfaceVariant),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Sasae Works（以下、「当方」といいます）が提供するアプリケーション（以下、「本アプリ」といいます）の利用条件を定めるものです。本アプリを利用するユーザーは、本規約に同意の上、本アプリを利用するものとします。',
                          style: textTheme.bodyLarge?.copyWith(
                            height: 1.8,
                            color: scheme.onSurfaceVariant,
                          ),
                        ),

                        _buildSection(scheme, textTheme, '第1条（適用）',
                            '本規約は、ユーザーと当方との間の本アプリの利用に関わる一切の関係に適用されます。'),

                        _buildSection(
                          scheme,
                          textTheme,
                          '第2条（利用環境および自己責任）',
                          '1. ユーザーは、本アプリを利用するために必要な端末、通信環境その他の利用環境を自己の責任と費用において準備するものとします。\n'
                              '2. アプリを削除した場合、端末内に保存されたデータは削除され、当方による復元はできません。\n'
                              '3. バックアップ機能を利用する場合、ユーザーご自身の責任において外部クラウドストレージサービスを管理するものとします。当方の故意または重過失による場合を除き、当方はバックアップデータの紛失・破損について責任を負いません。',
                        ),

                        _buildSection(scheme, textTheme, '第3条（アプリ内課金・サブスクリプション）',
                            '1. 本アプリでは一部機能においてアプリ内決済を提供しています。\n2. 返金手続き等についてはApple Inc.またはGoogle LLCが定める各ストアの規約が適用され、当方では直接の返金処理を行うことはできません。\n3. サブスクリプションの解約はユーザー自身が各ストアの設定から行う必要があります。アプリを削除しただけではサブスクリプションは解約されません。'),

                        _buildSection(scheme, textTheme, '第4条（禁止事項）',
                            '1. 本アプリのリバースエンジニアリング・逆コンパイル等を試みる行為。\n2. 当方または第三者の知的財産権を侵害する行為。\n3. 本アプリの不具合を意図的に利用した不正行為。\n4. その他、当方が不適切と判断する行為。'),

                        _buildSection(scheme, textTheme, '第5条（本アプリの変更・終了）',
                            '当方は、ユーザーへの事前通知なく本アプリの内容を変更・停止・終了することができます。'),

                        _buildSection(
                          scheme,
                          textTheme,
                          '第6条（免責事項）',
                          '本アプリは、日常の利便性向上、記録・管理、情報提供等を目的として提供されるものです。当方は、本アプリの内容の正確性、完全性、有用性および特定目的への適合性を保証するものではありません。本アプリの利用によって生じた損害について、当方の故意または重過失による場合を除き、当方は責任を負わないものとします。',
                        ),
                        _buildSection(scheme, textTheme, '第7条（利用規約の変更）',
                            '当方は必要と判断した場合、ユーザーへの個別通知なく本規約を変更することができます。'),

                        _buildSection(scheme, textTheme, '第8条（準拠法・裁判管轄）',
                            '本規約の解釈にあたっては日本法を準拠法とします。紛争が生じた場合には当方の主たる事務所所在地を管轄する裁判所を第一審の専属的合意管轄裁判所とします。'),

                        _buildSection(scheme, textTheme, '第9条（お問い合わせ窓口）',
                            'ご質問等は、下記のメールアドレスまでご連絡ください。\n\nSasae Works 運営窓口\nE-mail: sasae.works@gmail.com'),

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
