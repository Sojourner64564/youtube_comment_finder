// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;

import '../../features/youtube_comment_finder/data/data_sources/comment_thread_data_source/comment_thread_pager_remote_data_source_impl.dart'
    as _i4;
import '../../features/youtube_comment_finder/data/data_sources/comment_thread_data_source/comment_thread_remote_data_source_impl.dart'
    as _i6;
import '../../features/youtube_comment_finder/data/network/network_info_impl.dart'
    as _i9;
import '../../features/youtube_comment_finder/data/repository/comment_thread_repository_impl/comment_thread_pager_repository_impl.dart'
    as _i11;
import '../../features/youtube_comment_finder/data/repository/comment_thread_repository_impl/comment_thread_repository_impl.dart'
    as _i13;
import '../../features/youtube_comment_finder/domain/repository/comment_thread_repository/comment_thread_pager_repository.dart'
    as _i10;
import '../../features/youtube_comment_finder/domain/repository/comment_thread_repository/comment_thread_repository.dart'
    as _i12;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl/use_case_comment_thread_impl.dart'
    as _i14;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl/use_case_comment_thread_pager_impl.dart'
    as _i15;
import '../../features/youtube_comment_finder/presentation/cubit/fetch_comments_cubit/fetch_comments_cubit.dart'
    as _i16;
import '../data_sources/comment_thread_data_source/comment_thread_pager_remote_data_source.dart'
    as _i3;
import '../data_sources/comment_thread_data_source/comment_thread_remote_data_source.dart'
    as _i5;
import '../network/network_info.dart' as _i8;
import 'injectable.dart' as _i17; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.CommentThreadPagerRemoteDataSource>(
      () => _i4.CommentThreadPagerRemoteDataSourceImpl());
  gh.lazySingleton<_i5.CommentThreadRemoteDataSource>(
      () => _i6.CommentThreadRemoteDataSourceImpl());
  gh.factory<_i7.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.lazySingleton<_i8.NetworkInfo>(
      () => _i9.NetworkInfoImpl(get<_i7.InternetConnectionChecker>()));
  gh.lazySingleton<_i10.CommentThreadPagerRepository>(
      () => _i11.CommentThreadPagerRepositoryImpl(
            get<_i8.NetworkInfo>(),
            get<_i3.CommentThreadPagerRemoteDataSource>(),
          ));
  gh.lazySingleton<_i12.CommentThreadRepository>(
      () => _i13.CommentThreadRepositoryImpl(
            get<_i8.NetworkInfo>(),
            get<_i5.CommentThreadRemoteDataSource>(),
          ));
  gh.lazySingleton<_i14.UseCaseCommentThreadImpl>(
      () => _i14.UseCaseCommentThreadImpl(get<_i12.CommentThreadRepository>()));
  gh.lazySingleton<_i15.UseCaseCommentThreadPagerImpl>(() =>
      _i15.UseCaseCommentThreadPagerImpl(
          get<_i10.CommentThreadPagerRepository>()));
  gh.lazySingleton<_i16.FetchCommentsCubit>(() => _i16.FetchCommentsCubit(
        get<_i14.UseCaseCommentThreadImpl>(),
        get<_i15.UseCaseCommentThreadPagerImpl>(),
      ));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i17.RegisterModuleConnectionChecker {}
