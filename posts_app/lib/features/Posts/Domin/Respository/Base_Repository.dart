
import 'package:dartz/dartz.dart';
import 'package:posts_app/core/error/Failure.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';

abstract class BaseRepository {


  Future<Either<List<PostEntities>,Failure>> getPosts();
  Future<Either<Unit,Failure>> updatePost( PostEntities postEntities );
  Future<Either<Unit,Failure>> addPost( PostEntities postEntities);
  Future<Either<Unit,Failure>> deletPost( int id);


}