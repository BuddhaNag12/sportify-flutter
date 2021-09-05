/* 
  --------------
  custom Throwable Exceptions for handling firebase auth
  Todo: need Modifications
  --------------

*/


class NotFoundError implements Exception{
  String errMsg() => 'No Details Found'; 
}
class InvalidEmail implements Exception{
  String errMsg() => 'Email Should be a valid email'; 
}
class UserNotFound implements Exception{
  String errMsg() => 'No users registered for the given email'; 
}
class WrongPassword implements Exception{
  String errMsg() => 'Please Provide a valid password'; 
}
class WeakPassword implements Exception{
  String errMsg() => 'Please Provide A strong password with minimum 8 characters'; 
}
class EmailExist implements Exception{
  String errMsg() => 'Please provide an unique email'; 
}
