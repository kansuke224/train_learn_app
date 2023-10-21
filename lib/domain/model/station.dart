import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interactive_viewer_01/domain/model/train_line.dart';

@freezed
class Station {
  const Station({
    required this.name,
    required this.trainLineList,
  });

  final String name;
  final List<({TrainLine trainLine, String stationShortName})> trainLineList;
}
