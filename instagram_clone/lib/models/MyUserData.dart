/// id : 9
/// username : "zmin"
/// fullname : "ZMin"
/// bio : ""
/// profile_pic : "http://192.168.50.33:8000/media/avatar.png"
/// number_of_followers : 0
/// number_of_following : 0
/// number_of_posts : 1
/// user_posts : [{"id":"82ef0929-3b3c-4e52-b303-4844fd93062e","photo":"/media/uploads/e2534cc8-ad21-4dd3-be72-ae3a26d4df72.jpg","text":"","location":"","number_of_likes":0,"number_of_comments":0,"posted_on":"2022-01-20T03:22:55.511258Z"}]
/// followed_by_req_user : false

class MyUserData {
  MyUserData({
      int? id, 
      String? username, 
      String? fullname, 
      String? bio, 
      String? profilePic, 
      int? numberOfFollowers, 
      int? numberOfFollowing, 
      int? numberOfPosts, 
      List<User_posts>? userPosts, 
      bool? followedByReqUser,}){
    _id = id;
    _username = username;
    _fullname = fullname;
    _bio = bio;
    _profilePic = profilePic;
    _numberOfFollowers = numberOfFollowers;
    _numberOfFollowing = numberOfFollowing;
    _numberOfPosts = numberOfPosts;
    _userPosts = userPosts;
    _followedByReqUser = followedByReqUser;
}

  MyUserData.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _fullname = json['fullname'];
    _bio = json['bio'];
    _profilePic = json['profile_pic'];
    _numberOfFollowers = json['number_of_followers'];
    _numberOfFollowing = json['number_of_following'];
    _numberOfPosts = json['number_of_posts'];
    if (json['user_posts'] != null) {
      _userPosts = [];
      json['user_posts'].forEach((v) {
        _userPosts?.add(User_posts.fromJson(v));
      });
    }
    _followedByReqUser = json['followed_by_req_user'];
  }
  int? _id;
  String? _username;
  String? _fullname;
  String? _bio;
  String? _profilePic;
  int? _numberOfFollowers;
  int? _numberOfFollowing;
  int? _numberOfPosts;
  List<User_posts>? _userPosts;
  bool? _followedByReqUser;

  int? get id => _id;
  String? get username => _username;
  String? get fullname => _fullname;
  String? get bio => _bio;
  String? get profilePic => _profilePic;
  int? get numberOfFollowers => _numberOfFollowers;
  int? get numberOfFollowing => _numberOfFollowing;
  int? get numberOfPosts => _numberOfPosts;
  List<User_posts>? get userPosts => _userPosts;
  bool? get followedByReqUser => _followedByReqUser;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['fullname'] = _fullname;
    map['bio'] = _bio;
    map['profile_pic'] = _profilePic;
    map['number_of_followers'] = _numberOfFollowers;
    map['number_of_following'] = _numberOfFollowing;
    map['number_of_posts'] = _numberOfPosts;
    if (_userPosts != null) {
      map['user_posts'] = _userPosts?.map((v) => v.toJson()).toList();
    }
    map['followed_by_req_user'] = _followedByReqUser;
    return map;
  }

}

/// id : "82ef0929-3b3c-4e52-b303-4844fd93062e"
/// photo : "/media/uploads/e2534cc8-ad21-4dd3-be72-ae3a26d4df72.jpg"
/// text : ""
/// location : ""
/// number_of_likes : 0
/// number_of_comments : 0
/// posted_on : "2022-01-20T03:22:55.511258Z"

class User_posts {
  User_posts({
      String? id, 
      String? photo, 
      String? text, 
      String? location, 
      int? numberOfLikes, 
      int? numberOfComments, 
      String? postedOn,}){
    _id = id;
    _photo = photo;
    _text = text;
    _location = location;
    _numberOfLikes = numberOfLikes;
    _numberOfComments = numberOfComments;
    _postedOn = postedOn;
}

  User_posts.fromJson(dynamic json) {
    _id = json['id'];
    _photo = json['photo'];
    _text = json['text'];
    _location = json['location'];
    _numberOfLikes = json['number_of_likes'];
    _numberOfComments = json['number_of_comments'];
    _postedOn = json['posted_on'];
  }
  String? _id;
  String? _photo;
  String? _text;
  String? _location;
  int? _numberOfLikes;
  int? _numberOfComments;
  String? _postedOn;

  String? get id => _id;
  String? get photo => _photo;
  String? get text => _text;
  String? get location => _location;
  int? get numberOfLikes => _numberOfLikes;
  int? get numberOfComments => _numberOfComments;
  String? get postedOn => _postedOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['photo'] = _photo;
    map['text'] = _text;
    map['location'] = _location;
    map['number_of_likes'] = _numberOfLikes;
    map['number_of_comments'] = _numberOfComments;
    map['posted_on'] = _postedOn;
    return map;
  }

}