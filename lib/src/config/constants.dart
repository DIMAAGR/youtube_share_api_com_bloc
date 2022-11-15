class Const {
  Const._();

  static const String apiKey = 'AIzaSyBGjjSBzdrs09l3A6lHmvF9Rc3Qx4ehN10';
  static const String googleApiYoutubeV3URL = 'https://www.googleapis.com/youtube/v3/';
  static const String googleSuggestQueriesURL = 'http://suggestqueries.google.com/complete/';
}

/*
"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$search&type=video&key=$API_KEY&maxResults=10"
"https://www.googleapis.com/youtube/v3/search?part=snippet&q=$_search&type=video&key=$API_KEY&maxResults=10&pageToken=$_nextToken"
"http://suggestqueries.google.com/complete/search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json"
 */
