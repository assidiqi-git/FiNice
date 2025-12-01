import 'package:finice/viewmodels/category_view_model.dart';
import 'package:finice/views/widget/category_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryViewModel()..fetchCategories(),
      child: const _CategoryPageContent(),
    );
  }
}

class _CategoryPageContent extends StatelessWidget {
  const _CategoryPageContent();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CategoryViewModel>();

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => viewModel.fetchCategories(),
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              // Type Button
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
                      _buildTypeButton(
                        context,
                        viewModel,
                        'Incomes',
                        'income',
                        Colors.indigo,
                      ),
                      _buildTypeButton(
                        context,
                        viewModel,
                        'Expenses',
                        'expense',
                        Colors.red,
                      ),
                      _buildTypeButton(
                        context,
                        viewModel,
                        'Savings',
                        'saving',
                        Colors.green,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Add Category
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                elevation: 2,
                child: InkWell(
                  onTap: () {
                    context.pushNamed('add_category');
                  },
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
              Divider(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${viewModel.selectedType[0].toUpperCase()}${viewModel.selectedType.substring(1)} Categories',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: viewModel.isLoading
                    ? Center(child: CircularProgressIndicator())
                    : viewModel.filteredCategories.isEmpty
                    ? Center(child: Text("Tidak ada data"))
                    : ListView.builder(
                        itemCount: viewModel.filteredCategories.length,
                        itemBuilder: (context, index) {
                          final category = viewModel.filteredCategories[index];

                          return CategoryListWidget(
                            title: category.name,
                            tag: category.type,
                            description: category.description,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTypeButton(
  BuildContext context,
  CategoryViewModel viewModel,
  String label,
  String typeKey,
  MaterialColor color,
) {
  final bool isActive = viewModel.selectedType == typeKey;
  return Expanded(
    // 4. Expanded agar membagi ruang
    child: InkWell(
      onTap: () {
        context.read<CategoryViewModel>().setSelectedType(typeKey);
      },
      child: Container(
        height: 50,
        // 6. Gunakan Container untuk padding & alignment
        alignment: Alignment.center,
        decoration: BoxDecoration(color: isActive ? color[400] : Colors.white),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 1,
            fontWeight: FontWeight.w700,
            color: isActive ? Colors.white : color[700], // Sesuaikan warna
          ),
        ),
      ),
    ),
  );
}
