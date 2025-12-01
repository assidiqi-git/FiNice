import 'package:finice/viewmodels/category_view_model.dart';
import 'package:finice/views/widget/category_list_widget.dart';
import 'package:finice/views/widget/category_type_button_widget.dart';
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

    return RefreshIndicator(
      onRefresh: () => viewModel.fetchCategories(),
      child: Scaffold(
        body: Padding(
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
                      CategoryTypeButton(
                        label: "Incomes",
                        color: Colors.indigo,
                        isActive: viewModel.selectedType == 'income',
                        onTap: () => context
                            .read<CategoryViewModel>()
                            .setSelectedType('income'),
                      ),
                      CategoryTypeButton(
                        label: "Expenses",
                        color: Colors.red,
                        isActive: viewModel.selectedType == 'expense',
                        onTap: () => context
                            .read<CategoryViewModel>()
                            .setSelectedType('expense'),
                      ),
                      CategoryTypeButton(
                        label: "Savings",
                        color: Colors.green,
                        isActive: viewModel.selectedType == 'saving',
                        onTap: () => context
                            .read<CategoryViewModel>()
                            .setSelectedType('saving'),
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
                  onTap: () async {
                    final bool? refresh = await context.pushNamed<bool>(
                      'add_category',
                    );

                    if (refresh == true) {
                      if (context.mounted) {
                        context.read<CategoryViewModel>().fetchCategories();
                      }
                    }
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
              // Header Category
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
              // List Category
              SizedBox(height: 10),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (viewModel.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (viewModel.errorMessage != null) {
                      return SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Center(child: Text(viewModel.errorMessage!)),
                            ],
                          ),
                        ),
                      );
                    }

                    if (viewModel.filteredCategories.isEmpty) {
                      return SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [Center(child: Text("Data tidak ada"))],
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: viewModel.filteredCategories.length,
                        itemBuilder: (context, index) {
                          final category = viewModel.filteredCategories[index];

                          return CategoryListWidget(
                            title: category.name,
                            tag: category.type,
                            description: category.description,
                          );
                        },
                      );
                    }
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
