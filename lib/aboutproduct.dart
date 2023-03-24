import 'package:e_commerce_project/Model/products.dart';
import 'package:e_commerce_project/Provider/cartprovider.dart';
import 'package:e_commerce_project/cardcontainer.dart';
import 'package:e_commerce_project/colorconst.dart';
import 'package:e_commerce_project/database/sqlitedatabase.dart';
import 'package:e_commerce_project/placeorder.dart';
import 'package:e_commerce_project/viewcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewProductdetails extends StatefulWidget {
  const ViewProductdetails({
    super.key,
  });

  @override
  State<ViewProductdetails> createState() => _ViewProductdetailsState();
}

class _ViewProductdetailsState extends State<ViewProductdetails> {
  final DatabaseService _databaseService = DatabaseService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // handler = DataBase();
  }

  Future<List<ProductDetails>> _getBreeds() async {
    return await _databaseService.breeds();
  }

  int total = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: InkWell(
              onTap: () {
                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(10),
                                      topLeft: Radius.circular(10),
                                    )),
                                    backgroundColor: Colors.white,
                                    context: context,
                                    builder: (context) {
                                      return Adduser();
                                      }
                                      );
                
              },
              child: Container(
                color: Colors.yellow.shade600,
                alignment: Alignment.center,
                height: 50.0,
                child: Text(
                  'Proceed to Pay',
                  style: GoogleFonts.rubik(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                  child: ListView(children: [
                Container(
                  height: 48,
                  width: double.infinity,
                  color: Color.fromRGBO(colors[0]["r"]!.toInt(),
                      colors[0]["g"]!.toInt(), colors[0]["b"]!.toInt(), 1),
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Image(
                              image: AssetImage("assets/Mask Group 22@3x.png"),
                              height: 20,
                              width: 20,
                              color: Colors.white,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text(
                            "Your Cart",
                            style: GoogleFonts.rubik(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                  ),
                  height: MediaQuery.of(context).size.height / 1.5,
                  color: Colors.white,
                  child: FutureBuilder(
                    future: _getBreeds(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ProductDetails>> snapshot) {
                      for (int i = 0; i < snapshot.data!.length; i++) {
                        total += snapshot.data![i].price!;
                      }
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            final cartdata = snapshot.data?[index];

                            return ViewContainer(
                              imagename: cartdata!.image,
                              name: cartdata.name,
                              special: cartdata.price,
                              offer: cartdata.description,
                            );
                          },
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                ReusableWidget(
                    title: 'Sub-Total',
                    value: r'$' + (total?.toStringAsFixed(2) ?? '0')),
              ])),
            )));
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({Key? key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.rubik(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                value.toString(),
                style: GoogleFonts.rubik(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ));
  }
}
