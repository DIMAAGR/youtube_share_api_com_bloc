import 'package:flutter/material.dart';
import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({super.key, required this.model});

  final Items model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(model.snippet!.thumbnails!.high!.url!), fit: BoxFit.cover)),
        ),
        ListTile(
          onTap: null,
          title: Text(model.snippet!.title!, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
        )
      ],
    );
  }
}
/*
  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Container(),
          ],
        )
      ],
    );
 *
 */