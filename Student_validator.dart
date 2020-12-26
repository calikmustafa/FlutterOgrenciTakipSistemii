class StudentValidationMixin{
  String validateFirstname(String value){
    if(value.length<2){
      return "isim en az 2 karakterolmalıdır";
    }
  }
  String validateSurname(String value){
    if(value.length<2){
      return "Soyad en az 2 karakter olmalıdır";
    }
  }
  String validateGrade(String value){
    var grade=int.parse(value);
    if(grade<0||grade>100){
      return "Not 0-100 arasında olmalıdır";
    }
  }
}