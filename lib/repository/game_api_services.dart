

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:series_app/models/data_model.dart';
import 'package:http/http.dart' as http;
class GameApi{

   Future<List<DataModel>?> getGamesData() async {
    String url=" https://www.gamerpower.com/api/giveaways";
    final result=await http.Client().get(Uri.parse(url));
    if(result.statusCode !=200)
    {
      return null;
    }
    else
    {
      Iterable models=jsonDecode(result.body);
      List<DataModel> dataModels=[];
      for(var model in models)
      {
        DataModel dataModel=DataModel.fromJson(model);
        dataModels.add(dataModel);
      }
      return dataModels;
    }
  }
}