import 'package:flutter/material.dart';

// 1. Kita buat generik <T>, artinya bisa menerima tipe data apa saja.
class DropdownWidget<T> extends StatelessWidget {
  // 2. Daftar parameter yang kita perlukan
  final String? labelText;
  final String? hintText;
  final T? value;
  final List<T> items;
  final String Function(T item)
  itemToString; // Fungsi untuk menampilkan string dari objek
  final void Function(T? newValue) onChanged;
  final String? Function(T? value)? validator;

  const DropdownWidget({
    super.key,
    this.labelText,
    this.hintText,
    required this.value,
    required this.items,
    required this.itemToString,
    required this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final bool isValueInItems = value == null
        ? false
        : items.any((item) => item == value);
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        // (Opsional) Tambahkan outline/border
        side: BorderSide(color: Colors.grey[300]!, width: 1),
      ),
      elevation: 0.5, //
      child: DropdownButtonFormField<T>(
        initialValue: isValueInItems ? value : null,
        isExpanded: false,

        decoration: InputDecoration(
          hintText: hintText,

          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,

          prefix: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Penting!
              children: [
                Text(
                  labelText ?? '',
                  style: TextStyle(
                    color: Colors.indigo[700], // Sesuaikan warna (cth: ungu)
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                // SizedBox(width: 12.0), // Jarak antara teks dan divider
              ],
            ),
          ),

          // 7. Atur padding vertikal
          contentPadding: EdgeInsets.symmetric(vertical: 14.0),
        ),
        validator: validator,
        onChanged: onChanged,
        items: items.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(itemToString(item)),
          );
        }).toList(),
      ),
    );
  }
}
