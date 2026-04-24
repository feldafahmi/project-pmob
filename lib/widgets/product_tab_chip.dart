// ============================================
// FILE: lib/widgets/product_tab_chip.dart
// ============================================

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Pill chip untuk filter tab di ProductScreen (Semua/Modul/Kelas/dll)
/// dan untuk sort chips (Terpopuler/Terbaru/Termurah).
class ProductTabChip extends StatelessWidget {
  const ProductTabChip({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.variant = ProductChipVariant.tab,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final ProductChipVariant variant;

  static const Color _navy = Color(0xFF001261);
  static const Color _purple = Color(0xFFA600B2);
  static const Color _muted = Color(0xFF757684);
  static const Color _border = Color(0x14001261);
  static const Color _purpleFaint = Color(0x14A600B2);

  @override
  Widget build(BuildContext context) {
    final isTab = variant == ProductChipVariant.tab;

    final Color bg;
    final Color fg;
    final Color borderColor;
    if (isTab) {
      bg = isActive ? _navy : Colors.white;
      fg = isActive ? Colors.white : _muted;
      borderColor = isActive ? _navy : _border;
    } else {
      bg = isActive ? _purpleFaint : Colors.transparent;
      fg = isActive ? _purple : _muted;
      borderColor = isActive ? _purple : _border;
    }

    return Padding(
      padding: EdgeInsets.only(right: isTab ? 8 : 6),
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(99),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(99),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isTab ? 16 : 10,
              vertical: isTab ? 7 : 4,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              border: Border.all(
                color: borderColor,
                width: isTab ? 1.5 : 1,
              ),
            ),
            child: Text(
              label,
              style: GoogleFonts.manrope(
                fontSize: isTab ? 12 : 10,
                fontWeight: FontWeight.w700,
                color: fg,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ProductChipVariant { tab, sort }
