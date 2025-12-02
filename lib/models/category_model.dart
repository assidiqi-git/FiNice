class CategoryModel {
  final String? id;
  final String name;
  final String? description;
  final String type;

  CategoryModel({
    this.id,
    required this.name,
    this.description,
    required this.type,
  });

  Map<String, dynamic> toJson([String? method]) {
    return {
      'name': name,
      'description': description ?? '',
      'type': type,
      if (method != null) '_method': method,
    };
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'].toString(),
      name: json['name'],
      description: json['description'] ?? '',
      type: json['type'],
    );
  }
}
