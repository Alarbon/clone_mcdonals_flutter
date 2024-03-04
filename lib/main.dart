import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mcdonalds_clone/menu_option.dart';
import 'package:mcdonalds_clone/order_item.dart';
import 'package:mcdonalds_clone/popular_item.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'McDonald\'s clone',
      home: const MyHomePage(),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.varelaRoundTextTheme(),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.varelaRoundTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int coke = 0;

  int fries = 0;

  int cheeseburguer = 0;

  int nuggets = 0;

  double total = 0;

  bool isDarkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDarkModeEnabled ? ThemeData.dark() : ThemeData.light(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Colors.transparent,
            statusBarBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark),
        child: Scaffold(
            body: Row(
          children: [
            Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        color:
                            isDarkModeEnabled ? Colors.black : Colors.grey[50],
                        child: SafeArea(
                            child: Padding(
                          padding: const EdgeInsets.only(
                              left: 24.0, bottom: 16.0, top: 24.0, right: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    child: SvgPicture.asset(
                                      'assets/images/logo.svg',
                                      height: 48,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 70,
                                    child: DayNightSwitcher(
                                      dayBackgroundColor: Colors.yellow[700],
                                      sunColor: Colors.yellow[900],
                                      nightBackgroundColor: Colors.red[900],
                                      moonColor: Colors.yellow[700],
                                      isDarkModeEnabled: isDarkModeEnabled,
                                      onStateChanged: (isDarkModeEnabled) {
                                        setState(() {
                                          this.isDarkModeEnabled =
                                              isDarkModeEnabled;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 64.0,
                              ),
                              const Text(
                                "Hey",
                                style: TextStyle(
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w900),
                              ),
                              const Text(
                                "what's up",
                                style: TextStyle(
                                    fontSize: 36.0,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      MenuOption(
                                        titile: 'Combo meal',
                                        imageURL:
                                            'assets/images/combo_meal.png',
                                        discount: 20,
                                      ),
                                      MenuOption(
                                        titile: 'Burgers and sandwiches',
                                        imageURL:
                                            'assets/images/burgers_and_sandwiches.png',
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      MenuOption(
                                        titile: 'Happy meal',
                                        imageURL:
                                            'assets/images/happy_meal.png',
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      MenuOption(
                                        titile: 'Brevages',
                                        imageURL: 'assets/images/beverages.png',
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      MenuOption(
                                        titile: 'Chicken',
                                        imageURL: 'assets/images/chicken.png',
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      MenuOption(
                                        titile: 'Snacks & sides',
                                        imageURL:
                                            'assets/images/snacks_and_sides.png',
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 48.0,
                              ),
                              const Text(
                                "Popular",
                                style: TextStyle(fontSize: 36),
                              ),
                              const SizedBox(
                                height: 32.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      PopularItem(
                                          tittle: "Big Mac",
                                          imageURL: "assets/images/big_mac.png",
                                          price: r"$ 3.79",
                                          isDarkModeEnabled: isDarkModeEnabled),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      PopularItem(
                                          tittle: "Double Quarter Pounder",
                                          imageURL:
                                              "assets/images/double_quarter_pounder.png",
                                          price: r"$ 4.10",
                                          isDarkModeEnabled: isDarkModeEnabled),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      PopularItem(
                                          tittle: "Bacon Ranch Salad",
                                          imageURL:
                                              "assets/images/bacon_ranch_salad.png",
                                          price: r" $ 2.18",
                                          isDarkModeEnabled: isDarkModeEnabled),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      PopularItem(
                                          tittle: "Quarter Pounder",
                                          imageURL:
                                              "assets/images/quarter_pounder.png",
                                          price: r"$ 3.79",
                                          isDarkModeEnabled: isDarkModeEnabled),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      PopularItem(
                                          tittle: "Fillet O Fish",
                                          imageURL:
                                              "assets/images/filet_o_fish.png",
                                          price: r"$ 2.99",
                                          isDarkModeEnabled: isDarkModeEnabled),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      PopularItem(
                                          tittle: "Cheeseburguer",
                                          imageURL:
                                              "assets/images/cheeseburger.png",
                                          price: r"$ 2.49",
                                          isDarkModeEnabled: isDarkModeEnabled),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                      )
                    ],
                  ),
                )),
            Expanded(
                child: Container(
              color: isDarkModeEnabled ? Colors.black : Colors.grey[50],
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, bottom: 16.0, top: 24.0, right: 16.0),
                child: Column(
                  children: [
                    const Text(
                      'My',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text(
                      'Order',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Take out',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Expanded(
                        child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        OrderItem(
                            imageUrl: "assets/images/beverages.png",
                            name: "Diet Coke",
                            price: r'$1.49',
                            quantity: coke,
                            isDarkModeEnabled: isDarkModeEnabled,
                            onPressedPlus: () {
                              setState(() {
                                if (coke < 99) {
                                  coke++;
                                  total = calculateTotal(
                                      coke, fries, cheeseburguer, nuggets);
                                }
                              });
                            },
                            onPressedRemove: () {
                              setState(() {
                                if (coke > 0) {
                                  coke--;
                                  total = calculateTotal(
                                      coke, fries, cheeseburguer, nuggets);
                                }
                              });
                            }),
                        OrderItem(
                            imageUrl: "assets/images/snacks_and_sides.png",
                            name: "Large Fries",
                            price: r'$3.98',
                            quantity: fries,
                            isDarkModeEnabled: isDarkModeEnabled,
                            onPressedPlus: () {
                              setState(() {
                                if (fries < 99) {
                                  fries++;
                                  total = calculateTotal(
                                      coke, fries, cheeseburguer, nuggets);
                                }
                              });
                            },
                            onPressedRemove: () {
                              setState(() {
                                if (fries > 0) {
                                  fries--;
                                  total = calculateTotal(
                                      coke, fries, cheeseburguer, nuggets);
                                }
                              });
                            }),
                        OrderItem(
                            imageUrl: "assets/images/cheeseburger.png",
                            name: "Cheeseburguer",
                            price: r'2.49',
                            quantity: cheeseburguer,
                            isDarkModeEnabled: isDarkModeEnabled,
                            onPressedPlus: () {
                              setState(() {
                                if (cheeseburguer < 99) {
                                  cheeseburguer++;
                                  total = calculateTotal(
                                      coke, fries, cheeseburguer, nuggets);
                                }
                              });
                            },
                            onPressedRemove: () {
                              setState(() {
                                if (cheeseburguer > 0) {
                                  cheeseburguer--;
                                  total = calculateTotal(
                                      coke, fries, cheeseburguer, nuggets);
                                }
                              });
                            }),
                        OrderItem(
                            imageUrl: "assets/images/chicken.png",
                            name: "Nuggets x10",
                            price: r'$ 3.99',
                            quantity: nuggets,
                            isDarkModeEnabled: isDarkModeEnabled,
                            onPressedPlus: () {
                              setState(() {
                                if (nuggets < 99) {
                                  nuggets++;
                                  total = calculateTotal(
                                      coke, fries, cheeseburguer, nuggets);
                                }
                              });
                            },
                            onPressedRemove: () {
                              setState(() {
                                if (nuggets > 0) {
                                  nuggets--;
                                  total = calculateTotal(
                                      coke, fries, cheeseburguer, nuggets);
                                }
                              });
                            }),
                      ],
                    )),
                    const Divider(
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 12,
                          color: isDarkModeEnabled ? Colors.grey : Colors.black,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        r"$ " + total.toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                isDarkModeEnabled ? Colors.grey : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Container(
                      width: double.infinity,
                      height: 80,
                      decoration: const BoxDecoration(
                          color: Color(0xFFFFCB3F),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            if (total > 0) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: isDarkModeEnabled
                                          ? Colors.black
                                          : Colors.white,
                                      title: Text(
                                        "Order placed",
                                        style: TextStyle(
                                          color: isDarkModeEnabled
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      content: SizedBox(
                                        height: 300,
                                        width: 550,
                                        child: Column(
                                          children: [
                                            Text(
                                              "You ordered:",
                                              style: TextStyle(
                                                color: isDarkModeEnabled
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            buildOrderRow(
                                                "assets/images/beverages.png",
                                                coke,
                                                "Diet Coke",
                                                1.49,
                                                isDarkModeEnabled),
                                            buildOrderRow(
                                                "assets/images/snacks_and_sides.png",
                                                fries,
                                                "Large Fries",
                                                3.98,
                                                isDarkModeEnabled),
                                            buildOrderRow(
                                                "assets/images/cheeseburger.png",
                                                cheeseburguer,
                                                "Cheeseburger",
                                                2.49,
                                                isDarkModeEnabled),
                                            buildOrderRow(
                                                "assets/images/chicken.png",
                                                nuggets,
                                                "Nuggets",
                                                3.99,
                                                isDarkModeEnabled),
                                            const Spacer(),
                                            Text(
                                              "Total: \$ ${total.toStringAsFixed(2)} ",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: isDarkModeEnabled
                                                      ? Colors.white
                                                      : Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                coke = 0;
                                                fries = 0;
                                                cheeseburguer = 0;
                                                nuggets = 0;
                                                total = 0;
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Ok"))
                                      ],
                                    );
                                  });
                            }
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        )),
      ),
    );
  }

  double calculateTotal(int coke, int fries, int cheeseburguer, int nuggets) {
    double totalCoke = coke != 0 ? coke * 1.49 : 0;
    double totalFries = fries != 0 ? fries * 3.98 : 0;
    double totalCheeseburguer = cheeseburguer != 0 ? cheeseburguer * 2.49 : 0;
    double totalNuggets = nuggets != 0 ? nuggets * 3.99 : 0;
    return (totalCoke + totalFries + totalCheeseburguer + totalNuggets);
  }

  Widget buildOrderRow(String imagePath, int quantity, String itemName,
      double itemPrice, bool isDarkModeEnabled) {
    return quantity > 0
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                child: Image.asset(
                  imagePath,
                  height: 50,
                ),
              ),
              SizedBox(
                width: 170,
                child: Text(
                  "$quantity $itemName x \$$itemPrice. ",
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkModeEnabled ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          )
        : Container();
  }
}
