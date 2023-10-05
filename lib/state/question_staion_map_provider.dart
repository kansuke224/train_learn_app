import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/enum/station_code.dart';
import 'package:interactive_viewer_01/model/station.dart';

import 'midosuji_line_station_provider.dart';

final questionStationMapProvider = StateProvider<Map<StationCode, StateNotifierProvider<StationNotifier, Station>>>(
  (ref) => {
    StationCode.esaka: esakaStationProvider,
    StationCode.higashiMikuni: higashiMikuniStationProvider,
  },
);
