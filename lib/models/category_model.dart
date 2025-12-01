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

  Map<String, dynamic> toJson() {
    return {'name': name, 'description': description ?? '', 'type': type};
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
