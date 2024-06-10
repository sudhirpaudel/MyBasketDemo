import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mybasket/models/combo_model.dart';

Future<List<ComboDataModel>> getComboData() async {
  List<ComboDataModel> combos = [];
  final firebase = FirebaseFirestore.instance;
  QuerySnapshot querySnapshot = await firebase.collection('Combo').get();
  for (QueryDocumentSnapshot docSnapshot in querySnapshot.docs) {
    Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
    ComboDataModel combo = comboDataModelFromJson(jsonEncode(data),docSnapshot.id);
    combos.add(combo);
  }
  return combos;
}
