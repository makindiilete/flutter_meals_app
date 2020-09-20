/*
We will be learning some basics of dart in this module but we will not be writing it inside our main.dart file that we have cleared out. Instead we will be using an online service "dartpad" to learn dart "https://dartpad.dev/"

DART is a strongly typed programming language just like c# so all variables have their type at the front of the variable name
*/

//SAMPLE DART Function : - main() is the entry function of our app, ds fn is called when the app starts
void main() { //void : - D return type of the function, d fn returns ntin so d type is void
  for (int i = 0; i < 5; i++) { // d var i is integer so its type is int
    print('hello ${i + 1}');
  }
}

//Sample function 2
addNumbers(int num1, int num2){
  print(num1 + num2);
}

void main() {
  addNumbers(1,4);
  print("Hello");
}

/*
In dart, we have two types of numbers, integers and doubles.. Integers are whole numbers while doubles are number with decimal place, we then also have string for text.. So if we want to use a decimal number as part of the argument then we can rewrite the code as what we have below..
Our function need to have a return type also, it will be "void" if it returns nothing and if it returns something, it will take the type of the value its returning
*/

double addNumbers(int num1, double num2){
  // print(num1 + num2);
  return num1 + num2; //d function returns a double as return type
}

void main() {
  print(addNumbers(1,4.1)); //so here now we can call the function inside print() since it is returning a value
  print("Hello");
}




void addNumbers(int num1, int num2){
  print(num1 + num2);
}

void main() {
  addNumbers(1,4);
  print("Hello");
}


/*
We can also use another type "num" which takes both integer and double/decimal
*/

num addNumbers(num num1, num num2){
  // print(num1 + num2);
  return num1 + num2;
}

void main() {
  print(addNumbers(2,4.1));
  print("Hello");
}


