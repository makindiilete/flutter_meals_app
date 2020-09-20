/* 
FractionallySizedBox
If you have a single widget you can use a FractionallySizedBox widget to specify a percentage of the available space to fill. Here the green Container is set to fill 70% of the available width and 30% of the available height.
 */

Widget myLayoutWidget() {
  return FractionallySizedBox(
    heightFactor: 0.3,
    widthFactor: 0.7,
    child: Container(
      color: Colors.green,
    ),
  );
}
