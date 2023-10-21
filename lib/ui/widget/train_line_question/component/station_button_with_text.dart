import 'package:flutter/material.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_list_view_model.dart';
import 'package:interactive_viewer_01/ui/style/station_button_style.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question/component/station_button.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question/component/station_text.dart';

class StationButtonWithText extends StatelessWidget {
  const StationButtonWithText({
    super.key,
    required this.question,
    required this.buttonStyle,
  });

  final GetQuestionListViewModel question;
  final StationButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StationButton(
          question: question,
          buttonStyle: buttonStyle,
        ),
        const SizedBox(width: 3),
        StationText(
          question: question,
        ),
      ],
    );
  }
}
