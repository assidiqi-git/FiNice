import 'package:finice/views/widget/date_widget.dart';
import 'package:finice/views/widget/dropdown_widget.dart';
import 'package:flutter/material.dart';

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({super.key});

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  String _selectedTag = 'income';
  String? selectedCategory;
  List<String> categories = ["Elektronik", "Fashion", "Makanan"];
  DateTime _mySelectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Activity',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            spacing: 15,
            children: [
              Card(
                // Atur properti klip agar efek klik (ripple) ikut membulat
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  // (Opsional) Tambahkan outline/border
                  side: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                elevation: 2,
                child: Container(
                  // 2. Beri tinggi yang pas untuk Row
                  height: 50, // Tinggi umum untuk komponen input
                  child: Row(
                    // 3. Bagi layout secara horizontal
                    children: [
                      // --- BAGIAN 'DATE RANGE' (Bisa Diklik) ---
                      Expanded(
                        // 4. Expanded agar membagi ruang
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedTag = 'income';
                            });
                          },
                          child: Container(
                            color: _selectedTag == 'income'
                                ? Colors.indigo[400]
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              'Incomes',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: _selectedTag == 'income'
                                    ? Colors
                                          .white // Sesuaikan warna
                                    : Colors.indigo[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedTag = 'expense';
                            });
                          },
                          child: Container(
                            color: _selectedTag == 'expense'
                                ? Colors.indigo[400]
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              'Expense',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: _selectedTag == 'expense'
                                    ? Colors
                                          .white // Sesuaikan warna
                                    : Colors.indigo[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedTag = 'saving';
                            });
                          },
                          child: Container(
                            color: _selectedTag == 'saving'
                                ? Colors.indigo[400]
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              'Savings',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: _selectedTag == 'saving'
                                    ? Colors
                                          .white // Sesuaikan warna
                                    : Colors.indigo[700],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Amount',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87, // Ganti sesuai tema Anda
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Category',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87, // Ganti sesuai tema Anda
                      ),
                    ),
                  ),
                  DropdownWidget<String>(
                    hintText: "Pilih kategori...",
                    value: selectedCategory,
                    items: categories,
                    // Untuk String, kita hanya perlu mengembalikan 'item' itu sendiri
                    itemToString: (item) => item,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    validator: (value) {
                      if (value == null) return "Kategori wajib diisi";
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Desctiption',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87, // Ganti sesuai tema Anda
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(),
                    ),
                  ),
                ],
              ),
              DateWidget(
                label: 'Pilih Tanggal Transaksi',
                initialDate: _mySelectedDate,
                onDateSelected: (newDate) {
                  // Callback ini akan dipanggil saat user memilih tanggal baru
                  setState(() {
                    _mySelectedDate = newDate;
                  });
                  print("Tanggal baru dipilih: $_mySelectedDate");
                },
                // (Opsional) Batasi tanggal
                // firstDate: DateTime(2020),
                // lastDate: DateTime.now(),
              ),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                          left: 10,
                          right: 10,
                        ),
                        child: Text(
                          'Add Transaction',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
