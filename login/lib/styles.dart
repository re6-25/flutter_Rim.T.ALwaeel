import 'package:flutter/material.dart';

const kTeal = Color(0xFF0FB9B1); // سماوي مائل للأخضر
const kAqua = Color(0xFF34D5E3); // سماوي أفتح

LinearGradient kGradient = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [kAqua, kTeal],
);

InputDecoration underDec(String hint, IconData icon) => InputDecoration(
  hintText: hint,
  prefixIcon: Icon(icon, color: kTeal),
  enabledBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFBDBDBD)),
  ),
  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: kTeal, width: 2),
  ),
);

ButtonStyle pillFill({Color color = kTeal}) => ElevatedButton.styleFrom(
  backgroundColor: color,
  foregroundColor: Colors.white,
  shape: const StadiumBorder(),
  padding: const EdgeInsets.symmetric(vertical: 14),
);

ButtonStyle pillOutline({Color color = Colors.white}) =>
    OutlinedButton.styleFrom(
      foregroundColor: color,
      side: BorderSide(color: color, width: 1.6),
      shape: const StadiumBorder(),
      padding: const EdgeInsets.symmetric(vertical: 14),
    );
