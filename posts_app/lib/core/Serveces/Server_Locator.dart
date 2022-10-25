import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/features/Posts/Data/Data_Sources/Local_Data_Source.dart';
import 'package:posts_app/features/Posts/Data/Data_Sources/Remoted_Data_Source.dart';
import 'package:posts_app/features/Posts/Data/Repository_Imp/Repository_Imp.dart';
import 'package:posts_app/features/Posts/Domin/Respository/Base_Repository.dart';
import 'package:posts_app/features/Posts/Domin/UseCases/Add_Post_UC.dart';
import 'package:posts_app/features/Posts/Domin/UseCases/Delet_Post_UC.dart';
import 'package:posts_app/features/Posts/Domin/UseCases/Get_Posts_UC.dart';
import 'package:posts_app/features/Posts/Domin/UseCases/Update_Post_UC.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_Bloc.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/Post_Manger/Post_Bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Network/Connection_Checker.dart';

final getIt = GetIt.instance;

class ServerLocator {
  Future<void> init() async {
    //bloc

    getIt.registerFactory(() => PostBloc(getPostsUC: getIt()));
    getIt.registerFactory(() => OnpostBloc(
        addPostUC: getIt(), deletPostUC: getIt(), updatePostUC: getIt()));

    //useCases
    getIt.registerLazySingleton(() => GetPostsUC(baseRepository: getIt()));
    getIt.registerLazySingleton(() => AddPostUC(baseRepository: getIt()));
    getIt.registerLazySingleton(() => DeletPostUC(baseRepository: getIt()));
    getIt.registerLazySingleton(() => UpdatePostUC(baseRepository: getIt()));

    //Repository
    getIt.registerLazySingleton<BaseRepository>(() => RepositoryImp(
        baseLocalDataSource: getIt(),
        baseRemotedDataSource: getIt(),
        baseConnectionChecker: getIt()));

    //DataSource
    getIt.registerLazySingleton<BaseRemotedDataSource>(
        () => RemotedDataSource());
    getIt.registerLazySingleton<BaseLocalDataSource>(
        () => LocalDataSource(getIt()));
    //core
    getIt.registerLazySingleton<BaseConnectionChecker>(
        () => ConnectionChecker(connectionChecker: getIt()));
    //extarnal
    final sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerLazySingleton(() => sharedPreferences);
    getIt.registerLazySingleton(() => InternetConnectionChecker());
  }
}
