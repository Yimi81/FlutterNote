import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class CheWieListItem extends StatefulWidget {
  final VideoPlayerController videoController;
  final bool looping;
  CheWieListItem({Key key,@required this.videoController,this.looping}):super(key:key);
  @override
  _CheWieListItemState createState() => _CheWieListItemState();
}

class _CheWieListItemState extends State<CheWieListItem> {
  ChewieController _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoController,
      aspectRatio: 16/9,
      looping: widget.looping,
      autoInitialize: true,
      errorBuilder: (context,errorMessage)
        {
          return Center(
            child: Text(errorMessage,style: TextStyle(color: Colors.white),),
          );
        }
    );

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chewieController.dispose();
    widget.videoController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }
}
