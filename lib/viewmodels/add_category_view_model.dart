import 'package:finice/models/category_model.dart';
import 'package:finice/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class AddCategoryViewmodel extends ChangeNotifier {
  final CategoryRepository _repository = CategoryRepository();

  bool _isLoading = false;
  String? _errorMessage;
  String _selectedType = 'income';

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String get selectedType => _selectedType;

  void setSelectedType(String key) {
    _selectedType = key;
    notifyListeners();
  }

  Future<bool> submitCategory(String name, String description) async {
    if (name.isEmpty) {
      _errorMessage = "Nama kategori tidak boleh kosong";
      notifyListeners();
      return false;
    }

    _setLoading(true);
    _errorMessage = null;

    try {
      final newCategory = CategoryModel(
        name: name,
        description: description,
        type: _selectedType,
      );

      await _repository.createCategory(newCategory);
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
