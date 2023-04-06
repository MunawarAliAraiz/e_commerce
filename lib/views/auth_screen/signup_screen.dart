import 'package:get/get.dart';
import '../../consts/consts.dart';
import '../../widgets_common/applogo_widget.dart';
import '../../widgets_common/bg_widget.dart';
import '../../widgets_common/custom_textfeild.dart';
import '../../widgets_common/our_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool? isCheck = false;

  @override
  Widget build(BuildContext context) {
    return bgWidget(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Join $appname Now".text.fontFamily(bold).size(22).white.make(),
            15.heightBox,
            Column(
              children: [
                customTextFeild(hint: nameHint, title: name),
                customTextFeild(hint: emailHint, title: email),
                customTextFeild(hint: passwordHint, title: password),
                customTextFeild(hint: passwordHint, title: retypePass),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child:TextButton(onPressed: (){}, child: forgetPass.text.make())
                //   ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: redColor,
                      checkColor: whiteColor,
                      value: isCheck, 
                      onChanged: (newVal){
                        setState(() {
                          isCheck = newVal;
                        });
                      }
                      ),
                    5.widthBox,
                    Expanded(
                      child: RichText(text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "I agree to the ",
                            style: TextStyle(fontFamily: bold,color: fontGrey)),
                          TextSpan(
                            text: termCond,
                            style: TextStyle(fontFamily: bold,color: redColor)),
                          TextSpan(
                            text: " & ",
                            style: TextStyle(fontFamily: bold,color: fontGrey)),
                          TextSpan(
                            text: privacyPol,
                            style: TextStyle(fontFamily: bold,color: redColor)),
                        ]
                      )),
                    )
                  ],
                ),
                ourButton(title: signup, color: isCheck == true ? redColor : lightGrey, textColor: whiteColor, onPress: (){}).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alrHavAcc.text.make(),
                    login.text.color(redColor).make()
                  ],
                ).onTap(() {
                  Get.back();
                }),
              ],
            ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
          ],
        ),
      ),
    ));
  }
}