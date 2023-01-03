import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SbError extends StatelessWidget {
  const SbError({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  show(BuildContext context, [String? message]) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: _build(context, message ?? 'Ops something went wrong...'),
    ));
  }

  Widget _build(BuildContext context, String message) {
    ThemeData themex = Theme.of(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: 90,
          decoration: BoxDecoration(
              color: themex.backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: themex.indicatorColor,
                          fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
            top: -15,
            left: -10,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
              child: Stack(
                children: [
                  Image.asset(
                    "assets/map.png",
                    scale: 5,
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
