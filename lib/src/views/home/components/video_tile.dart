import 'package:flutter/material.dart';
import 'package:youtube_share_api_com_bloc/src/models/youtube_search_model.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({super.key, required this.model});

  final Items model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
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
            contentPadding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
            title: Text(model.snippet!.title!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700), maxLines: 2),
            subtitle: Text(model.snippet!.channelTitle!, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          )
        ],
      ),
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