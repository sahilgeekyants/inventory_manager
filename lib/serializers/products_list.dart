import 'product_info.dart';

class ProductsList {
  List<ProductInfo>? products;

  ProductsList({
    this.products,
  });

  ProductsList.fromJson(List<dynamic> json) {
    products = json.isNotEmpty ? json.map((product) => ProductInfo.fromJson(product)).toList() : [];
  }
  List<Map<String, dynamic>> toJsonList(List<ProductInfo> products) {
    return products.map((product) => ProductInfo().toJson(product)).toList();
  }
}
