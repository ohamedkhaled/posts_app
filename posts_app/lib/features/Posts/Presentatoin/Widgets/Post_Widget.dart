


import 'package:flutter/material.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';
import 'package:posts_app/features/Posts/Presentatoin/Screens/Detials_body.dart';

class PostWidget extends StatelessWidget {
 final  List<PostEntities> listPosts ;
  const PostWidget({ required this.listPosts,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder:(context ,index){
          return ListTile(
              leading: Text(listPosts[index].id.toString()),
              title: Text(listPosts[index].title,style: const  TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              subtitle: Text(listPosts[index].body,style: const TextStyle(fontSize: 16 ),),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>DetialsScren(postEntities: listPosts[index])));

              },

          );
        } ,
        separatorBuilder: (context, index) =>const  Divider(thickness: 1,) ,
        itemCount: listPosts.length);
  }
}
