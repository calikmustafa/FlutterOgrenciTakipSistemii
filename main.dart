import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/screens/student_add.dart';
import 'package:ogrenci_takip_sistemi/screens/student_edit.dart';
import 'package:ogrenci_takip_sistemi/students.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Student selectedStudent=Student.withId(0, "", "", 0);

  String mesaj = "";

  List<Student> students = [
    Student.withId(1,"Mustafa", "Çalık", 40),
    Student.withId(2,"Zeynep", "Çalık", 70),
    Student.withId(3,"Seher", "Çalık", 10)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Öğrenci Takip Sistemi"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://lh3.googleusercontent.com/a-/AOh14GjRi7d1BHOeJJ3-XIPf0koFoKLAR1r2Ga_zbPHG=s96-c-rg-br100"),
                    ),
                    onTap: () {
                      setState(() {
                        selectedStudent = students[index];
                      });
                    },
                    title: Text(students[index].firstName +
                        " " +
                        students[index].surname),
                    subtitle: Text("sınavdan aldığı not:" +
                        students[index].grade.toString() +
                        "[" +
                        students[index].getstatus +
                        "]"),
                    trailing: buildStatusIcon(students[index].grade),
                  );
                }),
          ),
          Text("Secili Öğrenci: "+selectedStudent.firstName),
          Row(
            children: <Widget>[
              Flexible(//yan yana parçalara bölerek butonlar eklememizi sağlıyor
                fit: FlexFit.tight,
                flex: 3,//ne kadar pay alacağını söyler yani ekranı 3 parçaya böldün 3 parçasını buna ver
                child:RaisedButton(
                  color: Colors.amberAccent,//butonumuzun rengini de ekledik.
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                      AlertDialog();
                    },
                    child: Row(//row ile yan yana ıcon ve text koyduk
                      children: [
                        Icon(Icons.add),//ıcon butonumuzu ekledik
                         SizedBox(width: 5.0,),
                        Text(" Yeni Ogrenci"),
                        
                        
                       
                        
                      ],
                    ),
                  ),
                
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child:RaisedButton(
                  color: Colors.red,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedStudent)));
                      
                    },
                    child: Row(
                      children: [ 
                         Icon(Icons.update),
                          SizedBox(width: 5.0,),
                        Text("Guncelle"),
                       
                       
                        
                      ],
                    ),
                    
                  ),
                
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child:RaisedButton(
                  color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        students.remove(selectedStudent);
                      });
                      var mesaj="silindi"+" "+selectedStudent.firstName+" "+selectedStudent.surname;
                      mesajGoster(context,mesaj);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete),
                        SizedBox(width: 5.0,),
                        Text("sil"),
                        
                        
                       
                      ],
                    ),
                  ),
                
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

Widget buildStatusIcon(int grade) {
  if (grade >= 50) {
    return Icon(Icons.done);
  } else if (grade >= 40) {
    return Icon(Icons.album);
  } else {
    return Icon(Icons.clear);
  }
}

String sinavHesapla(grade) {
  String mesaj = "";
  if (grade >= 50) {
    mesaj = "geçti";
  } else if (grade >= 40) {
    mesaj = "bütünlemeye kaldı";
  } else {
    mesaj = "kaldı";
  }
  return mesaj;
}

void mesajGoster(BuildContext context, String mesaj) {
  var alert = AlertDialog(
    title: Text("işlem sonucu"),
    content: Text(mesaj),
  );
  showDialog(context: context, builder: (BuildContext context) => alert);
}
