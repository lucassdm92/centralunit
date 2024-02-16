import 'package:json_annotation/json_annotation.dart';

part 'UserData.g.dart';

@JsonSerializable(createToJson: true)
class StoreEntity{

   StoreEntity(this.storeName,this.storeDescription,this.storeLocation);

   @JsonKey()
   String storeName;
   @JsonKey()
   String storeDescription;
   @JsonKey()
   String storeLocation;

   factory StoreEntity.fromJson(Map<String, dynamic> json) => _$StoreEntityFromJson(json);

   Map<String, dynamic> toJson() => _$StoreEntityToJson(this);
}