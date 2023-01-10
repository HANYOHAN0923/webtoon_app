import 'package:flutter/material.dart';
import 'package:webtoon_app/model/webtoon_model.dart';
import 'package:webtoon_app/widget/webtoon_widget.dart';

class WebtoonList extends StatelessWidget {
  final AsyncSnapshot<List<WebtoonModel>> snapshot;

  const WebtoonList({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        // 보여줄게 많으면 다 로드하면 메모리가 작살나서 유저한테 보이는 것만 로딩해온다
        var webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40, // List.build()랑 달리 추가되는 인자인데, 리스트뷰가 로드하는 대상 사이마다 이 위젯을 리턴한다.
      ),
    );
  }
}
