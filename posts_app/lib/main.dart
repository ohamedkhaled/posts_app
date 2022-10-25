import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:posts_app/core/Base_Use_Case/Base_Use_Case.dart';
import 'package:posts_app/core/Network/Connection_Checker.dart';
import 'package:posts_app/core/Serveces/Server_Locator.dart';
import 'package:posts_app/features/Posts/Data/Data_Sources/Local_Data_Source.dart';
import 'package:posts_app/features/Posts/Data/Data_Sources/Remoted_Data_Source.dart';
import 'package:posts_app/features/Posts/Data/Repository_Imp/Repository_Imp.dart';
import 'package:posts_app/features/Posts/Domin/Respository/Base_Repository.dart';
import 'package:posts_app/features/Posts/Domin/UseCases/Get_Posts_UC.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/Resours_Manger/String_Manger.dart';
import 'core/Theme_Data/Theme_Manger.dart';
import 'core/utils/Config_Size.dart';
import 'features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_Bloc.dart';
import 'features/Posts/Presentatoin/Manger/Post_Manger/Post_Bloc.dart';
import 'features/Posts/Presentatoin/Manger/Post_Manger/Post_Event.dart';
import 'features/Posts/Presentatoin/Screens/Posts_Screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized() ;
  await ServerLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({ super.key});



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    GetPostsUC(baseRepository:getIt()).call(const Noparamiter());

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> getIt<PostBloc>()..add(GetPostEvent())),
        BlocProvider(create: (_)=> getIt<OnpostBloc>())
      ],
       child: MaterialApp(
      title:StringManger.postsApp,
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      home: PostsScreen(),

    )
    );
  }
}
