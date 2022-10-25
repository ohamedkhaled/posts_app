
import 'package:dartz/dartz.dart';
import 'package:posts_app/core/Base_Use_Case/Base_Use_Case.dart';
import 'package:posts_app/core/error/Failure.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';
import 'package:posts_app/features/Posts/Domin/Respository/Base_Repository.dart';

class GetPostsUC extends BaseUseCase<List<PostEntities>,Noparamiter>{

  final BaseRepository baseRepository ;


  GetPostsUC({ required this.baseRepository});

  @override
  Future<Either<List<PostEntities>, Failure>> call(Noparamiter parameter) async {
    print("GetPostsUC");
     final result =  await baseRepository.getPosts() ;
     return result ;

  }

}