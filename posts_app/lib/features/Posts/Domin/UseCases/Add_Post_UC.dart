
import 'package:dartz/dartz.dart';
import 'package:posts_app/core/Base_Use_Case/Base_Use_Case.dart';
import 'package:posts_app/core/error/Failure.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';

import '../Respository/Base_Repository.dart';

class AddPostUC extends BaseUseCase<Unit,PostEntities>{


  BaseRepository baseRepository ;


  AddPostUC({ required this.baseRepository});

  @override
  Future<Either<Unit, Failure>> call(PostEntities postEntities) async {

    final result = await baseRepository.addPost(postEntities) ;

    return result ;
  }
}