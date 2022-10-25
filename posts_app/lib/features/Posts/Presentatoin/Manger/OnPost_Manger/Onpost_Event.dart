import 'package:equatable/equatable.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';

abstract class OnpostEvent extends Equatable {
  const OnpostEvent();
}

class AddEvent extends OnpostEvent{
  final PostEntities postEntities ;

  const AddEvent({required this.postEntities});

  @override
  List<Object?> get props => [postEntities];
}
class DeletEvent extends OnpostEvent{

  final int id ;

 const DeletEvent({required this.id});

  @override

  List<Object?> get props => [id];
}

class UpdateEvent extends OnpostEvent{

 final PostEntities postEntities ;

 const UpdateEvent({required  this.postEntities});

  @override
  List<Object?> get props => [postEntities];

}