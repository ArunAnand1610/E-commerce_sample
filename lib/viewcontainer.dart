import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewContainer extends StatefulWidget {
  final imagename;
  final imagepath;
  final name;

  final special;
  final offer;
  final discountprice;
  final id;
  const ViewContainer(
      {Key? key,
      this.name,
      this.special,
      this.imagename,
      this.imagepath,
      this.offer,
      this.discountprice,
      this.id})
      : super(key: key);

  @override
  _ViewContainerState createState() => _ViewContainerState();
}

class _ViewContainerState extends State<ViewContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(31, 73, 91, 0.1),
                blurRadius: 4,
              )
            ]),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network("${widget.imagename}", errorBuilder:
                  (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                return Image.asset(
                    'assets/1672479762EUKROMA PLUS NEWPiglow Cream.jpg');
              }, fit: BoxFit.fitWidth),
            ),
            //     Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text("${widget.special}",
            //       style: GoogleFonts.rubik(
            //           fontWeight: FontWeight.bold,
            //           fontSize: 10,
            //           color: Colors.black)),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  margin: const EdgeInsets.only(top: 8, left: 8),
                  child: Text('${widget.name}',
                      //overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/2.5,
                  margin: const EdgeInsets.only(top: 8, left: 8),
                  child: Text('${widget.offer}',
                     
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
                Container(
                  width: 160,
                  margin: const EdgeInsets.only(top: 8, left: 8),
                  child: Text('Price:${widget.special} Rs',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.rubik(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
