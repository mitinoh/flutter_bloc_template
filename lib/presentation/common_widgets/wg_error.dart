import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_bloc_template/presentation/common_widgets/sb_error.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen({Key? key, this.state = null, this.message = "Ops..", this.errorDetails})
      : super(key: key);
  final state;
  final String? message;
  final FlutterErrorDetails? errorDetails;

  late ThemeData themex;
  @override
  Widget build(BuildContext context) {
    themex = Theme.of(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/error.jpg",
            fit: BoxFit.cover,
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                Text(
                  "Oh no, something went wrong... 😟",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, color: Colors.black, fontSize: 16),
                ),
                TextButton(
                  onPressed: () {
                    _openEmail(context);
                  },
                  child: Text(
                    "CONTACT US",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _openEmail(BuildContext context) async {
    final Uri _url = Uri.parse(
        'mailto:company.team@gmail.com?subject=flutter_bloc_template error&body=I got this error :( \n\n' +
            (message ?? ''));

    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      SbError().show(context);
    }
  }
}
