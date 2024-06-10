import 'package:flutter/material.dart';
import 'package:mybasket/config/colors.dart';
import 'package:mybasket/models/combo_model.dart';
import 'package:mybasket/screens/add_to_cart_bottomsheet.dart';

class DescriptionsPage extends StatefulWidget {
  final ComboDataModel combo;
  const DescriptionsPage(
      {super.key, required this.combo});

  @override
  State<DescriptionsPage> createState() => _DescriptionsPageState();
}

class _DescriptionsPageState extends State<DescriptionsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: primaryColor,
      ),
      body: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.6,
              color: primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                  SizedBox(
                    height: height * 0.5,
                    child: Stack(
                      children: [
                        Container(
                            height: height * 0.5,
                            width: width,
                            color: primaryColor,
                            child: Center(
                              child: Container(
                                height: 240,
                                width: 240,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(240),
                                    color: Colors.white),
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        240), // Image radius
                                    child: Image.network(
                                        widget.combo.imageUrl,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () => {
                              showModalBottomSheet<void>(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AddToCartBottomSheet(
                                      combo: widget.combo);
                                },
                              )
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.white),
                              child: const Center(
                                  child: Icon(
                                Icons.add,
                                color: primaryColor,
                                size: 40,
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.4 - 60,
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.combo.name,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: darkColor),
                      ),
                      Text(
                        "Rs. ${widget.combo.price}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    widget.combo.description,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: darkColorSemiLight),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
