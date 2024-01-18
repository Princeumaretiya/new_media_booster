import 'package:flutter/material.dart';
import 'package:media_booster/Bottom_provider/Bottom_provider.dart';
import 'package:media_booster/Music_player/Provider_screen/Music_provider.dart';
import 'package:media_booster/Music_player/View_screen/Music_home_screen.dart';
import 'package:media_booster/Music_player/View_screen/Play_music_screen.dart';
import 'package:media_booster/Vidio_player/Provider_screen/Video_provider.dart';
import 'package:media_booster/Vidio_player/View_screen/Play_video_screen.dart';
import 'package:media_booster/splash_screen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Bottom_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Music_provider(),
          ),
          ChangeNotifierProvider(
            create: (context) => Video_provider(),
          ),
          // ChangeNotifierProvider(
          //   create: (context) => splash(),
          // ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => splashscrren(),
            "Play_music": (context) => Play_music(),
            "play": (context) => Music_home_screen(),
            "video": (context) => Play_video(),
          },
          theme: ThemeData.dark(),
        ),
      ),
    ),
  );
}
