import 'package:flutter/material.dart';
import 'package:sasae_portal/common/store_link_button_widget.dart';
import 'package:sasae_portal/models/project.dart';
import 'package:sasae_portal/screens/project_detail_screen.dart';
import 'package:sasae_portal/screens/privacy_policy_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  static const double _navBreakpoint = 880;

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 520),
      curve: Curves.easeOutCubic,
      alignment: 0.08,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < _navBreakpoint;

    return Scaffold(
      key: _scaffoldKey,
      drawer: compact ? _buildDrawer(context) : null,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: compact ? 0 : 20,
        title: Padding(
          padding: EdgeInsets.only(left: compact ? 4 : 0),
          child: Text(
            'Sasae Works', // ← Worksに修正
            style: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: -0.4,
            ),
          ),
        ),
        actions: [
          if (compact)
            IconButton(
              icon: const Icon(Icons.menu_rounded),
              tooltip: 'メニュー',
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
            )
          else ...[
            _NavAction(label: 'Home', onTap: () => _scrollTo(_heroKey)),
            _NavAction(label: 'Projects', onTap: () => _scrollTo(_projectsKey)),
            _NavAction(label: 'Contact', onTap: () => _scrollTo(_contactKey)),
            const SizedBox(width: 24),
          ],
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, thickness: 1, color: scheme.outlineVariant.withValues(alpha: 0.6)),
        ),
      ),
      body: SelectionArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(child: _HeroSection(key: _heroKey, scheme: scheme, textTheme: textTheme)),
            SliverToBoxAdapter(child: _ProjectsSection(key: _projectsKey, scheme: scheme, textTheme: textTheme)),
            SliverToBoxAdapter(child: _ContactSection(key: _contactKey, scheme: scheme, textTheme: textTheme)),
            SliverToBoxAdapter(child: _Footer(scheme: scheme, textTheme: textTheme)),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
              child: Text(
                'Sasae Works', // ← Worksに修正
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            _DrawerTile(label: 'Home', onTap: () { Navigator.pop(context); _scrollTo(_heroKey); }),
            _DrawerTile(label: 'Projects', onTap: () { Navigator.pop(context); _scrollTo(_projectsKey); }),
            _DrawerTile(label: 'Contact', onTap: () { Navigator.pop(context); _scrollTo(_contactKey); }),
          ],
        ),
      ),
    );
  }
}

