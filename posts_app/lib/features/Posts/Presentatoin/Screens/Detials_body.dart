





import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_Bloc.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_Event.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_States.dart';
import 'package:posts_app/features/Posts/Presentatoin/Screens/Post_Add_Updata_Page.dart';
import 'package:posts_app/features/Posts/Presentatoin/Screens/Posts_Screen.dart';

import '../../../../core/utils/Config_Size.dart';

class DetialsScren extends StatelessWidget {

  final PostEntities postEntities ;
  const DetialsScren ({required this.postEntities,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(postEntities.title, style: TextStyle(fontSize: 25,color: Colors.black),),
          const  Divider(height:  50 , thickness: 2,),
            Text(postEntities.body,style: TextStyle(fontSize: 16,color: Colors.grey),),
            const  Divider(height:  50 , thickness: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (_)=>
                      PostAddUpdataPage(isUpdate: true,post: postEntities)));
                }, icon: Icon(Icons.edit), label: Text("Edit")),
                ElevatedButton.icon(onPressed:  ()=>deleteDialog(context),
                    style: ButtonStyle(
                      backgroundColor:  MaterialStateProperty.all(
                          Colors.red
                      )
                    ),
                    icon: Icon(Icons.delete), label: Text("Delete"))
              ],
            )
          ],
        ),
      ),
    );
  }

  void deleteDialog (BuildContext context ) {

    showDialog(context: context, builder: (context){
      return BlocConsumer<OnpostBloc,OnpostStates>(
        listener: (context, state) {
          if (state is OnpostErrorMessageState) {
            Navigator.of(context).pop();
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

        },
        builder: (context, state) {
          if( state is OnPostLoadingState){
            return  AlertDialog(
              title: SizedBox(
                height: ConfigSize.defaultSize! * 40,
                child: const Center(child: CircularProgressIndicator()),
              ),
            );
          }
          return DeletDialogWidget(id:postEntities.id ,Context:context);

        },

        );


    });
  }

  Widget DeletDialogWidget({required int id ,required BuildContext Context}) {
    return AlertDialog(
      title: Text("Are you sure ?"),
      actions: [
        TextButton(onPressed: ()=>Navigator.of(Context).pop(), child: Text("No")),
        TextButton(onPressed: (){
          BlocProvider.of<OnpostBloc>(Context).add(DeletEvent(id: id));
        }, child: Text("yes"))
      ],
    );
  }
}
