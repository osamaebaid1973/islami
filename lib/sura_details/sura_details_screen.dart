import 'package:flutter/material.dart';
import 'package:islami/models/sura_model.dart';

class SuraDetailsScreen extends StatelessWidget {
  static const String routeName = 'SuraDetails';
  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuraModel suraModel = ModalRoute.of(context)?.settings.arguments as SuraModel;
    return Scaffold(
      appBar: AppBar(
        title:  Text(suraModel.suraNameEn),
      ),
      body: Container(),
    );;
  }
}