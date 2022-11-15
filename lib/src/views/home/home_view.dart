import 'package:flutter/material.dart';
import 'package:youtube_share_api_com_bloc/src/config/constants.dart';
import 'package:youtube_share_api_com_bloc/src/delegates/data_serach.dart';
import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';
import 'package:youtube_share_api_com_bloc/src/repository/youtube_suggestion_repository.dart';
import 'package:youtube_share_api_com_bloc/src/widgets/action_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
// youtubeLogo
  SizedBox _showYoutubeLogo() {
    return SizedBox(
      width: 112,
      child: Image.network(
        Const.youtubeIconImageLink,
        fit: BoxFit.fitHeight,
      ),
    );
  }

  // AppBar Actions
  List<Widget> _showAppBarActionsButtons() {
    return [
      // =========================================================================
      // FAVORITE BUTTON
      // =========================================================================
      Stack(children: [
        Center(
          child: ActionButton(
            onPressed: () {},
            icon: Icons.favorite_rounded,
            tooltip: 'Favorites',
          ),
        ),
        _favoriteQuantityWidget(),
      ]),
      // =========================================================================
      // SEARCH BUTTON
      // =========================================================================
      ActionButton(
        onPressed: () => showSearch(context: context, delegate: DataSearch()),
        tooltip: 'Search',
        icon: Icons.search_rounded,
      ),
    ];
  }

  Positioned _favoriteQuantityWidget() {
    return Positioned(
      top: 14,
      right: 8,
      child: Container(
        width: 12.5,
        height: 12.5,
        padding: const EdgeInsets.only(top: 0.5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orangeAccent[700],
        ),
        child: const Center(
          child: Text('0', style: TextStyle(fontSize: 9), textAlign: TextAlign.center),
        ),
      ),
    );
  }

  // Action Button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showYoutubeLogo(),
        actions: _showAppBarActionsButtons(),
      ),
    );
  }
}
