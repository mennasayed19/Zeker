import 'dart:developer';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

@pragma('vm:entry-point') // مهم للتعامل مع النوتيفيكيشن في الخلفية
void onBackgroundNotificationTap(NotificationResponse response) {
  log("Notification tapped in background: ${response.id}");
}

class NotificationService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Init Notifications
  static Future<void> init() async {
    // تهيئة Timezone
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));

    // إعدادات Android
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    // إعدادات iOS
    final DarwinInitializationSettings iosSettings =
        DarwinInitializationSettings();

    final InitializationSettings settings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        log("Notification tapped in foreground: ${details.id}");
      },
      onDidReceiveBackgroundNotificationResponse: onBackgroundNotificationTap,
    );

    const AndroidNotificationChannel azkarChannel = AndroidNotificationChannel(
      'azkar_channel',
      'Azkar Notifications',
      description: 'Channel for daily Azkar notifications',
      importance: Importance.max,
      playSound: true,
    );
    // await flutterLocalNotificationsPlugin.show(
    //   0,
    //   "اختبار الإشعار",
    //   "لو ده ظهر يبقى الإشعارات شغالة",
    //   const NotificationDetails(
    //     android: AndroidNotificationDetails(
    //       'test_channel',
    //       'Test Notifications',
    //       importance: Importance.max,
    //       priority: Priority.high,
    //     ),
    //   ),
    // );
    log('Test notification sent');
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(azkarChannel);
  }

  Future<void> requestExactAlarmPermission() async {
    if (await Permission.scheduleExactAlarm.isDenied) {
      await Permission.scheduleExactAlarm.request();
    }
  }

  static Future<void> scheduleDailyAzkar() async {
    final now = DateTime.now();

    DateTime morning = DateTime(now.year, now.month, now.day, 8, 0);
    if (morning.isBefore(now)) morning = morning.add(Duration(days: 1));
    // DateTime morning = now.add(const Duration(seconds: 5));
    log('Scheduled Morning Azkar at: $morning');

    await flutterLocalNotificationsPlugin.zonedSchedule(
      2000,
      "أذكار الصباح",
      "حان وقت أذكار الصباح",
      tz.TZDateTime.from(morning, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'azkar_channel',
          'Azkar Notifications',
          importance: Importance.max,
          priority: Priority.high,
          enableVibration: true,
          ongoing: true,
          autoCancel: false,
          playSound: true,
          visibility: NotificationVisibility.public,
          styleInformation: BigTextStyleInformation(
            'حان وقت أذكار الصباح. يمكنك الضغط هنا لفتح التطبيق ومتابعة الأذكار.',
            htmlFormatBigText: true,
          ),
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    // أذكار المساء الساعة 18:00
    DateTime evening = DateTime(now.year, now.month, now.day, 18, 0);
    if (evening.isBefore(now)) evening = evening.add(Duration(days: 1));
    //DateTime evening = now.add(const Duration(seconds: 10));
    log('Scheduled Evening Azkar at: $evening');

    await flutterLocalNotificationsPlugin.zonedSchedule(
      2001,
      "أذكار المساء",
      "حان وقت أذكار المساء",
      tz.TZDateTime.from(evening, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'azkar_channel',
          'Azkar Notifications',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          enableVibration: true,
          ongoing: true,
          autoCancel: false,
          silent: false,
          visibility: NotificationVisibility.public,
          styleInformation: BigTextStyleInformation(
            'حان وقت أذكار المساء. يمكنك الضغط هنا لفتح التطبيق ومتابعة الأذكار.',
            htmlFormatBigText: true,
          ),
        ),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static Future<void> cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  void schedulePrayerNotifications(dynamic timings) async {
    int id = 100;
    final timingsMap = timings.toJson() as Map<String, dynamic>;

    for (var entry in timingsMap.entries) {
      final name = entry.key;
      final timeStr = entry.value;
      if (timeStr == null) continue;

      final parts = timeStr.toString().split(":");
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      DateTime scheduledTime = DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        hour,
        minute,
      );

      if (scheduledTime.isBefore(DateTime.now())) {
        scheduledTime = scheduledTime.add(const Duration(days: 1));
      }

      await NotificationService.flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        "وقت الصلاة: $name",
        "حان الآن وقت صلاة $name",
        tz.TZDateTime.from(scheduledTime, tz.local),
        NotificationDetails(
          android: AndroidNotificationDetails(
            'prayer_channel',
            'Prayer Notifications',
            importance: Importance.max,
            priority: Priority.high,
            enableVibration: true,
            ongoing: false,
            visibility: NotificationVisibility.public,
            playSound: true,
            autoCancel: true,
            styleInformation: BigTextStyleInformation(
              'حان الآن وقت صلاة $name.',
              htmlFormatBigText: true,
            ),
          ),
          iOS: const DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
      );

      id++;
    }
  }
}
