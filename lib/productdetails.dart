import 'package:e_commerce_project/Model/productmodel.dart';
import 'package:e_commerce_project/Model/products.dart';
import 'package:e_commerce_project/Provider/cartprovider.dart';
import 'package:e_commerce_project/Provider/productprovider.dart';
import 'package:e_commerce_project/aboutproduct.dart';
import 'package:e_commerce_project/cardcontainer.dart';
import 'package:e_commerce_project/colorconst.dart';
import 'package:e_commerce_project/core/apiservice.dart';
import 'package:e_commerce_project/core/josnlist.dart';
import 'package:e_commerce_project/database/sqlitedatabase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List _item = Response().foodItems;
  bool _loading = false;
  final DatabaseService _databaseService = DatabaseService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getNews();
  }

  //

  @override
  Widget build(BuildContext context) {
    List<ProductDetails> foodLists = List<Map<String, dynamic>>.from(_item)
        .map((e) => ProductDetails.fromJson(e))
        .toList();
    final cart = Provider.of<CartProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(children: [
                  Container(
                    height: 48,
                    width: double.infinity,
                    color: Color.fromRGBO(colors[0]["r"]!.toInt(),
                        colors[0]["g"]!.toInt(), colors[0]["b"]!.toInt(), 1),
                    child: Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Image(
                                image:
                                    AssetImage("assets/Mask Group 22@3x.png"),
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              )),
                          Text(
                            "Product Details",
                            style: GoogleFonts.rubik(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),

                          // ignore: prefer_const_constructors
                          badges.Badge(
                            badgeContent: Consumer<CartProvider>(
                              builder: (context, value, child) {
                                return Text(
                                  value.getCounter().toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ViewProductdetails()));
                            },
                            child: const Icon(
                              Icons.shopping_cart,
                              size: 40,
                              color: Colors.green,
                            ), //icon style
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin:
                          const EdgeInsets.only(right: 16, left: 16, top: 16),
                      color: Colors.white,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 3,
                                  childAspectRatio: 1.2 / 2.2
                                  // childAspectRatio:
                                  //     (MediaQuery.of(context).size.width) /
                                  //         (MediaQuery.of(context).size.height / 1.2),
                                  ),
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: foodLists.length,
                          itemBuilder: (context, i) {
                            final item = foodLists[i];
                            return InkWell(
                                onTap: () async {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(31, 73, 91, 0.1),
                                          blurRadius: 4,
                                        )
                                      ]),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${item.name}",
                                            style: GoogleFonts.rubik(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10,
                                                color: Colors.black)),
                                      ),
                                      Stack(
                                        children: [
                                          Container(
                                            width: 160,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Image.network(
                                              "${item.image}",
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return Image.asset(
                                                    'assets/1672479762EUKROMA PLUS NEWPiglow Cream.jpg');
                                              },
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          Positioned.directional(
                                            textDirection: TextDirection.rtl,
                                            end: 95,
                                            top: 160,
                                            start: 12,
                                            bottom: 8,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffffffff),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        blurRadius: 6,
                                                        blurStyle:
                                                            BlurStyle.outer,
                                                        color: Color.fromRGBO(
                                                            40, 115, 240, 0.08))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              width: 47,
                                              height: 24,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 6),
                                                    child: SvgPicture.asset(
                                                      'assets/redheart.svg',
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 6, left: 3),
                                                    child: Text("Like",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xff202020))),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: 160,
                                        margin: const EdgeInsets.only(
                                            top: 8, left: 8),
                                        child: Text('Rs:${item.price}',
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.rubik(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        margin: const EdgeInsets.only(
                                            top: 8, left: 8),
                                        child: Text('${item.description}',
                                            //  overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.rubik(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal)),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.only(
                                              top: 8, left: 8),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    await _databaseService
                                                        .insertBreed(ProductDetails(
                                                            description: item
                                                                .description,
                                                            id: item.id,
                                                            image: item.image,
                                                            name: item.name,
                                                            positionInList: item
                                                                .positionInList,
                                                            price: item.price,
                                                            ratingCount: item
                                                                .ratingCount,
                                                            ratingValue: item
                                                                .ratingValue))
                                                        .then((value) {
                                                      cart.addTotalPrice(
                                                          item.price!.toInt());
                                                      cart.addCounter();
                                                    });
                                                    toast(
                                                        "Successfully add to cart");
                                                  },
                                                  child: Container(
                                                    height: 25,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        color: Colors.blue),
                                                    child: Center(
                                                      child: Text(
                                                        "Add to Cart",
                                                        style:
                                                            GoogleFonts.rubik(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      // color: Colors.brown.shade300,
                                                      height: 20,
                                                      width: 60,
                                                      child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        shrinkWrap: true,
                                                        itemCount: 4,
                                                        itemBuilder:
                                                            (context, i) {
                                                          return Container(
                                                            height: 11,
                                                            width: 11.8,
                                                            child: Image.asset(
                                                              'assets/star.png',
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ]))
                                    ],
                                  ),
                                ));
                          }))
                ]))));
  }
}
