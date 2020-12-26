class Student{
int id;
String firstName;
String surname;
int grade;
String _status;
Student.withId(int id,String firstName,String surname,int grade){
  this.id=id;
  this.firstName=firstName;
  this.surname=surname;
  this.grade=grade;
}
Student(int id,String firstName,String surname,int grade){
  
  this.firstName=firstName;
  this.surname=surname;
  this.grade=grade;
}
Student.withoutInfo(){
  
}
String get getstatus{
String message="";
if(this.grade>=50){
  message="Geçti";
}
else if(this.grade>=40){
  message="bütünlemeye kaldı";
}
else{
  message="kaldı";
}
return message;


}


}