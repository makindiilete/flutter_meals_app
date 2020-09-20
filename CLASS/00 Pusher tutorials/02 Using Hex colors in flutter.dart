/* 
We want to use the color : "#d6e8f6"
So we only need to convert the string #d6e8f6 to an integer value. Also we need to respect that opacity always needs to be specified.
255 (full) opacity is represented by the hexadecimal value FF. This already leaves us with 0xFF. Now, we just need to append our color string like this:

const color = Color(0xffb74093);

OR

const color = const Color(0XFFb74093);
 */
