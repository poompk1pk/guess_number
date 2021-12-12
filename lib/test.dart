
import 'dart:io';
import 'dart:math';

/**
 * Created by PoomPK
 */
void main() {

  print('Guess the Number! just type the number in range 0-100.');

  // seed for random
  var seed = 'a#d@i~F_!'.hashCode;
  var r = new Random(seed);

  // bypass answer is 59
  var answer = r.nextInt(101);
  var count = 0;

  for(;;) {

    stdout.write("\nInput the number to guess: ");

    try {
      var iGuess = stdin.readLineSync();
      var guessNum = int.parse(iGuess!);
      count++;
      if (guessNum == answer) {
        print('\n######################\nYou won!!!\nThe number was $answer\nYour amount of guesses is $count'+ " times.\nThanks for playing!\n######################");
        break;
      } else {

        // the distance betweet the input number and the answer
        num range = sqrt((pow(guessNum-answer, 2)).abs());

        /**
         * hint message
         */
        if(range < 10) {
          print("Nice try! very too close.");
        } else if(range < 15) {
          print("almost! tik tok tiktok...");
        } else if(range < 20) {
          print("Excited! It's close.");
        } else if(range < 50) {
          print("Not bad!\n[hint] It's in range 50 of your input number");
        } else if(range < 80 && range <= 100) {
          print("Very far! :)");
        }
      }
    } on FormatException {
      print('Invalid format! please try again.');
    }

  }

}