class MyFavorites {
  bool? status;
  MyFavoritesData? data;
  MyFavorites.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = MyFavoritesData.fromJson(json['data']);
  }
}

class MyFavoritesData {
  int? currentPage;
  List<DataModelTest> data = [];
  MyFavoritesData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <DataModelTest>[];
      json['data'].forEach((v) {
        data.add(DataModelTest.fromJson(v));
      });
    }
  }
}

class DataModelTest {
  int? id;
  Products? product;
  DataModelTest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = Products.fromJson(json['product']);
  }
}

class Products {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
  }
}
