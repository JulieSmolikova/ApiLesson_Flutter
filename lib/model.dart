import 'dart:convert';
import 'package:api_lesson/api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Data extends ChangeNotifier {

  List<User> users = [];

  Future fetchUsers()async{
    final response = await get(Uri.parse('https://randomuser.me/api/?results=50'));

    if(response.statusCode == 200){
      //print(response.body);
      final results = jsonDecode(response.body)['results'] as List<dynamic>;
      users = results.map((e) {

        final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last'],
        );

        final picture = Picture(
            large: e['picture']['large'],
            medium: e['picture']['medium'],
            thumbnail: e['picture']['thumbnail'],
        );

        return User(
            gender: e['gender'],
            email: e['email'],
            phone: e['phone'],
            cell: e['cell'],
            nat: e['nat'],
            name: name,
            picture: picture,
        );
      }).toList();
    }
    notifyListeners();
  }

}