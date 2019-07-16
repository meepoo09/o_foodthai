class UserModel {

  // field
   String id, name, user, pass;
  //Constructor
  UserModel(this.id,this.name,this.user,this.pass);
  UserModel.parseJson(Map<String, dynamic> parseJson){
    id=parseJson['id'];
    name=parseJson['name'];
    user=parseJson['user'];
    pass=parseJson['pass'];
    

  }
}