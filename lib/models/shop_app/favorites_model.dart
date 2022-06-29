// class FavoritesModel {
//   bool? status;
//   //Null? message;
//   Data? data;
//
//   FavoritesModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     //message = json['message'];
//     data = Data.fromJson(json['data']);
//   }
// }
//
// class Data {
//   int? currentPage;
//   List<FavData>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   //Null? nextPageUrl;
//   String? path;
//   int? perPage;
//   //Null? prevPageUrl;
//   int? to;
//   int? total;
//
//   Data.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data = <FavData>[];
//       json['data'].forEach((v) {
//         data!.add(new FavData.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     // nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     //prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }
// }
//
// class FavData {
//   int? id;
//   Product? product;
//
//   FavData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     product = Product.fromJson(json['product']);
//   }
// }
//
// class Product {
//   int? id;
//   dynamic price;
//   dynamic oldPrice;
//   int? discount;
//   String? image;
//   String? name;
//   String? description;
//
//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//   }
// }
class FavoritesModel {
  bool? status;
  Data? data;

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  int? currentPage;
  List<FavoritesData> data = [];

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <FavoritesData>[];
      json['data'].forEach((v) {
        data.add(FavoritesData.fromJson(v));
      });
    }
  }
}

class FavoritesData {
  int? id;
  Product? product;

  FavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }
}

class Product {
  int? id;
  dynamic price;
  dynamic oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
