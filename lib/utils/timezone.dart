import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Timezone {
  static String getRealTime(String country) {
    tz.initializeTimeZones();
    final location = tz.getLocation(country);
    final currentTime = tz.TZDateTime.now(location);
    final String time = currentTime.toString().substring(11, 16);
    return time;
  }

  static String getRealDate() {
    final DateTime now = DateTime.now();
    final String formattedDate = DateFormat('EEEE, dd MMM yyyy').format(now);
    return formattedDate;
  }
}
