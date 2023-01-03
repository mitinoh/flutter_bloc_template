import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadLineWidget extends StatelessWidget {
  const HeadLineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themex = Theme.of(context);
    return Column(
      children: [
        _buildHeader(themex),
        const SizedBox(height: 10),
      ],
    );
  }

  Row _buildHeader(ThemeData themex) => Row(
        children: [
          RichText(
            text: TextSpan(
                text: 'Welcome on ',
                style: GoogleFonts.poppins(
                    color: themex.indicatorColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
                children: <TextSpan>[
                  TextSpan(
                    text: "flutter_bloc_template",
                    style: GoogleFonts.poppins(
                        color: themex.indicatorColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  )
                ]),
          ),
        ],
      );

}
