class BannerDataModel {
  late String image;
  late String text;

  BannerDataModel({required this.image, required this.text});

  BannerDataModel.fromJson(Map<String, dynamic> calldata) {
    image = calldata['img'];
  }
}
