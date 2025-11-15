import 'package:flutter/material.dart';

class DateRangeWidget extends StatefulWidget {
  const DateRangeWidget({super.key});

  @override
  State<DateRangeWidget> createState() => _DateRangeWidgetState();
}

class _DateRangeWidgetState extends State<DateRangeWidget> {
  // Variabel state untuk menyimpan rentang tanggal yang dipilih
  DateTimeRange? _selectedDateRange;

  // Fungsi untuk menampilkan date range picker
  Future<void> _selectDateRange(BuildContext context) async {
    DateTime now = DateTime.now();
    final DateTimeRange? picked = await showDateRangePicker(
      initialEntryMode: DatePickerEntryMode.input,
      context: context,
      // Tanggal paling awal yang bisa dipilih
      firstDate: DateTime(2000),
      // Tanggal paling akhir yang bisa dipilih
      lastDate: DateTime(2300),
      // (Opsional) Rentang tanggal yang aktif saat picker dibuka
      initialDateRange:
          _selectedDateRange ??
          DateTimeRange(
            start: DateTime(now.year, now.month, 1),
            end: DateTime(now.year, now.month + 1, 0),
          ),
      helpText: 'Pilih Rentang Tanggal', // Teks judul
    );

    // Cek jika pengguna memilih rentang (tidak menekan 'Cancel')
    if (picked != null && picked != _selectedDateRange) {
      // Update state dengan tanggal yang baru dipilih
      setState(() {
        _selectedDateRange = picked;
      });
    }
  }

  // Fungsi bantu sederhana untuk memformat tanggal
  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // Atur properti klip agar efek klik (ripple) ikut membulat
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        // (Opsional) Tambahkan outline/border
        side: BorderSide(color: Colors.grey[300]!, width: 1),
      ),
      elevation: 0.5, // Sedikit bayangan

      child: InkWell(
        onTap: () => _selectDateRange(context),
        child: SizedBox(
          // 2. Beri tinggi yang pas untuk Row
          height: 56, // Tinggi umum untuk komponen input
          child: Row(
            // 3. Bagi layout secara horizontal
            children: [
              // --- BAGIAN 'DATE RANGE' (Bisa Diklik) ---
              Expanded(
                // 4. Expanded agar membagi ruang
                child: Container(
                  // 6. Gunakan Container untuk padding & alignment
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Tanggal",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.indigo[700], // Sesuaikan warna
                    ),
                  ),
                ),
              ),

              // --- PEMISAH (DIVIDER) ---
              SizedBox(
                height: 30, // Beri tinggi agar divider tidak penuh
                child: VerticalDivider(thickness: 1, color: Colors.indigo[400]),
              ),

              // --- BAGIAN 'CATEGORY' (Bisa Diklik) ---
              Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    _selectedDateRange == null
                        ? ''
                        : '${_formatDate(_selectedDateRange!.start)} - ${_formatDate(_selectedDateRange!.end)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700], // Sesuaikan warna
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
