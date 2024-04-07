import 'package:booklyapp/Core/utilites/api_service.dart';
import 'package:booklyapp/Features/Home/data/Repos/Home%20_Repo_Impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGititLocaator() {
  getIt.registerSingleton<HomeRepoEmpl>(HomeRepoEmpl(ApiService(Dio())));
}
