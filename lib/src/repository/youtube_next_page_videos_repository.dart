import 'dart:convert';

import 'package:http/http.dart';
import 'package:youtube_share_api_com_bloc/src/config/constants.dart';
import 'package:youtube_share_api_com_bloc/src/config/services/networking_service.dart';
import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';

class YoutubeNextPageVideosRepository {
  static final Networking _networking = Networking(url: Const.googleApiYoutubeV3URL);

  static Future<YoutubeSearchModel> doGoToNextPage(String search, String nextToken) async {
    try {
      Response response = await _networking.get(path: 'search?part=snippet&q=$search&type=video&key=${Const.apiKey}&maxResults=10&pageToken=$nextToken');

      if (response.statusCode == 200) {
        YoutubeSearchModel model = YoutubeSearchModel.fromJson(jsonDecode(response.body));
        model.search = search;
        return model;
      }

      return YoutubeSearchModel();
    } catch (e) {
      return YoutubeSearchModel();
    }
  }
}
