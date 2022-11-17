//

// =============================================================================
// Event Class
// =============================================================================

abstract class VideosListingEvent {}

// =============================================================================
// EVENTS:
// =============================================================================

/// ON SELECT EVENT:
class VideoSelectedEvent extends VideosListingEvent {}

// ON SEARCH CHANGE EVENT:
class VideoSearchEvent extends VideosListingEvent {
  String searchValue = '';
  VideoSearchEvent(this.searchValue);
}

class VideoNextPageEvent extends VideosListingEvent {
  String searchValue = '';
  String nextPageToken = '';

  VideoNextPageEvent({required String search, required String token})
      : nextPageToken = token,
        searchValue = search;
}
