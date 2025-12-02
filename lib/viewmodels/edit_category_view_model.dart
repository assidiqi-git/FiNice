import 'package:finice/models/category_model.dart';
import 'package:finice/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class EditCategoryViewModel extends ChangeNotifier {
  final CategoryRepository _repository = CategoryRepository();

  bool _isLoading = false;
  String? _errorMessage;
  String _selectedType = 'income';
  String? _id;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get selectedType => _selectedType;

  void setSelectedType(String key) {
    _selectedType = key;
    notifyListeners();
  }

  void loadData(CategoryModel category) {
    _selectedType = category.type;
    _id = category.id;
    notifyListeners();
  }

  Future<bool> updateCategory(String name, String description) async {
    if (name.isEmpty || description.isEmpty) {
      _errorMessage = "Harap isi semua kolom";
      notifyListeners();
      return false;
    }

    _setLoading(true);
    _errorMessage = null;

    try {
      final newCategory = CategoryModel(
        id: _id,
        name: name,
        description: description,
        type: _selectedType,
      );

      await _repository.updateCategory(newCategory);
      _setLoading(false);
      return true;
    } catch (e) {
      _errorMessage = e.toString().replaceAll("Exception: ", "");
      _setLoading(false);
      return false;
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
