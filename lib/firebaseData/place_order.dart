import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybasket/models/order_model.dart';
import 'package:uuid/uuid.dart';

placeOrder(OrderModel order) async {
  final firebase = FirebaseFirestore.instance;

  String orderId = const Uuid().v1();
  try {
    await firebase.collection("Order").doc(orderId).set(order.toJson());
    return true;
  } catch (e) {
    return false;
  }
}
