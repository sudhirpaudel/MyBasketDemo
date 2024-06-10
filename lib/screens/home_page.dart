import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mybasket/bloc/comboBloc/combo_bloc.dart';
import 'package:mybasket/config/colors.dart';
import 'package:mybasket/models/combo_model.dart';
import 'package:mybasket/screens/cart_page.dart';
import 'package:mybasket/screens/descriptions_page.dart';
import 'package:mybasket/screens/small_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController comboNameController = TextEditingController();
  int shownPageIndex = 0;
  int selected = 0;
  List categories = ["hot", "popular", "new", "top"];
  List categoriesName = ["Hottest", "Popular", "NewCombo", "Top"];

  bool search = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ComboBloc, ComboState>(
              builder: (context, state) {
                if (state is ComboInitial) {
                  if (state.combos.isNotEmpty) {
                    int count = state.combos
                        .where((combo) => combo.quantity > 0)
                        .length;
                    return appContainer(context, count, state.combos);
                  } else {
                    return appContainer(context, 0, []);
                  }
                } else {
                  return appContainer(context, 0, []);
                }
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello Kante,",
                      style: TextStyle(
                          color: darkColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16),
                    ),
                    TextSpan(
                      text: " What fruit salad combo do you want today?",
                      style: TextStyle(
                          color: darkColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: width / 1.2,
                    decoration: BoxDecoration(
                        color: boxBgColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (comboNameController.text.isNotEmpty) {
                                if (search) {
                                  comboNameController.clear();
                                }
                                search = !search;
                              }
                            });
                          },
                          child: search
                              ? const SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    Icons.search_off,
                                    color: darkColor,
                                  ),
                                )
                              : const Icon(
                                  Icons.search,
                                  color: darkColor,
                                ),
                        ),
                        SizedBox(
                          height: 50,
                          width: width / 1.4 - 60,
                          child: TextField(
                            controller: comboNameController,
                            style:
                                const TextStyle(fontSize: 14, color: darkColor),
                            cursorColor: darkColor,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search for fruit salad combo',
                                hintStyle: TextStyle(
                                    fontSize: 14, color: darkColorLight)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            search
                ? SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 30),
                          child: const Text(
                            "Searched Combo",
                            style: TextStyle(
                                color: darkColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<ComboBloc, ComboState>(
                          builder: (context, state) {
                            if (state is ComboInitial) {
                              if (state.combos.isEmpty) {
                                return const SizedBox(
                                  height: 180,
                                  child: Center(child: Text("Loading!!")),
                                );
                              } else {
                                return SizedBox(
                                  height: 180,
                                  width: width,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.combos.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (comboNameController.text ==
                                          state.combos[index].name) {
                                        return Row(
                                          children: [
                                            index == 0
                                                ? const SizedBox(
                                                    width: 30,
                                                  )
                                                : const SizedBox(
                                                    width: 10,
                                                  ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DescriptionsPage(
                                                            combo: state
                                                                .combos[index]
                                                          )),
                                                );
                                              },
                                              child: SmallBoxCombo(
                                                  combo: state.combos[index],
                                                  bgColor: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                );
                              }
                            } else {
                              return const SizedBox(
                                height: 180,
                                child: Center(child: Text("Nothing Here!!")),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            search
                ? const SizedBox()
                : SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 30),
                          child: const Text(
                            "Recommended Combo",
                            style: TextStyle(
                                color: darkColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<ComboBloc, ComboState>(
                          builder: (context, state) {
                            if (state is ComboInitial) {
                              if (state.combos.isEmpty) {
                                return const SizedBox(
                                  height: 180,
                                  child: Center(child: Text("Loading!!")),
                                );
                              } else {
                                return SizedBox(
                                  height: 180,
                                  width: width,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.combos.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Row(
                                        children: [
                                          index == 0
                                              ? const SizedBox(
                                                  width: 30,
                                                )
                                              : const SizedBox(
                                                  width: 10,
                                                ),
                                          InkWell(
                                            onTap: () {
                                               Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DescriptionsPage(
                                                            combo: state
                                                                .combos[index]
                                                          )),
                                                );
                                            },
                                            child: SmallBoxCombo(
                                                combo: state.combos[index],
                                                bgColor: Colors.white),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                );
                              }
                            } else {
                              return const SizedBox(
                                height: 180,
                                child: Center(child: Text("Nothing Here!!")),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
            search
                ? const SizedBox()
                : SizedBox(
                    child: Column(
                      children: [
                        Container(
                            height: 32,
                            padding: const EdgeInsets.only(left: 30),
                            child: ListView.builder(
                                itemCount: categories.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: SizedBox(
                                      height: 32,
                                      child: Center(
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                shownPageIndex = 0;
                                                selected = index;
                                              });
                                            },
                                            child: showCategory(
                                                selected == index,
                                                categoriesName[index])),
                                      ),
                                    ),
                                  );
                                })),
                        const SizedBox(height: 4),
                        BlocBuilder<ComboBloc, ComboState>(
                          builder: (context, state) {
                            if (state is ComboInitial) {
                              if (state.combos.isEmpty) {
                                return const SizedBox(
                                  height: 180,
                                  child: Center(child: Text("Loading!!")),
                                );
                              } else {
                                return SizedBox(
                                  height: 180,
                                  width: width,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: state.combos.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      if (state.combos[index].tag ==
                                          categories[selected]) {
                                        shownPageIndex = shownPageIndex + 1;
                                        return Row(
                                          children: [
                                            shownPageIndex == 1
                                                ? const SizedBox(
                                                    width: 30,
                                                  )
                                                : const SizedBox(
                                                    width: 10,
                                                  ),
                                            InkWell(
                                              onTap: () {
                                                 Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          DescriptionsPage(
                                                            combo: state
                                                                .combos[index]
                                                          )),
                                                );
                                              },
                                              child: SmallBoxCombo(
                                                  combo: state.combos[index],
                                                  bgColor: Colors.white),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        );
                                      } else {
                                        return const SizedBox();
                                      }
                                    },
                                  ),
                                );
                              }
                            } else {
                              return const SizedBox(
                                height: 180,
                                child: Center(child: Text("Error!!")),
                              );
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
            const SizedBox(
              height: 2,
            )
          ],
        ),
      ),
    );
  }
}

Widget showCategory(bool isSelected, String categoryName) {
  return isSelected
      ? SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoryName,
                style: const TextStyle(
                    color: darkColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              Container(
                height: 2,
                width: 30,
                color: primaryColor,
              )
            ],
          ),
        )
      : Text(
          categoryName,
          style: TextStyle(
              color: darkColorSemiLight,
              fontWeight: FontWeight.w400,
              fontSize: 14),
        );
}

Widget appContainer(
    BuildContext context, int count, List<ComboDataModel> combos) {
  return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 40,
              width: 40,
            ),
            InkWell(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ViewCartPage(
                            combos: combos,
                          )),
                );
              },
              child: SizedBox(
                width: 40,
                child: Stack(
                  children: [
                    const SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.shopping_bag,
                            color: primaryColor,
                            size: 32,
                          ),
                          Text(
                            "My Basket",
                            style: TextStyle(fontSize: 8),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: count > 0
                            ? Container(
                                height: 18,
                                width: 18,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(18)),
                                child: Center(
                                  child: Text(
                                    "$count",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                height: 1,
                              ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ));
}
