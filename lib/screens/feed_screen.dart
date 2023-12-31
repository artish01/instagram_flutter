import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/utils/colors.dart';

import '../widgets/post_card.dart';



class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset('assets/ic_instagram.svg',color: primaryColor,height: 32,),
        actions: [ 
          IconButton(onPressed: (){}, icon: const  Icon(Icons.message_outlined,),)

        ],
      ),

      body:const PostCard(),
    );
  }
}