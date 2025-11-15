import 'package:finice/views/widget/dropdown_widget.dart';
import 'package:finice/views/widget/icon_picker_widget.dart';
import 'package:flutter/material.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  String _selectedTag = 'income';
  String? selectedCategory;
  List<String> categories = ["Elektronik", "Fashion", "Makanan"];
  final List<IconData> _myIconList = [
    Icons.wallet,
    Icons.shopping_cart,
    Icons.fastfood,
    Icons.receipt,
    Icons.airplanemode_active,
    Icons.savings,
    Icons.attach_money,
    Icons.bolt,
    Icons.home,
    Icons.car_rental,
    Icons.phone_android,
    Icons.school,
    Icons.fitness_center,
    Icons.card_giftcard,
    Icons.pets,
  ];
  IconData _selectedCategoryIcon = Icons.wallet; // Default
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Category',
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
              Container(
                alignment: Alignment.center,
                child: ClipOval(
                  child: Material(
                    color: Colors.indigo, // 3. Beri warna di sini
                    child: InkWell(
                      onTap: () {},
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Icon(
                          _selectedCategoryIcon,
                          size: 90,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

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
              IconPickerWidget(
                label: "Icon",
                currentIcon: _selectedCategoryIcon,
                iconList: _myIconList, // Berikan daftar ikon Anda
                onIconSelected: (newIcon) {
                  // Callback ini akan dipanggil saat user memilih ikon
                  setState(() {
                    _selectedCategoryIcon = newIcon;
                  });
                },
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
                          'Add Category',
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
