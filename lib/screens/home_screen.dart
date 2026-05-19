import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sasae_portal/common/store_link_button_widget.dart';
import 'package:sasae_portal/models/project.dart';
import 'package:sasae_portal/screens/project_detail_screen.dart';
import 'package:sasae_portal/screens/privacy_policy_screen.dart';

/// The main landing page of the Sasae Works portal website.
/// This screen includes a hero section, a list of projects, contact info, and a footer.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _updatesKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  static const double _navBreakpoint = 880;

  /// Smoothly scrolls to the section identified by the given [key].
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
        titleSpacing: 0,
        title: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1120),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Text(
                    'Sasae Works',
                    style: textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const Spacer(),
                  if (compact)
                    IconButton(
                      icon: const Icon(Icons.menu_rounded),
                      tooltip: 'メニュー',
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                    )
                  else ...[
                    _NavAction(label: 'Home', onTap: () => _scrollTo(_heroKey)),
                    _NavAction(label: 'Updates', onTap: () => _scrollTo(_updatesKey)),
                    _NavAction(label: 'Projects', onTap: () => _scrollTo(_projectsKey)),
                    _NavAction(label: 'Contact', onTap: () => _scrollTo(_contactKey)),
                  ],
                ],
              ),
            ),
          ),
        ),
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
            SliverToBoxAdapter(child: _AnnouncementsSection(key: _updatesKey, scheme: scheme, textTheme: textTheme)),
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
                'Sasae Works',
                style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            _DrawerTile(label: 'Home', onTap: () { Navigator.pop(context); _scrollTo(_heroKey); }),
            _DrawerTile(label: 'Updates', onTap: () { Navigator.pop(context); _scrollTo(_updatesKey); }),
            _DrawerTile(label: 'Projects', onTap: () { Navigator.pop(context); _scrollTo(_projectsKey); }),
            _DrawerTile(label: 'Contact', onTap: () { Navigator.pop(context); _scrollTo(_contactKey); }),
          ],
        ),
      ),
    );
  }
}

// --- Data ---

