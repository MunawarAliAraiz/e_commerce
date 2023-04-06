import 'package:e_commerce/consts/consts.dart';
import 'package:e_commerce/consts/lists.dart';
import 'package:e_commerce/widgets_common/home_buttons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: lightGrey,
      padding: EdgeInsets.all(12),
      width: context.screenWidth,
      height:context.screenHeight,
      child: SafeArea(child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: whiteColor,
                hintText: searchAnyThing,
                hintStyle: TextStyle(color: textfieldGrey)
              ),
            ),
          ),
          10.heightBox,

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  //Brands Swipper
              VxSwiper.builder(
                autoPlay: true,
                aspectRatio: 16/9,
                enlargeCenterPage: true,
                height: context.screenHeight*0.17,
                itemCount: slidersList.length, 
                itemBuilder: ((context, index) {
                return
                  Image.asset(slidersList[index],
                  fit: BoxFit.cover,
                  ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).shadowLg.make();
              })),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(2, (index) => homeButtons(
                height: context.screenHeight * 0.13,
                width: context.screenWidth / 2.75,
                icon: index == 0 ? icTodaysDeal : icFlashDeal,
                title: index == 0 ? todayDeal : flashSale
              ))
              ),
              15.heightBox,
              //Brands Swipper 2
              VxSwiper.builder(
                autoPlay: true,
                aspectRatio: 16/9,
                enlargeCenterPage: true,
                height: context.screenHeight*0.17,
                itemCount: slidersList2.length, 
                itemBuilder: ((context, index) {
                return
                  Image.asset(slidersList2[index],
                  fit: BoxFit.cover,
                  ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).shadowLg.make();
              })),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) => homeButtons(
                height: context.screenHeight * 0.13,
                width: context.screenWidth / 3.5,
                icon: index == 0 ? icTopCategories : index == 1 ? icBrands : icTopSeller,
                title: index == 0 ? topCategory : index == 1 ? brands : topSellers
              ))
              ),
              10.heightBox,
              Align(
                alignment: Alignment.centerLeft,
                child: featCategory.text.size(20).color(darkFontGrey).make()
              )
                ],
              ),
            ),
          )


        ],
      )),
      );
  }
}