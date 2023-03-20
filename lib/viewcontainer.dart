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
                width: double.infinity,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                  ),
                ],
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
            width: 160,
            margin: const EdgeInsets.only(top: 8, left: 8),
            child: Text('${widget.offer}',
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.rubik(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }
}
