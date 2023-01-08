import 'package:flutter/material.dart';
import 'package:wothoq/translations/Strings.dart';
import 'package:easy_localization/easy_localization.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsetsGeometry _padding =  EdgeInsets.only(left: 20, right: 6, top: 6, bottom: 6);
    BorderRadius _borderRadius = BorderRadius.only(
      topRight: Radius.circular(64),
      bottomRight: Radius.circular(64),
    );
    if (context.locale == Locale('ar')) {
      _borderRadius = BorderRadius.only(
        topLeft: Radius.circular(64),
        bottomLeft: Radius.circular(64),
      );
     _padding =  EdgeInsets.only(left: 6, right: 20, top: 6, bottom: 6);
    }
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Container(
            padding: _padding,
            decoration: BoxDecoration(color: Colors.white, borderRadius: _borderRadius),
            child: Icon(Icons.arrow_back, color: Colors.black, size: 20),
          ),
          Spacer(),
          singleAppBarButton(Icons.share_outlined, press: () {}),
          singleAppBarButton(Icons.favorite_border, press: () {
            //Show dialog change language
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(Strings().changeLanguage),
                  content: Text(Strings().changeLanguageMessage),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(Strings().cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        //current locale
                        Locale locale = context.locale;
                        //change locale
                        context.setLocale(locale == Locale('ar') ? Locale('en') : Locale('ar'));
                        Navigator.pop(context);
                      },
                      child: Text(Strings().ok),
                    ),
                  ],
                );
              },
            );
          }),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  Widget singleAppBarButton(IconData icon, {required Function press}) {
    return GestureDetector(
      onTap: () => press(),
      child: Container(
          padding: EdgeInsets.all(6),
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(64),
          ),
          child: Icon(icon, color: Colors.grey, size: 18)),
    );
  }
}
