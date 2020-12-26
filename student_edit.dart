

import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/students.dart';
import 'package:ogrenci_takip_sistemi/validation/Student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student selectedStudent;
  StudentEdit( Student selectedStudent){//consturactor oluşturarak parametreyle verileri almamı sağladım
    this.selectedStudent=selectedStudent;
  }
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState(selectedStudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
  //bu clasımızın fonkisyonlarımızı kullansın demek with i hangi sınıfa uygularsan çağırırsın
  Student selectedStudent;
  _StudentAddState(Student selectedStudent){
    this.selectedStudent=selectedStudent;
  }
  
  var formKey=GlobalKey<FormState>();//formstate için bir tane anahtar üret ki formların bilgilerine ulaşabileyim
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(" Yeni Öğrenci Ekle"),
        ),
        body: Container(
          margin: EdgeInsets.all(20), //her tarafdan boşluk bırak demek
          child: Form(
            //form yapıcaz
            key: formKey,//formla ilgili bilgileri alabilmek için tanımladık

            child: Column(
              //alt alta olucak bu formlar
              children: <Widget>[
                buildFirstNameField(),
                buildLastNameField(),
                buildGradeField(),
                buildSubmitButton(),
              ],
            ),
          ),
        ));
  }

  Widget buildFirstNameField() {
    return TextFormField(
      //kullanıcıdan input almak için textler koyduk
      decoration: InputDecoration(
        //tekformField'lerin özelliklerini kullanmak için InputDecoretion kullanmak zorundasın
        labelText: "Öğrenci Adı", //girilecek alan
        hintText: "Engin", //ipucu alanı
      ),
      validator: validateFirstname, //alana girilecek verinin formatının uygunluğudur örnek:girilecek isim 20 karakterden fazla olmasın
      onSaved: (String value) {//formu kaydettiğimiz tuşuna bastığımızda formdaki bütün onsavedleri tetiklemiş olucaz ve student nesnesini doldurmuş olucak bu şekilde
        selectedStudent.firstName = value; //girilen değeri student nesnemizin firstnamine aktar dedik.
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: "Öğrenci Soyadı", hintText: "demiroğ"),
      validator: validateSurname,
      onSaved: (String value) {
        selectedStudent.surname = value;
      },
    );
  }

  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "aldığı not", hintText: "65"),
      validator: validateGrade,
      onSaved: (String value) {
        selectedStudent.grade = int.parse(value);
      },
    );
  }

  Widget buildSubmitButton() {
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: () {
        if(formKey.currentState.validate()){//validate oluyorsa yani kullanıcı herşeyi doğru yazmışsa 
          formKey.currentState.save();//save butonlarının hepsini çalıştır.
          
          Navigator.pop(context);//bir önceki sayfaya git demek
        }
      },
    );
  }
}
