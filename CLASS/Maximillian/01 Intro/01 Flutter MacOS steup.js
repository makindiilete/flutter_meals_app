/*
1)  Download the flutter.zip file from "https://flutter.dev/docs/get-started/install/macos", if you are on macos 10.13.6, ensure you download flutter 1.0.0.
2)  Extract it into a directory
3)  Next we need to add flutter to our environment path so we can run the command from terminal, Navigate into the directory where you have the flutter extracted to from the terminal.
4)  Next run "pwd" (Present working dir) in the terminal to get the dir location info e.g. /Users/michaelzomoakin/Desktop/Dev/Flutter
5)  Now refactor the path to "export PATH=/Users/michaelzomoakin/Desktop/Dev/Flutter/bin:$PATH"
6) In the terminal, run "cd" to go back to home dir
7)  Run "ls -la" in your terminal and check if you have ".bash_profile"
8)  Run "vim .bash_profile" this will create the bash profile if the file does not exist
9)  On the next screen, press I on your keyboard to insert something, go up and press enter to add a space above the export statement you are seeing there.
10) Now paste the "export PATH=/Users/michaelzomoakin/Desktop/Dev/Flutter/bin:$PATH"
11) Now Press "Esc" then run ":wq"
12) Close your terminal and reopened it
13) Now type "flutt" and hit tab,if it auto completes it to "flutter", JOB DONE
14) Now run "flutter doctor" and it checks if your system meets all required for flutter to run, install all recommendations.
15) Now Run the command "open -a simulator" to start ios simulator
16) After starting the simulator, open terminal in your project folder and run "flutter run" to launch the app in your simulator

CREATING A PROJECT
1)  From the dir where you want the project to be created, run "flutter create project_name" no dash allowed or space only underscore.
*/
