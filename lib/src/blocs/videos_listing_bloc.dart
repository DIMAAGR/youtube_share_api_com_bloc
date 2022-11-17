import 'dart:async';

import 'package:youtube_share_api_com_bloc/src/blocs/videos_listing_events.dart';
import 'package:youtube_share_api_com_bloc/src/blocs/videos_listing_state.dart';
import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';
import 'package:youtube_share_api_com_bloc/src/repository/youtube_next_page_videos_repository.dart';
import 'package:youtube_share_api_com_bloc/src/repository/youtube_videos_repository.dart';

class VideosBloc {
  late final StreamController<VideosListingEvent> _inputVideosController = StreamController();
  final StreamController<VideosListingState> _outputVideosController = StreamController();

  // INPUT
  Sink<VideosListingEvent> get inputVideos => _inputVideosController.sink;

  // OUTPUT
  Stream<VideosListingState> get stream => _outputVideosController.stream;

  VideosBloc() {
    _inputVideosController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(VideosListingEvent event) async {
    YoutubeSearchModel search = YoutubeSearchModel();
    if (event is VideoNextPageEvent == false) {
      _outputVideosController.sink.add(VideosFetchingState());
    }

    try {
      if (event is VideoSearchEvent) {
        search = await YoutubeVideosRepository.doSearchVideos(event.searchValue);
        _outputVideosController.sink.add(VideosFetchedState(videos: search));
      } else if (event is VideoNextPageEvent) {
        search = await YoutubeNextPageVideosRepository.doGoToNextPage(event.searchValue, event.nextPageToken);
        _outputVideosController.sink.add(VideosFetchedState(videos: search));
        //...
      }
    } catch (_) {
      _outputVideosController.sink.add(VideoErrorState());
    }
  }

  void dispose() {
    _inputVideosController.close();
    _outputVideosController.close();
  }
}
