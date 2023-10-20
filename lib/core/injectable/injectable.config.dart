// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i11;

import '../../features/youtube_comment_finder/data/data_sources/comment_replies_data_source/comment_replies_pager_remote_data_source_impl.dart'
    as _i4;
import '../../features/youtube_comment_finder/data/data_sources/comment_replies_data_source/comment_replies_remote_data_source_impl.dart'
    as _i6;
import '../../features/youtube_comment_finder/data/data_sources/comment_thread_data_source/comment_thread_pager_remote_data_source_impl.dart'
    as _i8;
import '../../features/youtube_comment_finder/data/data_sources/comment_thread_data_source/comment_thread_remote_data_source_impl.dart'
    as _i10;
import '../../features/youtube_comment_finder/data/network/network_info_impl.dart'
    as _i13;
import '../../features/youtube_comment_finder/data/repository/comment_replies_repository_impl/comment_replies_pager_repository_impl.dart'
    as _i15;
import '../../features/youtube_comment_finder/data/repository/comment_replies_repository_impl/comment_replies_repository_impl.dart'
    as _i17;
import '../../features/youtube_comment_finder/data/repository/comment_thread_repository_impl/comment_thread_pager_repository_impl.dart'
    as _i19;
import '../../features/youtube_comment_finder/data/repository/comment_thread_repository_impl/comment_thread_repository_impl.dart'
    as _i21;
import '../../features/youtube_comment_finder/domain/repository/comment_replies_repository/comment_replies_pager_repository.dart'
    as _i14;
import '../../features/youtube_comment_finder/domain/repository/comment_replies_repository/comment_replies_repository.dart'
    as _i16;
import '../../features/youtube_comment_finder/domain/repository/comment_thread_repository/comment_thread_pager_repository.dart'
    as _i18;
import '../../features/youtube_comment_finder/domain/repository/comment_thread_repository/comment_thread_repository.dart'
    as _i20;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_replies_impl/use_case_comment_replies_impl.dart'
    as _i22;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_replies_impl/use_case_comment_replies_pager_impl.dart'
    as _i23;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl/use_case_comment_thread_impl.dart'
    as _i24;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl/use_case_comment_thread_pager_impl.dart'
    as _i25;
import '../../features/youtube_comment_finder/presentation/cubit/fetch_comments_cubit/fetch_comments_cubit.dart'
    as _i26;
import '../data_sources/comment_replies_data_source/comment_replies_pager_remote_data_source.dart'
    as _i3;
import '../data_sources/comment_replies_data_source/comment_replies_remote_data_source.dart'
    as _i5;
import '../data_sources/comment_thread_data_source/comment_thread_pager_remote_data_source.dart'
    as _i7;
import '../data_sources/comment_thread_data_source/comment_thread_remote_data_source.dart'
    as _i9;
import '../network/network_info.dart' as _i12;
import 'injectable.dart' as _i27; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i3.CommentRepliesPagerRemoteDataSource>(
      () => _i4.CommentRepliesPagerRemoteDataSourceImpl());
  gh.lazySingleton<_i5.CommentRepliesRemoteDataSource>(
      () => _i6.CommentRepliesRemoteDataSourceImpl());
  gh.lazySingleton<_i7.CommentThreadPagerRemoteDataSource>(
      () => _i8.CommentThreadPagerRemoteDataSourceImpl());
  gh.lazySingleton<_i9.CommentThreadRemoteDataSource>(
      () => _i10.CommentThreadRemoteDataSourceImpl());
  gh.factory<_i11.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.lazySingleton<_i12.NetworkInfo>(
      () => _i13.NetworkInfoImpl(get<_i11.InternetConnectionChecker>()));
  gh.lazySingleton<_i14.CommentRepliesPagerRepository>(
      () => _i15.CommentRepliesPagerRepositoryImpl(
            get<_i3.CommentRepliesPagerRemoteDataSource>(),
            get<_i12.NetworkInfo>(),
          ));
  gh.lazySingleton<_i16.CommentRepliesRepository>(
      () => _i17.CommentRepliesRepositoryImpl(
            get<_i12.NetworkInfo>(),
            get<_i5.CommentRepliesRemoteDataSource>(),
          ));
  gh.lazySingleton<_i18.CommentThreadPagerRepository>(
      () => _i19.CommentThreadPagerRepositoryImpl(
            get<_i12.NetworkInfo>(),
            get<_i7.CommentThreadPagerRemoteDataSource>(),
          ));
  gh.lazySingleton<_i20.CommentThreadRepository>(
      () => _i21.CommentThreadRepositoryImpl(
            get<_i12.NetworkInfo>(),
            get<_i9.CommentThreadRemoteDataSource>(),
          ));
  gh.lazySingleton<_i22.UseCaseCommentRepliesImpl>(() =>
      _i22.UseCaseCommentRepliesImpl(get<_i16.CommentRepliesRepository>()));
  gh.lazySingleton<_i23.UseCaseCommentRepliesPagerImpl>(() =>
      _i23.UseCaseCommentRepliesPagerImpl(
          get<_i14.CommentRepliesPagerRepository>()));
  gh.lazySingleton<_i24.UseCaseCommentThreadImpl>(
      () => _i24.UseCaseCommentThreadImpl(get<_i20.CommentThreadRepository>()));
  gh.lazySingleton<_i25.UseCaseCommentThreadPagerImpl>(() =>
      _i25.UseCaseCommentThreadPagerImpl(
          get<_i18.CommentThreadPagerRepository>()));
  gh.lazySingleton<_i26.FetchCommentsCubit>(() => _i26.FetchCommentsCubit(
        get<_i24.UseCaseCommentThreadImpl>(),
        get<_i25.UseCaseCommentThreadPagerImpl>(),
        get<_i22.UseCaseCommentRepliesImpl>(),
        get<_i23.UseCaseCommentRepliesPagerImpl>(),
      ));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i27.RegisterModuleConnectionChecker {}
