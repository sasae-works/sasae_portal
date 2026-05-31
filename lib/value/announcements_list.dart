import 'package:sasae_portal/value/label.dart';

enum CreatedAPP {
  // 1. 定義の先頭に列挙値と値を記述する。最後の要素の末尾にはセミコロン「;」が必須。
  HOMENIKKI("assets/homeNikki/褒め日記アイコン.png",),
  THREEGOODTHINGS("assets/3GoodThings/3グッドシングスアイコン.png",),
  KOKORORESESEARCH("assets/kokoroResearch/ココロリサーチアイコン.png",),
  BAGNONAKAMI("assets/bagNakami/バッグの中身アイコン.png",),
  YAKINIKU("assets/yakiniku/焼肉アイコン.png",);

  // 2. インスタンス変数。これらは必ず final でなければならない。
  final String imagePath;

    // 3. コンストラクタ。必ず const でなければならない。
    const CreatedAPP(this.imagePath, );
    ///使用法
    ///const state = ConnectionState.connected;
  //   print(state.code); // 200
}


class announceUpdateApp {
  final CreatedAPP createdAPP;
  final String date;
  final String version;
  final List<String> contents;

  announceUpdateApp({
    required this.createdAPP,
    required this.date,
    required this.version,
    required this.contents,
  });
}

List<announceUpdateApp> announceAppList = [
  //TODo リリースしなおしになりそうなので一旦コメントアウト
  // announceUpdateApp(
  //   createdAPP: CreatedAPP.HOMENIKKI,
  //   date: "2026年2月19日",
  //   version: "1.8.2",
  //   contents: ["【不具合修正】", "・一部端末での共有機能のバグを修正しました"],
  // ),
  // announceUpdateApp(
  //   createdAPP: CreatedAPP.THREEGOODTHINGS,
  //   date: "2026年2月19日",
  //   version: "2.1.1",
  //   contents: ["【不具合修正】", "・一部端末での共有機能のバグを修正しました"],
  // ),
  // announceUpdateApp(
  //   createdAPP: CreatedAPP.KOKORORESESEARCH,
  //   date: "2026年2月19日",
  //   version: "1.4.1",
  //   contents: [
  //     "【不具合修正】",
  //     "・通知スイッチの開閉が正しく動作しない不具合を修正しました",
  //     "・その他、細かな不具合の修正と調整を行いました",
  //   ],
  // ),
  // announceUpdateApp(
  //   createdAPP: CreatedAPP.KOKORORESESEARCH,
  //   date: "2025年11月11日",
  //   version: "1.4.0",
  //   contents: [
  //     "[機能追加]",
  //     "・設定一覧に体調と気分のアイコンとテキスト（とても悪い～とても良い）を編集する項目を追加しました",
  //
  //     "【修正点】",
  //     "・アイコンや文字サイズなど軽微な調整をしました",
  //   ],
  // ),
  // announceUpdateApp(
  //   createdAPP: CreatedAPP.HOMENIKKI,
  //   date: "2025年10月23日",
  //   version: "1.8.1",
  //   contents: [
  //     "【不具合修正】\n・「その他」ボタンから開く画面の表示を一部調整しました。",
  //     "・一部の端末で音声入力が正しく動作しなかった不具合を修正しました。",
  //   ],
  // ),
  // announceUpdateApp(
  //   createdAPP: CreatedAPP.KOKORORESESEARCH,
  //   date: "2025年10月13日",
  //   version: "1.3.0",
  //   contents: [
  //     "【修正点】",
  //     "・時間を手動入力する際、キーボード上の次へボタンから次の入力欄へ移動できるようにしました。",
  //     "・PDFタイトルで「タスク」が「日常」と誤って表示されていた不具合を修正しました。",
  //     "・その他、軽微な不具合を修正しました。",
  //   ],
  // ),
  // announceUpdateApp(
  //   createdAPP: CreatedAPP.THREEGOODTHINGS,
  //   date: "2025年10月10日",
  //   version: "2.1.0",
  //   contents: [
  //     "【新機能追加】",
  //     "・設定画面から「北半球／南半球」を切り替えて、季節表示を変更できる機能を追加しました。",
  //     "・設定画面からオン・オフを切り替えられる「定期的にバックアップをおすすめする通知機能」を追加しました。",
  //
  //     "【不具合修正・改善】",
  //     "・日付変更ボタンが正しく動作しなかった不具合を修正しました。",
  //     "・一部端末で通知が届かない問題を修正しました。",
  //     "・アプリ全体のパフォーマンスを改善しました。",
  //     "・一部UIのデザインや表示を調整しました。",
  //   ],
  // ),
  // announceUpdateApp(
  //   createdAPP: CreatedAPP.HOMENIKKI,
  //   date: "2025年6月10日",
  //   version: "1.8.0",
  //   contents: [
  //     "【機能追加】",
  //     "・褒め日記にオリジナルの例文を追加可能になりました。",
  //     "オリジナル例文もバックアップと復元機能に対応しており、",
  //     "機種変更時でも安心して、あなたの褒め言葉のライブラリを引き継げます。",
  //     "・検索バーでスペース区切りによる複数ワード検索に対応しました。",
  //     " 　検索例：「月曜日　食事」など",
  //
  //     "【その他修正】",
  //     "・例文に一部誤りがあったので修正しました",
  //     "・今までの記録ページの検索と日付抽出ボタンのバグを修正しました",
  //     "・パスワードロックのボタン関係の大きさを修正しました",
  //     "・日付の文字の大きさなど細かい修正をしました",
  //   ],
  // ),
  // announceUpdateApp(
  //   createdAPP: CreatedAPP.THREEGOODTHINGS,
  //   date: "2025年4月25日",
  //   version: "2.0.0",
  //   contents: [
  //     "【新機能追加】",
  //     "・1週間、1ヶ月、季節ごと、半年ごと、1年ごとに「3 Good Things」を記録できる機能を追加しました。",
  //     "・検索バーでスペース区切りによる複数ワード検索に対応しました。",
  //     "　検索例：「月曜日　食事」など",
  //     "・新しいフォントを追加しました。",
  //     "・選べる色のバリエーションを増やしました。",
  //     "・使用できるエフェクトを追加しました。",
  //     "・ロック画面機能に「秘密の質問」設定を追加しました。",
  //     "　事前に秘密の質問を設定しておくことで、ロック画面パスワードを忘れても解除が可能です。",
  //     "・達成度機能を追加しました。",
  //     "　「3 Good Things」を続けることで、達成度トロフィーがアンロックされます。",
  //
  //     "【UI修正】",
  //     "・カレンダーの矢印ボタンのデザインを調整しました。",
  //     "・一部テキストを縁取り文字に変更しました。",
  //     "・その他、細かなUI修正を行いました。",
  //   ],
  // ),
];
