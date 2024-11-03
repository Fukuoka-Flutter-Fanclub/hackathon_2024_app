# スヤリスト 😴

睡眠を神聖な儀式として捉え直す、新しい形の睡眠信仰アプリケーションへようこそ。あなたの心と体に平安な眠りをもたらします。

## 概要 🌙

スヤリストは、現代社会で失われつつある「良質な睡眠」の価値を、独自の世界観と信仰を通じて取り戻すためのアプリケーションです。睡眠の質を高めるための精神的なアプローチを提供します。

### 主な機能 ✨

- **聖なる教義**: オリジナルの創世記や教えを通じて、睡眠の神聖さを説きます
- **AI による導き**: ChatGPT を活用した睡眠の相談所。あなたの悩みに寄り添います
- **神のお告げ**: 就寝時間になると、安らぎの BGM と共に静かな眠りへ誘います
- **祈りの言葉**: 睡眠導入のための音声ガイダンスで、心を落ち着かせます
<div align="center">
  <img src="assets/images/system.png" alt="スヤリストの仕組み" width="200"/>
</div>

## 開発環境 🛠

- Flutter 3.24.3
- バックエンド: Supabase
- AI 対話: OpenAI API
- 主要パッケージ:
  - supabase_flutter(Supabase クライアント)
  - flutter_riverpod (状態管理)
  - go_router (画面遷移)
  - flutter_local_notifications (通知)
  - flutter_tts (音声合成)
  - sentry_flutter (エラー監視)

## セットアップ 📝

1. **パッケージのインストール**

```bash
fvm flutter pub get
```

2. **環境設定**
   `.env`ファイルを作成:

```
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_supabase_key
SENTRY_URL=your_sentry_key
CHAT_GPT_API_KEY=your_openai_api_key
```

3. **実行**

```bash
fvm flutter run
```

## プロジェクト構成 📁

```
lib/
├── core/          # 共通コンポーネント
├── features/      # 機能モジュール
│   ├── auth/      # 認証
│   ├── chat/      # AI対話
│   ├── home/      # メイン画面
│   ├── original/  # 教義コンテンツ
│   ├── notification/ # 通知
│   ├── setting/   # 設定
│   └── tab/       # 画面管理
├── router/        # ルーティング
└── main.dart      # エントリー
```

---

「良き眠りは、魂の安息なり」

- スヤリスト教典より
