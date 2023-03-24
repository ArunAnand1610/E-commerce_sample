
class Products {
  Products({
    required this.data,
  });

  final List<ProductDetails> data;

  factory Products.fromMap(List json) => Products(
        data: List<ProductDetails>.from(json.map((x) => ProductDetails.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}


class ProductDetails {
    ProductDetails({
        required this.description,
        required this.id,
        required this.image,
        required this.name,
        required this.positionInList,
        required this.price,
        required this.ratingCount,
        required this.ratingValue,
    });

    final String? description;
    final int? id;
    final String? image;
    final String? name;
    final int? positionInList;
    final int? price;
    final int? ratingCount;
    final int? ratingValue;

    factory ProductDetails.fromJson(Map<String, dynamic> json){ 
        return ProductDetails(
            description: json["description"],
            id: json["id"],
            image: json["image"],
            name: json["name"],
            positionInList: json["positionInList"],
            price: json["price"],
            ratingCount: json["ratingCount"],
            ratingValue: json["ratingValue"],
        );
    }

    Map<String, dynamic> toJson() => {
        "description": description,
        "id": id,
        "image": image,
        "name": name,
        "positionInList": positionInList,
        "price": price,
        "ratingCount": ratingCount,
        "ratingValue": ratingValue,
    };

}
