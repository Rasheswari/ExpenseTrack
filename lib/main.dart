import 'package:flutter/material.dart';
import 'package:expense_track/widgets/expenses.dart';


var kcolorScheme =ColorScheme.fromSeed(seedColor: 
const Color.fromARGB(255, 96, 59, 181));

var kDarkcolorScheme =ColorScheme.fromSeed(
brightness: Brightness.dark,
seedColor:const Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkcolorScheme,
        cardTheme: const CardTheme().copyWith(
        color:kDarkcolorScheme.secondaryContainer,
        margin:const EdgeInsets.all(16),

        
       ),
        elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        
        surfaceTintColor:kDarkcolorScheme.primaryContainer,
        ),
       ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
       colorScheme: kcolorScheme,
       appBarTheme: const AppBarTheme().copyWith(
        foregroundColor: kcolorScheme.primaryContainer,
        backgroundColor: kcolorScheme.onPrimaryContainer,
       ),
       cardTheme: const CardTheme().copyWith(
        color:kcolorScheme.secondaryContainer,
        margin:const EdgeInsets.all(16),
       ),
      
       elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        surfaceTintColor:kcolorScheme.primaryContainer,
        ),
       ),
       textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
           fontWeight: FontWeight.normal,
           color: kcolorScheme.onSecondaryContainer,
           fontSize: 14,
        ),

       ),
       ),
      
        home: const Expenses(),
        
      ),
     

    
  ); 
}
