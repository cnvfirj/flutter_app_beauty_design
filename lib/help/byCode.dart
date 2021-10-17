
import 'package:flutter/material.dart';

class Pair<T,K>{
  T first;
  K second;

 Pair(this.first, this.second);
}

abstract class DragWidget{
  void shift(DragUpdateDetails d);
}