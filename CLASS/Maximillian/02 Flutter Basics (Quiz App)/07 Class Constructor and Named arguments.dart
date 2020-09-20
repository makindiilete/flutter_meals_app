
class Person{
  String firstName;
  int age;

  //construtor
  Person(String inputName, int inputAge){
    firstName = inputName;
    age = inputAge;
  }
}

void main() {
  var p1 = Person("Max", 30);
  print(p1.age);
  print(p1.firstName);
}

//Constructor with same name as the class fields
class Person{
  String firstName;
  int age;

  //construtor with default value
  Person({ String inputName, int age = 30}){
    firstName = inputName;
    this.age = age;
  }
}

void main() {
  var p1 = Person(inputName: "Mike");
  print(p1.age);
  print(p1.firstName);
}

//Named Argument
class Person{
  String firstName;
  int age;

  //construtor with Name arguments ({})
  Person({String inputName, int inputAge}){
    firstName = inputName;
    age = inputAge;
  }
}

void main() {
  //calling constructor params with Name arguments
  //Advantage : - For constructors with many args, we can arrange them in any order, they do not need to follow the order we have in the constuctor
  var p1 = Person(inputAge: 30, inputName: "Mike");  // return MaterialApp(home: Text("Hello!"),);
  print(p1.age);
  print(p1.firstName);
}

//MAKING A CONSTRUCTOR PARAMETER REQUIRED : - This is for flutter alone, dart does not understand this.
class Person{
  String firstName;
  int age;

  //construtor with Name arguments ({})
  Person({@required String inputName, @required int inputAge}){
    firstName = inputName;
    age = inputAge;
  }
}

void main() {
  //calling constructor params with Name arguments
  //Advantage : - For constructors with many args, we can arrange them in any order, they do not need to follow the order we have in the constuctor
  var p1 = Person(inputAge: 30, inputName: "Mike");
  print(p1.age);
  print(p1.firstName);
}


//CONSTRUCTOR WITH DEFAULT VALUE
class Person{
  String firstName;
  int age;

  //construtor with default value
  Person({ String inputName, int inputAge = 30}){
    firstName = inputName;
    age = inputAge;
  }
}

void main() {
  var p1 = Person(inputName: "Mike");
  print(p1.age);
  print(p1.firstName);
}


//CONSTRUCTOR WITH NO BODY
class Person{
  String firstName;
  int age;

  //construtor with no body
  Person({ this.firstName, this.age = 29});
}

void main() {
  var p1 = Person(firstName: "Mike");
  print(p1.age);
  print(p1.firstName);
}

