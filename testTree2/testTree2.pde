import processing.sound.*;
  
TreeNode tree;
TreeNode current;
String s= "Ramani's Personality Quiz! Press an arrow to get started!";
BinarySearchTree t;
Scenes sc;
boolean three=false;
boolean one=false;
boolean two=false;
boolean zero=false;
private int levelCount=0;
SoundFile file;
  //put your audio file name here
  String audioName = "mi_fallout.mp3";
  String path;

void setup() {
  size(1000, 800);
  t=new BinarySearchTree();
  tree=t.buildTree();
  current=tree;
  sc=new Scenes();
  path = sketchPath(audioName);
    file = new SoundFile(this, path);
    file.play();
}

void draw() {
  sc.scene3();
  fill(255,0,127);
  textSize(25);
  text(s, 100, 80);
  if (zero==true) {
   //sc.scene0();
   
  } else if (one==true) {
    sc.scene1();
    text("play again? (press down arrow)", 600, 600);
  } else if (two==true) {
    sc.scene2();
    text("play again? (press down arrow)", 600, 600);
  } else {
    zero=true;
  }
}

void keyPressed() {
   check();

  if (keyCode == LEFT) {
    s=(String)current.getValue();
    System.out.println(s);

    if (s.equals("You are a severe extrovert! You love to hang out with friends and you're outgoing!")) {
      one = true;
      zero = false;
    } else if (s.equals("You are a medium extrovert! You have the tendencies of both an introvert and an extrovert!")) {
      three = true;
      zero = false;
    }
    if (s.equals("You are a mild extrovert!") || s.equals("You are an ambivert! You like to have close relationships and you keep your thought to your self!") || s.equals("You are a medium extrovert! You have the tendencies of both an introvert and an extrovert!") || s.equals("You are a severe extrovert! You love to hang out with friends and you're outgoing!")) {
      one=true;
      zero=false;
      text("play again? (press down arrow)", 200, 400);
    } else if (s.equals("You are a mild introvert!") || s.equals("You are an ambivert! You like to have close relationships and you keep your thought to your self!") || s.equals("You are a medium introvert! You have the tendencies of both an introvert and an extrovert!") || s.equals("You are a severe introvert! You like to have close relationships and you keep your thought to your self!")) {
      two=true;
      zero=false;
      text("play again? (press down arrow)", 200, 400);
    } else {
      current= current.getLeft();
      levelCount++;
    }
  } else if (keyCode == RIGHT) {
    s=(String)current.getValue();
    System.out.println(s);

    
    if (s.equals("You are a mild introvert!") || s.equals("You are an ambivert! You like to have close relationships and you keep your thought to your self!") || s.equals("You are a medium introvert! You have the tendencies of both an introvert and an extrovert!") || s.equals("You are a severe introvert! You like to have close relationships and you keep your thought to your self!")) {
      one=true;
      zero=false;
      text("play again? (press down arrow)", 200, 400);
    } else if (s.equals("You are a mild extrovert!") || s.equals("You are an ambivert! You like to have close relationships and you keep your thought to your self!") || s.equals("You are a medium extrovert! You have the tendencies of both an introvert and an extrovert!") || s.equals("You are a severe extrovert! You love to hang out with friends and you're outgoing!")) {
      two=true;
      zero=false;
      text("play again? (press down arrow)", 200, 400);
    } else {
      current = current.getRight();
      levelCount++;
    }
  }
}

void check() {

  println(levelCount);
  if (levelCount > 4 && keyCode==DOWN) {
    println("play Again");
    zero=true;
    levelCount=0;
    current=tree;
    s="Personality Quiz Again! Really? press a left or right arrow";
    System.out.println(s);
  }

}


interface Treeable {
  public Object getValue();
  public Treeable getLeft();
  public Treeable getRight();
  public void setValue(Comparable value);
  public void setLeft(Treeable left);
  public void setRight(Treeable right);
}
