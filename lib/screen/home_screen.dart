import 'package:flutter/material.dart';
import 'package:webtoon_app/model/webtoon_model.dart';
import 'package:webtoon_app/service/api_service.dart';
import 'package:webtoon_app/widget/webtoon_list_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodayToons();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: WebtoonList(snapshot: snapshot),
              ),
            ],
          ); // 많은 양의 데이터를 보여줄 때
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: webtoons,
    );
  }
}
