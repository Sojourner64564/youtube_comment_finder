// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i12;

import '../../features/youtube_comment_finder/data/data_sources/comment_replies_data_source/comment_replies_pager_remote_data_source_impl.dart'
    as _i4;
import '../../features/youtube_comment_finder/data/data_sources/comment_replies_data_source/comment_replies_remote_data_source_impl.dart'
    as _i6;
import '../../features/youtube_comment_finder/data/data_sources/comment_thread_data_source/comment_thread_pager_remote_data_source_impl.dart'
    as _i8;
import '../../features/youtube_comment_finder/data/data_sources/comment_thread_data_source/comment_thread_remote_data_source_impl.dart'
    as _i10;
import '../../features/youtube_comment_finder/data/network/network_info_impl.dart'
    as _i14;
import '../../features/youtube_comment_finder/data/repository/comment_replies_repository_impl/comment_replies_pager_repository_impl.dart'
    as _i17;
import '../../features/youtube_comment_finder/data/repository/comment_replies_repository_impl/comment_replies_repository_impl.dart'
    as _i19;
import '../../features/youtube_comment_finder/data/repository/comment_thread_repository_impl/comment_thread_pager_repository_impl.dart'
    as _i21;
import '../../features/youtube_comment_finder/data/repository/comment_thread_repository_impl/comment_thread_repository_impl.dart'
    as _i23;
import '../../features/youtube_comment_finder/domain/repository/comment_replies_repository/comment_replies_pager_repository.dart'
    as _i16;
import '../../features/youtube_comment_finder/domain/repository/comment_replies_repository/comment_replies_repository.dart'
    as _i18;
import '../../features/youtube_comment_finder/domain/repository/comment_thread_repository/comment_thread_pager_repository.dart'
    as _i20;
import '../../features/youtube_comment_finder/domain/repository/comment_thread_repository/comment_thread_repository.dart'
    as _i22;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_replies_impl/use_case_comment_replies_impl.dart'
    as _i24;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_replies_impl/use_case_comment_replies_pager_impl.dart'
    as _i25;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl/use_case_comment_thread_impl.dart'
    as _i26;
import '../../features/youtube_comment_finder/domain/usecase/use_case_comment_thread_impl/use_case_comment_thread_pager_impl.dart'
    as _i27;
import '../../features/youtube_comment_finder/presentation/cubit/fetch_comments_cubit/fetch_comments_cubit.dart'
    as _i28;
import '../../features/youtube_comment_finder/presentation/cubit/find_comment_cubit/find_comment_cubit.dart'
    as _i11;
import '../../features/youtube_comment_finder/presentation/cubit/parse_link_cubit/parse_link_cubit.dart'
    as _i15;
import '../data_sources/comment_replies_data_source/comment_replies_pager_remote_data_source.dart'
    as _i3;
import '../data_sources/comment_replies_data_source/comment_replies_remote_data_source.dart'
    as _i5;
import '../data_sources/comment_thread_data_source/comment_thread_pager_remote_data_source.dart'
    as _i7;
import '../data_sources/comment_thread_data_source/comment_thread_remote_data_source.dart'
    as _i9;
import '../network/network_info.dart' as _i13;
import 'injectable.dart' as _i29; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i11.FindCommentCubit>(() => _i11.FindCommentCubit());
  gh.factory<_i12.InternetConnectionChecker>(
      () => registerModuleConnectionChecker.internetConnection);
  gh.lazySingleton<_i13.NetworkInfo>(
      () => _i14.NetworkInfoImpl(get<_i12.InternetConnectionChecker>()));
  gh.lazySingleton<_i15.ParseLinkCubit>(() => _i15.ParseLinkCubit());
  gh.lazySingleton<_i16.CommentRepliesPagerRepository>(
      () => _i17.CommentRepliesPagerRepositoryImpl(
            get<_i3.CommentRepliesPagerRemoteDataSource>(),
            get<_i13.NetworkInfo>(),
          ));
  gh.lazySingleton<_i18.CommentRepliesRepository>(
      () => _i19.CommentRepliesRepositoryImpl(
            get<_i13.NetworkInfo>(),
            get<_i5.CommentRepliesRemoteDataSource>(),
          ));
  gh.lazySingleton<_i20.CommentThreadPagerRepository>(
      () => _i21.CommentThreadPagerRepositoryImpl(
            get<_i13.NetworkInfo>(),
            get<_i7.CommentThreadPagerRemoteDataSource>(),
          ));
  gh.lazySingleton<_i22.CommentThreadRepository>(
      () => _i23.CommentThreadRepositoryImpl(
            get<_i13.NetworkInfo>(),
            get<_i9.CommentThreadRemoteDataSource>(),
          ));
  gh.lazySingleton<_i24.UseCaseCommentRepliesImpl>(() =>
      _i24.UseCaseCommentRepliesImpl(get<_i18.CommentRepliesRepository>()));
  gh.lazySingleton<_i25.UseCaseCommentRepliesPagerImpl>(() =>
      _i25.UseCaseCommentRepliesPagerImpl(
          get<_i16.CommentRepliesPagerRepository>()));
  gh.lazySingleton<_i26.UseCaseCommentThreadImpl>(
      () => _i26.UseCaseCommentThreadImpl(get<_i22.CommentThreadRepository>()));
  gh.lazySingleton<_i27.UseCaseCommentThreadPagerImpl>(() =>
      _i27.UseCaseCommentThreadPagerImpl(
          get<_i20.CommentThreadPagerRepository>()));
  gh.lazySingleton<_i28.FetchCommentsCubit>(() => _i28.FetchCommentsCubit(
        get<_i26.UseCaseCommentThreadImpl>(),
        get<_i27.UseCaseCommentThreadPagerImpl>(),
        get<_i24.UseCaseCommentRepliesImpl>(),
        get<_i25.UseCaseCommentRepliesPagerImpl>(),
      ));
  return get;
}

class _$RegisterModuleConnectionChecker
    extends _i29.RegisterModuleConnectionChecker {}
