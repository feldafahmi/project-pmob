// ============================================
// FILE: lib/widgets/product_type_badge.dart
// ============================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/product_model.dart';

/// Mapping warna + ikon per ProductType — disesuaikan dengan
/// design tokens dari Mark-Up Produk Screen.
class ProductTypeStyle {
  final Color background;
  final Color foreground;
  final IconData icon;
  final List<Color> gradient;

  const ProductTypeStyle({
    required this.background,
    required this.foreground,
    required this.icon,
    required this.gradient,
  });

  static const Color _navy = Color(0xFF001261);
  static const Color _blue = Color(0xFF002196);
  static const Color _purple = Color(0xFFA600B2);
  static const Color _green = Color(0xFF16A34A);

  static ProductTypeStyle of(ProductType type) {
    switch (type) {
      case ProductType.modul:
        return const ProductTypeStyle(
          background: Color(0x1AA600B2), // rgba(166,0,178,0.10)
          foreground: _purple,
          icon: Icons.menu_book_rounded,
          gradient: [_purple, Color(0xFF6B0075)],
        );
      case ProductType.kelas:
        return const ProductTypeStyle(
          background: Color(0x1A002196), // rgba(0,33,150,0.10)
          foreground: _blue,
          icon: Icons.play_arrow_rounded,
          gradient: [_blue, _navy],
        );
      case ProductType.bootcamp:
        return const ProductTypeStyle(
          background: Color(0x1A001261), // rgba(0,18,97,0.10)
          foreground: _navy,
          icon: Icons.bolt_rounded,
          gradient: [_navy, Color(0xFF1E3A8A)],
        );
      case ProductType.mentoring:
        return const ProductTypeStyle(
          background: Color(0x1A16A34A), // rgba(22,163,74,0.10)
          foreground: _green,
          icon: Icons.groups_rounded,
          gradient: [_green, Color(0xFF065F46)],
        );
    }
  }
}

class ProductTypeBadge extends StatelessWidget {
  const ProductTypeBadge({
    super.key,
    required this.type,
    this.small = false,
  });

  final ProductType type;
  final bool small;

  @override
  Widget build(BuildContext context) {
    final style = ProductTypeStyle.of(type);
    final iconSize = small ? 9.0 : 10.0;
    final fontSize = small ? 9.0 : 10.0;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: small ? 7 : 9,
        vertical: small ? 2 : 3,
      ),
      decoration: BoxDecoration(
        color: style.background,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(style.icon, size: iconSize, color: style.foreground),
          const SizedBox(width: 4),
          Text(
            type.label.toUpperCase(),
            style: GoogleFonts.manrope(
              fontSize: fontSize,
              fontWeight: FontWeight.w700,
              color: style.foreground,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
