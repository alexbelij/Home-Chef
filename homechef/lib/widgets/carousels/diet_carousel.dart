import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homechef/models/diet_model.dart';
import 'package:homechef/screens/all_categories/all_diet_screen.dart';
import 'package:homechef/screens/diet_screen.dart';
import 'package:homechef/widgets/size_route.dart';

class DietCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Diets',
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AllDietPage(
                      diets: diets,
                    ),
                  ),
                ),
                child: Chip(
                  backgroundColor: Colors.yellow[100],
                  label: Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.amber[600],
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ) 
              ),
            ],
          ),
        ),
        Container(
          height: 230.0,
          child: Scrollbar(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: diets.length,
              itemBuilder: (BuildContext context, int index) {
                Diet diet = diets[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DietPage(
                        diet: diet,
                      ),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                    width: 200.0,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          bottom: 15.0,
                          child: Container(
                            height: 90.0,
                            width: 200.0,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[200],
                                  offset: Offset(0, 5),
                                  blurRadius: 10,
                                  spreadRadius: 1
                                )
                              ],
                              color: Colors.white,
                              // color: Colors.amber[300],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${diet.recipes.length} recipes',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      // letterSpacing: 1.0,
                                    ),
                                  ),
                                  SizedBox(height: 5.0,),
                                  AutoSizeText(
                                    diet.description,
                                    maxFontSize: 20.0,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
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
                          child: Stack(
                            children: <Widget>[
                              Hero(
                                tag: diet.imageUrl,
                                child: Stack(
                                  children: <Widget>[ 
                                    Container(
                                      height: 120.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image(
                                          height: 120.0,
                                          width: 190.0,
                                          image: AssetImage(diet.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                          
                                      Container(
                                        height: 120.0,
                                        width: 190.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          gradient: LinearGradient(
                                            begin: FractionalOffset.topCenter,
                                            end: FractionalOffset.bottomCenter,
                                            colors: [
                                              Colors.transparent,
                                              Colors.black,
                                            ],
                                            stops: [
                                              0.5,
                                              1.0
                                            ])
                                        ),
                                      ),
                                  ]
                                ),
                              ),
                              
                              Positioned(
                                left: 10.0,
                                bottom: 10.0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 5.0),
                                          child: SizedBox(
                                            width: 80.0,
                                            child: Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Divider(
                                                height: 2.0,
                                                color: Colors.yellow,
                                                thickness: 2.0,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    
                                    Text(
                                      diet.name,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}