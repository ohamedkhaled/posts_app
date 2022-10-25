import 'package:dartz/dartz.dart';
import 'package:posts_app/core/utils/Api_Helper/Api.dart';
import 'package:posts_app/core/utils/Api_Helper/Constant_Api.dart';
import 'package:posts_app/core/utils/Constant_App.dart';
import 'package:posts_app/features/Posts/Data/Model/Posts_Model.dart';

abstract class BaseRemotedDataSource{


 Future< List<PostsModel>> getPost();
 Future<Unit> addPost(PostsModel postsModel );
  Future<Unit> deletPost(int id);
  Future<Unit> updatePost(PostsModel postsModel);
}

class RemotedDataSource extends BaseRemotedDataSource{

  @override
  Future<List<PostsModel>> getPost() async {
    List<dynamic> jason = await Api().Get(Url: ConstentApi.BaseUrl +'/posts/');

    List<PostsModel> listPosts =[];
    for(int i=0 ;i<jason.length ;i++){
      listPosts.add(PostsModel.fromjason(jason[i]));
    }

    return listPosts ;
  }

  @override
  Future<Unit> addPost( PostsModel postsModel) async {

    final body ={
      title:postsModel.title,
      Body :postsModel.body
    };
      await Api().Post(Url: ConstentApi.BaseUrl +'/posts/', body: body);

return Future.value(unit);

  }
  @override
  Future<Unit> deletPost(int id) async{
    List<dynamic> jason = await Api().delete(Url: ConstentApi.BaseUrl +'/posts/${id}');
    return Future.value(unit);
  }




  @override
  Future<Unit> updatePost( PostsModel postsModel)async {
    final body ={
      title:postsModel.title,
      Body:postsModel.body
    };

    await Api().Put(Url: '${ConstentApi.BaseUrl}/posts/${postsModel.id.toString()}', body: body);

    return Future.value(unit);
  }
}


