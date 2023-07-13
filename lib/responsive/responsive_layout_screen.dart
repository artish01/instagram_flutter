import 'package:flutter/material.dart';



import '../utils/dimensions.dart';


class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget? mobileScreenLayout;
  const ResponsiveLayout({super.key, required this.webScreenLayout,this.mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if(constraints.maxWidth>webscreensize)
        {// web screen 
          return webScreenLayout;

        }
        return mobileScreenLayout!;

        //mobile screen
      }
      
      );
  }
}