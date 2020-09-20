/* 
The Expanded widget can take a flex parameter. This is useful for giving size weights to the children. For example, here are two Containers in a row. The first one takes up 30% of the row and the second one takes up 70%.

flex : 10 is the highest
flex: 1 is the lowest
 */

Widget myLayoutWidget() {
  return Row(
    children: [
      Expanded(
          flex: 3,
          child: Container(
            color: Colors.green,
          )),
      Expanded(
          flex: 7,
          child: Container(
            color: Colors.teal,
          )),
    ],
  );
}
