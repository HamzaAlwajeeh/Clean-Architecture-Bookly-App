import 'package:bookly_app/Features/Search/data/data_source/search_remote_data_source.dart';
import 'package:bookly_app/Features/Search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/core/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton(ApiService(Dio()));
  getIt.registerSingleton(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
  getIt.registerSingleton(
    SearchRepoImpl(
      searchRemoteDataSource: SearchRemoteDataSource(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
}
