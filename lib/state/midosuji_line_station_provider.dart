import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/enum/station_code.dart';
import 'package:interactive_viewer_01/model/station.dart';
import 'package:interactive_viewer_01/model/train_line.dart';
import 'package:interactive_viewer_01/style/custom_color.dart';

final esakaStationProvider = StateNotifierProvider<StationNotifier, Station>(
  (ref) => StationNotifier(
    Station.createCircleStation(
      stationCode: StationCode.esaka,
      name: "江坂",
      centerPosition: const Offset(1229, 935),
      color: CustomColor.midosujiLineColor,
      trainLineList: [
        TrainLine.createMidosujiLine(),
      ],
      shortNameList: const ["M11"],
    ),
  ),
);

final higashiMikuniStationProvider = StateNotifierProvider<StationNotifier, Station>(
  (ref) => StationNotifier(
    Station.createCircleStation(
      stationCode: StationCode.higashiMikuni,
      name: "東三国",
      centerPosition: const Offset(1236, 1049),
      color: CustomColor.midosujiLineColor,
      trainLineList: [
        TrainLine.createMidosujiLine(),
      ],
      shortNameList: ["M12"],
    ),
  ),
);

class StationNotifier extends StateNotifier<Station> {
  StationNotifier(Station station) : super(station);

  // 選択中 or 未選択の状態へ更新する
  void setIsSelected(bool isSelected) {
    state = state.setIsSelected(isSelected);
  }

  // 解答済みの状態へ変更
  void setAnswerd() {
    state = state.setAnswerd();
  }
}
