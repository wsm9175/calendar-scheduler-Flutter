import 'package:flutter/material.dart';
import 'screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{
  //flutter framework의 준비 여부 체크
  WidgetsFlutterBinding.ensureInitialized();

  //intl
  await initializeDateFormatting();

  runApp(
    MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
    )
  );
}

