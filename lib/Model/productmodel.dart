class ProductDetail {
    ProductDetail({
        required this.id,
        required this.code,
        required this.name,
        required this.slug,
        required this.displayMode,
        required this.description,
        required this.metaTitle,
        required this.metaDescription,
        required this.metaKeywords,
        required this.status,
        required this.imageUrl,
        required this.createdAt,
        required this.updatedAt,
    });

    final int? id;
    final dynamic code;
    final String? name;
    final String? slug;
    final String? displayMode;
    final String? description;
    final String? metaTitle;
    final String? metaDescription;
    final String? metaKeywords;
    final int? status;
    final String? imageUrl;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory ProductDetail.fromJson(Map<String, dynamic> json){ 
        return ProductDetail(
            id: json["id"],
            code: json["code"],
            name: json["name"],
            slug: json["slug"],
            displayMode: json["display_mode"],
            description: json["description"],
            metaTitle: json["meta_title"],
            metaDescription: json["meta_description"],
            metaKeywords: json["meta_keywords"],
            status: json["status"],
            imageUrl: json["image_url"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
        "slug": slug,
        "display_mode": displayMode,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keywords": metaKeywords,
        "status": status,
        "image_url": imageUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };

}
