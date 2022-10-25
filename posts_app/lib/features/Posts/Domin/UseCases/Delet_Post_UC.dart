import 'package:dartz/dartz.dart';
import 'package:posts_app/core/Base_Use_Case/Base_Use_Case.dart';
import 'package:posts_app/core/error/Failure.dart';

import '../Entities/Post_Entities.dart';
import '../Respository/Base_Repository.dart';


class DeletPostUC extends BaseUseCase<Unit,int>{

  BaseRepository baseRepository ;


  DeletPostUC({ required this.baseRepository});

  @override
  Future<Either<Unit, Failure>> call(int id ) async {

    final result = await baseRepository.deletPost(id) ;

    return result ;


  }

}