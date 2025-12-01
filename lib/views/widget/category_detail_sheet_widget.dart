import 'package:flutter/material.dart';
// Ganti dengan import model Anda yang sebenarnya
import 'package:finice/models/category_model.dart';

class CategoryDetailSheetWidget extends StatelessWidget {
  const CategoryDetailSheetWidget({
    super.key,
    required this.category,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  final CategoryModel category;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  /// Static Helper Method: Agar pemanggilan dari luar lebih bersih.
  /// Kita tidak perlu menulis 'showModalBottomSheet' berulang kali di Page.
  static void show(
    BuildContext context, {
    required CategoryModel category,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) => CategoryDetailSheetWidget(
        category: category,
        onEditTap: onEdit,
        onDeleteTap: onDelete,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Logika Warna & Icon (Bisa dipindah ke Model jika ingin lebih clean lagi)
    final Map<String, ({IconData icon, Color color})> categoryType = {
      'income': (icon: Icons.arrow_downward_rounded, color: Colors.indigo),
      'expense': (icon: Icons.arrow_upward_rounded, color: Colors.red),
      'saving': (icon: Icons.wallet, color: Colors.green),
    };

    final style = categoryType[category.type];

    return Padding(
      // Mengatasi area keyboard/system navigation
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 20,
        left: 20,
        right: 20,
        top: 12,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle Bar
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),

          // Header Icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: style?.color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(style?.icon, color: style?.color, size: 32),
          ),
          const SizedBox(height: 16),

          // Name & Type
          Text(
            category.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),

          // Badge Type
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: style!.color.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              category.type.toUpperCase(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: style.color,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Description Box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DESCRIPTION",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  category.description!,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Action Buttons
          Row(
            children: [
              // DELETE BUTTON
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup sheet dulu
                    onDeleteTap(); // Jalankan logika delete dari parent
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.redAccent),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Delete"),
                ),
              ),
              const SizedBox(width: 16),

              // EDIT BUTTON
              Expanded(
                child: FilledButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup sheet dulu
                    onEditTap(); // Jalankan logika edit dari parent
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Edit"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
