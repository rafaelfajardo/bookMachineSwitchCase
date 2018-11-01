// multipage using "switch" and "case" command
// modifies code from Processing 3 libraries examples
// is a minimalist example that renders an 8 page PDF document
// with one page per frame (that is to say one page per pass through the draw loop)


import processing.pdf.*;
int num = 0; // a variable used in the switch/case statement

void setup() {
  size(400, 400, PDF, "multiPage.pdf");
  
}


void draw() {
  num = frameCount; // make num = frameCount of sketch
  background(128);
  fill(0);
  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer. this invokes the library. it's unclear how many times and where it can be invoked

  switch (num) {
    case 0: // it appears that there is no frame 0
      println(frameCount+" do nothing"); // we won't see this in the console because it never executes
      // Draw something good here
      //line(width/4, height/4, 3*width/4, 3*height/4);
      //pdf.nextPage();  // Tell renderer to go to the next page 
      break;
    case 1:
      println(frameCount);
      // Draw something good here
      line(width/4, height/4, 3*width/4, 3*height/4); // diagonal line from upper left to lower right
      line(3*width/4, height/4, width/4, 3*height/4); // diagonal line from upper right to lower left
      pdf.nextPage();  // Tell renderer to go to the next page 
      break;
    case 2: // these cases cascade in the fashion of an "or" statement, so long as one is true then commands executed
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
      println(frameCount);
      text(str(frameCount), width/2, height/2); // write frameCount to center of composition
      pdf.nextPage(); // tell renderer to go to next page
      break;
    
    case 8: // final case is treated differently than other cases. 
      println(frameCount + "end");
      text(str(frameCount), width/2, height/2);
      exit(); // exit program to close pdf renderer. invoking pdf.nextpage() would give us an extra, unwanted, page
      }
}



/*
// switch and case example from Processing 3 reference
int num = 1;

switch(num) {
  case 0: 
    println("Zero");  // Does not execute
    break;
  case 1: 
    println("One");  // Prints "One"
    break;
}
*/

/*
// example from Processing 3 libraries
import processing.pdf.*;

void setup() {
  size(400, 400, PDF, "filename.pdf");
}

void draw() {
  // Draw something good here
  line(0, 0, frameCount * 4, height);
    
  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer

  // When finished drawing, quit and save the file
  if (frameCount == 100) {
    exit();
  } else {
    pdf.nextPage();  // Tell it to go to the next page 
  }
}
*/
