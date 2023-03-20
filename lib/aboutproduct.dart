import 'package:e_commerce_project/cardcontainer.dart';
import 'package:e_commerce_project/colorconst.dart';
import 'package:e_commerce_project/viewcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProductdetails extends StatefulWidget {
  final imageUrl;
  final name;
  final description;
  final title;
  final id;
  const ViewProductdetails({super.key, this.imageUrl, this.name, this.description, this.title, this.id});

  @override
  State<ViewProductdetails> createState() => _ViewProductdetailsState();
}

class _ViewProductdetailsState extends State<ViewProductdetails> {
  @override
  Widget build(BuildContext context) {
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
                          const EdgeInsets.only(right: 16, left: 16, ),
                      color: Colors.white,
                      child:  ViewContainer(
                              imagename: widget.imageUrl,
                              name: widget.name,
                              special: widget.title,
                              offer: widget.description,
                            ))
                        
                ]))));
  }
}

  