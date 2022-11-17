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
