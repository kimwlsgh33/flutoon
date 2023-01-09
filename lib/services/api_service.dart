import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toons/models/webtoon_detail_model.dart';
import 'package:toons/models/webtoon_episode_model.dart';
import 'package:toons/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev/";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse(baseUrl + today);
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(res.body);
      // final List<WebtoonModel> webtoons = jsonDecode(res.body); // not working
      for (var webtoon in webtoons) {
        // final toon = WebtoonModel.fromJson(webtoon);
        // print(toon.title);
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    } else {
      throw Error(); // if not throw error, nullsafety is broke
    }
  }

  static Future<WebtoonDetailModel> getDetailById(String id) async {
    final url = Uri.parse(baseUrl + id);
    final res = await http.get(url);

    if (res.statusCode == 200) {
      final webtoon = jsonDecode(res.body);
      return WebtoonDetailModel.fromJson(webtoon);
    } else {
      throw Error(); // if not throw error, nullsafety is broke
    }
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodeById(
      String id) async {
    List<WebtoonEpisodeModel> episodeInstances = [];
    final url = Uri.parse("$baseUrl$id/episodes");
    final res = await http.get(url);
    if (res.statusCode == 200) {
      final episodes = jsonDecode(res.body);
      for (var episode in episodes) {
        episodeInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodeInstances;
    } else {
      throw Error(); // if not throw error, nullsafety is broke
    }
  }
}
