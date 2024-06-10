import 'package:flutter/material.dart';
import 'package:mybasket/config/colors.dart';
import 'package:mybasket/models/combo_model.dart';
import 'package:mybasket/screens/place_order_page.dart';

class ViewCartPage extends StatefulWidget {
  final List<ComboDataModel> combos;
  const ViewCartPage({super.key, required this.combos});

  @override
  State<ViewCartPage> createState() => _ViewCartPageState();
}

class _ViewCartPageState extends State<ViewCartPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
                  "Your Cart",
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
            height: height - 300,
            width: width,
            child: ListView.builder(
                        itemCount: widget.combos.length,
                        itemBuilder: (BuildContext context, int index) {
                          

                          if (widget.combos[index].quantity > 0  ) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          shape: BoxShape.rectangle,
                                          borderRadius:
                                              BorderRadius.circular(80),
                                        ),
                                        child: ClipOval(
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(
                                                80), // Image radius
                                            child: Image.network(widget.combos[index].imageUrl,
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                       SizedBox(
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.combos[index].name,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: darkColor),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Rs.${widget.combos[index].price}",
                                              style:const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: primaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                       SizedBox(
                                        height: 80,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Quantity",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: darkColor),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "${widget.combos[index].quantity}",
                                              style:const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  color: primaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Container(
                                  height: 2,
                                  width: width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  color: Colors.grey,
                                )
                              ],
                            );
                          } else {
                            return const SizedBox();
                          }
                        })
          ),
          Container(
            height: 110,
            width: width,
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: InkWell(
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PlaceOrderPage()),
                  )
                },
                child: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      "Checkout",
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
}
