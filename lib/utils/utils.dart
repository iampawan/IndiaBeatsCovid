import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

mixin Utils {
  static bool get checkIfDebug {
    var debug = false;  
    assert(debug = true);
    return debug;
  }

  static String getFormattedTime(String iso) {
    if (iso != null) {
      final DateTime now = DateTime.parse(iso).toLocal();
      final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm aa');
      return "${formatter.format(now)} (~${now.toLocal().timeAgo()})";
    }
    return null;
  }

  // static String getTimeAgo(String iso, {bool enableShort = true}) {
  //   if (iso != null) {
  //     final DateTime now = DateTime.parse(iso);

  //     return now.timeAgo(enableFromNow: enableShort);
  //   }
  //   return null;
  // }
}
