import 'package:flutter/material.dart';

class IconPickerWidget extends StatefulWidget {
  final IconData currentIcon;
  final Function(IconData) onIconSelected;
  final List<IconData> iconList;
  final String label;

  const IconPickerWidget({
    super.key,
    required this.currentIcon,
    required this.onIconSelected,
    required this.iconList,
    this.label = "Pilih Ikon", // Label default
  });

  @override
  State<IconPickerWidget> createState() => _IconPickerWidgetState();
}

class _IconPickerWidgetState extends State<IconPickerWidget> {
  // Variabel state internal untuk melacak ikon yang dipilih
  late IconData _selectedIcon;

  @override
  void initState() {
    super.initState();
    _selectedIcon = widget.currentIcon;
  }

  // Fungsi untuk memunculkan modal bottom sheet
  void _showIconPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Penting agar bisa di-scroll
      shape: const RoundedRectangleBorder(
        // Hiasan sudut
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        // Gunakan DraggableScrollableSheet untuk modal yang bisa di-drag
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6, // Ketinggian awal modal (60% layar)
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Column(
              children: [
                // 1. "Gagang" untuk drag
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                // 2. Judul Modal
                const Text(
                  "Pilih sebuah Ikon",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // 3. Grid berisi ikon
                Expanded(
                  child: GridView.builder(
                    controller: scrollController, // Hubungkan scroll controller
                    padding: const EdgeInsets.all(16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6, // 6 ikon per baris
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    itemCount: widget.iconList.length,
                    itemBuilder: (context, index) {
                      final icon = widget.iconList[index];
                      return InkWell(
                        onTap: () {
                          // Saat ikon diklik:
                          // 1. Update state internal
                          setState(() {
                            _selectedIcon = icon;
                          });
                          // 2. Kirim data ke parent via callback
                          widget.onIconSelected(icon);
                          // 3. Tutup modal
                          Navigator.of(context).pop();
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          alignment: Alignment.center,
                          child: Icon(icon, size: 30, color: Colors.black87),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Ini adalah widget "tombol" yang terlihat di halaman
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Label
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),

        // 2. "Tombol" palsu
        InkWell(
          onTap: () => _showIconPicker(context), // Panggil modal
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 3. Ikon yang terpilih
                Icon(
                  _selectedIcon,
                  color: Theme.of(context).primaryColor, // Ambil warna primer
                ),
                const Text(
                  "Ganti Ikon",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
