/* 
Dart does not have any built in date formatter which we can use to format our dates so we will be using a 3rd party package which will enable us to see how we can make use of 3rd party packages in our app...
1)  Search for 'flutter intl date format' or go to https://pub.dev/packages/intl
2)  On the "installing" tab, copy the "intl: ^0.16.1" and go to your pubspec.yaml file and in the same line as 'flutter', add what you copied, vs code tries to install it automatically and if this fails, you can install it manually with "flutter pub get"
3)  Now to format our date, we use it like this "DateFormat().format(tx.date)," ==> August 24, 2020 8:31:11 AM
4)  You can configure the date pattern manually: - 
 DateFormat('yyy/MM/dd').format(tx.date), ==> 2020/08/24
 DateFormat('yyy-MM-dd').format(tx.date), ==> 2020-08-24
5)  You can also choose from preconfigured patter : - 
DateFormat.yMMMd().format(tx.date), ==> Aug 24, 2020
DateFormat.yMMMMd().format(tx.date), ==> August 24, 2020

 */
