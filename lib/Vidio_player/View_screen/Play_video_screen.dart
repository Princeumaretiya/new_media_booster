import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider_screen/Video_provider.dart';

class Play_video extends StatefulWidget {
  const Play_video({Key? key}) : super(key: key);

  @override
  State<Play_video> createState() => _Play_videoState();
}

class _Play_videoState extends State<Play_video> {

  Video_provider? providerF;
  Video_provider? providerT;


  @override
  Widget build(BuildContext context) {

    providerF=Provider.of<Video_provider>(context,listen: false);
    providerT=Provider.of<Video_provider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        body: Chewie(
         controller: providerT!.chewieController!,
        ),
      ),
    );
  }
}
