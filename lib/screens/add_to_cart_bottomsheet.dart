import 'package:flutter/material.dart';
import 'package:mybasket/config/colors.dart';
import 'package:mybasket/models/combo_model.dart';
import 'package:mybasket/widgets/snackbar.dart';

class AddToCartBottomSheet extends StatefulWidget {
  final ComboDataModel combo;
  const AddToCartBottomSheet({super.key, required this.combo});

  @override
  State<AddToCartBottomSheet> createState() => _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Container(
        height: 200,
        width: width,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      child: Image.asset('assets/images/food1.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.combo.name,
                        style:
                            const TextStyle(fontSize: 15, color: darkColor),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.combo.price,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Quantity",
                          style: TextStyle(fontSize: 12, color: darkColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () => {
                                  setState(() {
                                    if (quantity > 1) {
                                      quantity--;
                                    }
                                  })
                                },
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Center(
                                  child: Text(
                                    "$quantity",
                                    style: const TextStyle(
                                        color: darkColor,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => {
                                  setState(() {
                                    quantity++;
                                  })
                                },
                                child: Container(
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    child: InkWell(
                      onTap: () {
                        // ComboDataModel combo = ComboDataModel(
                        //     comboId: widget.combo.comboId,
                        //     imageUrl: widget.combo.imageUrl,
                        //     name: widget.combo.name,
                        //     price: widget.combo.price,
                        //     description: widget.combo.description,
                        //     tag: widget.combo.tag,
                        //     favourite: widget.combo.favourite,
                        //     quantity: quantity);
        
                        
                        Navigator.pop(context);
                        showSnackBar(
                            context, "Added To Cart!!", primaryColor, true);
                      },
                      child: Container(
                        height: 50,
                        width: 140,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Add To Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
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
