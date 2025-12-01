import 'package:flutter_application/core/network/dio_client.dart';
import 'package:flutter_application/data/auth/sources/auth_api_service.dart';
import 'package:flutter_application/data/auth/repositories/auth.dart';
import 'package:flutter_application/data/auth/sources/auth_firebase_service.dart';
import 'package:flutter_application/data/movie/repositories/movie.dart';
import 'package:flutter_application/data/movie/sources/movie.dart';
import 'package:flutter_application/data/tv/repositories/tv.dart';
import 'package:flutter_application/data/tv/sources/tv.dart';
import 'package:flutter_application/domain/auth/repositories/auth.dart';
import 'package:flutter_application/domain/auth/usecases/is_logged_in.dart';
import 'package:flutter_application/domain/auth/usecases/signup.dart';
import 'package:flutter_application/domain/auth/usecases/signin.dart';
import 'package:flutter_application/domain/movie/repositories/movie.dart';
import 'package:flutter_application/domain/movie/usecases/get_all_my_movies.dart';
import 'package:flutter_application/domain/movie/usecases/get_movie_trailer.dart';
import 'package:flutter_application/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:flutter_application/domain/movie/usecases/get_recommendation_movies.dart';
import 'package:flutter_application/domain/movie/usecases/get_similar_movies.dart';
import 'package:flutter_application/domain/movie/usecases/get_trending_movies.dart';
import 'package:flutter_application/domain/tv/repository/tv.dart';
import 'package:flutter_application/domain/tv/usecases/get_popular_tv.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TVService>(TVApiServiceImpl());

  //Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());
  sl.registerSingleton<TvRepository>(TvRepositoryImpl());

  //Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrendingMoviesUseCase>(GetTrendingMoviesUseCase());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(
      GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTVUseCase>(GetPopularTVUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetRecommendationMoviesUseCase>(
      GetRecommendationMoviesUseCase());
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
  sl.registerSingleton<GetAllMyMoviesUseCase>(GetAllMyMoviesUseCase());
}
