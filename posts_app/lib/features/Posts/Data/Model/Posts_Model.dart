
import 'package:posts_app/core/utils/Constant_App.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';

class PostsModel extends PostEntities {
  PostsModel({required super.id, required super.title, required super.body});

  factory PostsModel.fromjason(Map<String, dynamic> jason) =>
      PostsModel(id: jason[id], title: jason[title], body: jason[Body]);


  Map<String,dynamic> tojason()=>
         { id:this.id , title: this.title ,Body:this.body} ;


}
