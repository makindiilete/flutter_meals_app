/*

CONST CONSTRUCTORS
You can prefix a constructor of a class with 'const' if all its arguments are final

CONST WIDGETS
Inside the widget tree, you can prefix a widget with 'const' if what it renders never changes after rebuilds e.g For our 'Text('Delete')' widget, this can be made const because we know the text will always be delete no matter what happens, so we can change it to 'const Text("Delete")' same goes for the delete icon. And this will not dramatically improve our app performance but its a good practice we can cultivate 'not' while developing our app but while reviewing our code before it goes to production.
*/