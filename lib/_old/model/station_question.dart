import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interactive_viewer_01/model/station.dart';
import 'package:interactive_viewer_01/model/station_button_style_info.dart';
import 'package:interactive_viewer_01/question/model/answer.dart';
import 'package:interactive_viewer_01/question/model/question.dart';

part 'station_question.freezed.dart';

@freezed
class StationQuestion with _$StationQuestion implements Question {
  const StationQuestion._();

  const factory StationQuestion({
    required Answer answer,
    required Station station,
    required StationButtonStyleInfo stationButtonStyleInfo,
  }) = _StationQuestion;

  @override
  StationQuestion setAnswer(String actualAnswer) {
    Answer answer = this.answer.answer(actualAnswer);
    return copyWith(
      answer: answer,
    );
  }
}
