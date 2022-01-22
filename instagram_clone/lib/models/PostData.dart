/// id : "07b98a39-d6fa-449b-91e7-d8aee171831c"
/// author : {"username":"zmin","profile_pic":"http://192.168.50.33:8000/media/avatar.png"}
/// photo : "http://192.168.50.33:8000/media/uploads/9dfdecc1-893a-4eca-a5c3-2c52d449c6db.jpg"
/// text : "Heyheyy"
/// location : ""
/// posted_on : "2022-01-20T04:01:11.943853Z"
/// number_of_likes : 0
/// number_of_comments : 1
/// post_comments : [{"id":2,"author":{"username":"zmin","profile_pic":"/media/avatar.png"},"text":"Helloooooo","posted_on":"2022-01-20T04:09:26.590875Z"}]
/// liked_by_req_user : false

class PostData {
  PostData({
      String? id, 
      PostAuthor? author,
      String? photo, 
      String? text, 
      String? location, 
      String? postedOn, 
      int? numberOfLikes, 
      int? numberOfComments, 
      List<Post_comments>? postComments, 
      bool? likedByReqUser,}){
    _id = id;
    _author = author;
    _photo = photo;
    _text = text;
    _location = location;
    _postedOn = postedOn;
    _numberOfLikes = numberOfLikes;
    _numberOfComments = numberOfComments;
    _postComments = postComments;
    _likedByReqUser = likedByReqUser;
}

  PostData.fromJson(dynamic json) {
    _id = json['id'];
    _author = json['author'] != null ? PostAuthor.fromJson(json['author']) : null;
    _photo = json['photo'];
    _text = json['text'];
    _location = json['location'];
    _postedOn = json['posted_on'];
    _numberOfLikes = json['number_of_likes'];
    _numberOfComments = json['number_of_comments'];
    if (json['post_comments'] != null) {
      _postComments = [];
      json['post_comments'].forEach((v) {
        _postComments?.add(Post_comments.fromJson(v));
      });
    }
    _likedByReqUser = json['liked_by_req_user'];
  }
  String? _id;
  PostAuthor? _author;
  String? _photo;
  String? _text;
  String? _location;
  String? _postedOn;
  int? _numberOfLikes;
  int? _numberOfComments;
  List<Post_comments>? _postComments;
  bool? _likedByReqUser;

  String? get id => _id;
  PostAuthor? get author => _author;
  String? get photo => _photo;
  String? get text => _text;
  String? get location => _location;
  String? get postedOn => _postedOn;
  int? get numberOfLikes => _numberOfLikes;
  int? get numberOfComments => _numberOfComments;
  List<Post_comments>? get postComments => _postComments;
  bool? get likedByReqUser => _likedByReqUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_author != null) {
      map['author'] = _author?.toJson();
    }
    map['photo'] = _photo;
    map['text'] = _text;
    map['location'] = _location;
    map['posted_on'] = _postedOn;
    map['number_of_likes'] = _numberOfLikes;
    map['number_of_comments'] = _numberOfComments;
    if (_postComments != null) {
      map['post_comments'] = _postComments?.map((v) => v.toJson()).toList();
    }
    map['liked_by_req_user'] = _likedByReqUser;
    return map;
  }

}

/// id : 2
/// author : {"username":"zmin","profile_pic":"/media/avatar.png"}
/// text : "Helloooooo"
/// posted_on : "2022-01-20T04:09:26.590875Z"

class Post_comments {
  Post_comments({
      int? id, 
      PostAuthor? author,
      String? text, 
      String? postedOn,}){
    _id = id;
    _author = author;
    _text = text;
    _postedOn = postedOn;
}

  Post_comments.fromJson(dynamic json) {
    _id = json['id'];
    _author = json['author'] != null ? PostAuthor.fromJson(json['author']) : null;
    _text = json['text'];
    _postedOn = json['posted_on'];
  }
  int? _id;
  PostAuthor? _author;
  String? _text;
  String? _postedOn;

  int? get id => _id;
  PostAuthor? get author => _author;
  String? get text => _text;
  String? get postedOn => _postedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_author != null) {
      map['author'] = _author?.toJson();
    }
    map['text'] = _text;
    map['posted_on'] = _postedOn;
    return map;
  }

}

/// username : "zmin"
/// profile_pic : "/media/avatar.png"

class PostAuthor {
  PostAuthor({
      String? username, 
      String? profilePic,}){
    _username = username;
    _profilePic = profilePic;
}

  PostAuthor.fromJson(dynamic json) {
    _username = json['username'];
    _profilePic = json['profile_pic'];
  }
  String? _username;
  String? _profilePic;

  String? get username => _username;
  String? get profilePic => _profilePic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['profile_pic'] = _profilePic;
    return map;
  }

}

/// username : "zmin"
/// profile_pic : "http://192.168.50.33:8000/media/avatar.png"

class CommentAuthor {
  CommentAuthor({
      String? username, 
      String? profilePic,}){
    _username = username;
    _profilePic = profilePic;
}

  CommentAuthor.fromJson(dynamic json) {
    _username = json['username'];
    _profilePic = json['profile_pic'];
  }
  String? _username;
  String? _profilePic;

  String? get username => _username;
  String? get profilePic => _profilePic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['profile_pic'] = _profilePic;
    return map;
  }

}