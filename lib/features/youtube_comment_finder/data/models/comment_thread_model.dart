import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/item_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/data/models/page_info_model.dart';
import 'package:youtube_comment_finder/features/youtube_comment_finder/domain/entitys/comment_thread_entity.dart';

class CommentThreadModel extends CommentThreadEntity{
  const CommentThreadModel({
    required String kind,
    required String etag,
    required PageInfoModel pageInfoModel,
    required List<ItemModel> items,
  }): super(
    kind: kind,
    etag: etag,
    p
  );

  factory CommentThreadModel.fromJson(Map<String, dynamic> json) => CommentThreadModel(
    kind: json["kind"],
    etag: json["etag"],
    pageInfoModel: PageInfoModel.fromJson(json["pageInfo"]),
    items: List<ItemModel>.from(json["items"].map((x) => ItemModel.fromJson(x))),
  );
}





class PokemonEntity {
  final String name;
  final int id;
  final List<TypesEntity> types;
  const PokemonEntity({
    required this.name,
    required this.id,
    required this.types,
  });
}


class TypesEntity {
  final TypeEntity type;
  const TypesEntity({
    required this.type,
  });
}
class TypeEntity {
  final String name;
  const TypeEntity({
    required this.name,
  });
}




class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required String name,
    required int id,
    required List<TypesModel> types,
  }) : super(
    name: name,
    id: id,
    types: types,
  );

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      name: json['kName'],
      id: json['kId'],
      types: TypesModel.fromJson(json['kTypes']),
    );
  }
}

class TypesModel extends TypesEntity {
  const TypesModel({
    required TypeModel type,
  }) : super(type: type);

  static List<TypesModel> fromJson(List<dynamic> jsonList) {
    List<TypesModel> returnedList = [];
    for (Map<String, dynamic> json in jsonList) {
      returnedList.add(
        TypesModel(
          type: TypeModel.fromJson(json['kType']),
        ),
      );
    }
    return returnedList;
  }

  Map<String, dynamic> toJson() {
    return {
      'kType': type,
    };
  }
}

class TypeModel extends TypeEntity {
  const TypeModel({
    required String name,
  }) : super(name: name);

  static TypeModel fromJson(Map<String, dynamic> json) {
    return TypeModel(
      name: json['kName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kName': name,
    };
  }
}









