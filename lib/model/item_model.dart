class ItemModel {
  late String id, image, title, detailid;
  late int totalPrice, sellPrice;
  ItemModel({
    required this.id,
    required this.image,
    required this.title,
    required this.totalPrice,
    required this.sellPrice,
  });

  ItemModel.fromJson(Map<String, dynamic> itemmodelcall) {
    id = itemmodelcall['id'];
    image = itemmodelcall['img'];

    title = itemmodelcall['title'];

    sellPrice = itemmodelcall['sell_price'];

    totalPrice = itemmodelcall['total_price'];
    detailid = itemmodelcall['details_id'];
  }
}
