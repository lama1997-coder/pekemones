import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultText extends StatelessWidget {
  final String title;
  final Color? color;
  final double? size;
  final double? letterSpace;
  final double? wordSpace;
  final String? fontFamily;
  final TextAlign? align;
  final TextDecoration? decoration;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final Function()? onTap;
  final int? maxLines;
  final TextStyle? textStyle;

  DefaultText(
      {required this.title,
      this.color,
      this.size,
      this.align,
      this.fontFamily,
      this.decoration,
      this.letterSpace,
      this.wordSpace,
      this.overflow,
      this.fontWeight,
      this.onTap,
      this.maxLines,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          child: Text(
            title == "" ? "" : "$title",
            textAlign: align ?? TextAlign.start,
            textScaleFactor: 1,
            maxLines: maxLines ?? null,
            style: textStyle ??
            //GoogleFonts.gloriaHallelujah(),
                  GoogleFonts.gloriaHallelujah(
                  color: color ?? Colors.white,
                  fontSize: size ?? 13,
                  letterSpacing: letterSpace,
                  wordSpacing: wordSpace,
                  decoration: decoration ?? TextDecoration.none,
                  fontWeight: fontWeight ?? FontWeight.w500,
              
                ),
            overflow: overflow,
          ),
        ));
  }
}
