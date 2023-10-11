// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i5;

import '../../features/youtube_comment_finder/data/data_sources/comment_thread_remote_data_source_impl.dart'
    as _i4;
import '../../features/youtube_comment_finder/data/network/network_info_impl.dart'
    as _i7;
import '../../features/youtube_comment_finder/data/repository/comment_thread_repository_impl.dart'
    as _i9;
import '../../features/youtube_comment_finder/domain/repository/comment_thread_repository.dart'
    as _i8;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl.dart'
    as _i10;
import '../../features/youtube_comment_finder/presentation/cubit/fetch_comments_cubit.dart'
    as _i11;
import '../data_sources/comment_thread_remote_data_source.dart' as _i3;
import '../network/network_info.dart' as _i6;
import 'injectable.dart' as _i12; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final registerModuleConnectionChecker = _$RegisterModuleConnectionChecker();
  gh.lazySingleton<_i3.CommentThreadRemoteDataSource>(
      () => _i4.CommentThreadRemoteDataSourceImpl());
  gh.factory<_i5.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i7.NetworkInfoImpl(get<_i5.InternetConnectionChecker>()));
  gh.lazySingleton<_i8.CommentThreadRepository>(
      () => _i9.CommentThreadRepositoryImpl(
            get<_i6.NetworkInfo>(),
            get<_i3.CommentThreadRemoteDataSource>(),
          ));
  gh.lazySingleton<_i10.UseCaseCommentThreadImpl>(
      () => _i10.UseCaseCommentThreadImpl(get<_i8.CommentThreadRepository>()));
  gh.lazySingleton<_i11.FetchCommentsCubit>(
      () => _i11.FetchCommentsCubit(get<_i10.UseCaseCommentThreadImpl>()));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i12.RegisterModuleConnectionChecker {}