final List<Project> _allProjects = [
  Project(
    title: '3 Good Things〜寝る前3つの良かったこと日記',
    icon: 'assets/3GoodThings/3グッドシングスアイコン.png',
    summary: "１日で起きた3つの良いことを書く習慣を続けるための無料日記アプリです。毎日寝る前の記録が、あなたの幸福感や睡眠の質の改善に役立つことが報告されています😴",
    recommendedText:
        '★ このアプリがおすすめな人 ★\n・日記を習慣にしたいけど続かない\n・ネガティブな考えを改善したい\n・忙しくても自分と向き合う時間が欲しい\n・小さな幸せや成長を感じたい\n・写真や音声でも記録を残したい。\n・バックアップ対応の安心な日記アプリを探している',
    mainText:
        '「3 Good Things」は、心理学者のマーティン・セリグマン博士が提唱したポジティブ心理学の手法に基づいた日記アプリです。\n\n毎日寝る前に、その日にあった「3つの良いこと」を記録するだけで、あなたの脳は自然とポジティブな出来事に注目するようになります。科学的に証明されたこの習慣は、幸福感の向上、ストレスの軽減、そして睡眠の質の改善に大きな効果をもたらします。\n\n【アプリの特徴】\n\n■ 継続を支えるトロフィーシステム\n「三日坊主で終わらせない」ために、あなたの継続をバッジやトロフィーで表彰します。小さな積み重ねが目に見える形で蓄積されるため、モチベーションを維持しやすくなります。\n\n■ 写真と音声での豊かな記録\n言葉だけでは表現しきれない感情を、写真や音声メッセージとして残すことができます。その時の空気感までパッケージして、未来の自分へのプレゼントにしましょう。\n\n■ データの安心バックアップ\nクラウドバックアップ機能により、機種変更時や万が一の際も大切な記録を失うことはありません。\n\n■ リラックスを誘うナイトモード設計\n就寝前の利用を想定し、目に優しいダークモードと落ち着いた配色を採用しています。一日の終わりに、心穏やかなひとときを提供します。\n\nポジティブな変化は、今夜の3つの書き込みから始まります。',
    contentsText:
        "褒め日記に次ぐ２本目のリリースアプリ。かつて図書館で知り、3GoodThingsをやっていた時期がありましたが、中々続かずに辞めてしまいました。それをふと思い出しGooglePlayなどで調べてみると、先発のアプリは更新が停滞気味で「もっと良いものを作れるのではないか？」と思い作った次第です。",
    attentionToDetail:
        "・アプリの配色は夜に使うということで目に優しくリラックス系の色である緑を選びました。\n・アイコンは3という数字だけではシンプル過ぎるので、チェックを３つ付けました。\nこれは１つ良いことを書くごとにチェックを付けるアプリの仕組みを表しているものでもあります\n・できるだけ長続きしてほしいという願いを込めて、少しずつ成長している実感を得てもらうためにトロフィー機能を実装。\n・飽きないように色やフォント背景パターンなどの追加",
    jpImageList: List.generate(8, (i) => 'assets/3GoodThings/jp/Apple iPhone 11 Pro Max Screenshot $i.png'),
    enImageList: List.generate(8, (i) => 'assets/3GoodThings/en/Apple iPhone 11 Pro Max Screenshot $i.png'),
    techStack: 'Flutter / Dart / Drift',
    googlePlayLink: 'https://play.google.com/store/apps/details?id=com.taylorsguild.three_good_things',
    appStoreLink:
        'https://apps.apple.com/jp/app/3-good-things-%E5%AF%9D%E3%82%8B%E5%89%8D3%E3%81%A4%E3%81%AE%E8%89%AF%E3%81%8B%E3%81%A3%E3%81%9F%E3%81%93%E3%81%A8%E6%97%A5%E8%A8%98/id6443807421',
    createDate: '2022年10月26日',
    updateDate: '2025年10月23日',
    version: '2.1.0',
  ),
  Project(
    title: '褒め日記',
    icon: 'assets/homeNikki/褒め日記アイコン.png',
    summary: "『褒め日記』 - あなたの小さな成功を記録するアプリ！毎日, 自分を褒めることでポジティブな自分になりましょう😊",
    recommendedText:
        '★ このアプリがおすすめな人 ★\n・日記を書く習慣を身つけたい方\n・ポジティブな思考を持ちたい方\n・忙しくて時間がない方\n・過去の思い出を振り返りたい方:\n・分かりやすい成果をみて肯定感アップ\n・SNSでのシェアを楽しみたい方',
    mainText: "",
    contentsText: "開発の背景",
    attentionToDetail: "こだわり",
    jpImageList: List.generate(8, (i) => 'assets/homeNikki/jp/Apple iPhone 11 Pro Max Screenshot $i.png'),
    enImageList: List.generate(8, (i) => 'assets/homeNikki/en/Apple iPhone 11 Pro Max Screenshot $i.png'),
    techStack: 'Flutter / Dart / Drift',
    googlePlayLink: 'https://play.google.com/store/apps/details?id=com.taylorsguild.homerarejyouzu',
    appStoreLink: 'https://apps.apple.com/jp/app/%E8%A4%92%E3%82%81%E6%97%A5%E8%A8%98/id1617944420',
    createDate: '2022年3月29日',
    updateDate: '2025年6月19日',
    version: '1.8.0',
  ),
  Project(
    title: 'ココロリサーチ',
    icon: 'assets/kokoroResearch/ココロリサーチアイコン.png',
    summary: "うつや双極性障害の方や復職を目指している方の生活リズムを可視化。\n医師への提示もスムーズにする活動記録ツールです。",
    recommendedText:
        '★ このアプリがおすすめな人 ★\n・生活パターンを客観的に見たい方\n✓昼夜逆転など崩れた生活リズムの改善したい\n・メンタルヘルスの不調（うつ病、双極性障害、統合失調症など）や病気、怪我などからの復職や就職を目指したい\n・病気の再発防止とセルフケア\n・ストレスを感じる活動や気分が良くなる活動を知りたい\n・お薬の管理と飲み忘れを防止\n・主治医や職場の方とデータを共有し、アドバイスや今後の目標を立てられる',
    mainText: "",
    contentsText:
        "双極性障害の方や復職したい人向けのアプリが数少なく、また既にある物を使ってみて自分なりにこうした方が使いやすいのではないかと思い、その他の必要と思える機能の追加（お薬の飲み忘れ防止など）を付け加えて作ってみました",
    attentionToDetail: "こだわり",
    jpImageList: List.generate(8, (i) => 'assets/kokoroResearch/jp/Apple iPhone 11 Pro Max Screenshot $i.png'),
    enImageList: List.generate(8, (i) => 'assets/kokoroResearch/en/Apple iPhone 11 Pro Max Screenshot $i.png'),
    techStack: 'Flutter / Dart / Drift',
    googlePlayLink: 'https://play.google.com/store/apps/details?id=com.taylorsguild.kokoro_research',
    appStoreLink:
        'https://apps.apple.com/jp/app/%E3%82%B3%E3%82%B3%E3%83%AD%E3%83%AA%E3%82%B5%E3%83%BC%E3%83%81/id6499306435',
    createDate: '2024年9月18日',
    updateDate: '2025年10月22日',
    version: '1.3.0',
  ),
  Project(
    title: 'バッグの中身',
    icon: 'assets/bagNakami/バッグの中身アイコン.png',
    summary: "「あれ持ったっけ？」を解消。カバンの中身をリスト化し、忘れ物をゼロにする持ち物管理アプリです。バッグごとの入れ替えもスムーズに。",
    recommendedText:
        '★ このアプリがおすすめな人 ★\n・バッグに入れ忘れた物を確認したい人\n・バッグに何が入っているかスマホで確認したい\n・バッグを沢山使い分けて物の行方が分からなくなる人',
    mainText: "",
    contentsText: "開発の背景",
    attentionToDetail: "こだわり", //TODO 英語も画像できたら追加
    jpImageList: List.generate(5, (i) => 'assets/bagNakami/jp/bag-screenshot${i + 1}.png'),
    enImageList: [],
    techStack: 'Flutter / Dart / Drift',
    googlePlayLink: 'https://play.google.com/store/apps/details?id=com.taylorsguild.simple_contents_of_bag',
    appStoreLink: 'https://apps.apple.com/jp/app/%E3%83%90%E3%83%83%E3%82%B0%E3%81%AE%E4%B8%AD%E8%BA%AB/id1626800664',
    createDate: '2022年6月22日',
    updateDate: '2022年6月22日',
    version: '1.0.0',
  ),
  Project(
    title: '焼肉判定AI（Preparing）',
    icon: 'assets/yakiniku/焼肉アイコン.png',
    summary: "AIが肉の「最高の焼き加減」を判定。色覚の多様性により焼き具合の判断が難しい方をサポートする、ユニバーサルデザインの試みです。",
    recommendedText:
        '★ このアプリがおすすめな人 ★ \n・色覚多様性（P型、D型、T型など）をお持ちで、肉の色の変化が分かりにくい方。\n・焼肉店やBBQで、生焼けによる食中毒が心配な方。\n・ステーキを自分好みの絶妙な焼き加減で仕上げたい方。\n・誰にも頼らず、自分のペースで安心して食事を楽しみたい方。',
    mainText:
        '「焼肉判定AI」は、最新の物体認識AI（YOLO）を活用して、網の上の肉が「生」「食べ頃」「焼きすぎ」のどの状態にあるかをリアルタイムで判別する、ユニバーサルデザイン・アプリです。\n\n【開発の目的】\n世の中には「色の変化」を捉えるのが苦手な色覚多様性（D型やP型など）を持つ方が多くいらっしゃいます。そうした方々にとって、赤から茶色へ変わる「肉の焼き加減」の判断は非常に難しく、焼肉を楽しむ際のハードルになっていました。\n\n本プロジェクトは、テクノロジーの力でそのバリアを取り除き、誰もが自分のペースで、安心して美味しいお肉を楽しめる社会を目指しています。\n\n【主な機能】\n■ リアルタイムAI解析\nスマホのカメラをかざすだけで、AIが瞬時に肉の状態を識別します。\n\n■ 視認性の高い通知\n色だけに頼らず、テキストとアイコンによる明確なフィードバックを行います。\n\n■ 多様な肉の種類に対応（予定）\n牛肉だけでなく、豚肉や鶏肉など、焼き加減の判断が難しい食材の学習を進めています。',
    contentsText:
        "私自身、色覚多様性を持つ友人と食事をした際、彼が肉の焼き具合を何度も確認している姿を見て、この課題を解決したいと考えました。単なる「便利ツール」ではなく、誰かの「できない」を「できる」に変える、FlutterとAIの可能性を追求した一作です。",
    attentionToDetail:
        "・YOLOを用いた画像認識モデルの軽量化により、スマホ上でのスムーズな動作を実現。\n・UIは極力シンプルに。食事の楽しさを邪魔しない、直感的な操作感にこだわりました。\n・現在、より精度の高い判定を目指し、様々な照明環境（焼肉店の独特な照明など）での学習データを収集中です。",
    jpImageList: [
      'assets/yakiniku/jp/Apple iPhone 16 Pro Max Screenshot 1.png',
      'assets/yakiniku/jp/Apple iPhone 16 Pro Max Screenshot 2.png',
      'assets/yakiniku/jp/Apple iPhone 16 Pro Max Screenshot 3.png',
      'assets/yakiniku/jp/Apple iPhone 16 Pro Max Screenshot 4.png',
      'assets/yakiniku/jp/Apple iPhone 16 Pro Max Screenshot 5.png',
    ],
    enImageList: [],
    techStack: 'Flutter / YOLO / Python',
    googlePlayLink: '',
    appStoreLink: '',
    createDate: '',
    updateDate: '',
    version: '1.0.0',
  ),
];

