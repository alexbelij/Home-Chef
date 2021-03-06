import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homechef/models/cuisine_model.dart';
import 'package:homechef/models/recipe_model.dart';
import 'package:homechef/screens/recipe_screen.dart';
import 'package:homechef/screens/search_screen.dart';
import 'package:homechef/widgets/helpers/cuisine_helpers.dart';
import 'package:homechef/widgets/rating_stars.dart';

class CuisinePage extends StatefulWidget {

  final Cuisine cuisine;
  CuisinePage({this.cuisine});
  
  @override
  _CuisinePageState createState() => _CuisinePageState();
}

class _CuisinePageState extends State<CuisinePage> with SingleTickerProviderStateMixin{
  
  AnimationController _controller;
  Animation<double> animation;
  Animation curve;
  ScrollController _scrollController;
  
  bool isScrollDown = false;
  bool isShow = true;
  bool initScreen = true;
  double mediaWidth;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController.addListener( () {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!isScrollDown) {
          initScreen = false;
          isScrollDown = true;
          isShow = false;  
          _controller.forward();
        }
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (isScrollDown) {
          isScrollDown = false;
          isShow = true;
          _controller.reverse(); 
        }
      }
    }
    );

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350)
    );

    curve = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  Widget topPart() {

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Container(
        height: animation.value,
        width: mediaWidth,
        child: Stack(
          children: <Widget>[

            Container(
              height: animation.value,
              width: mediaWidth,
              child: Hero(
                tag: widget.cuisine.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                  // borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image: AssetImage(widget.cuisine.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            
            Container(
              height: animation.value,
              width: mediaWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30.0),
                    bottomLeft: Radius.circular(30.0),
                  ),
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.9),
                    Colors.black12,
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
              top: 30.0 + (animation.value - mediaWidth * 0.5) * 0.2,
              child: Container(
                width: mediaWidth,
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
                width: mediaWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [

                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, bottom: 5.0, right: 15.0),
                        child: SizedBox(
                          width: mediaWidth * 0.5,
                          child: Divider(
                            height: 2.0,
                            color: Colors.yellow[500],
                            thickness: 2.0,
                          ),
                        ),
                      ),
                    ),

                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 18.0, bottom: 0.0, right: 15.0),
                        child: AutoSizeText(
                          widget.cuisine.name,
                          maxLines: 1,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.2
                            ),
                            color: Colors.white.withOpacity(0.9),
                          )
                        ),
                      ),
                    )
                  ]
                ),
              ),
            )
          ],
        ),
      );
      });
  }

  Widget callbackRecipes() {
    return (resultRecipes[widget.cuisine.name].length == 6) 
    ? FutureBuilder<List<Recipe>>(
      future: getCuisineCategoryRecipes(4, widget.cuisine.name),
      builder: (context, snapshot) {

        switch (snapshot.connectionState) {
          case ConnectionState.waiting: 
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.active:
            return Center(child: CircularProgressIndicator(),);
          case ConnectionState.done:
            if (snapshot.hasData) resultRecipes[widget.cuisine.name] = snapshot.data;
            break;
          default:

        }

        return categoriesListBuilder();
      })

    : categoriesListBuilder();
  }


  Widget categoriesListBuilder() {

    return Expanded(
      child: Scrollbar(
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(indent: 20.0, endIndent: 20.0,),
          controller: _scrollController,
          padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
          itemCount: resultRecipes[widget.cuisine.name].length,
          itemBuilder: (BuildContext context, int index) {
            Recipe recipe = resultRecipes[widget.cuisine.name][index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RecipePage(
                      recipe: recipe,
                    )
                  ));
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                    height: 170.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
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
                                  recipe.name,
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
                                    '${recipe.id}',
                                    style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'Recipe ID',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            recipe.cookTime.toString() + ' minutes',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          RatingStars(rating: recipe.rate, color: Colors.grey[700], borderColor: Colors.grey[700],),
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
                      child: (recipe.imageUrl.contains('assets')) 
                      ? Image(
                        width: 110.0,
                        image: AssetImage(
                          recipe.imageUrl,
                        ),
                        fit: BoxFit.cover,
                      )
                      : Image.network(
                        recipe.imageUrl,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(statusBarBrightness: Brightness.dark) // Or Brightness.dark
    // );

    mediaWidth = MediaQuery.of(context).size.width;

    animation = Tween(
      begin: mediaWidth * 0.7, 
      end: mediaWidth * 0.5).animate(curve);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
          setState(() {});
        }
      },
      child: new Scaffold(
        body: Stack(
          children: <Widget> [
            Column(
              children: <Widget>[

                topPart(),
                callbackRecipes()
                
              ],
            ),
          ]
        )
      ),
    );
  }
}
