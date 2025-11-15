import 'package:flutter/material.dart';

/// Sebuah widget input form yang reusable untuk memilih tanggal.
///
/// Membutuhkan [label], [initialDate], dan callback [onDateSelected].
class DateWidget extends StatefulWidget {
  final String label;
  final DateTime initialDate;
  final Function(DateTime) onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;

  const DateWidget({
    super.key,
    required this.label,
    required this.initialDate,
    required this.onDateSelected,
    this.firstDate,
    this.lastDate,
  });

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  // Variabel state internal untuk menyimpan dan menampilkan tanggal
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    // Inisialisasi state dengan tanggal awal dari 'widget'
    _selectedDate = widget.initialDate;
  }

  // Ini adalah fungsi yang Anda berikan,
  // bertugas memunculkan dialog dan meng-update state
  Future<void> _pickDate(BuildContext context) async {
    // 'showDatePicker' ADALAH fungsi yang memanggil dialog
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate, // Tanggal awal yang aktif
      firstDate: widget.firstDate ?? DateTime(DateTime.now().year - 100),
      lastDate: widget.lastDate ?? DateTime(DateTime.now().year + 100),
    );

    // Sisa logikanya
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
      // Kirim tanggal yang dipilih kembali ke parent widget
      widget.onDateSelected(_selectedDate);
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    // Kita bungkus dengan Column agar bisa menampilkan label
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Label
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87, // Ganti sesuai tema Anda
          ),
        ),
        const SizedBox(height: 8),

        // 2. Widget "Input" yang bisa diklik
        InkWell(
          onTap: () => _pickDate(context), // Panggil fungsi saat diklik
          borderRadius: BorderRadius.circular(10.0), // Efek ripple membulat
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[400]!),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 3. Teks tanggal yang diformat (dari package intl)
                Text(
                  _formatDate(_selectedDate),
                  style: const TextStyle(fontSize: 16),
                ),

                // 4. Ikon
                Icon(
                  Icons.calendar_today_outlined,
                  color: Theme.of(context).primaryColor, // Ambil warna primer
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
