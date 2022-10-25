import 'package:dartz/dartz.dart';
import 'package:posts_app/core/Network/Connection_Checker.dart';
import 'package:posts_app/core/error/Exception.dart';
import 'package:posts_app/core/error/Failure.dart';
import 'package:posts_app/features/Posts/Data/Data_Sources/Local_Data_Source.dart';
import 'package:posts_app/features/Posts/Data/Data_Sources/Remoted_Data_Source.dart';
import 'package:posts_app/features/Posts/Data/Model/Posts_Model.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';
import 'package:posts_app/features/Posts/Domin/Respository/Base_Repository.dart';

typedef Future<Unit> DeletOrUpdataOrAdd() ;
class RepositoryImp extends BaseRepository {
  final BaseLocalDataSource baseLocalDataSource;
  final BaseRemotedDataSource baseRemotedDataSource;
  final BaseConnectionChecker baseConnectionChecker;

  RepositoryImp(
      {required this.baseLocalDataSource,
      required this.baseRemotedDataSource,
      required this.baseConnectionChecker});

  @override
  Future<Either<List<PostEntities>, Failure>> getPosts() async {
    if (await baseConnectionChecker.getConnectionCkecker()) {
      try {
        final result = await baseRemotedDataSource.getPost();
        baseLocalDataSource.ChachedPostes(result);
        return Left(result);
      } on ServerException {
        return Right(ServerFailure());
      }
    } else {
      try {
        final result = await baseLocalDataSource.getCachedPosts();
        return Left(result);
      } on CacheException {
        return Right(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Unit, Failure>> addPost(PostEntities postEntities) async {
    final PostsModel postsModel = PostsModel(
        id: postEntities.id,
        title: postEntities.title,
        body: postEntities.body);

    return await  handelMethod( () {
      return baseRemotedDataSource.addPost(postsModel) ;
    });

  }

  @override
  Future<Either<Unit, Failure>> deletPost(int id) async {
    return await  handelMethod( () {
      return baseRemotedDataSource.deletPost(id) ;
    });

  }

  @override
  Future<Either<Unit, Failure>> updatePost(PostEntities postEntities) async {
    final PostsModel postsModel = PostsModel(
        id: postEntities.id,
        title: postEntities.title,
        body: postEntities.body);


   return await  handelMethod( () {
      return baseRemotedDataSource.updatePost(postsModel) ;
    });


  }


  Future<Either<Unit, Failure>>  handelMethod( DeletOrUpdataOrAdd deletOrUpdataOrAdd) async{
    if (await baseConnectionChecker.getConnectionCkecker()) {
    try {
      deletOrUpdataOrAdd();
    return const Left(unit);
    } on ServerException {
    return Right(ServerFailure());
    }
    } else {
    return Right(OffLineFailure());
    }
  }

}


