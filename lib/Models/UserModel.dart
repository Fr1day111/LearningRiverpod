

 class UserModel{
  final int id;
  final String email;
  final String fname;
  final String lname;
  final String avatar;

  UserModel(this.id, this.email, this.fname, this.lname, this.avatar);

  UserModel.fromMap(Map<String, dynamic> res):
    id= res['id'],
    email= res['email'],
    fname= res['first_name'],
    lname= res['last_name'],
    avatar= res['avatar'];

}