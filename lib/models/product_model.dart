class ProductModel {
  String image;
  String name;
  String category;
  String price;
  String size;
  String description;
  String sun;
  String temp;
  String water;
  String productId;

  ProductModel({
    this.image,
    this.name,
    this.category,
    this.price,
    this.size,
    this.description,
    this.sun,
    this.temp,
    this.water,
    this.productId,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map['name'];
    image = map['image'];
    description = map['description'];
    category = map['category'];
    size = map['size'];
    price = map['price'];
    water = map['water'];
    sun = map['sun'];
    temp = map['temp'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'image': image,
      'description': description,
      'category': category,
      'size': size,
      'price': price,
      'water': water,
      'sun': sun,
      'temp': temp,
      'productId': productId,
    };
  }
}
