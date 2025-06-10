class ObjectNotif {
  String head;
  String? id;
  String body;
  String image;
  ObjectNotif({
    required this.head,
    this.id,
    required this.body,
    required this.image,
  });
  factory ObjectNotif.fromJson(Map<String, dynamic> jason) {
    return ObjectNotif(
        head: jason["head"], image: jason["image"], body: jason["body"]);
  }
}
