import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      // --- ナビゲーションバー (AppBar) ---
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Sasae Project',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          _buildNavLink('Home'),
          _buildNavLink('Projects'),
          _buildNavLink('Contact'),
          const SizedBox(width: 40),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // メインビジュアル
                    const Text(
                      'Sasae Project',
                      style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, letterSpacing: -1.5),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      '技術で、日常の「支え」をつくる。',
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                    ),
                    const SizedBox(height: 80),

                    // 実績セクション
                    const Text(
                      'Projects',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 48),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 24,
                      runSpacing: 24,
                      children: [
                        _buildProjectCard(
                          context,
                          title: '3 Good Things',
                          icon: Icons.wb_sunny_outlined,
                          description: "💡1日3つの「よかったこと」で毎日が変わる。ポジティブ心理学に基づき、幸福感を高め、メンタルを整える日記アプリです。",
                          techStack: 'Flutter / Dart / Drift',
                        ),
                        _buildProjectCard(
                          context,
                          title: '褒め日記',
                          icon: Icons.thumb_up_alt_outlined,
                          description: '毎日の小さな成功や頑張りを記録して、自己肯定感を高め、心のストレスを軽減するセルフケアツール。',
                          techStack: 'Flutter / Dart / Drift',
                        ),
                        _buildProjectCard(
                          context,
                          title: 'ココロリサーチ',
                          icon: Icons.favorite_border,
                          description: 'うつ病や双極性障害などメンタルヘルスに悩む方のための生活リズム記録アプリ。活動を可視化して改善を目指します。',
                          techStack: 'Flutter / Dart / Drift',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // --- フッター (Footer) ---
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  // ナビゲーション用のリンクボタン
  Widget _buildNavLink(String title) {
    return TextButton(
      onPressed: () {}, // 後でスクロール処理などを追加
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          title,
          style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  // フッターウィジェット
  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Column(
        children: [
          const Text('© 2026 Sasae Project', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // ここをクリックしたときにプライバシーポリシーを表示させる
                },
                child: const Text('プライバシーポリシー', style: TextStyle(color: Colors.blueGrey, fontSize: 13)),
              ),
              const Text('|', style: TextStyle(color: Colors.grey)),
              TextButton(
                onPressed: () {},
                child: const Text('お問い合わせ', style: TextStyle(color: Colors.blueGrey, fontSize: 13)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context,
      {required String title, required IconData icon, required String description, required String techStack}) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 30,
              offset: const Offset(0, 15)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.blue, size: 44),
          const SizedBox(height: 20),
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 14),
          Text(
              description,
              style: TextStyle(color: Colors.grey.shade700, height: 1.6, fontSize: 15)
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                    techStack,
                    style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600, fontSize: 12)
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }
}