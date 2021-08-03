import 'package:flutter/material.dart';
import 'package:portfolio/constant/url.dart';
import 'package:portfolio/screens/header/header.dart';
import 'package:portfolio/screens/home/data.dart';
import 'package:portfolio/utils/functions.dart';
import 'package:portfolio/widgets/nav_button.dart';
import 'package:portfolio/widgets/social_button.dart';


class HomeScreenWeb extends StatefulWidget {
  @override
  _HomeScreenWebState createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {

    ScrollController _scrollController = new ScrollController();
    double expandedHight = 570.0;
    double res = 0.0;

    @override
    void initState() {
      _scrollController.addListener(() => setState(() { _scrollListener();}));
      super.initState();
    }

    bodyScrollControll (double height) {
      _scrollController.animateTo(
        height,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }

    double get top {
      res = expandedHight;
      if (_scrollController.hasClients) {
        double offset = _scrollController.offset;
        if (offset < (res - kToolbarHeight)) {
          setState(() {
            res -= offset;
          });
        } else {
          setState(() {
            res = kToolbarHeight;
          });
        }
      }
      return res;
    }

    var values = 0.0;
    _scrollListener() {
      if(_scrollController.position.pixels <= _scrollController.position.maxScrollExtent){
        setState(() {
          values = _scrollController.position.pixels; 
        });
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: Stack(
            children: [
              CustomScrollView(
                controller: _scrollController,            
                slivers: <Widget>[                 
                  SliverAppBar(  
                    backwardsCompatibility: true,   
                    leading: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      margin: EdgeInsets.only(left: 100),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: (){
                            bodyScrollControll(0.0);
                          },
                          child: Text("Resume of".toUpperCase()),
                        ),
                      ),        
                    ), 
                    
                    //Navigation bar section
                    actions: [
                      for(int i = 0; i < navBarButtonText.length; i++)
                      NavButton(
                        onTap: (){
                          bodyScrollControll(bodyScrollControlHeight[i]);
                        },
                        buttonText: navBarButtonText[i],
                      ),
                      NavButton(
                        onTap: ()async {
                          await launchURL(URL.blogURL);
                        },
                        buttonText: "Blog",
                      ), 
                      NavButton(
                        onTap: ()async {
                          await launchURL(URL.youtubeURL);
                        },
                        buttonText: "Youtube",
                      ),
                      SizedBox(width: 80,)

                    ],


                    leadingWidth: 200,
                    expandedHeight: 600.0,
                    floating: true,
                    pinned: true,
                    snap: true,
                    elevation: 50,
                    backgroundColor: Colors.teal,
                      
                    //StickyHeader Section
                    flexibleSpace: FlexibleSpaceBar(
                      background: StickyHeader(),                  
                    ),
                  ),

                  //Body and Footer Section
                  Container(
                    child: SliverList(
                      delegate:  SliverChildListDelegate(pages)
                    ),
                  ),

                ],
              ),

             //Social button section
             values <= 500 || values == null? Positioned(
                top: top,
                width: MediaQuery.of(context).size.width,
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for(int i = 0; i < socialURL.length; i++)
                      SocialButton(
                        onPressed: ()async {
                          await launchURL(socialURL[i]);
                        },
                        icon: socialIcon[i],
                      ),
                    ],
                  ),
                )
              ) : Container(height: 0),
            ],
          ),
      );
    }
    
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
