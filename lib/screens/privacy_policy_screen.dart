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
                              style: textTheme.bodySmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Text(
                              '最終更新日：2026年10月18日',
                              style: textTheme.bodySmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Sasae Works（以下「当方」といいます）は、当方が提供するアプリケーションおよび関連サービス（以下「本サービス」といいます）におけるユーザー情報の取扱いについて、以下のプライバシーポリシーを定めます。各項目は、該当する機能を提供するアプリに適用されます。',
                          style: textTheme.bodyLarge?.copyWith(
                            height: 1.8,
                            color: scheme.onSurfaceVariant,
                          ),
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '1. 取得・保存する情報について',
                          '本サービスでは、利用するアプリの機能に応じて、ユーザーが入力した記録、メモ、タグ、写真、記録日時、価格や購入に関する情報、設定情報等を取り扱います。健康記録機能があるアプリでは、手動入力された歩数、距離、運動時間、睡眠時間等も取り扱います。\nGoogleまたはAppleによるアカウント連携に対応するアプリでは、Firebase Authenticationを利用し、ユーザー識別子や認証に必要な情報を処理します。連携方法や設定によってはメールアドレス等が取得される場合があります。\n記録は原則として端末内に保存されます。Firebaseによるクラウドバックアップ・同期に対応するアプリで当該機能を利用する場合、バックアップ対象の記録や写真等をGoogle LLCが提供するFirebase（Cloud Firestore・Cloud Storage）へ送信し、保存・復元・同期に利用します。対象データはアプリや機能によって異なります。健康関連データの取扱いについては第5項に定めます。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '2. 広告配信について（Google AdMob）',
                          '広告を表示するアプリでは、Google LLCが提供するGoogle AdMobを使用します。広告の表示、効果測定、不正利用防止等のため、広告識別子（利用可能な場合）、端末情報、広告の表示・操作に関する情報等がGoogleに送信される場合があります。これらの情報の取扱いはGoogleのプライバシーポリシー等に従います。\n広告のパーソナライズやトラッキングに関する設定は、端末のプライバシー設定等から変更できます。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '3. アプリ内課金について（RevenueCat）',
                          'アプリ内課金を提供するアプリでは、AppleまたはGoogleの決済機能を使用します。RevenueCatを導入しているアプリでは、購入状態の確認・管理にも同サービスを使用します。購入商品、購入日時、契約状態、購入に関係する識別子等が、これらのサービスで処理されます。クレジットカード番号等の決済情報は、各ストアの決済システムにより取り扱われます。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '4. 写真・カメラの利用について',
                          '写真の添付やカメラ撮影に対応するアプリでは、ユーザーが選択または撮影した画像を、記録への添付、表示、保存等に利用します。画像は通常端末内に保存され、Firebaseによる画像バックアップ・同期に対応するアプリで当該機能を利用する場合は、Firebase Cloud Storageにも保存されることがあります。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '5. 健康データの利用について',
                            '一部のアプリでは、ユーザーの許可に基づき、Appleヘルスケア（HealthKit）またはAndroidのヘルスコネクト（Health Connect）から、歩数、距離、運動時間、睡眠時間等の情報を取得する場合があります。取得した健康データは、アプリ内での表示や記録の振り返りに利用します。健康データの保存方法やクラウド同期の対象範囲は、アプリの機能に応じて異なります。現在提供している健康データ連携機能では、HealthKit・Health Connectから自動取得した健康データはクラウドバックアップ・同期の対象とせず、ユーザーが手動入力した健康関連データは、対応するバックアップ・同期機能を利用する場合にFirebaseへ保存されることがあります。健康データを広告配信の目的で利用したり、広告事業者に提供したりすることはありません。'
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '6. データの保存期間・削除について',
                          '端末内のデータは、ユーザーによる削除またはアプリのアンインストール等により失われる場合があります。一方、Firebaseに保存されたバックアップデータは、アプリをアンインストールするだけでは削除されません。\nデータ削除機能を提供するアプリでは、設定画面等から対象データを削除できます。削除対象や処理範囲は操作内容によって異なります。削除処理に不具合がある場合や削除を希望する場合は、第8項の連絡先へお問い合わせください。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '7. 外部サービス・ポリシーの変更について',
                          '本サービスでは、アプリごとに必要な範囲でFirebase（認証・クラウド保存）、Google AdMob（広告配信）、RevenueCat（購入管理）、Apple・Googleの決済サービス等を利用します。各サービスにおける情報の取扱いには、それぞれのプライバシーポリシーが適用されます。\n当方は、機能やデータの取扱いの変更に応じて本ポリシーを改訂する場合があります。重要な変更については、アプリ内または適切な方法で案内します。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '8. お問い合わせ窓口',
                          '個人情報やデータの取扱い、保存データの削除に関するお問い合わせは、以下までご連絡ください。\n\nSasae Works 運営窓口\nE-mail: sasae.works@gmail.com',
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
                              style: textTheme.bodySmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 24),
                            Text(
                              '最終更新日：2026年10月18日',
                              style: textTheme.bodySmall?.copyWith(
                                color: scheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text(
                          '本規約は、Sasae Works（以下「当方」といいます）が提供するアプリケーションおよび関連サービス（以下「本サービス」といいます）の利用条件を定めます。',
                          style: textTheme.bodyLarge?.copyWith(
                            height: 1.8,
                            color: scheme.onSurfaceVariant,
                          ),
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '第1条（適用）',
                          '本規約は、本サービスの利用に関するユーザーと当方との関係に適用されます。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '第2条（利用環境・データの保存）',
                          '1. ユーザーは、本サービスの利用に必要な端末、通信環境等を自己の責任と費用で用意するものとします。\n2. アプリを削除すると端末内のデータが失われる場合があります。対応アプリでクラウドバックアップを利用している場合、バックアップが残っていれば復元できることがあります。\n3. 対応アプリのクラウドバックアップ・同期は、通信状況、認証状態、サービス障害等により利用できない場合があります。重要な記録については、ユーザー自身でも適切な管理を行ってください。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '第3条（アプリ内課金・サブスクリプション）',
                          '1. 本サービスには有料機能を提供するアプリがあります。料金、期間、提供内容は購入画面に表示します。\n2. 自動更新型サブスクリプションは、各ストアの定める方法で解約しない限り更新されます。アプリの削除やサインアウトだけでは解約されません。\n3. 購入、請求、返金についてはAppleまたはGoogleの適用される規約・手続きに従います。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '第4条（禁止事項）',
                          '1. 法令または第三者の権利を侵害する行為。\n2. 本サービスの運営を妨害し、または不正アクセスを行う行為。\n3. 不具合を悪用し、データやサービスに不正な影響を与える行為。\n4. その他、当方が合理的な理由に基づき不適切と判断する行為。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '第5条（サービスの変更・終了）',
                          '当方は、必要に応じて本サービスの機能を変更、停止または終了する場合があります。ユーザーへの影響が大きい変更については、可能な範囲で事前に案内します。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '第6条（免責・責任）',
                          '本サービスは、記録・管理・情報提供等の利便性向上を目的とします。健康データを扱う機能は医療上の診断、治療、助言を提供するものではありません。健康データの表示や集計には端末・連携サービス等に由来する誤差が生じる場合があります。\n当方は、本サービスの完全な無停止運用やデータの完全な保全を保証するものではありません。ただし、法令上免責が認められない責任については、この限りではありません。',
                        ),
                        _buildSection(
                          scheme,
                          textTheme,
                          '第7条（規約の変更）',
                          '当方は、法令やサービス内容の変更等に応じて本規約を変更する場合があります。重要な変更については、アプリ内その他の適切な方法で案内します。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '第8条（準拠法・裁判管轄）',
                          '本規約には日本法を適用します。本サービスに関する紛争の管轄裁判所は、適用される法令に従って定めるものとします。',
                        ),

                        _buildSection(
                          scheme,
                          textTheme,
                          '第9条（お問い合わせ窓口）',
                          '本規約に関するお問い合わせは、以下までご連絡ください。\n\nSasae Works 運営窓口\nE-mail: sasae.works@gmail.com',
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

  Widget _buildSection(
    ColorScheme scheme,
    TextTheme textTheme,
    String title,
    String content,
  ) {
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

  Widget _buildSectionTitle(
    ColorScheme scheme,
    TextTheme textTheme,
    String title,
  ) {
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
