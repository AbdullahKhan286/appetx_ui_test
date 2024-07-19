import 'package:apptex_ui_task/config/constant/color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLength;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLength = 200,
    this.fontSize = 14,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.left,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String displayText;
    if (_isExpanded) {
      displayText = widget.text;
    } else {
      displayText = widget.text.length > widget.trimLength
          ? '${widget.text.substring(0, widget.trimLength)}...'
          : widget.text;
    }

    return RichText(
      textAlign: widget.textAlign,
      text: TextSpan(
        text: displayText,
        style: GoogleFonts.poppins(
          fontSize: widget.fontSize,
          color: widget.color,
          fontWeight: widget.fontWeight,
        ),
        children: [
          if (widget.text.length > widget.trimLength)
            TextSpan(
              text: _isExpanded ? ' Show Less' : ' Read More',
              style: GoogleFonts.montserrat(
                fontSize: widget.fontSize,
                color: primaryColor,
                fontWeight: widget.fontWeight,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
            ),
        ],
      ),
    );
  }
}
