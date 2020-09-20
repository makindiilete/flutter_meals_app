/*
Both Final & Const look similar because they are both used for values that cannot be changed after they have been initialized but they both have their differences..

Const : - Value must be known before the code/app is compiled/launched e.g.
const dateOfBirth = "07/04/1991";
The value assigned cannot be changed after it has been initialized

Final : - Value is only known after the app has been compiled/launched e.g. The value will come from the database from the result of async operation like "componentDidMount()" in react
final dateOfBirth = getBirthDateFromDB();
The value assigned cannot be changed after it has been initialized

Final can both serve the purpose of both const and final and to avoid confusion it's better we stick to "final".
*/
