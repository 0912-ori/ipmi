PFont miTexto, miTexto2;
PImage img1, img2, img3, img4, img5, img6;

int e = -1; 
int tiempoInicio = 0;

float tamFont = 10;
float posY = 480;
int degradado = 0;
float posX = -600;

void setup() {
  size(640, 480);
  miTexto = loadFont("FranklinGothic-MediumItalic-48.vlw");
  miTexto2 = loadFont("PalatinoLinotype-Roman-48.vlw");

  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");
  img6 = loadImage("6.jpg");

  textAlign(LEFT, TOP);
}

void draw() {
  background(0);
  textFont(miTexto2);
  fill(255);

  if (e == -1) {
    // Pantalla de inicio
    background(0);
    fill(255);
    textFont(miTexto);
    textSize(32);
    text("PINOCHO", 230, 150);
    textSize(18);
    text("Haz clic en el botón para comenzar", 180, 200);

    // Botón de inicio
    fill(0);
    stroke(255);
    strokeWeight(2);
    rect(250, 250, 140, 50);
    fill(255);
    textSize(20);
    text("Iniciar", 285, 265);

  } else if (e == 0) {
    image(img1, 0, 0, width, height);
    textSize(tamFont);
    text("Geppetto, un carpintero solitario, construye un muñeco de madera al que llama Pinocho y desea que sea un niño de verdad.", 50, 300, 540, 160);
    if (tamFont < 22) tamFont += 0.1;

  } else if (e == 1) {
    image(img2, 0, 0, width, height);
    textSize(22);
    text("Una noche, el Hada Azul cumple el deseo de Geppetto y da vida a Pinocho. Le dice que si se porta bien y demuestra ser valiente y sincero, podrá convertirse en un niño real.", posX, 320, 540, 160);
    if (posX < 50) posX += 1.5;

  } else if (e == 2) {
    image(img3, 0, 0, width, height);
    fill(255, degradado);
    textSize(22);
    text("Pinocho desobedece y empieza a mentir. Cada vez que lo hace, su nariz crece, y aprende que mentir tiene consecuencias.", 50, 300, 540, 160);
    if (degradado < 255) degradado += 2;

  } else if (e == 3) {
    image(img4, 0, 0, width, height);
    textSize(22);
    text("Pinocho se deja engañar por personajes malvados como el Zorro y el Gato, y termina en situaciones peligrosas, alejándose de casa.", 50, posY, 540, 160);
    if (posY > 300) posY -= 1;

  } else if (e == 4) {
    image(img5, 0, 0, width, height);
    textSize(tamFont);
    text("Al final, Pinocho demuestra valentía al ir a buscar a Geppetto, que ha sido tragado por una ballena. Logra salvarlo y volver con él.", 50, 300, 540, 160);
    if (tamFont < 22) tamFont += 0.1;

  } else if (e == 5) {
    image(img6, 0, 0, width, height);
    textSize(22);
    text("Por su coraje y su buen corazón, el Hada Azul recompensa a Pinocho y lo convierte en un niño de verdad. Geppetto y él son muy felices.", posX, posY, 540, 160);
    if (posX < 50) posX += 1.5;
    if (posY > 300) posY -= 1;

    // Botón de reinicio
    fill(0);
    stroke(255);
    strokeWeight(2);
    rect(500, 420, 100, 40);
    fill(255);
    textSize(16);
    text("Reiniciar", 515, 445);
  }

 
  if (e >= 0 && e < 5) {
    int duracion = 300; 

    if (e == 1) {
      duracion = 500;
    }

    if (frameCount - tiempoInicio > duracion) {
      e++;
      tiempoInicio = frameCount;

      // Reset valores para siguiente escena
      tamFont = 10;
      posY = 480;
      posX = -600;
      degradado = 0;
    }
  }
}

void mouseClicked() {
  if (e == -1) {
    if (mouseX > 250 && mouseX < 390 && mouseY > 250 && mouseY < 300) {
      e = 0;
      tiempoInicio = frameCount;
    }
  }

  if (e == 5) {
    if (mouseX > 500 && mouseX < 600 && mouseY > 420 && mouseY < 460) {
      e = 0;
      tamFont = 10;
      posY = 480;
      posX = -600;
      degradado = 0;
      tiempoInicio = frameCount;
    }
  }
}
