import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toons/models/webtoon_detail_model.dart';
import 'package:toons/models/webtoon_episode_model.dart';
import 'package:toons/services/api_service.dart';
import 'package:toons/widgets/episode_widget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episodes;
  late SharedPreferences prefs;
  bool isFavorite = false;

  Future initPrefs() async {
    // get shared preferences
    prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList("favorites");
    if (favorites != null) {
      // check if the webtoon is already in the favorites list
      isFavorite = favorites.contains(widget.id);
    } else {
      // if the favorites list is empty, create a new one
      prefs.setStringList("favorites", []);
    }
    setState(() {});
  }

  onHeartTap() async {
    final favorites = prefs.getStringList("favorites");
    if (favorites != null) {
      if (isFavorite) {
        favorites.remove(widget.id);
      } else {
        favorites.add(widget.id);
      }
      await prefs.setStringList("favorites", favorites);
      setState(() {
        isFavorite = !isFavorite;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getDetailById(widget.id);
    episodes = ApiService.getLatestEpisodeById(widget.id);
    initPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title, // title from DetailScreen()
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            )),
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.green.shade300,
            ),
            onPressed: onHeartTap,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
          child: Column(
            children: [
              Center(
                child: Hero(
                  tag: widget.id,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(5, 5),
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10, // soften the shadow
                          // spreadRadius: 1, //extend the shadow
                        ),
                      ],
                    ),
                    width: 350,
                    child: Image.network(widget.thumb),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              FutureBuilder(
                  future: webtoon,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.about,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '${snapshot.data!.genre}, ${snapshot.data!.age}',
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Text('...');
                    }
                  }),
              const SizedBox(height: 25),
              FutureBuilder(
                  future: episodes,
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          for (var episode in snapshot.data!)
                            // ListTile(
                            // leading: Image.network(episode.thumb),
                            // title: Text(episode.title),
                            // subtitle: Text(episode.date),
                            // ),
                            Episode(episode: episode, id: widget.id),
                        ],
                      );
                    } else {
                      return const Text('...');
                    }
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
