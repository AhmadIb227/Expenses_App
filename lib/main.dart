import 'package:expenses/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
} 

var mycolorScheme= ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 59, 96,179),
);

var myDarkcolorScheme= ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 59, 96,179),
 );


class MyApp extends StatelessWidget 
{
    const MyApp({super.key});                                           
    @override
    Widget build(BuildContext context) 
    {
      return  Center(
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'ENG:Ahmad Ibrahem',
              themeMode: ThemeMode.light,
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: mycolorScheme,
                appBarTheme:const  AppBarTheme().copyWith(
                    backgroundColor: mycolorScheme.onPrimaryContainer,
                    foregroundColor: mycolorScheme.primaryContainer,
                ),
                cardTheme: const CardTheme().copyWith(
                  color: mycolorScheme.secondaryContainer,
                  margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
                ),
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mycolorScheme.primaryContainer,
                  ),
                ),
                textTheme: ThemeData().textTheme.copyWith(
                  titleLarge: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: mycolorScheme.onSecondaryContainer,
                    fontSize: 17,
                  )
                )
               ),
              darkTheme: ThemeData.dark().copyWith(
               // //useMaterial3: true,
              colorScheme: mycolorScheme,
              bottomSheetTheme:const BottomSheetThemeData().copyWith(
                backgroundColor: myDarkcolorScheme.onPrimaryContainer,
              ) ,
              appBarTheme:const  AppBarTheme().copyWith(
                  backgroundColor: myDarkcolorScheme.onPrimaryContainer,
                  foregroundColor: myDarkcolorScheme.primaryContainer,
              ),
              cardTheme: const CardTheme().copyWith(
                color: myDarkcolorScheme.secondaryContainer,
                margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8)
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                  backgroundColor: myDarkcolorScheme.primaryContainer,
                  foregroundColor: myDarkcolorScheme.primaryContainer,
                ),
              ),
              textTheme: ThemeData().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: myDarkcolorScheme.onSecondaryContainer,
                  fontSize: 17,
                )
              )
               ),
              home:const Expenses(),
              
          ),
      );
   }
}