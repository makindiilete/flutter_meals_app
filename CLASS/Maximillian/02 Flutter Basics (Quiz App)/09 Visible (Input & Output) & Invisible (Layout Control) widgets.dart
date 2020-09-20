/*
Now we want to take our simple app further and build a quiz app so alongside the text we are displaying in the body, we want to display a couple of buttons.
Now we are facing an issue here, we can only pass one widget to the body and we already have a Text widget there, adding another maybe with comma or plus sign will throw an error.. So we need a way to sought this out and this leads us to the types of widgets we have..
VISIBLE WIDGET : - They are drawn onto the screen, they are what users interact with e.g. Text(), RaisedButtons(), Cards(), Container().
INVISIBLE WIDGET : - They give our app structure and control how visible widget are drawn onto the screen e.g. Row(), Column(), ListView(), Container()

Container() is a widget that belongs to both categories because it is invisible but then you can give it some styling.
*/
