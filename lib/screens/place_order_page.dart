import 'package:flutter/material.dart';
import 'package:mybasket/config/colors.dart';
import 'package:mybasket/firebaseData/place_order.dart';
import 'package:mybasket/main.dart';
import 'package:mybasket/models/order_model.dart';
import 'package:mybasket/widgets/snackbar.dart';

class PlaceOrderPage extends StatefulWidget {
  const PlaceOrderPage({super.key});

  @override
  State<PlaceOrderPage> createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void completeOrder() async {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        addressController.text.isNotEmpty) {
      if (await placeOrder(OrderModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          phone: phoneController.text,
          email: emailController.text,
          orderDate: DateTime.now(),
          cart: []))) {
        showSnackBar(context, "Order Placed ", primaryColor, true);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const MyApp()),
        );
      } else {
        showSnackBar(context, "Order Placement Failed ", primaryColor, false);
      }
    } else {
      showSnackBar(context, "Fill all the fields ", primaryColor, false);
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width,
            height: 120,
            color: primaryColor,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.only(left: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.white),
                    child: const Center(
                        child: Icon(
                      Icons.arrow_back_ios,
                      color: primaryColor,
                      size: 22,
                    )),
                  ),
                ),
                const Text(
                  "Place Your Order",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                const SizedBox()
              ],
            ),
          ),
          SizedBox(
            width: width,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textFullBox(width / 2 - 45, 0, "FirstName", "N'golo",
                          firstNameController),
                      textFullBox(width / 2 - 45, 0, "LastName", "Kante",
                          lastNameController),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                textFullBox(
                    width, 30, "Email", "kante@gmail.com", emailController),
                const SizedBox(
                  height: 16,
                ),
                textFullBox(width, 30, "Phone", "9846098460", phoneController),
                const SizedBox(
                  height: 16,
                ),
                textFullBox(
                    width, 30, "Address", "Pokhara,Nepal", addressController),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 110,
            width: width,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: InkWell(
                onTap: () => {completeOrder()},
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Complete Order",
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget textFullBox(width, double padding, headingText, hintText,
      TextEditingController controller) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            " $headingText",
            style: const TextStyle(
                color: darkColor, fontWeight: FontWeight.w500, fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: width,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                color: boxBgColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: controller,
              textInputAction: TextInputAction.next,
              style: const TextStyle(fontSize: 14, color: darkColor),
              cursorColor: darkColor,
              decoration: InputDecoration(
                
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14, color: darkColorLight)),
            ),
          ),
        ],
      ),
    );
  }
}
