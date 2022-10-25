


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/Serveces/Server_Locator.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_Bloc.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/Post_Manger/Post_Bloc.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/Post_Manger/Post_Event.dart';
import 'package:posts_app/features/Posts/Presentatoin/Screens/Post_Add_Updata_Page.dart';

import '../../../../core/utils/Config_Size.dart';
import '../../../../core/utils/Constant_App.dart';
import '../Widgets/Posts_Screen_Body.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConfigSize().init(context);
    return Scaffold(
          appBar: AppBar(
            title: const Text(posts),
          ),
          body:const PostsScreenBody() ,
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:(_)=>const PostAddUpdataPage(isUpdate: false) ));
            },
            child: const Icon(Icons.add),
          ),
         );


  }


}
