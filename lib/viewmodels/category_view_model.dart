import 'package:finice/models/category_model.dart';
import 'package:finice/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class CategoryViewModel extends ChangeNotifier {
  final CategoryRepository _repository = CategoryRepository();

  List<CategoryModel> _categories = [];

  bool _isLoading = false;
  String? _errorMessage;
  String _selectedType = 'income';

  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get selectedType => _selectedType;

  void setSelectedType(String key) {
    _selectedType = key;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _categories = await _repository.getAllCategories();
    } catch (e) {
      _errorMessage = e.toString().replaceAll("Exception: ", "");
    } finally {
      _isLoading = false;
      notifyListeners(); // Update UI (Tampilkan List atau Error)
    }
  }

  List<CategoryModel> get filteredCategories {
    _isLoading = true;
    if (_categories.isEmpty) return [];
    final newList = _categories
        .where((item) => item.type == _selectedType)
        .toList();
    _isLoading = false;
    return newList;
  }

  Future<bool> deleteCategory(int id) async {
    try {
      await _repository.deleteCategory(id);
      fetchCategories();
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll("Exception: ", "");
      return false;
    } finally {
      notifyListeners(); // Update UI (Tampilkan List atau Error)
    }
  }
}
