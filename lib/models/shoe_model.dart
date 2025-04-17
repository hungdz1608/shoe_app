class Shoe{
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Shoe({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  Shoe.defaultConstructor()
      : id = '',
        name = '',
        price = 0,
        imageUrl = '',
        description = '';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
    };
  }
  factory Shoe.fromJson(Map<String, dynamic> json) => Shoe(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
    );
  }

  class ShoeInCart extends Shoe {
    int quantity;
    ShoeInCart({
      this.quantity = 1,
      required super.id,
      required super.name,
      required super.price,
      required super.imageUrl,
      required super.description,
    });

    ShoeInCart.defaultConstructor()
        : quantity = 1,
          super(id: '', name: '', price: 0, imageUrl: '', description: '');

    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'name': name,
        'price': price,
        'imageUrl': imageUrl,
        'description': description,
        'quantity': quantity,
      };
    }

    factory ShoeInCart.fromJson(Map<String, dynamic> json) => ShoeInCart(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      quantity: json['quantity'],
    );
  }