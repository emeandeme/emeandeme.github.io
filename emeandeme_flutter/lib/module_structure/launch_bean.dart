import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class LaunchBean {
  LaunchBean({
    required Uri uri,
  })  : assert(
          uri.scheme.isNotEmpty,
          'You cannot add an unscheme uri has launchBean',
        ),
        _uri = uri;

  LaunchBean.fromString(String url) : _uri = Uri.tryParse(url);

  const LaunchBean.fromNullableUri(Uri? uri) : _uri = uri;

  final Uri? _uri;

  Future<bool> get canLaunch async {
    final Uri? uri = _uri;
    if (uri == null) {
      return false;
    }
    return canLaunchUrl(uri);
  }

  Future<void> launch() async {
    final Uri? uri = _uri;
    if (uri == null) {
      return;
    }

    if (await canLaunch) {
      await launchUrl(uri);
    }
  }
}
