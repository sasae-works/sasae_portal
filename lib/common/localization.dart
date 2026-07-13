enum AppLanguage { ja, en }

class AppStrings {
  final AppLanguage language;
  AppStrings(this.language);

  // Navigation
  String get home => language == AppLanguage.ja ? 'Home' : 'Home'; // Usually English is fine for nav labels even in JA, but keeping it flexible
  String get updates => language == AppLanguage.ja ? 'Updates' : 'Updates';
  String get projects => language == AppLanguage.ja ? 'Projects' : 'Projects';
  String get contact => language == AppLanguage.ja ? 'Contact' : 'Contact';

  // Hero Section
  String get heroTitle => language == AppLanguage.ja 
      ? 'Flutterによる、生活に寄り添うツール開発' 
      : 'Developing tools that support your daily life with Flutter';
  String get heroSubtitle => language == AppLanguage.ja
      ? 'Sasae Worksは、メンタルウェルネスとセルフケアに寄り添うプロダクトを開発しています。日々の小さな気づきを、Flutterを用いた洗練された体験へ。'
      : 'Sasae Works develops products that support mental wellness and self-care. Transforming small daily insights into sophisticated experiences with Flutter.';
  String get viewProjects => language == AppLanguage.ja ? 'プロジェクトを見る' : 'View Projects';

  // Announcements Section
  String get newsLabel => language == AppLanguage.ja ? 'NEWS' : 'NEWS';

  // Projects Section
  String get projectsLabel => language == AppLanguage.ja ? 'PROJECTS' : 'PROJECTS';

  // Contact Section
  String get contactLabel => language == AppLanguage.ja ? 'CONTACT' : 'CONTACT';
  String get contactDescription => language == AppLanguage.ja
      ? 'アプリ開発のご相談や、プロジェクトに関するお問い合わせをお待ちしております。お気軽にご連絡ください。'
      : 'We welcome consultations regarding app development and inquiries about our projects. Please feel free to contact us.';
  String get emailAddressLabel => language == AppLanguage.ja ? 'Email Address' : 'Email Address';

  // Footer
  String get footerBrandSubtitle => language == AppLanguage.ja 
      ? '日常の気づきを、形にする場所。' 
      : 'A place to give shape to daily insights.';
  String get legalLabel => language == AppLanguage.ja ? 'LEGAL' : 'LEGAL';
  String get privacyPolicy => language == AppLanguage.ja ? 'プライバシーポリシー・利用規約' : 'Privacy Policy ・ terms of service';

  // Language Toggle
  String get languageToggleLabel => language == AppLanguage.ja ? 'English' : '日本語';

  // App Names
  String get homeNikki => language == AppLanguage.ja ? '褒め日記' : 'Compliment Diary';
  String get threeGoodThings => language == AppLanguage.ja ? '3 Good Things' : '3 Good Things';
  String get kokoroResearch => language == AppLanguage.ja ? 'ココロリサーチ' : 'Kokoro Research';
  String get bagNoNakami => language == AppLanguage.ja ? 'バッグの中身' : "In My Bag";
  String get yakinikuAI => language == AppLanguage.ja ? '焼肉判定AI' : 'Yakiniku AI';

  // Project Detail
  String get overview => language == AppLanguage.ja ? '概要' : 'Overview';
  String get featuresAndDetails => language == AppLanguage.ja ? '機能と特徴の詳細' : 'Features & Details';
  String get screenshots => language == AppLanguage.ja ? 'スクリーンショット' : 'Screenshots';
  String get developmentBackground => language == AppLanguage.ja ? '開発の背景' : 'Development Background';
  String get keyPoints => language == AppLanguage.ja ? 'こだわったポイント' : 'Key Points';
  String get releaseNotes => language == AppLanguage.ja ? 'リリースノート' : 'Release Notes';
  String get techStackLabel => language == AppLanguage.ja ? '技術スタック' : 'Tech Stack';
  String get viewAllHistory => language == AppLanguage.ja ? '過去の履歴をすべて見る' : 'View all history';
  String get closeHistory => language == AppLanguage.ja ? '過去の履歴を閉じる' : 'Close history';
  String get viewFullDetails => language == AppLanguage.ja ? '詳細をすべて見る' : 'View full details';
  String get closeDetails => language == AppLanguage.ja ? '詳細を閉じる' : 'Close details';
}
