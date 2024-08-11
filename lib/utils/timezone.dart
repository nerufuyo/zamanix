import 'package:intl/intl.dart';

class Timezone {
  static String getRealTime(String country) {
    final DateTime now = DateTime.now();
    final Duration offset = now.timeZoneOffset;
    final DateTime currentTime = now.add(offset);
    final String time = currentTime.toString().substring(11, 16);
    return time;
  }

  static String getRealDate() {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('EEEE, dd MMM yyyy').format(now);
    return formattedDate;
  }
}
