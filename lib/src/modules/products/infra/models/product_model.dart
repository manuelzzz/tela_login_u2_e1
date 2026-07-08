import 'package:tela_login_u2_e1/src/modules/products/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    super.id,
    super.title,
    super.price,
    super.description,
    super.category,
    super.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      description: json['description'] as String?,
      category: json['category'] as String?,
      image: _imageFromJson(json),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
    };
  }

  static List<ProductModel> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }

  static String? _imageFromJson(Map<String, dynamic> json) {
    final image = json['image'] as String?;

    if (image != null && image.isNotEmpty) {
      return image;
    }

    final thumbnail = json['thumbnail'] as String?;

    if (thumbnail != null && thumbnail.isNotEmpty) {
      return thumbnail;
    }

    final images = json['images'];

    if (images is List && images.isNotEmpty && images.first is String) {
      return images.first as String;
    }

    return null;
  }
}
