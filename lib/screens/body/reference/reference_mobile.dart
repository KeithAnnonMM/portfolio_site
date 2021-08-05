import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/constant/color.dart';
import 'package:portfolio/screens/body/reference/data.dart';


class ReferenceMobile extends StatefulWidget {
  const ReferenceMobile({ Key key }) : super(key: key);

  @override
  _ReferenceMobileState createState() => _ReferenceMobileState();
}

class _ReferenceMobileState extends State<ReferenceMobile> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(top: 36),
            width: MediaQuery.of(context).size.width,
            color: defaultWhite,
            child: Center(child: Text("References", style: TextStyle(color: defaultBlack, fontSize: 28, fontWeight: FontWeight.bold),)),
          ),
          Card(
            elevation: 10,
            shadowColor: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: Builder(
                    builder: (context) {
                      return CarouselSlider(
                      options: CarouselOptions(
                       height: 300,
                      initialPage: _current,
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }
                    ),
                    items: recomendations.map((item) => Container(
                      padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [                                  
                                  Image.network("${item["recomender_picture"]}", width: 100,height: 100,),
                                  Text("${item["recomender_name"]}",style: TextStyle(height: 1.5, fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87)),
                                  Text("${item["recomender_position"]}",style: TextStyle(height: 1.5, fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black54))
                                ],
                              ),
                            ),
                            SizedBox(height: 30,),
                            Container(
                              child: Text("${item["recomendation"]}",
                               style: TextStyle(height: 1.5, fontSize: 14, color: Colors.black45), 
                               textAlign: TextAlign.justify,
                               overflow: TextOverflow.visible
                               ),
                            )
                          ],
                        )
                        ),
                      ).toList(),
                     );
                    },
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: recomendations.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 48.0,
                          height: 2.0,
                          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: (Theme.of(context).brightness == Brightness.dark? Colors.white : Colors.black).withOpacity(_current == entry.key ? 0.9 : 0.4),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

