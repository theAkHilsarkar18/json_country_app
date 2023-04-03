import 'package:flutter/material.dart';
import 'package:json_country_app/screens/country_detail_screen/view/detailscreen.dart';
import 'package:json_country_app/screens/country_screen/provider/countryprovider.dart';
import 'package:json_country_app/screens/country_screen/view/countryscreen.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Countryprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => Countryscreen(),
          'detail' : (context) => Detailscreen(),
        },
      ),
    ),
  );
}