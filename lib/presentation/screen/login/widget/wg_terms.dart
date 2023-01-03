import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc_template/utils/link.dart';

class TermsWidget extends StatelessWidget {
  const TermsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themex = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
                text: "By clicking the continue button with google or apple you accept",
                style: GoogleFonts.poppins(
                    color: Colors.grey, fontWeight: FontWeight.w300, fontSize: 10),
                children: <TextSpan>[
                  TextSpan(
                      recognizer: new TapGestureRecognizer()..onTap = () => Link.terms(),
                      text: " terms & conditions",
                      style: TextStyle(
                          color: themex.primaryColor, fontWeight: FontWeight.w300)),
                  TextSpan(
                      text: " and",
                      style: TextStyle(
                        color: themex.primaryColor,
                      )),
                  TextSpan(
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () => Link.privacy(),
                      text: " privacy.",
                      style: TextStyle(
                          color: themex.primaryColor, fontWeight: FontWeight.w300))
                ]),
          ),
        ),
      ],
    );
  }
}
