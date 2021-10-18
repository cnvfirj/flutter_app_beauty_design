
import 'package:flutter/material.dart';

class Pair<T,K>{
  T first;
  K second;

 Pair(this.first, this.second);
 
 Pair<T,K>clone(){
   return new Pair(first, second);
 }
}

abstract class DragWidget{
  void shift(DragUpdateDetails d);
}