import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:youtube_share_api_com_bloc/src/config/constants.dart';
import 'package:youtube_share_api_com_bloc/src/config/services/networking_service.dart';
import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';

class YoutubeVideosRepository {
  static final Networking _networking = Networking(url: Const.googleApiYoutubeV3URL);

  static Future<YoutubeSearchModel> doSearchVideos(String search) async {
    try {
      Response response = await _networking.get(path: 'search?part=snippet&q=$search&type=video&key=${Const.apiKey}&maxResults=10');

      if (response.statusCode == 200) {
        return YoutubeSearchModel.fromJson(jsonDecode(response.body));
      }

      return YoutubeSearchModel();
    } catch (err) {
      debugPrint('An error has occourred: ${err.toString()}');
      return YoutubeSearchModel();
    }
  }
}
