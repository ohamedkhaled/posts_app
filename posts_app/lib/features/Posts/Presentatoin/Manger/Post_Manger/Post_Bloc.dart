import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/Base_Use_Case/Base_Use_Case.dart';
import 'package:posts_app/core/error/Failure.dart';
import 'package:posts_app/core/error/Strings.dart';
import 'package:posts_app/core/utils/Methods.dart';
import 'package:posts_app/features/Posts/Domin/UseCases/Get_Posts_UC.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/Post_Manger/Post_Event.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/Post_Manger/Post_States.dart';

import '../../../Domin/Entities/Post_Entities.dart';

class PostBloc extends Bloc<PostEvent,PostStates> {
   final GetPostsUC getPostsUC ;

   PostBloc({required this.getPostsUC}) : super( const InitialState()){


      on<GetPostEvent>(getPosts) ;
      on<RefrishPostEvent>(refrishPost);
   }



  FutureOr<void> getPosts(GetPostEvent event, Emitter<PostStates> emit) async {

      final postsOrFailure = await getPostsUC.call( const Noparamiter() ) ;

      emit(const LoadingState());
      emit( getEither( postsOrFailure));
  }

   PostStates getEither(Either<List<PostEntities>, Failure> either )
   {
      return either .fold((posts) => LoadedState(postsList: posts),
              (failure) => ErrorState(errorMassege: Methods().getTypeOfFailure(failure))
      );
   }



  FutureOr<void> refrishPost(RefrishPostEvent event, Emitter<PostStates> emit) async {
     final postsOrFailure = await getPostsUC.call( const Noparamiter() ) ;

     emit(LoadingState());
     emit( getEither( postsOrFailure));
  }
}
