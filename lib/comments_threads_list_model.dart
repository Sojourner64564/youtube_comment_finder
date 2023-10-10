// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);
/*
class Welcome {
  final String kind;
  final String etag;
  final PageInfo pageInfo;
  final List<Item> items;

  Welcome({
    required this.kind,
    required this.etag,
    required this.pageInfo,
    required this.items,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    kind: json["kind"],
    etag: json["etag"],
    pageInfo: PageInfo.fromJson(json["pageInfo"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "pageInfo": pageInfo.toJson(),
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}
///-------------------------------------------------------------------------------------
class Item {
  final String kind;
  final String etag;
  final String id;
  final ItemSnippet snippet;
  final Replies replies;

  Item({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
    required this.replies,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: json["kind"],
    etag: json["etag"],
    id: json["id"],
    snippet: ItemSnippet.fromJson(json["snippet"]),
    replies: Replies.fromJson(json["replies"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "id": id,
    "snippet": snippet.toJson(),
    "replies": replies.toJson(),
  };
}
///-------------------------------------------------------------------------------------

class Replies {
  final List<Comment> comments;

  Replies({
    required this.comments,
  });

  factory Replies.fromJson(Map<String, dynamic> json) => Replies(
    comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
  };
}
///-------------------------------------------------------------------------------------

class Comment {
  final String kind;
  final String etag;
  final String id;
  final TopLevelCommentSnippet snippet;

  Comment({
    required this.kind,
    required this.etag,
    required this.id,
    required this.snippet,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    kind: json["kind"],
    etag: json["etag"],
    id: json["id"],
    snippet: TopLevelCommentSnippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind,
    "etag": etag,
    "id": id,
    "snippet": snippet.toJson(),
  };
}
///-------------------------------------------------------------------------------------

class TopLevelCommentSnippet {
  final String channelId;
  final String videoId;
  final String textDisplay;
  final String textOriginal;
  final String? parentId;
  final String authorDisplayName;
  final String authorProfileImageUrl;
  final String authorChannelUrl;
  final AuthorChannelId authorChannelId;
  final bool canRate;
  final String viewerRating;
  final int likeCount;
  final DateTime publishedAt;
  final DateTime updatedAt;

  TopLevelCommentSnippet({
    required this.channelId,
    required this.videoId,
    required this.textDisplay,
    required this.textOriginal,
    this.parentId,
    required this.authorDisplayName,
    required this.authorProfileImageUrl,
    required this.authorChannelUrl,
    required this.authorChannelId,
    required this.canRate,
    required this.viewerRating,
    required this.likeCount,
    required this.publishedAt,
    required this.updatedAt,
  });

  factory TopLevelCommentSnippet.fromJson(Map<String, dynamic> json) => TopLevelCommentSnippet(
    channelId: json["channelId"],
    videoId: json["videoId"],
    textDisplay: json["textDisplay"],
    textOriginal: json["textOriginal"],
    parentId: json["parentId"],
    authorDisplayName: json["authorDisplayName"],
    authorProfileImageUrl: json["authorProfileImageUrl"],
    authorChannelUrl: json["authorChannelUrl"],
    authorChannelId: AuthorChannelId.fromJson(json["authorChannelId"]),
    canRate: json["canRate"],
    viewerRating: json["viewerRating"],
    likeCount: json["likeCount"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "channelId": channelId,
    "videoId": videoId,
    "textDisplay": textDisplay,
    "textOriginal": textOriginal,
    "parentId": parentId,
    "authorDisplayName": authorDisplayName,
    "authorProfileImageUrl": authorProfileImageUrl,
    "authorChannelUrl": authorChannelUrl,
    "authorChannelId": authorChannelId.toJson(),
    "canRate": canRate,
    "viewerRating": viewerRating,
    "likeCount": likeCount,
    "publishedAt": publishedAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
///-------------------------------------------------------------------------------------

class AuthorChannelId {
  final String value;

  AuthorChannelId({
    required this.value,
  });

  factory AuthorChannelId.fromJson(Map<String, dynamic> json) => AuthorChannelId(
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
  };
}

class ItemSnippet {
  final String channelId;
  final String videoId;
  final Comment topLevelComment;
  final bool canReply;
  final int totalReplyCount;
  final bool isPublic;

  ItemSnippet({
    required this.channelId,
    required this.videoId,
    required this.topLevelComment,
    required this.canReply,
    required this.totalReplyCount,
    required this.isPublic,
  });

  factory ItemSnippet.fromJson(Map<String, dynamic> json) => ItemSnippet(
    channelId: json["channelId"],
    videoId: json["videoId"],
    topLevelComment: Comment.fromJson(json["topLevelComment"]),
    canReply: json["canReply"],
    totalReplyCount: json["totalReplyCount"],
    isPublic: json["isPublic"],
  );

  Map<String, dynamic> toJson() => {
    "channelId": channelId,
    "videoId": videoId,
    "topLevelComment": topLevelComment.toJson(),
    "canReply": canReply,
    "totalReplyCount": totalReplyCount,
    "isPublic": isPublic,
  };
}
///-------------------------------------------------------------------------------------

class PageInfo {
  final int totalResults;
  final int resultsPerPage;

  PageInfo({
    required this.totalResults,
    required this.resultsPerPage,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalResults: json["totalResults"],
    resultsPerPage: json["resultsPerPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults,
    "resultsPerPage": resultsPerPage,
  };
}
///-------------------------------------------------------------------------------------
*/