import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts_app/features/Posts/Data/Model/Posts_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/Exception.dart';
import '../../../../core/utils/Constant_App.dart';

abstract class BaseLocalDataSource {
  Future<List<PostsModel>> getCachedPosts();
  Future<Unit> ChachedPostes(List<PostsModel> postsModel);
}

class LocalDataSource extends BaseLocalDataSource {
   late SharedPreferences? sharedPreferences;

  LocalDataSource( this.sharedPreferences);

  @override
  Future<Unit> ChachedPostes(List<PostsModel> postsModels) {
    List postModelToJason =
        postsModels.map<Map<String, dynamic>>((e) => e.tojason()).toList();
    sharedPreferences!.setString(cachedPost, json.encode(postModelToJason));
    return Future.value(unit);
  }

  @override
  Future<List<PostsModel>> getCachedPosts() {
    final jasonData = sharedPreferences!.getString(cachedPost);
    if (jasonData != null) {
      List jasonDecoded = json.decode(jasonData);
      List<PostsModel> jasonTopostMpdel =
          jasonDecoded.map<PostsModel>((e) => PostsModel.fromjason(e)).toList();
      return Future.value(jasonTopostMpdel);
    } else {
      throw CacheException();
    }
  }
}
