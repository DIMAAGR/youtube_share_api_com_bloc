import 'package:flutter/material.dart';
import 'package:youtube_share_api_com_bloc/src/views/home/home_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeView(),
      title: 'Youtube App (FlutterTube)',
    );
  }
}
