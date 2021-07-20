
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

class StickyHeader extends StatelessWidget {
  const StickyHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        image:  DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
          image: AssetImage("assets/abc.png"),
          fit: BoxFit.cover,
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 100,),
          AvatarGlow(
            glowColor: Colors.teal,
            endRadius: 90.0,
            duration: Duration(milliseconds: 2000),
            repeat: true,
            showTwoGlows: true,
            repeatPauseDuration: Duration(milliseconds: 100),
            child: Material(
              shape: CircleBorder(),
              child: ClipOval(
                child: Image.asset(
                "assets/mehedi_hasan.jpg",
                 width: 120,
                 height: 120,
                ),
              ),
            ),
          ),
          SizedBox(height: 24,),
          Text(
            "Md Mehedi Hasan".toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 20,),
          Text(
            "Flutter Developer || Web Developer || UX/UI Expart".toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  height: 48,  
                  minWidth: 150,                       
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.teal)),
                  onPressed: () {},
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: Text("Hire me".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
                ),
                SizedBox(width: 12,),
                MaterialButton(
                  height: 48,  
                  minWidth: 150,                          
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: Colors.teal)),
                  onPressed: () {},
                  color: Colors.teal,
                  textColor: Colors.white,
                  child: Text("Download CV".toUpperCase(),
                    style: TextStyle(fontSize: 14)),
                ),
              ],
            )   ,
          )
        ],
      ),
    );
  }
}


