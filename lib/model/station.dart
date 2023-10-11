import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interactive_viewer_01/model/train_line.dart';

part 'station.freezed.dart';

@freezed
class Station with _$Station {
  const Station._();

  const factory Station({
    required String name,
    required List<TrainLine> trainLineList,
    required List<String> shortNameList,
  }) = _Station;
}
