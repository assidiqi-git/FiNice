import 'package:finice/models/category_model.dart';
import 'package:finice/viewmodels/edit_category_view_model.dart';
import 'package:finice/views/widget/category_type_button_widget.dart';
import 'package:finice/views/widget/icon_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditCategoryPage extends StatelessWidget {
  const EditCategoryPage({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EditCategoryViewModel(),
      child: _EditCategoryPageContent(category: category),
    );
  }
}

// Pisahkan konten agar bisa akses 'Provider.of' atau 'Consumer'
class _EditCategoryPageContent extends StatefulWidget {
  const _EditCategoryPageContent({required this.category});

  final CategoryModel category;

  @override
  State<_EditCategoryPageContent> createState() =>
      _EditCategoryPageContentState();
}

class _EditCategoryPageContentState extends State<_EditCategoryPageContent> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category.name);
    _descriptionController = TextEditingController(
      text: widget.category.description,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EditCategoryViewModel>().loadData(widget.category);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
    final viewModel = context.watch<EditCategoryViewModel>();
    // viewModel.setSelectedType(category.type);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Category',
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
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                elevation: 2,
                child: SizedBox(
                  height: 50, // Tinggi umum untuk komponen input
                  child: Row(
                    children: [
                      CategoryTypeButton(
                        label: "Incomes",
                        color: Colors.indigo,
                        isActive: viewModel.selectedType == 'income',
                        onTap: () => context
                            .read<EditCategoryViewModel>()
                            .setSelectedType('income'),
                      ),
                      CategoryTypeButton(
                        label: "Expenses",
                        color: Colors.red,
                        isActive: viewModel.selectedType == 'expense',
                        onTap: () => context
                            .read<EditCategoryViewModel>()
                            .setSelectedType('expense'),
                      ),
                      CategoryTypeButton(
                        label: "Savings",
                        color: Colors.green,
                        isActive: viewModel.selectedType == 'saving',
                        onTap: () => context
                            .read<EditCategoryViewModel>()
                            .setSelectedType('saving'),
                      ),
                    ],
                  ),
                ),
              ),

              // TYPE CATEGORY
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
                                  .read<EditCategoryViewModel>()
                                  .updateCategory(
                                    _nameController.text,
                                    _descriptionController.text,
                                  );

                              if (success && context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content: Text('Berhasil update'),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                context.pop(true);
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
                            : const Text("Ubah Kategori"),
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
