class MyUser {
  final String? uid;
  MyUser({this.uid});
}

class MyUserData {
  final String? userId;
  final String? email;
  final String? fullname;
  final String? username;
  final String? bio;
  final String? profile_pic;
  final List? following;
  final List? followers;

  MyUserData(
      {this.username,
      this.email,
      this.fullname,
      this.bio,
      this.profile_pic,
      this.userId,
      this.following,
      this.followers
      });

  factory MyUserData.fromJson(Map<String, dynamic> json) {
    return MyUserData(
      userId: json['id'],
      email: json['email'],
      fullname: json['fullname'],
      username: json['username'],
      bio: json['bio'],
      profile_pic: json['profile_pic'],
      // following: json['following'],
      // followers: json['followers'],
    );
  }

}