final List<Map<String, String>> _allAnnouncements = [
  {'date': '2026/04/15', 'tag': '3 Good Things', 'content': 'Google Driveバックアップ機能を強化'},
  {'date': '2026/03/10', 'tag': 'ココロリサーチ', 'content': 'カレンダー画面の読み込み速度を向上'},
  {'date': '2025/11/15', 'tag': '褒め日記', 'content': 'App Store / Google Play にて初回リリース'},
];

// --- Hero Section ---
/// Displays the main slogan and introduction of Sasae Works.
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
          padding: const EdgeInsets.fromLTRB(24, 80, 24, 48), // 下の余白を詰め、お知らせとの連続性を確保
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '技術で、 日常の「支え」をつくる。',
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
/// Displays a grid/list of applications developed by Sasae Works.
class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({super.key, required this.scheme, required this.textTheme});
  final ColorScheme scheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    // 画面幅に応じてレイアウトを切り替え
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width > 1100;

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
                Text(
                  'PROJECTS',
                  style: textTheme.labelLarge?.copyWith(
                    color: scheme.primary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
                const SizedBox(height: 48),
                if (isWide)
                  // デスクトップ表示：3カラム
                  LayoutBuilder(
                    builder: (context, constraints) {
                      const int columns = 3;
                      final List<Widget> rows = [];
                      for (int i = 0; i < _allProjects.length; i += columns) {
                        final List<Widget> rowChildren = [];
                        for (int j = 0; j < columns; j++) {
                          if (i + j < _allProjects.length) {
                            rowChildren.add(Expanded(child: _ProjectCard(project: _allProjects[i + j])));
                          } else {
                            rowChildren.add(const Expanded(child: SizedBox()));
                          }
                          if (j < columns - 1) {
                            rowChildren.add(const SizedBox(width: 24));
                          }
                        }
                        rows.add(Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: rowChildren,
                        ));
                        if (i + columns < _allProjects.length) {
                          rows.add(const SizedBox(height: 24));
                        }
                      }
                      return Column(children: rows);
                    },
                  )
                else
                  // モバイル・タブレット表示：Wrapで柔軟に折り返す
                  Center(
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: _allProjects
                          .map((p) => SizedBox(
                                width: 340,
                                child: _ProjectCard(project: p),
                              ))
                          .toList(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- Sub Sections ---

/// A card widget that displays information about a single [Project].
class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});
  final Project project;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28),
        side: BorderSide(color: scheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ProjectDetailScreen(project: project)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24), // 余白を少し詰める
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(project.icon, width: 56, height: 56, fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              // タイトルの高さを2行分に固定
              SizedBox(
                height: (textTheme.headlineSmall?.fontSize ?? 24) * 1.3 * 2.2,
                child: Text(
                  project.title,
                  style: textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 12),
              // サマリーの高さを3行分に固定
              SizedBox(
                height: (textTheme.bodyMedium?.fontSize ?? 14) * 1.6 * 3.2,
                child: Text(
                  project.summary,
                  style: textTheme.bodyMedium?.copyWith(
                    color: scheme.onSurfaceVariant,
                    height: 1.6,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 24),

              if (project.jpImageList.isNotEmpty) ...[
                // カルーセルエリア
                ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.trackpad,
                    },
                  ),
                  child: SizedBox(
                    height: 220, // 少しコンパクトに
                    child: Scrollbar(
                      thumbVisibility: true,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: project.jpImageList.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 12),
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withValues(alpha: 0.06),
                                  blurRadius: 8,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
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
                const SizedBox(height: 20),
              ],

              // 下部の要素との間隔を空ける
              const SizedBox(height: 32),

              // ストアリンクボタン
              if (project.googlePlayLink.isNotEmpty || project.appStoreLink.isNotEmpty) ...[
                StoreLinkButtonWidget(
                  googlePlayLink: project.googlePlayLink,
                  appStoreLink: project.appStoreLink,
                ),
                const SizedBox(height: 16),
              ],

              Text(
                project.techStack,
                style: textTheme.labelLarge?.copyWith(
                  color: scheme.primary,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Announcements Section ---
/// Displays a list of recent updates and news.
class _AnnouncementsSection extends StatelessWidget {
  const _AnnouncementsSection({super.key, required this.scheme, required this.textTheme});
  final ColorScheme scheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    void navigateToProject(String tag) {
      final project = _allProjects.firstWhere(
        (p) => p.title.contains(tag),
        orElse: () => _allProjects.first,
      );
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProjectDetailScreen(project: project)),
      );
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 80), // 上部マージンを0にしてHeroに寄せる
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: scheme.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      'NEWS',
                      style: textTheme.labelSmall?.copyWith(
                        color: scheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Divider(color: scheme.outlineVariant.withValues(alpha: 0.4)),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              for (final item in _allAnnouncements)
                InkWell(
                  onTap: () => navigateToProject(item['tag']!),
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 110,
                          child: Text(
                            item['date']!,
                            style: textTheme.bodyMedium?.copyWith(
                              color: scheme.onSurfaceVariant,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            '【${item['tag']}】 ${item['content']}',
                            style: textTheme.bodyLarge,
                          ),
                        ),
                        Icon(Icons.chevron_right, size: 20, color: scheme.outlineVariant),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Section for contact information and inquiries.
class _ContactSection extends StatelessWidget {
  const _ContactSection({super.key, required this.scheme, required this.textTheme});
  final ColorScheme scheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < 600;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1120),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: isCompact ? 64 : 120,
            horizontal: 24,
          ),
          child: Column(
            children: [
              Text(
                'CONTACT',
                style: textTheme.labelLarge?.copyWith(
                  color: scheme.primary,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                '一緒に、新しい「支え」を。',
                textAlign: TextAlign.center,
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  fontSize: isCompact ? 24 : null,
                ),
              ),
              const SizedBox(height: 24),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text(
                  'アプリ開発のご相談や、プロジェクトに関するお問い合わせをお待ちしております。お気軽にご連絡ください。',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant,
                    height: 1.6,
                    fontSize: isCompact ? 15 : null,
                  ),
                ),
              ),
              const SizedBox(height: 48),
              // Email address highlight
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isCompact ? 16 : 40,
                  vertical: 24,
                ),
                decoration: BoxDecoration(
                  color: scheme.primaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: scheme.primary.withValues(alpha: 0.1)),
                ),
                child: Column(
                  children: [
                    Text(
                      'Email Address',
                      style: textTheme.labelMedium?.copyWith(color: scheme.primary),
                    ),
                    const SizedBox(height: 8),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: SelectableText(
                        'sasae.works@gmail.com',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Footer section containing site info and policy links.
class _Footer extends StatelessWidget {
  const _Footer({required this.scheme, required this.textTheme});
  final ColorScheme scheme;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isWide = width > 700;

    return Container(
      width: double.infinity,
      color: scheme.surfaceContainerHigh,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Column(
            children: [
              if (isWide)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrandInfo(false),
                    _buildFooterLinks(context, false),
                  ],
                )
              else
                Column(
                  children: [
                    _buildBrandInfo(true),
                    const SizedBox(height: 48),
                    _buildFooterLinks(context, true),
                  ],
                ),
              const SizedBox(height: 80),
              Divider(color: scheme.outlineVariant.withValues(alpha: 0.5)),
              const SizedBox(height: 32),
              Text(
                '© ${DateTime.now().year} Sasae Works. All rights reserved.',
                style: textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandInfo(bool isCenter) {
    return Column(
      crossAxisAlignment: isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'Sasae Works',
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '日常を支える、Flutter製のモダンなプロダクト。',
          textAlign: isCenter ? TextAlign.center : TextAlign.start,
          style: textTheme.bodyMedium?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }

  Widget _buildFooterLinks(BuildContext context, bool isCenter) {
    return Column(
      crossAxisAlignment: isCenter ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          'LEGAL',
          style: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 16),
        InkWell(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen()),
          ),
          child: Text(
            'プライバシーポリシー',
            style: textTheme.bodyMedium?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

// --- Common Widgets ---

/// A navigation action button used in the AppBar.
class _NavAction extends StatelessWidget {
  const _NavAction({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onTap, child: Text(label));
  }
}

/// A menu item used in the mobile navigation drawer.
class _DrawerTile extends StatelessWidget {
  const _DrawerTile({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(label), onTap: onTap);
  }
}
