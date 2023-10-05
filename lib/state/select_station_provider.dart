import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/enum/station_code.dart';

final selectStationProvider = StateProvider<StationCode>((ref) {
  return StationCode.empty;
});
