import 'package:flutter/material.dart';
import 'package:youtube_share_api_com_bloc/src/config/theme/theme.dart';
import 'package:youtube_share_api_com_bloc/src/views/home/home_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeView(),
      title: 'Youtube App (FlutterTube)',
      theme: AppTheme.theme,
      themeMode: ThemeMode.light,
    );
  }
}
