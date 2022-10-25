import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/core/utils/Config_Size.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_Bloc.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_States.dart';
import 'package:posts_app/features/Posts/Presentatoin/Screens/Posts_Screen.dart';
import 'package:posts_app/features/Posts/Presentatoin/Widgets/FromWidget.dart';

class PostAddUpdataPage extends StatelessWidget {
  final bool isUpdate;
  final PostEntities? post;
  const PostAddUpdataPage({required this.isUpdate, this.post, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(isUpdate ? "Edit Post" : "Add Post"),
        ),
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: BlocConsumer<OnpostBloc, OnpostStates>(
              listener: (context, state) {
            if (state is OnpostErrorMessageState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.errorMessage,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ));

            }
            else if(state is OnPostSuccesMessageState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.succesMessage,
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.green,
              ));
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => PostsScreen()),
                      (route) => false);
            }
          }, builder: (context, state) {
             if( state is OnPostLoadingState){
               return  SizedBox(
                 height: ConfigSize.defaultSize! * 40,
                 child: const Center(child: CircularProgressIndicator()),
               );
             }
             return FormWidget( isUpdate : isUpdate ,post :isUpdate?post :null);
          }),
        )));
  }
}
