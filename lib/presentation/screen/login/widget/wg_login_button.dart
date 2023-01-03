import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData themex = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: themex.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: RichText(
                  text: TextSpan(
                      text: 'continue with ',
                      style: GoogleFonts.poppins(
                          color: themex.indicatorColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                          text: text,
                          style: GoogleFonts.poppins(
                              color: themex.indicatorColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        )
                      ]),
                )),
          )
        ],
      ),
    );
  }
}