// --- Hero Section ---
class _HeroSection extends StatelessWidget {
  const _HeroSection({super.key, required this.scheme, required this.textTheme});
  final ColorScheme scheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 80, 24, 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '技術で、日常の「支え」をつくる。',
                style: textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'Sasae Worksは、メンタルウェルネスとセルフケアに寄り添うプロダクトを開発しています。日々の小さな気づきを、Flutterを用いた洗練された体験へ。',
                  style: textTheme.bodyLarge?.copyWith(color: scheme.onSurfaceVariant, height: 1.6),
                ),
              ),
              const SizedBox(height: 40),
              FilledButton(
                onPressed: () {
                  final state = context.findAncestorStateOfType<_HomeScreenState>();
                  state?._scrollTo(state._projectsKey);
                },
                child: const Text('プロジェクトを見る'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Projects Section ---
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key, required this.scheme, required this.textTheme});
  final ColorScheme scheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final projects = [
      const Project(
        title: '3 Good Things〜寝る前3つの良かったこと日記',
        icon: Icons.wb_sunny_outlined,
        description: '１日で起きた3つの良いことを書く習慣を続けるための無料日記アプリです。毎日寝る前の記録が、あなたの幸福感や睡眠の質の改善に役立つことが報告されています😴\nぜひ続けて、心地よい毎日を目指しましょう!\n\n★ このアプリがおすすめな人 ★\n・日記を習慣にしたいけど続かない\n・ネガティブな考えを改善したい\n・忙しくても自分と向き合う時間が欲しい\n・小さな幸せや成長を感じたい\n・写真や音声でも記録を残したい。\n・バックアップ対応の安心な日記アプリを探している',
        // description: 'ポジティブ心理学に基づき、1日3つの「よかったこと」を記録。メンタルを整え、幸福感を高めるセルフケアアプリです。',
        contentsText: "開発の背景",
        attentionToDetail: "こだわり",
        techStack: 'Flutter / Dart / Drift',
        googlePlayLink: 'https://play.google.com/store/apps/details?id=com.taylorsguild.three_good_things',
        appStoreLink: 'https://apps.apple.com/jp/app/3-good-things-%E5%AF%9D%E3%82%8B%E5%89%8D3%E3%81%A4%E3%81%AE%E8%89%AF%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%93%E3%81%A8%E6%97%A5%E8%A8%98/id6443807421',
        createDate: '2022年10月26日',
        updateDate: '2025年10月23日',
        version: '2.1.0',
      ),

      const Project(
        title: '褒め日記',
        icon: Icons.thumb_up_alt_outlined,
        description: '『褒め日記』 - あなたの小さな成功を記録するアプリ！\n毎日、自分を褒めることでポジティブな自分になりましょう😊\n\n★ このアプリがおすすめな人 ★\n・日記を書く習慣を身につけたい方\n・ポジティブな思考を持ちたい方\n・忙しくて時間がない方\n・過去の思い出を振り返りたい方:\n・分かりやすい成果をみて肯定感アップ\n・SNSでのシェアを楽しみたい方',
        // description: '毎日の小さな成功を記録し、自己肯定感を高めます。Driftを用いた完全ローカル保存で、プライバシーを守ります。',
        contentsText: "開発の背景",
        attentionToDetail: "こだわり",
        techStack: 'Flutter / Dart / Drift',
        googlePlayLink: 'https://play.google.com/store/apps/details?id=com.taylorsguild.homerarejyouzu',
        appStoreLink: 'https://apps.apple.com/jp/app/%E8%A4%92%E3%82%81%E6%97%A5%E8%A8%98/id1617944420',
        createDate: '2022年3月29日',
        updateDate: '2025年6月19日',
        version: '1.8.0',
      ),
      const Project(
        title: 'ココロリサーチ',
        icon: Icons.favorite_border_rounded,
        description: 'うつや双極性障害の方や復職を目指している方の生活リズムを可視化。\n医師への提示もスムーズにする活動記録ツールです。\n\n★ このアプリがおすすめな人 ★\n✓生活パターンを客観的に見たい方\n✓昼夜逆転など崩れた生活リズムの改善したい\n✓メンタルヘルスの不調（うつ病、双極性障害、統合失調症など）や病気、怪我などからの復職や就職を目指したい\n✓病気の再発防止とセルフケア\n✓ストレスを感じる活動や気分が良くなる活動を知りたい\n✓お薬の管理と飲み忘れを防止\n✓主治医や職場の方とデータを共有し、アドバイスや今後の目標を立てられる',
        // description: 'うつや双極性障害の方の生活リズムを可視化。医師への提示もスムーズにする活動記録ツールです。',
        contentsText: "双極性障害の方や復職したい人向けのアプリが数少なく、また既にある物を使ってみて自分なりにこうした方が使いやすいのではないかと思い、その他の必要と思える機能の追加（お薬の飲み忘れ防止など）を付け加えて作ってみました",
        attentionToDetail: "こだわり",
        techStack: 'Flutter / Dart / Drift',
        googlePlayLink: 'https://play.google.com/store/apps/details?id=com.taylorsguild.kokoro_research',
        appStoreLink: 'https://apps.apple.com/jp/app/%E3%82%B3%E3%82%B3%E3%83%AD%E3%83%AA%E3%82%B5%E3%83%BC%E3%83%81/id6499306435',
        createDate: '2024年9月18日',
        updateDate: '2025年10月22日',
        version: '1.3.0',
      ),
      const Project(
        title: 'バッグの中身',
        icon: Icons.restaurant_menu_rounded,
        description: 'かばんの中の持ち物管理用アプリです。\nこんなことはありませんか？\n・よく忘れ物をする\n・外出中に財布や傘など、荷物を家に置き忘れてないか気になる。\nそんなお悩みを解決します！\n\n★ このアプリがおすすめな人 ★\n・バッグに入れ忘れた物を確認したい人\n・バッグに何が入っているかスマホで確認したい\n・バッグを沢山使い分けて物の行方が分からなくなる人',
        // description: '\n・画像を登録できるので1つ1つのもちものの確認がしやすいです。\n・ホーム画面でその日にいる持ち物を選択し、用意したかどうかチェック！\n・追加画面でもちものを登録できます。\n・編集画面で画像の変更や名前の変更、削除が可能。\nさぁ、このアプリで忘れ物の悩みから解放されよう！',
        contentsText: "開発の背景",
        attentionToDetail: "こだわり",
        techStack: 'Flutter / Dart / Drift',
        googlePlayLink: 'https://play.google.com/store/apps/details?id=com.taylorsguild.simple_contents_of_bag',
        appStoreLink: 'https://apps.apple.com/jp/app/%E3%83%90%E3%83%83%E3%82%B0%E3%81%AE%E4%B8%AD%E8%BA%AB/id1626800664',
        createDate: '2022年6月22日',
        updateDate: '2022年6月22日',
        version: '1.0.0',
      ),
      const Project(
        title: '焼肉判定AI（Preparing）',
        icon: Icons.restaurant_menu_rounded,
        description: 'YOLOを用いた画像認識で、肉の焼き加減をリアルタイム判別。色覚の多様性をサポートする挑戦的なプロジェクトです。',
        contentsText: "開発の背景",
        attentionToDetail: "こだわり",
        techStack: 'Flutter / YOLO / Python',
        googlePlayLink: '',
        appStoreLink: '',
        createDate: '',
        updateDate: '',
        version: '1.0.0',
      ),
    ];

    return ColoredBox(
      color: scheme.surfaceContainerLow,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PROJECTS', style: textTheme.labelLarge?.copyWith(color: scheme.primary, fontWeight: FontWeight.bold)),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  children: projects.map((p) => SizedBox(width: 340, child: _ProjectCard(project: p))).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- 以下、既存のパーツ（ProjectCard, Contact, Footer等）の Project を Works に置換 ---

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: scheme.outlineVariant),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProjectDetailScreen(project: project))),
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(project.icon, color: scheme.primary, size: 32),
              const SizedBox(height: 16),
              Text(project.title, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              // const SizedBox(height: 12),//TODo
              // StoreLinkButtonWidget(googlePlayLink: project.googlePlayLink, appStoreLink: project.appStoreLink),
              const SizedBox(height: 12),
              Text(project.description, style: textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant)),
              const SizedBox(height: 20),
              Text(project.techStack, style: textTheme.labelMedium?.copyWith(color: scheme.primary)),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection({super.key, required this.scheme, required this.textTheme});
  final ColorScheme scheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Column(
          children: [
            Text('CONTACT', style: textTheme.labelLarge?.copyWith(color: scheme.primary, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            const Text('お問い合わせ・開発のご相談はメールにて承ります。'),
            const SizedBox(height: 24),
            Text('sasae.works@gmail.com', style: textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.scheme, required this.textTheme});
  final ColorScheme scheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      color: scheme.surfaceContainerHigh,
      child: Column(
        children: [
          Text('Sasae Works', style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen())),
            child: const Text('プライバシーポリシー'),
          ),
          const SizedBox(height: 24),
          Text('© ${DateTime.now().year} Sasae Works', style: textTheme.bodySmall),
        ],
      ),
    );
  }
}

// 共通パーツ
class _NavAction extends StatelessWidget {
  const _NavAction({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(label));
  }
}

class _DrawerTile extends StatelessWidget {
  const _DrawerTile({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(label), onTap: onTap);
  }
}