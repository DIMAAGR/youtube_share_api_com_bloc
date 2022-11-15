import 'dart:convert';
import 'package:http/http.dart';
import 'package:youtube_share_api_com_bloc/src/config/constants.dart';
import 'package:youtube_share_api_com_bloc/src/config/services/networking_service.dart';

class YoutubeSuggestionsRepository {
  static final Networking _networking = Networking(url: Const.googleSuggestQueriesURL);

  static Future<List<dynamic>> suggestions(String search) async {
    try {
      Response response = await _networking.get(path: 'search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json');
      if (response.statusCode == 200) {
        return json.decode(response.body)[1].map((v) => v[0]).toList();
      } else {
        return [response.statusCode.toString()];
      }
    } catch (e) {
      return ['UNKNOWN ERROR'];
    }
  }
}
