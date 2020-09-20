/*
VARIABLES
We can declare a variable with the keyword "var" or using its type explicitly. Its a good practice to use "var" because dart can always detect the type of the variable.
*/

//VAR KEYWORD
int addNumbers(int num1, int num2){
  // print(num1 + num2);
  return num1 + num2;
}

void main() {
  var firstResult = addNumbers(2,4); //declaring variable with the word "var"
  firstResult = addNumbers(45, 23);
  print(firstResult);
}

//VARIABLE WITH TYPE
int addNumbers(int num1, int num2){
  // print(num1 + num2);
  return num1 + num2;
}

void main() {
  int firstResult = addNumbers(2,4);
  firstResult = addNumbers(45, 23);
  print(firstResult);
}

/*if u are initializing a variable without a value then you need to put the type it will accept and not "var"*/
int addNumbers(int num1, int num2){
  // print(num1 + num2);
  return num1 + num2;
}

void main() {
  int firstResult;
  firstResult = addNumbers(45, 23);
  print(firstResult);
}

/*
CREATING AN OBJECT AND INITIALISING THE OBJECT AND ITS PROPERTIES : - Just like C#, we actually do not have "object" as a type like we do in javascript but we call object "CLASS", the same way we have in C# and we create object using the class keyword
*/

//U create an object using the "class" keyword
class Person {
  var name = "Michaelz";
  var age = 29;
}

void main() {
//var p1 = new Person(); //u can initialise Person object with the "new" keyword or just "Person()"
  var p1 = Person();
  var p2 = Person();
  p2.name = "Mayowa"; //assigning a new value to p2
  print(p1.name);
  print(p2.name);
}

