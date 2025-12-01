import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class MovieService {
  Future<Either> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieId);
  Future<Either> getRecommendationMovies(int movieId);
  Future<Either> getSimilarMovies(int movieId);
  Future<Either> getAllMyMovies();
}

class MovieApiServiceImpl extends MovieService {
  @override
  Future<Either> getTrendingMovies() async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/trending/movie/day?api_key=c304e6244c9ca42387d5236aa29daae0'));

      if (response.statusCode == 200) {
        print('fetch trending movies successfully');

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

  @override
  Future<Either> getNowPlayingMovies() async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/now_playing?api_key=c304e6244c9ca42387d5236aa29daae0'));

      if (response.statusCode == 200) {
        print('fetch now playing movies successfully');

        var data = jsonDecode(response.body)['results'].toList();
        //print(data);

        return Right({'content': data});
      } else {
        throw Exception('Exception: Failed to load Now playing movies');
      }
    } catch (e) {
      return Left('Failed to fetch Now playing movies');
    }
  }

  @override
  Future<Either> getMovieTrailer(int movieId) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=c304e6244c9ca42387d5236aa29daae0'));

      if (response.statusCode == 200) {
        print('fetch movie trailer successfully');

        var data = jsonDecode(response.body)['results'][0];
        return Right({'trailer': data});
        //return Right({data});
      } else {
        throw Exception('Exception: Failed to load movie Trailer');
      }
    } catch (e) {
      return Left('Failed to fetch movie Trailer');
    }
  }

  @override
  Future<Either> getRecommendationMovies(int movieId) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/recommendations?api_key=c304e6244c9ca42387d5236aa29daae0'));

      if (response.statusCode == 200) {
        print('fetch recommendation movie successfully');

        var data = jsonDecode(response.body)['results'].toList();
        return Right({'content': data});
        //return Right({data});
      } else {
        throw Exception('Exception: Failed to load movie recommendation');
      }
    } catch (e) {
      return Left('Failed to fetch movie recommendation');
    }
  }

  @override
  Future<Either> getSimilarMovies(int movieId) async {
    try {
      var response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/similar?api_key=c304e6244c9ca42387d5236aa29daae0'));

      if (response.statusCode == 200) {
        print('fetch similar movies successfully');

        var data = jsonDecode(response.body)['results'].toList();
        return Right({'content': data});
        //return Right({data});
      } else {
        throw Exception('Exception: Failed to load similar movies');
      }
    } catch (e) {
      return Left('Failed to fetch movie recommendation');
    }
  }

  @override
  Future<Either> getAllMyMovies() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('MyMovies').get();
      print('fetch My firebase movies successfully');
      return Right(returnedData.docs);
    } catch (e) {
      return Left('Failed to fetch My movies');
    }
  }
}
