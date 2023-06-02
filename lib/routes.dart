import 'package:flutter/material.dart';
import 'package:proyecto_cafe/screens/register_screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  return <String, WidgetBuilder>{
    '/register':(BuildContext context) => RegisterScreen(), 
  };
}