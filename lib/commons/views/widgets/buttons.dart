import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class AppButtonFlat extends ConsumerStatefulWidget {
  AppButtonFlat({
    super.key,
    required this.bgColor,
    required this.fgColor,
    required this.text,
    required this.onTap,
  });

  Color bgColor;
  Color fgColor;
  String text;
  void Function() onTap;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppButtonFlatState();
}

class _AppButtonFlatState extends ConsumerState<AppButtonFlat> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          60,
        ),
      ),
      onPressed: widget.onTap,
      child: Text(
        widget.text,
        style: GoogleFonts.lato(
          fontSize: 16,
          color: widget.fgColor,
        ),
      ),
    );
  }
}
