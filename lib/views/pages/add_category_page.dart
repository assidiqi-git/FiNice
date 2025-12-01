import 'package:finice/viewmodels/add_category_view_model.dart';
import 'package:finice/views/widget/icon_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoryPage extends StatelessWidget {
  const AddCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddCategoryViewmodel(),
      child: _AddCategoryPageContent(),
    );
  }
}

// Pisahkan konten agar bisa akses 'Provider.of' atau 'Consumer'
class _AddCategoryPageContent extends StatefulWidget {
  const _AddCategoryPageContent();

  @override
  State<_AddCategoryPageContent> createState() =>
      _AddCategoryPageContentState();
}

class _AddCategoryPageContentState extends State<_AddCategoryPageContent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
    final viewModel = context.watch<AddCategoryViewmodel>();

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
              if (viewModel.errorMessage != null)
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(bottom: 10),
                  color: Colors.red[100],
                  child: Text(
                    viewModel.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),

              // ICON HEADER
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

              // TYPE CATEGORY
              Card(
                // Atur properti klip agar efek klik (ripple) ikut membulat
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  // (Opsional) Tambahkan outline/border
                  side: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                elevation: 2,
                child: SizedBox(
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
                            context
                                .read<AddCategoryViewmodel>()
                                .setSelectedType('income');
                          },
                          child: Container(
                            color: viewModel.selectedType == 'income'
                                ? Colors.indigo[400]
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              'Incomes',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: viewModel.selectedType == 'income'
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
                            context
                                .read<AddCategoryViewmodel>()
                                .setSelectedType('expense');
                          },
                          child: Container(
                            color: viewModel.selectedType == 'expense'
                                ? Colors.indigo[400]
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              'Expense',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: viewModel.selectedType == 'expense'
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
                            context
                                .read<AddCategoryViewmodel>()
                                .setSelectedType('saving');
                          },
                          child: Container(
                            color: viewModel.selectedType == 'saving'
                                ? Colors.indigo[400]
                                : null,
                            alignment: Alignment.center,
                            child: Text(
                              'Savings',
                              style: TextStyle(
                                fontSize: 18,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700,
                                color: viewModel.selectedType == 'saving'
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
                label: '',
                currentIcon: _selectedCategoryIcon,
                iconList: _myIconList, // Berikan daftar ikon Anda
                onIconSelected: (newIcon) {
                  // Callback ini akan dipanggil saat user memilih ikon
                  setState(() {
                    _selectedCategoryIcon = newIcon;
                  });
                },
              ),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Kategori',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi Kategori',
                  border: OutlineInputBorder(),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      onPressed: viewModel.isLoading
                          ? null
                          : () async {
                              final success = await context
                                  .read<AddCategoryViewmodel>()
                                  .submitCategory(
                                    _nameController.text,
                                    _descriptionController.text,
                                  );

                              if (success && context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Berhasil disimpan'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                              }
                            },
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
                        child: viewModel.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text("Simpan Kategori"),
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
