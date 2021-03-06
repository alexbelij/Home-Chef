import 'package:flutter/material.dart';
import 'package:homechef/widgets/search_widgets/filter_pages/filter_page.dart';

class BottomSheetBuilder extends StatefulWidget {
  @override
  _BottomSheetBuilderState createState() => _BottomSheetBuilderState();
}

class _BottomSheetBuilderState extends State<BottomSheetBuilder> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Container(
          child: FilterPageView()
        ),
      ),
    );
  }
}