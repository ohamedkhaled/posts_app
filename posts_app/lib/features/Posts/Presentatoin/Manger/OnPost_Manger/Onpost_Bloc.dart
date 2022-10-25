import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/Methods.dart';
import 'package:posts_app/features/Posts/Domin/UseCases/Add_Post_UC.dart';
import 'package:posts_app/features/Posts/Domin/UseCases/Delet_Post_UC.dart';
import 'package:posts_app/features/Posts/Domin/UseCases/Update_Post_UC.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_Event.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_States.dart';
import '../../../../../core/error/Failure.dart';
import '../../../../../core/utils/Constant_App.dart';
import '../../../Domin/Entities/Post_Entities.dart';
import '../Post_Manger/Post_States.dart';

class OnpostBloc extends Bloc<OnpostEvent, OnpostStates> {
  final AddPostUC addPostUC;
  final DeletPostUC deletPostUC;
  final UpdatePostUC updatePostUC;

  OnpostBloc(
      {required this.addPostUC,
      required this.deletPostUC,
      required this.updatePostUC})
      : super(const OnpostInitialState()) {
    on<AddEvent>(addPost);
    on<DeletEvent>(deletPost);
    on<UpdateEvent>(updatePost);
  }

  FutureOr<void> addPost(AddEvent event, Emitter<OnpostStates> emit) async {
    emit(OnPostLoadingState());
    final addOrFailur = await addPostUC(event.postEntities);

    emit(getEither(addOrFailur, addSuccessMessage));
  }

  FutureOr<void> deletPost(DeletEvent event, Emitter<OnpostStates> emit) async {
    emit(OnPostLoadingState());

    final deletOrFailur = await deletPostUC(event.id);

    emit(getEither(deletOrFailur, deletedSuccessMessage));
  }

  FutureOr<void> updatePost(
      UpdateEvent event, Emitter<OnpostStates> emit) async {
    emit(OnPostLoadingState());

    final updateOrFailur = await updatePostUC(event.postEntities);

    emit(getEither(updateOrFailur, updatedSuccessMessage));
  }

  OnpostStates getEither(Either<Unit, Failure> either, String succesMessage) {
    return either.fold(
        (_) => OnPostSuccesMessageState(succesMessage: succesMessage),
        (failure) => OnpostErrorMessageState(
            errorMessage: Methods().getTypeOfFailure(failure)));
  }
}
