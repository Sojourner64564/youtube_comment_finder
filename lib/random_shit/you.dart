// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class NoCommentThreadModel extends Equatable {
  final String kind;
  final String etag;
  final String nextPageToken;
  final PageInfo pageInfo;
  final List<Items> items;
  const NoCommentThreadModel({
    this.kind = '',
    this.etag = '',
    this.nextPageToken = '',
    this.pageInfo = const PageInfo(),
    this.items = const [],
  });


  factory NoCommentThreadModel.fromMap(Map<String, dynamic> map) {
    print('commentThread');
    return NoCommentThreadModel(
      kind: map['kind'] as String,
      etag: map['etag'] as String,
        nextPageToken: map['nextPageToken'] as String? ?? '',
      pageInfo: PageInfo.fromMap(map['pageInfo'] as Map<String, dynamic>),
      items: List<Items>.from(
        (map['items'] as List<dynamic>).map<Items>(
          (x) => Items.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  factory NoCommentThreadModel.fromJson(String source) =>
      NoCommentThreadModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [kind, etag, pageInfo, items];
}

class Items extends Equatable {
  final String kind;
  final String etag;
  final String id;
  final ItemsSnippet snippet;
  final Replies replies;
  const Items({
    this.kind = '',
    this.etag = '',
    this.id = '',
    this.snippet = const ItemsSnippet(),
    this.replies = const Replies(),
  });

  Items copyWith({
    String? kind,
    String? etag,
    String? id,
    ItemsSnippet? snippet,
    Replies? replies,
  }) {
    return Items(
      kind: kind ?? this.kind,
      etag: etag ?? this.etag,
      id: id ?? this.id,
      snippet: snippet ?? this.snippet,
      replies: replies ?? this.replies,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kind': kind,
      'etag': etag,
      'id': id,
      'snippet': snippet.toMap(),
      'replies': replies.toMap(),
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    print('items');
    return Items(
      kind: map['kind'] as String,
      etag: map['etag'] as String,
      id: map['id'] as String,
      snippet: ItemsSnippet.fromMap(map['snippet'] as Map<String, dynamic>),
      replies: Replies.fromMap(map['replies'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) =>
      Items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      kind,
      etag,
      id,
      snippet,
      replies,
    ];
  }
}

class Replies extends Equatable {
  final List<TopLevelComment> comments;
  const Replies({
    this.comments = const [],
  });

  Replies copyWith({
    List<TopLevelComment>? comments,
  }) {
    return Replies(
      comments: comments ?? this.comments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'comments': comments.map((x) => x.toMap()).toList(),
    };
  }

  factory Replies.fromMap(Map<String, dynamic> map) {
    print('replies');
    return Replies(
      comments: List<TopLevelComment>.from(
        (map['comments'] as List<int>).map<TopLevelComment>(
          (x) => TopLevelComment.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Replies.fromJson(String source) =>
      Replies.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [comments];
}

class ItemsSnippet extends Equatable {
  final String channelId;
  final String videoId;
  final String textDisplay;
  final String textOriginal;
  final String parentId;
  final String authorDisplayName;
  final String authorProfileImageUrl;
  final String authorChannelUrl;
  final AuthorChannelId authorChannelId;
  final bool canRate;
  final String viewerRating;
  final int likeCount;
  final String publishedAt;
  final String updatedAt;
  const ItemsSnippet({
    this.channelId = '',
    this.videoId = '',
    this.textDisplay = '',
    this.textOriginal = '',
    this.parentId = '',
    this.authorDisplayName = '',
    this.authorProfileImageUrl = '',
    this.authorChannelUrl = '',
    this.authorChannelId = const AuthorChannelId(),
    this.canRate = false,
    this.viewerRating = '',
    this.likeCount = 0,
    this.publishedAt = '',
    this.updatedAt = '',
  });

  ItemsSnippet copyWith({
    String? channelId,
    String? videoId,
    String? textDisplay,
    String? textOriginal,
    String? parentId,
    String? authorDisplayName,
    String? authorProfileImageUrl,
    String? authorChannelUrl,
    AuthorChannelId? authorChannelId,
    bool? canRate,
    String? viewerRating,
    int? likeCount,
    String? publishedAt,
    String? updatedAt,
  }) {
    return ItemsSnippet(
      channelId: channelId ?? this.channelId,
      videoId: videoId ?? this.videoId,
      textDisplay: textDisplay ?? this.textDisplay,
      textOriginal: textOriginal ?? this.textOriginal,
      parentId: parentId ?? this.parentId,
      authorDisplayName: authorDisplayName ?? this.authorDisplayName,
      authorProfileImageUrl:
          authorProfileImageUrl ?? this.authorProfileImageUrl,
      authorChannelUrl: authorChannelUrl ?? this.authorChannelUrl,
      authorChannelId: authorChannelId ?? this.authorChannelId,
      canRate: canRate ?? this.canRate,
      viewerRating: viewerRating ?? this.viewerRating,
      likeCount: likeCount ?? this.likeCount,
      publishedAt: publishedAt ?? this.publishedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'channelId': channelId,
      'videoId': videoId,
      'textDisplay': textDisplay,
      'textOriginal': textOriginal,
      'parentId': parentId,
      'authorDisplayName': authorDisplayName,
      'authorProfileImageUrl': authorProfileImageUrl,
      'authorChannelUrl': authorChannelUrl,
      'authorChannelId': authorChannelId.toMap(),
      'canRate': canRate,
      'viewerRating': viewerRating,
      'likeCount': likeCount,
      'publishedAt': publishedAt,
      'updatedAt': updatedAt,
    };
  }

  factory ItemsSnippet.fromMap(Map<String, dynamic> map) {
    return ItemsSnippet(
      channelId: map['channelId'] as String,
      videoId: map['videoId'] as String,
      textDisplay: map['textDisplay'] as String,
      textOriginal: map['textOriginal'] as String,
      parentId: map['parentId'] as String,
      authorDisplayName: map['authorDisplayName'] as String,
      authorProfileImageUrl: map['authorProfileImageUrl'] as String,
      authorChannelUrl: map['authorChannelUrl'] as String,
      authorChannelId: AuthorChannelId.fromMap(
          map['authorChannelId'] as Map<String, dynamic>),
      canRate: map['canRate'] as bool,
      viewerRating: map['viewerRating'] as String,
      likeCount: map['likeCount'] as int,
      publishedAt: map['publishedAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsSnippet.fromJson(String source) =>
      ItemsSnippet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      channelId,
      videoId,
      textDisplay,
      textOriginal,
      parentId,
      authorDisplayName,
      authorProfileImageUrl,
      authorChannelUrl,
      authorChannelId,
      canRate,
      viewerRating,
      likeCount,
      publishedAt,
      updatedAt,
    ];
  }
}

class Snippet extends Equatable {
  final String channelId;
  final String videoId;
  final TopLevelComment topLevelComment;
  final bool canReply;
  final int totalReplyCount;
  final bool isPublic;
  const Snippet({
    this.channelId = '',
    this.videoId = '',
    this.topLevelComment = const TopLevelComment(),
    this.canReply = false,
    this.totalReplyCount = 0,
    this.isPublic = false,
  });

  Snippet copyWith({
    String? channelId,
    String? videoId,
    TopLevelComment? topLevelComment,
    bool? canReply,
    int? totalReplyCount,
    bool? isPublic,
  }) {
    return Snippet(
      channelId: channelId ?? this.channelId,
      videoId: videoId ?? this.videoId,
      topLevelComment: topLevelComment ?? this.topLevelComment,
      canReply: canReply ?? this.canReply,
      totalReplyCount: totalReplyCount ?? this.totalReplyCount,
      isPublic: isPublic ?? this.isPublic,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'channelId': channelId,
      'videoId': videoId,
      'topLevelComment': topLevelComment.toMap(),
      'canReply': canReply,
      'totalReplyCount': totalReplyCount,
      'isPublic': isPublic,
    };
  }

  factory Snippet.fromMap(Map<String, dynamic> map) {
    return Snippet(
      channelId: map['channelId'] as String,
      videoId: map['videoId'] as String,
      topLevelComment: TopLevelComment.fromMap(
          map['topLevelComment'] as Map<String, dynamic>),
      canReply: map['canReply'] as bool,
      totalReplyCount: map['totalReplyCount'] as int,
      isPublic: map['isPublic'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Snippet.fromJson(String source) =>
      Snippet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      channelId,
      videoId,
      topLevelComment,
      canReply,
      totalReplyCount,
      isPublic,
    ];
  }
}

class TopLevelComment extends Equatable {
  final String kind;
  final String etag;
  final String id;
  final TopLvlSnippet snippet;
  const TopLevelComment({
    this.kind = '',
    this.etag = '',
    this.id = '',
    this.snippet = const TopLvlSnippet(),
  });

  TopLevelComment copyWith({
    String? kind,
    String? etag,
    String? id,
    TopLvlSnippet? snippet,
  }) {
    return TopLevelComment(
      kind: kind ?? this.kind,
      etag: etag ?? this.etag,
      id: id ?? this.id,
      snippet: snippet ?? this.snippet,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'kind': kind,
      'etag': etag,
      'id': id,
      'snippet': snippet.toMap(),
    };
  }

  factory TopLevelComment.fromMap(Map<String, dynamic> map) {
    return TopLevelComment(
      kind: map['kind'] as String,
      etag: map['etag'] as String,
      id: map['id'] as String,
      snippet: TopLvlSnippet.fromMap(map['snippet'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TopLevelComment.fromJson(String source) =>
      TopLevelComment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [kind, etag, id, snippet];
}

class TopLvlSnippet extends Equatable {
  final String channelId;
  final String videoId;
  final String textDisplay;
  final String textOriginal;
  final String authorDisplayName;
  final String authorProfileImageUrl;
  final String authorChannelUrl;
  final AuthorChannelId authorChannelId;
  final bool canRate;
  final String viewerRating;
  final int likeCount;
  final String publishedAt;
  final String updatedAt;
  const TopLvlSnippet({
    this.channelId = '',
    this.videoId = '',
    this.textDisplay = '',
    this.textOriginal = '',
    this.authorDisplayName = '',
    this.authorProfileImageUrl = '',
    this.authorChannelUrl = '',
    this.authorChannelId = const AuthorChannelId(),
    this.canRate = false,
    this.viewerRating = '',
    this.likeCount = 0,
    this.publishedAt = '',
    this.updatedAt = '',
  });

  TopLvlSnippet copyWith({
    String? channelId,
    String? videoId,
    String? textDisplay,
    String? textOriginal,
    String? authorDisplayName,
    String? authorProfileImageUrl,
    String? authorChannelUrl,
    AuthorChannelId? authorChannelId,
    bool? canRate,
    String? viewerRating,
    int? likeCount,
    String? publishedAt,
    String? updatedAt,
  }) {
    return TopLvlSnippet(
      channelId: channelId ?? this.channelId,
      videoId: videoId ?? this.videoId,
      textDisplay: textDisplay ?? this.textDisplay,
      textOriginal: textOriginal ?? this.textOriginal,
      authorDisplayName: authorDisplayName ?? this.authorDisplayName,
      authorProfileImageUrl:
          authorProfileImageUrl ?? this.authorProfileImageUrl,
      authorChannelUrl: authorChannelUrl ?? this.authorChannelUrl,
      authorChannelId: authorChannelId ?? this.authorChannelId,
      canRate: canRate ?? this.canRate,
      viewerRating: viewerRating ?? this.viewerRating,
      likeCount: likeCount ?? this.likeCount,
      publishedAt: publishedAt ?? this.publishedAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'channelId': channelId,
      'videoId': videoId,
      'textDisplay': textDisplay,
      'textOriginal': textOriginal,
      'authorDisplayName': authorDisplayName,
      'authorProfileImageUrl': authorProfileImageUrl,
      'authorChannelUrl': authorChannelUrl,
      'authorChannelId': authorChannelId.toMap(),
      'canRate': canRate,
      'viewerRating': viewerRating,
      'likeCount': likeCount,
      'publishedAt': publishedAt,
      'updatedAt': updatedAt,
    };
  }

  factory TopLvlSnippet.fromMap(Map<String, dynamic> map) {
    return TopLvlSnippet(
      channelId: map['channelId'] as String,
      videoId: map['videoId'] as String,
      textDisplay: map['textDisplay'] as String,
      textOriginal: map['textOriginal'] as String,
      authorDisplayName: map['authorDisplayName'] as String,
      authorProfileImageUrl: map['authorProfileImageUrl'] as String,
      authorChannelUrl: map['authorChannelUrl'] as String,
      authorChannelId: AuthorChannelId.fromMap(
          map['authorChannelId'] as Map<String, dynamic>),
      canRate: map['canRate'] as bool,
      viewerRating: map['viewerRating'] as String,
      likeCount: map['likeCount'] as int,
      publishedAt: map['publishedAt'] as String,
      updatedAt: map['updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TopLvlSnippet.fromJson(String source) =>
      TopLvlSnippet.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      channelId,
      videoId,
      textDisplay,
      textOriginal,
      authorDisplayName,
      authorProfileImageUrl,
      authorChannelUrl,
      authorChannelId,
      canRate,
      viewerRating,
      likeCount,
      publishedAt,
      updatedAt,
    ];
  }
}

class AuthorChannelId extends Equatable {
  final String value;
  const AuthorChannelId({
    this.value = '',
  });

  AuthorChannelId copyWith({
    String? value,
  }) {
    return AuthorChannelId(
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
    };
  }

  factory AuthorChannelId.fromMap(Map<String, dynamic> map) {
    return AuthorChannelId(
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthorChannelId.fromJson(String source) =>
      AuthorChannelId.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [value];
}

class PageInfo extends Equatable {
  final int totalResults;
  final int resultsPerPage;
  const PageInfo({
    this.totalResults = 0,
    this.resultsPerPage = 0,
  });

  PageInfo copyWith({
    int? totalResults,
    int? resultsPerPage,
  }) {
    return PageInfo(
      totalResults: totalResults ?? this.totalResults,
      resultsPerPage: resultsPerPage ?? this.resultsPerPage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalResults': totalResults,
      'resultsPerPage': resultsPerPage,
    };
  }

  factory PageInfo.fromMap(Map<String, dynamic> map) {
    return PageInfo(
      totalResults: map['totalResults'] as int,
      resultsPerPage: map['resultsPerPage'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory PageInfo.fromJson(String source) =>
      PageInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [totalResults, resultsPerPage];
}
