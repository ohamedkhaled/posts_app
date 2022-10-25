import 'package:equatable/equatable.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';

abstract class PostStates extends Equatable  {
 const PostStates();
  @override
  List<Object?> get props => [];
}

class InitialState extends PostStates{
  const InitialState();
}

class LoadingState extends PostStates{
  const LoadingState();
}

class LoadedState extends PostStates{

  final List<PostEntities> postsList ;


 const LoadedState({required  this.postsList});

  @override

  List<Object?> get props => [postsList];
}

class ErrorState extends PostStates{

  final String errorMassege ;


 const ErrorState({required this.errorMassege});

  @override
  List<Object?> get props => [errorMassege];

}