import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class TVService {
  Future<Either> getPopularTv();
}

class TVApiServiceImpl implements TVService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/tv/popular?api_key=c304e6244c9ca42387d5236aa29daae0'));

      if (response.statusCode == 200) {
        print('fetch popular tv successfully');

        var data = jsonDecode(response.body)['results'].take(5).toList();
        //print(data);

        return Right({'content': data});
      } else {
        throw Exception('Exception: Failed to load trending movies');
      }
    } catch (e) {
      return Left('Failed to fetch trending movies');
    }
  }
}
