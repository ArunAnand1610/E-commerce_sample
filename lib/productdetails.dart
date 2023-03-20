import 'package:e_commerce_project/Model/productmodel.dart';
import 'package:e_commerce_project/Provider/productprovider.dart';
import 'package:e_commerce_project/aboutproduct.dart';
import 'package:e_commerce_project/cardcontainer.dart';
import 'package:e_commerce_project/colorconst.dart';
import 'package:e_commerce_project/core/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<ProductDetail> _item = [];
  bool _loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  getNews() {
    getsubNews().then((value) {
      context.read<ProductProvider>().subchap =
          List<Map<String, dynamic>>.from(value["data"])
              .map((e) => ProductDetail.fromJson(e))
              .toList();

      print("Here comes");
      setState(() {
        _loading = true;
      });
      print("Here comes");
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductDetail> getproductdetails =
        context.watch<ProductProvider>().subchapdata;
    return SafeArea(
        child: Scaffold(
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  children: [
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
                              onPressed: () {},
                              icon: const Image(
                                image:
                                    AssetImage("assets/Mask Group 22@3x.png"),
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left:16.0),
                            child: Text(
                              "Product Details",
                              style: GoogleFonts.rubik(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
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
                            childAspectRatio: 1.2/ 2.2
                            // childAspectRatio:
                            //     (MediaQuery.of(context).size.width) /
                            //         (MediaQuery.of(context).size.height / 1.2),
                          ),
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: getproductdetails.length,
                          itemBuilder: (context, i) {
                            final item = getproductdetails[i];
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewProductdetails(
                                  description: item.description,
                                  imageUrl: item.imageUrl,
                                  name: item.name,
                                  title: item.displayMode,
                                  id: item.id,
                                )));
                              },
                              child: CardContainer(
                                imagename: item.imageUrl,
                                name: item.name,
                                special: item.displayMode,
                                offer: item.description,
                              ),
                            );
                          }))
                ]))));
  }
}
