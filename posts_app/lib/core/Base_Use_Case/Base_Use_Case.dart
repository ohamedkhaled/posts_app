import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_app/core/error/Failure.dart';

abstract  class BaseUseCase<T,Parameter>{

Future<Either<T,Failure>> call(Parameter parameter);

}

class Noparamiter extends Equatable {
  const Noparamiter();

  @override
  // TODO: implement props
  List<Object?> get props => [];


}