import 'package:nb_utils/nb_utils.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> commonLaunchUrl(
  String address, {
  LaunchMode launchMode = LaunchMode.inAppWebView,
  bool isNewTab = true,
}) async {
  await launchUrl(
    Uri.parse(address),
    mode: launchMode,
    webOnlyWindowName: isWeb ? (isNewTab ? '_blank' : '_self') : null,
  ).catchError((e) {
    return false;
  });
}

void launchCall(String? url) {
  if (url.validate().isNotEmpty) {
    if (isIOS) {
      commonLaunchUrl(
        'tel://${url!}',
        launchMode: LaunchMode.externalApplication,
      );
    } else {
      commonLaunchUrl(
        'tel:${url!}',
        launchMode: LaunchMode.externalApplication,
      );
    }
  }
}

void launchMail(String? url) {
  if (url.validate().isNotEmpty) {
    commonLaunchUrl(
      'mailto:${url!}',
      launchMode: LaunchMode.externalApplication,
    );
  }
}
