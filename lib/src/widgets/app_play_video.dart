// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gugu/src/utils/app_const.dart';
import 'package:gugu/src/widgets/app_base_screen.dart';
import 'package:gugu/src/widgets/app_text.dart';
import 'package:gugu/src/widgets/app_video_player.dart';

class videoPlayer extends StatefulWidget {
  var id;
  var title;
  var url;
  videoPlayer(
      {Key? key, required this.id, required this.title, required this.url})
      : super(key: key);

  @override
  State<videoPlayer> createState() => _videoPlayerState();
}

class _videoPlayerState extends State<videoPlayer> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
      appBar: AppBar(
        title: AppText(
          txt: widget.title,
          size: 20,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      bgcolor: AppConst.white,
      isvisible: false,
      backgroundImage: false,
      backgroundAuth: false,
      child: CustomVideoPlayer(videoUrl: widget.url),
    );
  }
}
