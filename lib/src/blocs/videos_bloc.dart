import 'dart:async';
import 'dart:ui';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';
import 'package:youtube_share_api_com_bloc/src/repository/youtube_suggestion_repository.dart';

class VideosBloc implements BlocBase {
  List<YoutubeSearchModel> videos = [];

  final StreamController _videosController = StreamController();
  Stream get outVideos => _videosController.stream;

  final StreamController _searchController = StreamController();
  Sink get inSearch => _searchController.sink;

  // ===========================================================================

  VideosBloc() {
    _searchController.stream.listen((value) async => await YoutubeSuggestionsRepository.suggestions(value));
  }

  // ===========================================================================
  // OVERRIDES
  // ===========================================================================

  @override
  void addListener(VoidCallback listener) {}

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }

  @override
  bool get hasListeners => _videosController.hasListener || _searchController.hasListener;

  @override
  void notifyListeners() {}

  @override
  void removeListener(VoidCallback listener) {}
}
