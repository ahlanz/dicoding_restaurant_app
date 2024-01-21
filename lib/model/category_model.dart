class CategoryModel {
  String name;

  CategoryModel({
    required this.name,
  });

  @override
  String toString() {
    return 'CategoryModel('
        'name: $name)';
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
