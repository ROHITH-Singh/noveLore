import 'package:flutter/material.dart';

const kBlackcolor = Color(0xFF393939);
const kLightBlackColor = Color(0xFF8F8F8F);
const kIconColor = Color(0xFFF48A37);
const kProgressIndicator = Color(0xFF8E7066);
final kShadowcolor1 = Color(0x63635f).withOpacity(0.8);
final kShadowcolor = Color(0xFF393939).withOpacity(0.9);
final kgradienttheme = BoxDecoration(
  gradient: SweepGradient(colors: [
    Colors.pink,
    Colors.red,
    Colors.green,
    Colors.purple,
    Colors.teal
  ], stops: [
    0.8,
    0.96,
    0.74,
    0.22,
    0.85
  ], startAngle: 0.5, endAngle: 1),
);
