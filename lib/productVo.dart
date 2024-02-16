import 'package:json_annotation/json_annotation.dart';

part 'productVo.g.dart';

@JsonSerializable(createToJson: true)
class ProductVo{

  ProductVo(this.productName,this.productDescription,this.productQuantity,this.productAmount,this.productSize);

  @JsonKey()
  String productName;
  @JsonKey()
  String productDescription;
  @JsonKey()
  String productQuantity;
  @JsonKey()
  String productSize;
  @JsonKey()
  String productAmount;

  factory ProductVo.fromJson(Map<String, dynamic> json) => _$ProductVoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductVoToJson(this);
}