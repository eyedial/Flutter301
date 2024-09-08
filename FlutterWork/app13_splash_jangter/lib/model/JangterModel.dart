class JangterModel{
  final int id;
  final String title;
  final String? imgPath, content, address, created_at;
  final int? price, liked, chatting;
  // 생성자
  JangterModel({required this.id, this.imgPath, required this.title,
    this.content, this.price, this.address, this.liked, this.chatting,
    this.created_at});

  JangterModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      imgPath = json['imgPath'],
      title = json['title'],
      content = json['content'],
      price = json['price'],
      address = json['address'],
      liked = json['liked'],
      chatting = json['chatting'],
      created_at = json['created_at'];

}