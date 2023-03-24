import 'package:e_commerce_project/colorconst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardContainer extends StatefulWidget {
  final imagename;
  final imagepath;
  final name;
 final rating;
  final special;
  final offer;
  final discountprice;
  final id;
  const CardContainer(
      {Key? key,
      this.name,
      this.special,
      this.imagename,
      this.imagepath,
      this.offer,
      this.discountprice,
      this.id, this.rating})
      : super(key: key);

  @override
  _CardContainerState createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(31, 73, 91, 0.1),
              blurRadius: 4,
            )
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("${widget.special}",
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
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.network(
                  "${widget.imagename}",
                  errorBuilder: (BuildContext context, Object exception,
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
                      color: const Color(0xffffffff),
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 6,
                            blurStyle: BlurStyle.outer,
                            color: Color.fromRGBO(40, 115, 240, 0.08))
                      ],
                      borderRadius: BorderRadius.circular(12)),
                  width: 47,
                  height: 24,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: SvgPicture.asset(
                          'assets/redheart.svg',
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 6, left: 3),
                        child: Text("Like",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                color: Color(0xff202020))),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 160,
            margin: const EdgeInsets.only(top: 8, left: 8),
            child: Text('${widget.name}',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.rubik(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            margin: const EdgeInsets.only(top: 8, left: 8),
            child: Text('${widget.offer}',
                //  overflow: TextOverflow.ellipsis,
                style: GoogleFonts.rubik(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
          ),
          Container(
              margin: const EdgeInsets.only(top: 8, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                InkWell(
                  onTap: (){
                    
                  },
                  child: Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue
                    ),
                    child: Center(
                      child: Text("Add to Cart",style: GoogleFonts.rubik(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),),
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
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, i) {
                          return Container(
                            height: 11,
                            width: 11.8,
                            child: Image.asset(
                              'assets/star.png',
                              fit: BoxFit.contain,
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
    );
  }
}
