import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

mixin Utils {
  static bool get checkIfDebug {
    var debug = false;
    assert(debug = true);
    return debug;
  }

  static String getFormattedTime(String iso) {
    if (iso != null) {
      final DateTime now = DateTime.parse(iso);
      final DateFormat formatter = DateFormat('dd-MM-yyyy hh:mm aa');
      return "${formatter.format(now)} (~${timeago.format(now, allowFromNow: true)})";
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
