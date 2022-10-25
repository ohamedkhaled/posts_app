import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/Post_Manger/Post_Bloc.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/Post_Manger/Post_Event.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/Post_Manger/Post_States.dart';
import 'package:posts_app/features/Posts/Presentatoin/Widgets/Post_Widget.dart';
import '../../../../core/utils/Config_Size.dart';

class PostsScreenBody extends StatelessWidget {
  const PostsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc,PostStates>(
      builder: (context, state) {
        if(state is LoadingState){
          return  SizedBox(
            height: ConfigSize.defaultSize! * 40,
            child: const Center(child: CircularProgressIndicator()),
          ); ;
        }else if(state is LoadedState){
          return RefreshIndicator(
              onRefresh:()=> onRefresh(context) ,
          child: PostWidget( listPosts: state.postsList ));
        }else if(state is ErrorState){
           return SizedBox(
              height: ConfigSize.defaultSize! * 40 ,
              child: Center(child: Text(state.errorMassege)));
        }
        return SizedBox(
          height: ConfigSize.defaultSize! * 40,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );

      Container();
  }

 Future<void> onRefresh(BuildContext context )  async {
    BlocProvider.of<PostBloc>(context).add(RefrishPostEvent());
 }
}
