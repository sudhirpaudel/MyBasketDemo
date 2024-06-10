import 'dart:convert';

OrderModel orderDataFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderDataToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    String firstName;
    String lastName;
    String phone;
    String email;
    DateTime orderDate;
    List<Cart> cart;

    OrderModel({
        required this.firstName,
        required this.lastName,
        required this.phone,
        required this.email,
        required this.orderDate,
        required this.cart,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        orderDate: json["orderDate"],
        cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "orderDate": orderDate,
        "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
    };
}

class Cart {
    int comboId;
    int quantity;

    Cart({
        required this.comboId,
        required this.quantity,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        comboId: json["combo_id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "combo_id": comboId,
        "quantity": quantity,
    };
}
