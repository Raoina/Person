import 'dart:io';

void main(List<String> arguments) {
  print("Data of person");
  Person p = Person("Raoina", 2019594350, "new miami", 20);
  p.printDataPerson();
  print("--------------------------------");
  Student s = Student(
      "Raoina", 11155, "new miami", 20, "roainareda@gmail.com", "01060930730");
  s.insertSubjects();
  print("Data of student");
  s.printDataStudent();
  print("--------------------------------");
  Students ss = Students();
  ss.addStudent(200, "Ali", 50);
  ss.addStudent(201, "Ahmed", 70);
  ss.addStudent(205, "Menna", 30);
  ss.addStudent(215, "Mona", 40);
  ss.addStudent(150, "Loly", 60);
  ss.removeStudentList(2);
  ss.removeStudentMap(205);
  ss.update(1, "May");
  ss.printDataList();
  ss.printDataMap();
  ss.calcuLateDegrees(150);
}

//class Person
class Person {
  //Data
  late String name;
  late int id;
  late String address;
  late int age;
  //constructor
  Person(this.name, this.id, this.address, this.age);
  //method print data of person
  void printDataPerson() {
    print("Your name : $name");
    print("Your ID : $id");
    print("Your address : $address");
    print("Your age : $age");
  }
}

//Class Student
class Student extends Person {
  //Data
  late String email;
  late String phoneNumber;
  Map subjects = {};
//Constructor
  Student(super.name, super.id, super.address, super.age, this.email,
      this.phoneNumber);
//method to insert subjects and thier degree
  insertSubjects() {
    loop:
    while (true) {
      print("Your options :");
      print("If you want add subject enter 1 ");
      print("If you want exit enter 2");
      int num = int.parse(stdin.readLineSync()!);
      switch (num) {
        case 1:
          {
            print("Enter name of subject :");
            String subjectName = stdin.readLineSync()!;
            print("Enter your degree in it :");
            int degree = int.parse(stdin.readLineSync()!);
            subjects[subjectName] = degree;
          }
          break;
        case 2:
          {
            print("exit");
          }
          break loop;
        default:
          print("invalid option , plz try again");
          break;
      }
    }
  }

//Method to print student data , subjects and his/her degree in each subjects
  printDataStudent() {
    print("Your name : $name");
    print("Your ID : $id");
    print("Your address : $address");
    print("Your age : $age");
    print("Your email : $email");
    print("Your phone number: $phoneNumber");
    print("Your subjects and his degree : $subjects");
  }
}

// Class Students
class Students {
  late int id;
  late String name;
  Map mapStudent = {};
  List listStudent = [];
  Students();
  addStudent(int id, String name, int degree) {
    listStudent.add(name);
    mapStudent[id] = degree;
  }

  removeStudentList(int id) {
    listStudent.removeAt(id);
  }

  removeStudentMap(int id) {
    mapStudent.remove([id]);
  }

  update(int id, String name) {
    listStudent[id] = name;
  }

  calcuLateDegrees(int id) {
    if (mapStudent[id] >= 50) {
      print("succeded");
    } else {
      print("Fail");
    }
  }

  printDataList() {
    print("List of NameStudent :$listStudent");
  }

  printDataMap() {
    print("Data Students : $mapStudent");
  }
}
