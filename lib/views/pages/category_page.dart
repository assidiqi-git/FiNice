import 'package:finice/views/pages/add_category_page.dart';
import 'package:finice/views/widget/category_list_widget.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String _selectedTag = 'income';
  late Future<List<Map<String, dynamic>>> _dataFuture;

  @override
  void initState() {
    _dataFuture = getData();
    super.initState();
  }

  Future<List<Map<String, dynamic>>> getData() async {
    await Future.delayed(const Duration(seconds: 3));
    final List<Map<String, dynamic>> dataList = [
      {
        'title': 'Gaji Bulanan',
        'description': 'Gaji pokok dari kantor',
        'isImportant': true,
        'tag': 'income',
      },
      {
        'title': 'Bayar Listrik',
        'description': 'Tagihan bulan ini',
        'isImportant': true,
        'tag': 'expense',
      },
      {
        'title': 'Dana Darurat',
        'description': 'Sisihkan 10% dari gaji',
        'isImportant': true,
        'tag': 'saving',
      },
      {
        'title': 'Beli Kopi',
        'description': null, // atau 'description': 'Kopi susu'
        'isImportant': false,
        'tag': 'expense',
      },
      {
        'title': 'Bonus Project',
        'description': null,
        'isImportant': false,
        'tag': 'income',
      },
      {
        'title': 'Belanja Bulanan',
        'description': 'Stok sabun, beras, minyak, dll.',
        'isImportant': true,
        'tag': 'expense',
      },
      {
        'title': 'Investasi Reksadana',
        'description': 'Pembelian rutin',
        'isImportant': true,
        'tag': 'saving',
      },
      {
        'title': 'Bensin Motor',
        'description': null,
        'isImportant': false,
        'tag': 'expense',
      },
      {
        'title': 'Tabungan Liburan',
        'description': null,
        'isImportant': false,
        'tag': 'saving',
      },
      {
        'title': 'Makan Siang',
        'description': 'Makan di warung',
        'isImportant': false,
        'tag': 'expense',
      },
    ];
    return dataList;
  }

  void _onTagTapped(String tag) {
    setState(() {
      _selectedTag = tag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Column(
                spacing: 10,
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
                                _onTagTapped('income');
                              },
                              child: _selectedTag == 'income'
                                  ? Container(
                                      color: Colors.indigo[400],
                                      // 6. Gunakan Container untuk padding & alignment
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Incomes",
                                        style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Colors.white, // Sesuaikan warna
                                        ),
                                      ),
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Incomes',
                                        style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w700,
                                          color: Colors
                                              .indigo[700], // Sesuaikan warna
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _onTagTapped('expense');
                              },
                              child: _selectedTag == 'expense'
                                  ? Container(
                                      color: Colors.indigo[400],
                                      // 6. Gunakan Container untuk padding & alignment
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Expenses",
                                        style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Colors.white, // Sesuaikan warna
                                        ),
                                      ),
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Expenses',
                                        style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w700,
                                          color: Colors
                                              .indigo[700], // Sesuaikan warna
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                _onTagTapped('saving');
                              },
                              child: _selectedTag == 'saving'
                                  ? Container(
                                      color: Colors.indigo[400],
                                      // 6. Gunakan Container untuk padding & alignment
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Savings",
                                        style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w700,
                                          color:
                                              Colors.white, // Sesuaikan warna
                                        ),
                                      ),
                                    )
                                  : Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Savings',
                                        style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.w700,
                                          color: Colors
                                              .indigo[700], // Sesuaikan warna
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                    elevation: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AddCategoryPage();
                            },
                          ),
                        );
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(15),
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundColor: Colors.indigo,
                                  radius: 25,
                                  child: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'Add New Category',
                                  style: TextStyle(
                                    fontSize: 22,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.indigo, // Sesuaikan warna
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Column(
                spacing: 5,
                children: [
                  Divider(height: 40),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Income Categories',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FutureBuilder<List<Map<String, dynamic>>>(
                    future: _dataFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }

                      if (snapshot.hasData) {
                        final List<Map<String, dynamic>> allItems =
                            snapshot.data!;

                        final List<Map<String, dynamic>> filteredItems =
                            allItems.where((item) {
                              // Konversi string tag dari data ke Enum
                              final itemTag = item['tag'];
                              // Bandingkan dengan tag yang dipilih
                              return itemTag == _selectedTag;
                            }).toList();

                        if (filteredItems.isEmpty) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text('Tidak ada data untuk kategori ini.'),
                            ),
                          );
                        }

                        return Column(
                          children: List.generate(filteredItems.length, (
                            index,
                          ) {
                            final item = filteredItems[index];

                            return CategoryListWidget(
                              tag: item['tag'],
                              description: item['description'],
                              title: item['title'],
                              isImportant: item['isImportant'],
                            );
                          }),
                        );
                      } else {
                        return Center(child: Text('Error'));
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
