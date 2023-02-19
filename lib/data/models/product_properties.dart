import 'package:jubelio/domain/entities/product_properties.dart';

class AttributeModel {
  AttributeModel({
    this.id,
    this.name,
    this.position,
    this.visible,
    this.variation,
    this.options,
  });

  int? id;
  String? name;
  int? position;
  bool? visible;
  bool? variation;
  List<String>? options;

  factory AttributeModel.fromJson(Map<String, dynamic> json) => AttributeModel(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        visible: json["visible"],
        variation: json["variation"],
        options: json["options"] != null
            ? List<String>.from(json["options"].map((x) => x))
            : null,
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "visible": visible,
        "variation": variation,
        "options":
            options != null ? List<dynamic>.from(options!.map((x) => x)) : null,
      };

  Attribute toEntity() => Attribute(
        id: id,
        name: name,
        position: position,
        visible: visible,
        variation: variation,
        options: options,
      );
}

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.slug,
  });

  int? id;
  String? name;
  String? slug;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };

  Category toEntity() => Category(
        id: id,
        name: name,
        slug: slug,
      );
}

class DefaultAttributeModel {
  DefaultAttributeModel({
    this.id,
    this.name,
    this.option,
  });

  int? id;
  String? name;
  String? option;

  factory DefaultAttributeModel.fromJson(Map<String, dynamic> json) =>
      DefaultAttributeModel(
        id: json["id"],
        name: json["name"],
        option: json["option"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "option": option,
      };

  DefaultAttribute toEntity() => DefaultAttribute(
        id: id,
        name: name,
        option: option,
      );
}

class DimensionsModel {
  DimensionsModel({
    this.length,
    this.width,
    this.height,
  });

  String? length;
  String? width;
  String? height;

  factory DimensionsModel.fromJson(Map<String?, dynamic> json) =>
      DimensionsModel(
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String?, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
      };

  Dimensions toEntity() => Dimensions(
        length: length,
        width: width,
        height: height,
      );
}

class ImageModel {
  ImageModel({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  factory ImageModel.fromJson(Map<String?, dynamic> json) => ImageModel(
        id: json["id"],
        dateCreated: DateTime.parse(json["date_created"]),
        dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
        dateModified: DateTime.parse(json["date_modified"]),
        dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
      };

  ImageProduct toEntity() => ImageProduct(
        id: id,
        dateCreated: dateCreated,
        dateCreatedGmt: dateCreatedGmt,
        dateModified: dateModified,
        dateModifiedGmt: dateModifiedGmt,
        src: src,
        name: name,
        alt: alt,
      );
}

class LinksModel {
  LinksModel({
    this.self,
    this.collection,
  });

  List<CollectionModel>? self;
  List<CollectionModel>? collection;

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
        self: List<CollectionModel>.from(
            json["self"].map((x) => CollectionModel.fromJson(x))),
        collection: List<CollectionModel>.from(
            json["collection"].map((x) => CollectionModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self != null
            ? List<dynamic>.from(self!.map((x) => x.toJson()))
            : null,
        "collection": collection != null
            ? List<dynamic>.from(collection!.map((x) => x.toJson()))
            : null,
      };

  Links toEntity() => Links(
        self: self!.map((e) => e.toEntity()).toList(),
        collection: collection!.map((e) => e.toEntity()).toList(),
      );
}

class CollectionModel {
  CollectionModel({
    this.href,
  });

  String? href;

  factory CollectionModel.fromJson(Map<String, dynamic> json) =>
      CollectionModel(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };

  Collection toEntity() => Collection(
        href: href,
      );
}

class MetaDataModel {
  MetaDataModel({
    this.id,
    this.key,
    this.value,
  });

  int? id;
  String? key;
  String? value;

  factory MetaDataModel.fromJson(Map<String, dynamic> json) => MetaDataModel(
        id: json["id"],
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };

  MetaData toEntity() => MetaData(
        id: id,
        key: key,
        value: value,
      );
}
