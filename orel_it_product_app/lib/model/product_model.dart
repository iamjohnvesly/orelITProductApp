class ProductResponse {
  final int code;
  final String message;
  final ProductData data;

  ProductResponse({
    required this.code,
    required this.message,
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      code: json['code'],
      message: json['message'],
      data: ProductData.fromJson(json['data']),
    );
  }
}

class ProductData {
  final List<Product> products;
  final int total;

  ProductData({
    required this.products,
    required this.total,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      products: List<Product>.from(
        json['products'].map((product) => Product.fromJson(product)),
      ),
      total: json['total'],
    );
  }
}

class Product {
  final double price;
  final int discount;
  final double discountPrice;
  final List<ProductImage> images;
  final String code;
  final String shortDescription;
  final String productCode;
  final String searchUrl;
  final String name;
  final String priceCurrency;
  final int rate;

  Product({
    required this.price,
    required this.discount,
    required this.discountPrice,
    required this.images,
    required this.code,
    required this.shortDescription,
    required this.productCode,
    required this.searchUrl,
    required this.name,
    required this.priceCurrency,
    required this.rate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      price: json['price'],
      discount: json['discount'],
      discountPrice: json['discount_price'],
      images: List<ProductImage>.from(
        json['images'].map((image) => ProductImage.fromJson(image)),
      ),
      code: json['code'],
      shortDescription: json['shortDescription'],
      productCode: json['product_code'],
      searchUrl: json['search_url'],
      name: json['name'],
      priceCurrency: json['price_currency'],
      rate: json['rate'],
    );
  }
}

class ProductImage {
  final int order;
  final String url;

  ProductImage({
    required this.order,
    required this.url,
  });

  factory ProductImage.fromJson(Map<String, dynamic> json) {
    return ProductImage(
      order: json['order'],
      url: json['url'],
    );
  }
}
