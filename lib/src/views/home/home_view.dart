import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_share_api_com_bloc/src/blocs/videos_listing_bloc.dart';
import 'package:youtube_share_api_com_bloc/src/blocs/videos_listing_events.dart';
import 'package:youtube_share_api_com_bloc/src/blocs/videos_listing_state.dart';
import 'package:youtube_share_api_com_bloc/src/config/constants.dart';
import 'package:youtube_share_api_com_bloc/src/delegates/data_serach.dart';
import 'package:youtube_share_api_com_bloc/src/views/home/components/video_tile.dart';
import 'package:youtube_share_api_com_bloc/src/widgets/action_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
// BLOC
  late final VideosBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = VideosBloc();
    bloc.inputVideos.add(VideoSearchEvent(''));
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

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
        onPressed: () async {
          String? result = await showSearch(context: context, delegate: DataSearch());
          if (result != null) bloc.inputVideos.add(VideoSearchEvent(result));
        },
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

  Widget _showVideosCards() {
    return StreamBuilder(
        stream: bloc.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data! is VideosFetchedState) {
              VideosFetchedState videos = snapshot.data! as VideosFetchedState;
              return ListView.builder(
                itemCount: videos.videos!.items!.length,
                itemBuilder: (context, index) => VideoTile(model: videos.videos!.items![index]),
              );
            } else if (snapshot.data! is VideosFetchingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.data! is VideoSelectedEvent) {
              return Container();
            } else {
              return Container();
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showYoutubeLogo(),
        actions: _showAppBarActionsButtons(),
      ),
      body: _showVideosCards(),
    );
  }
}
