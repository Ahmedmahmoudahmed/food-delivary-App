import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key,required this.text}) : super(key: key);

  @override
  _ExpandableTextWidgetState createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText=true;
  double textHight=Dimensions.screenHeight/5.63;

  @override
  void initState() {
    if(widget.text.length>textHight){
      firstHalf=widget.text.substring(0,textHight.toInt());
      secondHalf=widget.text.substring(textHight.toInt()+1,widget.text.length);
    }else{
      firstHalf=widget.text;
      secondHalf='';
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color:AppColor.paraColor,size:Dimensions.font16,text: firstHalf):Column(
        children: [
          SmallText(height:1.8,color:AppColor.paraColor,size: Dimensions.font16,text: hiddenText?(firstHalf+'...'):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(height:1.8,text: hiddenText?"show more":"show less",color: AppColor.mainColor,),
                Icon(hiddenText?(Icons.arrow_drop_down):(Icons.arrow_drop_up),color: AppColor.mainColor,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
