import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

class PhoneCallBean {
  PhoneCallBean({
    required String number,
  }) : _uri = Uri(scheme: 'tel', path: number);

  final Uri _uri;

  Future<void> call() async {
    if (await canLaunchUrl(_uri)) {
      await launchUrl(_uri);
    }
  }
}
