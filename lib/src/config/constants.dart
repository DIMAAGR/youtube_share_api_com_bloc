class Const {
  Const._();

  static const String apiKey = 'AIzaSyDQsnHTEPqxI1UznjPyzIozusH7ENBsyKY';
  static const String googleApiYoutubeV3URL = 'https://www.googleapis.com/youtube/v3/';
  static const String googleSuggestQueriesURL = 'http://suggestqueries.google.com/complete/';
  static const String youtubeIconImageLink = 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/YouTube_Logo_2017.svg/1024px-YouTube_Logo_2017.svg.png';
}

/*
"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
"http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"
 */
