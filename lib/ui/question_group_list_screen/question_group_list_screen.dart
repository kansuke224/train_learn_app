import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/model/station_question_group.dart';
import 'package:interactive_viewer_01/state/question_group_list_screen/question_group_list_provider.dart';
import 'package:interactive_viewer_01/state/station_question_group_provider.dart';
import 'package:interactive_viewer_01/ui/route_map_screen.dart';

class QuestionGroupListScreen extends ConsumerWidget {
  const QuestionGroupListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<List<StationQuestionGroup>> questionGroupList = ref.watch(questionGroupListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("路線図問題一覧"),
      ),
      body: questionGroupList.when(
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text("Error $error"),
        data: (questionGroupList) {
          return ListView(
            children: [
              for (StationQuestionGroup questionGroup in questionGroupList)
                ListTile(
                  onTap: () => onQuestionGroupSelected(questionGroup, context, ref),
                  title: Text(questionGroup.questionGroupName),
                  subtitle: Text("自己ベスト : ${questionGroup.questionMap.length}問中 ${questionGroup.answerScore.bestScore}問 正解"),
                  trailing: Icon(Icons.arrow_right),
                )
            ],
          );
        },
      ),
      // body: ListView.builder(
      //   itemCount: stationQuestionGroupList.length,
      //   itemBuilder: (context, index) {
      //     StationQuestionGroup questionGroup = stationQuestionGroupList[index].getBestScore();
      //     return ListTile(
      //       onTap: () => onQuestionGroupSelected(questionGroup, context, ref),
      //       title: Text(questionGroup.questionGroupName),
      //       subtitle: Text("ベスト正当数"),
      //       trailing: Icon(Icons.arrow_right),
      //     );
      //   },
      // ),
    );
  }

  // 問題選択時の処理
  onQuestionGroupSelected(StationQuestionGroup questionGroup, BuildContext context, WidgetRef ref) async {
    // station_question_group_providerへquestionGroupをセットする
    ref.read(stationQuestionGroupProvider.notifier).setStationQuestionGroup(questionGroup);
    // 問題画面へ繊維
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return RouteMapScreen();
      },
    ));
  }
}
