class CategoriesModel {
  String? id;
  String? image;
  String? title;
  CategoriesModel({
    required this.id,
    required this.image,
    required this.title,
  });

  CategoriesModel.fromJson(Map<String, dynamic> callCategories) {
    // callCategories
    id = callCategories['id'];
    image = callCategories['img'];
    title = callCategories['title'];
  }
}
