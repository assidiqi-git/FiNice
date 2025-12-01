import 'package:flutter/material.dart';

class CategoryTypeButton extends StatelessWidget {
  const CategoryTypeButton({
    super.key,
    required this.label,
    required this.color,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final MaterialColor color;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // 4. Expanded agar membagi ruang
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          // 6. Gunakan Container untuk padding & alignment
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isActive ? color[400] : Colors.white,
            border: isActive
                ? null
                : Border(right: BorderSide(color: Colors.grey[300]!)),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.w700,
              color: isActive ? Colors.white : color[700], // Sesuaikan warna
            ),
          ),
        ),
      ),
    );
  }
}
