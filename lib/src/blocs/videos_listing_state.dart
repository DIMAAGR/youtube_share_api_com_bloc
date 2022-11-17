//

// =============================================================================
// Listening Class
// =============================================================================

import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';

abstract class VideosListingState {}

// =============================================================================
// STATES:
// =============================================================================

/// UNINITIALIZED STATE:
class VideosUninitializedState extends VideosListingState {}

/// FETCHING STATE:
class VideosFetchingState extends VideosListingState {}

/// FETCHED STATE:
class VideosFetchedState extends VideosListingState {
  YoutubeSearchModel? videos;

  VideosFetchedState({this.videos});
}

/// ERROR STATE:
class VideoErrorState extends VideosListingState {}

/// EMPTY STATE:
class VideoEmptyState extends VideosListingState {}
