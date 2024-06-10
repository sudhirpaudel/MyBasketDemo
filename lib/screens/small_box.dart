import 'package:flutter/material.dart';
import 'package:mybasket/config/colors.dart';
import 'package:mybasket/models/combo_model.dart';
import 'package:mybasket/screens/add_to_cart_bottomsheet.dart';

class SmallBoxCombo extends StatefulWidget {
  final ComboDataModel combo;
  final Color bgColor;
  const SmallBoxCombo({super.key, required this.combo, required this.bgColor});

  @override
  State<SmallBoxCombo> createState() => _SmallBoxComboState();
}

class _SmallBoxComboState extends State<SmallBoxCombo> {
  @override
  Widget build(BuildContext context) {
    //double width = MediaQuery.of(context).size.width;
    ComboDataModel combo = widget.combo;
    return SizedBox(
      height: 170,
      width: 130,
      child: Stack(
        children: [
          Container(
              height: 170,
              width: 130,
              decoration: BoxDecoration(
                color: widget.bgColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(80),
                      ),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(80), // Image radius
                          child:
                              Image.network(combo.imageUrl, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      combo.name,
                      style: const TextStyle(fontSize: 13, color: darkColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      height: 20,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rs. ${combo.price}",
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: primaryColor),
                          ),
                          InkWell(
                            onTap: () async {
                             
                              showModalBottomSheet<void>(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (BuildContext context) {
                                  return AddToCartBottomSheet(
                                    combo: combo,
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: lightPrimaryColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Icon(
                                Icons.add,
                                size: 16,
                                color: primaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () => {
                setState(() {
                  combo.favourite = !combo.favourite;
                })
              },
              child: Icon(
                combo.favourite ? Icons.favorite : Icons.favorite_outline,
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
