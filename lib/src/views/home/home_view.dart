import 'package:flutter/material.dart';
import 'package:youtube_share_api_com_bloc/src/blocs/videos_listing_bloc.dart';
import 'package:youtube_share_api_com_bloc/src/blocs/videos_listing_events.dart';
import 'package:youtube_share_api_com_bloc/src/blocs/videos_listing_state.dart';
import 'package:youtube_share_api_com_bloc/src/config/constants.dart';
import 'package:youtube_share_api_com_bloc/src/delegates/data_serach.dart';
import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';
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
  List<Items> listOfVideos = [];
  String page = '';

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
          listOfVideos = [];
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

              if (videos.videos!.items != null) listOfVideos += videos.videos!.items!;
              //   debugPrint('PAGE COUNTER: ${videos.videos!.nextPageToken}  ');

              return NotificationListener<ScrollEndNotification>(
                onNotification: (scrollEnd) {
                  final metrics = scrollEnd.metrics;

                  if (metrics.atEdge) {
                    if (metrics.pixels == 0) {
                      return false;
                    } else {
                      //     if (page != videos.videos!.nextPageToken) {
                      //         bloc.inputVideos.add(VideoNextPageEvent(token: videos.videos!.nextPageToken!, search: videos.videos!.search!));
                      //        page = videos.videos!.nextPageToken!;
                      //      }
                      return true;
                    }
                  }

                  return false;
                },
                child: ListView.builder(
                  itemCount: listOfVideos.length,
                  itemBuilder: (context, index) => VideoTile(model: listOfVideos[index]),
                ),
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
