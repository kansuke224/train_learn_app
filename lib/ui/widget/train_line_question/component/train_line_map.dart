import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/question_list_provider.dart';
import 'package:interactive_viewer_01/ui/style/station_button_style.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question/component/station_button_with_text.dart';

class TrainLineMap extends ConsumerWidget {
  const TrainLineMap({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 未初期化時はnull
    List<GetQuestionListViewModel>? questionList = ref.watch(questionListProvider);
    // TODO: AsyncValueにすることを検討する

    if (questionList == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Stack(
        children: [
          // 背景路線図
          Positioned(
            child: SvgPicture.asset(
              'assets/路線図(背景用).svg',
              height: 3000,
            ),
          ),
          for (GetQuestionListViewModel question in questionList)
            Builder(builder: (context) {
              StationButtonStyle? stationButtonStyle = stationButtonStyleMap[question.questionCode];
              if (stationButtonStyle == null) {
                return Container();
              }
              return Positioned(
                top: stationButtonStyle.leftTopPosition.dy,
                left: stationButtonStyle.leftTopPosition.dx,
                child: StationButtonWithText(
                  question: question,
                  buttonStyle: stationButtonStyle,
                ),
              );
            }),
        ],
      );
    }
  }
}
