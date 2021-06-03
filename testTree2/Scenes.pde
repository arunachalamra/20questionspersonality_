public class Scenes implements Comparable {
  PImage img;
  public Scenes() {
  }

  void scene0() {
    img = loadImage("data/read.png");
    image(img, 300, 400, 400, 200);
  }

  void scene1() {
    img = loadImage("data/concert.jpg");
    image(img, 150, 150, 400, 200);
  }
  void scene2() {
    img = loadImage("data/videocall.jpg");
    image(img, 150, 150, 400, 200);
  }
   void scene3() {
    img = loadImage("data/question.jpeg");
    image(img, 0, 0, 1000, 800);
  }

  int compareTo(Object o) {
    return -1;
  }
}
