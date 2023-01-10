import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoon_app/model/webtoon_episode_model.dart';
import 'package:webtoon_app/model/webtoon_info_model.dart';
import 'package:webtoon_app/model/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodayToons() async {
    // 비동기함수가 Return하기 위해서는 반환타입에 Future<>릁 사용해야 한다.
    List<WebtoonModel> webtoonClassList = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonClassList.add(
          WebtoonModel.fromJson(webtoon),
        );
      }
      return webtoonClassList;
    }
    throw Error();
  }

  static Future<WebtoonInfoModel> getToonInfoById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonInfoModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getToonEpisodeById(String id) async {
    List<WebtoonEpisodeModel> episodeList = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodeList.add(
          WebtoonEpisodeModel.fromJson(episode),
        );
      }
      return episodeList;
    }
    throw Error();
  }
}
