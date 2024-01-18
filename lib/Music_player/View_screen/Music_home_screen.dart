import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../Vidio_player/Provider_screen/Video_provider.dart';
import '../Provider_screen/Music_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Music_home_screen extends StatefulWidget {
  const Music_home_screen({Key? key}) : super(key: key);

  @override
  State<Music_home_screen> createState() => _Music_home_screenState();
}

class _Music_home_screenState extends State<Music_home_screen> {
  Music_provider? providerF;
  Music_provider? providerT;

  Video_provider? providerF1;
  Video_provider? providerT1;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<Music_provider>(context, listen: false);
    providerT = Provider.of<Music_provider>(context, listen: true);

    providerF1 = Provider.of<Video_provider>(context, listen: false);
    providerT1 = Provider.of<Video_provider>(context, listen: true);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          title: Center(
            child: Text(
              "Music Player",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ],
          bottom: TabBar(
            indicatorColor: Colors.redAccent,
            indicatorWeight: 2,
            tabs: [
              Tab(icon: Icon(Icons.music_note_outlined), text: "Music Player"),
              Tab(
                icon: Icon(Icons.video_library_outlined),
                text: "Video Player",
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 170),
                      child: Text(
                        "New Release",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 15),

                    CarouselSlider(
                      items: [
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("assets/p3.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("assets/p4.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("assets/p2.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("assets/p6.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage("assets/p7.jpeg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                      options: CarouselOptions(
                        height: 190.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 400),
                        viewportFraction: 0.8,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Mood",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mood("Relax ☺️"),
                        mood("Workout 🏃"),
                        mood("Sad 😔"),
                      ],
                    ),
                    // SizedBox(height: 20),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Most Played",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                providerT!.choiceIndex = index;
                                Navigator.pushNamed(context, "Play_music",
                                    arguments: index);
                              },
                              child: most(index));
                        },
                        itemCount: providerT!.musicList.length,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Play List",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 22.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                providerT!.choiceIndex = index;
                                Navigator.pushNamed(context, "play",
                                    arguments: index);
                              },
                              child: play(index));
                        },
                        itemCount: 3,
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Mood",
                    //       style: TextStyle(fontSize: 20, color: Colors.white),
                    //     ),
                    //     IconButton(
                    //         onPressed: () {},
                    //         icon: Icon(
                    //           Icons.arrow_forward_ios,
                    //           color: Colors.white,
                    //         ))
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     mood("Relax"),
                    //     mood("Sad"),
                    //     mood("Workout"),
                    //   ],
                    // ),
                    // SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 20),
                Text(
                  "Video Player",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "New Release",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 10),
                CarouselSlider(
                  items: [
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/p3.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/p4.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/p2.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/p6.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("assets/p7.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 400),
                    viewportFraction: 0.8,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 5,
                  width: 40.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      color: Colors.black),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Provider.of<Video_provider>(context, listen: false)
                                .loadVideo(
                                    "${providerT1!.videoList[index].path}");
                            Navigator.pushNamed(context, "video",
                                arguments: index);
                          },
                          child: video(index));
                    },
                    itemCount: 10,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget video(int index) {
    return Container(
      height: 22.h,
      width: 100.w,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
        image: DecorationImage(
            image: AssetImage("${providerT1!.videoList[index].img}"),
            fit: BoxFit.cover),
      ),
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          "${providerT1!.videoList[index].name}",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget most(int index) {
    return Container(
      height: 22.h,
      width: 28.w,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 14.h,
            width: 28.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("${providerT!.musicList[index].img}"),
                    fit: BoxFit.cover)),
          ),
          Text(
            "${providerT!.musicList[index].name}",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "${providerT!.musicList[index].singar}",
            style: TextStyle(color: Colors.white54),
          )
        ],
      ),
    );
  }

  Widget play(int index) {
    return Container(
      height: 22.h,
      width: 28.w,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 14.h,
            width: 28.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("${providerT!.musicList[index].img}"),
                    fit: BoxFit.cover)),
          ),
          Text(
            "${providerT!.musicList[index].name}",
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            "${providerT!.musicList[index].singar}",
            style: TextStyle(color: Colors.white54),
          )
        ],
      ),
    );
  }

  Widget mood(String data) {
    return Container(
      height: 5.h,
      width: 29.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white70),
      alignment: Alignment.center,
      child: Text(
        "$data",
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
    );
  }
}
