import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_app/features/Posts/Domin/Entities/Post_Entities.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_Bloc.dart';
import 'package:posts_app/features/Posts/Presentatoin/Manger/OnPost_Manger/Onpost_Event.dart';

class FormWidget extends StatefulWidget {
 final bool isUpdate ;
 final PostEntities? post ;

  const FormWidget({required this.isUpdate ,this.post ,Key? key}) : super(key: key);

  @override
  _FormWidgetState createState() => _FormWidgetState();
}


class _FormWidgetState extends State<FormWidget> {
  final key = GlobalKey<FormState>();
  TextEditingController titleController =TextEditingController();
  TextEditingController bodyController =TextEditingController();

  @override
  void initState() {
    if(widget.isUpdate){
      titleController.text =widget.post!.title ;
      bodyController.text = widget.post!.body ;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:  CrossAxisAlignment.center,
          children: [
          TextFormField(
            controller: titleController,
            validator: (value){
              if(value!.isEmpty){
                return "title can not be empty!";
              }
            },
            decoration: InputDecoration(
              hintText: "Title",

            ),
          ),
            TextFormField(
              controller: bodyController,
              validator: (value){
                if(value!.isEmpty){
                  return "body can not be empty!";
                }
              },
              decoration: InputDecoration(
                  hintText: "body"
              ),
              maxLines: 6,
              minLines: 6,
            ),
              ElevatedButton.icon(onPressed: (){
                validate();
              },icon: widget.isUpdate?Icon(Icons.edit) : Icon(Icons.add) ,
                  label: Text(widget.isUpdate ?"Edit":"Add") )

          ],
        )
    );
  }

  void validate() {

    if(key.currentState!.validate()){

      final postEntities = PostEntities(id: widget.isUpdate?widget.post!.id:0 ,title: titleController.text ,
          body: bodyController.text);
      if(widget.isUpdate){
        BlocProvider.of<OnpostBloc>(context).add(UpdateEvent(postEntities: postEntities));
      }else{
        BlocProvider.of<OnpostBloc>(context).add(AddEvent(postEntities: postEntities));
      }
    }

  }

}
