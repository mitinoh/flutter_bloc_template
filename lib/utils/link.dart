import 'package:url_launcher/url_launcher.dart';

class Link {
  static privacy() {
    openLink(""); // link to privacy and policy terms
  }

  static terms() {
    openLink(""); // link to terms and conditions
  }

  static assistance() {
    openLink("mailto:company.team@gmail.com?subject=flutter_bloc_template help&body="); // mail for assistence
  }

  static openLink(String link) async {
    final Uri _url = Uri.parse(link);

    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    }
  }
}
