import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz;
import 'package:tokyo_hakkason2024_app/core/constants/env_constants.dart';
import 'package:tokyo_hakkason2024_app/core/utils/theme.dart';
import 'package:tokyo_hakkason2024_app/features/notification/permission.dart';
import 'package:tokyo_hakkason2024_app/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Tokyo'));

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: DarwinInitializationSettings(),
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) async {
      final AudioPlayer audioPlayer = AudioPlayer();
      await audioPlayer.setSource(AssetSource("audio/stream.mp3"));
      await audioPlayer.resume();
    },
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await EnvConstants().init();
  await Supabase.initialize(
    url: EnvConstants().supabaseUrl,
    anonKey: EnvConstants().supabaseAnonKey,
  );

  await SentryFlutter.init((options) {
    options.dsn = EnvConstants().sentryUrl;
    // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
    // We recommend adjusting this value in production.
    options.tracesSampleRate = 1.0;
    // The sampling rate for profiling is relative to tracesSampleRate
    // Setting to 1.0 will profile 100% of sampled transactions:
    options.profilesSampleRate = 1.0;
  },
      appRunner: () => runApp(const ProviderScope(
            child: MyApp(),
          )));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        designSize: const Size(375, 812), // 仮のサイズ iPhone 12 mini
        builder: (context, _) {
          final router = ref.watch(routerProvider);
          final theme = ref.read(themeProvider);
          return MaterialApp.router(
            theme: theme,
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
