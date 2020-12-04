import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterappdogandcat/core/model/subject.dart';
import 'package:flutterappdogandcat/ui/shared/define.dart';
import 'package:flutterappdogandcat/ui/views/subject/subject_view.dart';

class Subjects extends StatelessWidget {

  final Subject subjectModel;

  Subjects({@required this.subjectModel});
  
  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width / 375;
    final height = MediaQuery.of(context).size.height / 647;
    
    return GestureDetector(child: Container(child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
      Container(width: 56 * width,height: 56 * width,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromRGBO(39, 65, 143, 1)
        ),child: SvgPicture.asset(subjectModel.image,width: 30 * width,height: 30 * height,fit: BoxFit.scaleDown)),
      SizedBox(height: 5 * height),
      Text(subjectModel.title,style: TextStyle(color: Colors.black))
    ],),),
    onTap: (){
      FocusScope.of(context).requestFocus(FocusNode());
        Navigator.of(context)
            .pushNamed(SubjectView.routeName, arguments: subjectModel);
      },);
  }
}
