import 'package:equatable/equatable.dart';

abstract class OnpostStates extends Equatable {
  const OnpostStates();

  @override
  List<Object?> get props => [];
}

class OnpostInitialState extends OnpostStates{
  const OnpostInitialState ();
}
class OnPostLoadingState extends OnpostStates{
  const OnPostLoadingState();
}
class OnpostErrorMessageState extends OnpostStates{
  final String errorMessage ;

  const OnpostErrorMessageState({required this.errorMessage});

  @override
  List<Object?> get props => [ errorMessage];
}

class OnPostSuccesMessageState extends OnpostStates{
  final String succesMessage ;

 const OnPostSuccesMessageState({required this.succesMessage});
  @override
  List<Object?> get props => [ succesMessage];
}