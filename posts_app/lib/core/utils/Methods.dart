
import '../error/Failure.dart';
import '../error/Strings.dart';

class Methods {

  String getTypeOfFailure(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure :
        return Strings.serverFailureMessage;
      case OffLineFailure:
        return Strings.offLineFailureMessage;
      case EmptyCacheFailure :
        return Strings.emptyCachFailureMessage;
      default :
        return Strings.unEexpectedFailureMessage;
    }
  }



}