import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homechef/models/time_model.dart';
import 'package:homechef/screens/search_screen.dart';

class AllTimePage extends StatefulWidget {

  final List<Time> times;

  AllTimePage({this.times});

  @override
  _AllTimePageState createState() => _AllTimePageState();
}

class _AllTimePageState extends State<AllTimePage> {

  bool _visible = false;

  void openSearchBar() {
    setState(() {
      _visible = true;
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          _visible = false;
          setState(() {});
        }
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[

                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0.0, 2.0),
                        blurRadius: 6.0,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.times[0].imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                
                Container(
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                        Color(0xffFCD966),
                      ],
                      stops: [
                        0.0,
                        0.3,
                        1.0
                      ])
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 70.0
                  ),
                  
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,

                    children: <Widget>[
                      Stack(
                        children: <Widget> [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.arrow_back_ios),
                                iconSize: 30.0,
                                color: Colors.white,
                                onPressed: () => Navigator.pop(context),
                              ), 
                              Row(
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.search),
                                    iconSize: 30.0,
                                    color: Colors.white,
                                    onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => SearchScreen())
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.sort),
                                    iconSize: 30.0,
                                    color: Colors.white,
                                    onPressed: () => Navigator.pop(context),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 
                        MediaQuery.of(context).size.width * 0.45
                      ),

                      Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Divider(
                                height: 2.0,
                                // color: Colors.yellow[700],
                                // color: Color(0xff383838),
                                color: Colors.yellow[500],
                                thickness: 3.0,
                              ),
                            ),
                          ),
                        ),

                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0, right: 10.0, bottom: 10.0),
                            child: AutoSizeText(
                              'By cooking time',
                              maxFontSize: 55,
                              maxLines: 1,
                              style: TextStyle(
                                shadows: [
                                  Shadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 2.0),
                                    blurRadius: 10.0,
                                  ),
                                ],
                                fontSize: 55.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff1D1D1D),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),


            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                  itemCount: widget.times.length,
                  itemBuilder: (BuildContext context, int index) {
                    Time time = widget.times[index];
                    return Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                          height: 170.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: 120.0,
                                      child: Text(
                                        time.name,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Text(
                                          '${time.recipes.length}',
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          'Recipes',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  time.description,
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          left: 20.0,
                          top: 15.0,
                          bottom: 15.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              width: 110.0,
                              image: AssetImage(
                                time.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}