import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:youtube_share_api_com_bloc/src/config/constants.dart';
import 'package:youtube_share_api_com_bloc/src/config/services/networking_service.dart';
import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';

class YoutubeSuggestionsRepository {
  static final Networking _networking = Networking(url: Const.googleSuggestQueriesURL);

  static Future<List<dynamic>> suggestions(String search) async {
    try {
      debugPrint('TRYING...');
      Response response = await _networking.get(path: 'search?hl=en&ds=yt&client=youtube&hjson=t&cp=1&q=$search&format=5&alt=json');
      debugPrint('SUCCESS...');
      if (response.statusCode == 200) {
        debugPrint('200 CODE...');

        return json.decode(response.body)[1].map((v) => v[0]).toList();
      } else {
        debugPrint('ERROR...');
        return ['NOT 200'];
      }
    } on HttpException catch (e) {
      debugPrint('AN ERROR OCOURRED!\nMESSAGE: ${e.message}\nURL: ${e.uri}');
      return ['ERROR'];
    } catch (e) {
      return ['UNKNOWN ERROR'];
    }
  }
}
