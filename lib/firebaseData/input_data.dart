import 'package:cloud_firestore/cloud_firestore.dart';

inputData() async {
  final firebase = FirebaseFirestore.instance;

  for (var i = 17; i < 22; i++) {
    await firebase.collection("Combo").doc("$i").set({
      "name": "VadaPau",
      "description":
          "Momos are a type of steamed filled dumpling in Tibetan and Nepali cuisine that is also popular in neighbouring Bhutan and India. Momos are usually served with a sauce known as achar influenced by the spices and herbs used within many South Asian cuisines.",
      "price": "220",
      "imageUrl": "https://firebasestorage.googleapis.com/v0/b/newmybasket.appspot.com/o/images%2Ffood2.png?alt=media&token=b55441c0-abcc-4e43-b8a5-c5c84a5daa0a",
      "tag": "top",
      "favourite": i.isOdd
    });
  }

  return true;
}
