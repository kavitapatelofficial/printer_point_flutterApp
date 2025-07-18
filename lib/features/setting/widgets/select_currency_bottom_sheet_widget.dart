import 'package:flutter/material.dart';
import 'package:flutter_sixvalley_ecommerce/localization/language_constrants.dart';
import 'package:flutter_sixvalley_ecommerce/features/splash/controllers/splash_controller.dart';
import 'package:flutter_sixvalley_ecommerce/utill/custom_themes.dart';
import 'package:flutter_sixvalley_ecommerce/utill/dimensions.dart';
import 'package:flutter_sixvalley_ecommerce/common/basewidget/custom_button_widget.dart';
import 'package:provider/provider.dart';

class SelectCurrencyBottomSheetWidget extends StatefulWidget {
  const SelectCurrencyBottomSheetWidget({super.key});

  @override
  State<SelectCurrencyBottomSheetWidget> createState() => _SelectCurrencyBottomSheetWidgetState();
}

class _SelectCurrencyBottomSheetWidgetState extends State<SelectCurrencyBottomSheetWidget> {
  int selectedIndex = 0;
  @override
  void initState() {
    selectedIndex = Provider.of<SplashController>(context, listen: false).currencyIndex!;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<SplashController>(
      builder: (context, currencyProvider, _) {
        return SingleChildScrollView(
          child: Container(padding: const EdgeInsets.only(bottom: 40, top: 15),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,

                borderRadius: const BorderRadius.vertical(top: Radius.circular(Dimensions.paddingSizeDefault))
            ),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(width: 40,height: 5,decoration: BoxDecoration(
                  color: Theme.of(context).hintColor.withOpacity(.5),
                  borderRadius: BorderRadius.circular(20)
              ),),
              const SizedBox(height: 20,),

              Text(getTranslated('select_currency', context)!, style: textBold.copyWith(fontSize: Dimensions.fontSizeLarge),),

              Padding(padding: const EdgeInsets.only(top: Dimensions.paddingSizeSmall, bottom: Dimensions.paddingSizeSmall),
                child: Text('${getTranslated('choose_your_currency_to_proceed', context)}',textAlign: TextAlign.center, style: textRegular),),

              if(currencyProvider.configModel != null && currencyProvider.configModel!.currencyList != null && currencyProvider.configModel!.currencyList!.isNotEmpty)
              RepaintBoundary(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: currencyProvider.configModel?.currencyList?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index){
                      return currencyProvider.configModel?.currencyList![index].status == false ? const SizedBox() : InkWell(
                        onTap: (){
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Padding(padding: const EdgeInsets.fromLTRB(Dimensions.paddingSizeDefault, 0,Dimensions.paddingSizeDefault, 0),
                          child: Container(decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
                              color: selectedIndex == index? Theme.of(context).primaryColor.withOpacity(.1): Theme.of(context).cardColor),
                            child: Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault, vertical: Dimensions.paddingSizeEight),
                              child: Row(children: [
                                Container(width : 40,height: 40,
                                    padding: const EdgeInsets.all(Dimensions.paddingSizeEight),
                                    decoration:BoxDecoration(shape: BoxShape.circle,
                                        color: selectedIndex == index? Theme.of(context).primaryColor: Theme.of(context).primaryColor.withOpacity(.5)) ,
                                    child: Center(
                                      child: Text(
                                          currencyProvider.configModel!.currencyList![index].symbol ?? '',
                                          style: textRegular.copyWith(color : Colors.white),
                                      ),
                                    ),
                                ),

                                Padding(padding: const EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeSmall),
                                  child: Padding(padding: const EdgeInsets.all(Dimensions.paddingSizeSmall),
                                    child: Text(currencyProvider.configModel!.currencyList![index].name!)))

                              ],),
                            ),),
                        ),
                      );

                    }),
              ),

              Padding(padding: const EdgeInsets.fromLTRB( Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall, Dimensions.paddingSizeSmall,0),
                child: CustomButton(buttonText: '${getTranslated('select', context)}', onTap: (){
                  Provider.of<SplashController>(context, listen: false).setCurrency(selectedIndex);
                  Navigator.pop(context);
                },),
              )

            ],),
          ),
        );
      }
    );
  }
}
