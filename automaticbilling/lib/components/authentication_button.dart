import 'package:automaticbilling/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
    required this.label,
    required this.onPressed,
    this.labelColor = Colors.white,
    Key? key,
  }) : super(key: key);

  final String label;
  final Color labelColor;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 12.0),
        ),
        backgroundColor: MaterialStateProperty.all(kDarkGreenColor),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        )),
      ),
      onPressed: onPressed,
      child: Text(
        label,

        style:
        TextStyle(
          color: labelColor, // Use the provided labelColor
          fontSize: 16.0, // Adjust the font size as needed
          fontWeight: FontWeight.bold, // Adjust the font weight as needed
        ),
        // GoogleFonts.poppins(fontSize: 16.0),

      ),
    );
  }
}
