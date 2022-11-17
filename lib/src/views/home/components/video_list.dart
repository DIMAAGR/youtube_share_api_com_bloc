import 'package:flutter/material.dart';
import 'package:youtube_share_api_com_bloc/src/blocs/videos_listing_state.dart';
import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';
import 'package:youtube_share_api_com_bloc/src/views/home/components/video_tile.dart';

class VideoListWidget extends StatefulWidget {
  const VideoListWidget({super.key, required this.state, required this.onScrollDown});

  final VideosListingState state;
  final Function(String, String) onScrollDown;

  @override
  State<VideoListWidget> createState() => _VideoListWidgetState();
}

class _VideoListWidgetState extends State<VideoListWidget> {
  List<Items> listOfVideos = [];
  String page = '';

  @override
  Widget build(BuildContext context) {
    // Widget Build

    // =========================================================================
    // ON LOADING STATE
    // =========================================================================

    if (widget.state is VideosFetchingState) {
      return const Center(child: CircularProgressIndicator(color: Colors.grey, strokeWidth: 6));
    }

    // =========================================================================
    // ON LOADED STATE
    // =========================================================================

    if (widget.state is VideosFetchedState) {
      VideosFetchedState videos = widget.state as VideosFetchedState;
      if (videos.videos!.items != null) listOfVideos += videos.videos!.items!;

      return NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          if (notification.metrics.atEdge && notification.metrics.pixels != 0) {
            if (page != videos.videos!.nextPageToken) {
              widget.onScrollDown(videos.videos!.search!, videos.videos!.nextPageToken!);
              page = videos.videos!.nextPageToken!;
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
    }

    // =========================================================================
    // ON ERROR STATE
    // =========================================================================

    return const Center(
      child: Text(
        'Algum erro ocorreu!\nPor favor, tente novamente mais tarde!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w400),
      ),
    );
  }
}
