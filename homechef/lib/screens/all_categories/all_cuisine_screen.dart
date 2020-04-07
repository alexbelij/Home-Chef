import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homechef/models/cuisine_model.dart';
import 'package:homechef/screens/cuisine_screen.dart';
import 'package:homechef/screens/search_screen.dart';
import 'package:homechef/widgets/size_route.dart';

class AllCuisinePage extends StatefulWidget {

  final List<Cuisine> cuisines;

  AllCuisinePage({this.cuisines});

  @override
  _AllCuisinePageState createState() => _AllCuisinePageState();
}

class _AllCuisinePageState extends State<AllCuisinePage> {

  Widget topPart() {
    return Stack(
      children: <Widget>[

        Container(
          height: MediaQuery.of(context).size.width * 0.7,
          width: MediaQuery.of(context).size.width,
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
          child: Hero(
            tag: "assets/imgs/cuisines.jpg",
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image(
                // height: double.maxFinite,
                // width: double.maxFinite,
                image: AssetImage("assets/imgs/cuisines.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        
        Container(
          height: MediaQuery.of(context).size.width * 0.7,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.transparent,
                Colors.black.withOpacity(0.9),
              ],
              stops: [
                0.0,
                0.5,
                1.0
              ])
          ),
        ),

        Positioned(
          top: 60.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    iconSize: 30.0,
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context),
                  ),
                ), 
                Flexible(
                  flex: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
                  ),
                )
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 20.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [

                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, bottom: 0.0, right: 15.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Divider(
                        height: 2.0,
                        color: Colors.yellow[500],
                        thickness: 3.0,
                      ),
                    ),
                  ),
                ),

                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, bottom: 0.0, right: 15.0),
                    child: AutoSizeText(
                      'By cuisine',
                      maxLines: 1,
                      style: TextStyle(
                        // shadows: Sha,
                        fontSize: 65.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ]
            ),
          ),
        )
      ],
    );
  }

  Widget buildCuisineElement(Cuisine cuisine) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => CuisinePage(
            cuisine: cuisine,
          ),
        ),
      ),
      child: Stack(
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 120.0,
                        child: Text(
                          cuisine.name,
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
                            '${cuisine.recipes.length}',
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
                    cuisine.description,
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
                  cuisine.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          setState(() {});
        }
      },
      child: Scaffold(
        body: Column(
          children: <Widget>[
            
            topPart(),

            Expanded(
              child: Scrollbar(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                  itemCount: widget.cuisines.length,
                  itemBuilder: (BuildContext context, int index) {
                    Cuisine cuisine = widget.cuisines[index];
                    return buildCuisineElement(cuisine);
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