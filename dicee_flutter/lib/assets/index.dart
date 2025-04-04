
enum ImagePath{
  dice1("lib/assets/dice1.png"),
  dice2("lib/assets/dice2.png"),
  dice3("lib/assets/dice3.png"),
  dice4("lib/assets/dice4.png"),
  dice5("lib/assets/dice5.png"),
  dice6("lib/assets/dice6.png");
  final String path;
  const ImagePath(this.path);
  String getDice(int value){
    return "lib/assets/dice$value.png";
  }

}