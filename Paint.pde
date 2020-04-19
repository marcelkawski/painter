import controlP5.*;

ControlP5 cp5;
int cont = 0;
boolean showMenu = false;
Group menuGroup;

PImage background;
color currentColor;
int rValue = 0;
int gValue = 0;
int bValue = 0;
int aValue = 255;
float stroke = 1.0;
int menuHeight;
int menuWidth;

ArrayList<PImage> backups;

void setup() {
  size(432, 768);
  
  background(240);
  background = get();
  cp5 = new ControlP5(this);
  menuHeight = height/2;
  menuWidth = width;
  cp5.getFont().setSize(16);
  
  backups = new ArrayList<PImage>();
  backups.add(background);
  
  setUpGUI();
}


void draw()
{
  cp5.getController("color").setColorBackground(currentColor);
  cp5.getController("color").setColorActive(currentColor);
  cp5.getController("color").setColorForeground(currentColor);
  
  if (mousePressed && !showMenu) 
  {
    stroke(currentColor);
    strokeWeight(stroke);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mouseReleased()
{
  if (!showMenu)
  {
    PImage backup;
    backup = get();
    backups.add(backup);
  }
}

void controlEvent(ControlEvent event) 
{
  if (event.isFrom("menu")) 
  {
    if (showMenu == false)
    {
      showMenu = true;
      manageMenu();
    }
    else
    {  
      showMenu = false;
      manageMenu();
    }
  }
  
  else if (event.isFrom("clear")) 
  {
        background = backups.get(0);
        if (backups.size() > 1)
        {
          do 
            backups.remove(backups.size()-1);
          while (backups.size() != 1);
        }
        set(0, 0, background);
  }
  
  else if (event.isFrom("save"))
  {
     String title = String.valueOf(day()) + "_" + String.valueOf(month()) + "_" + String.valueOf(year()) + "_" 
       + String.valueOf(hour()) + "_" + String.valueOf(minute()) + "_" + String.valueOf(second());
     showMenu = false;
     manageMenu();
     PImage partialSave = get(0, 0, width, height - cp5.get("menu").getHeight());
     partialSave.save(title + ".jpg");
     showMenu = true;
     manageMenu();
  }
  
  else if (event.isFrom("undo")) 
  {
    if (backups.size() > 1)
    { 
        background = backups.get(backups.size()-2);   
        backups.remove(backups.size()-1);
        set(0, 0, background);
    }
  }
  
  else if (event.isFrom("redSlider"))
  {
    rValue = (int)cp5.get("redSlider").getValue();
    cp5.get("redSlider").setColorBackground(color(map(rValue, 0, 255, 128, 192), 0, 0, 255));
    cp5.get("redSlider").setColorForeground(color(255, 0, 0, 255));
    cp5.get("redSlider").setColorActive(color(255, 0, 0, 255));
  }
  
  else if (event.isFrom("greenSlider")) 
  {
    gValue = (int)cp5.get("greenSlider").getValue();
    cp5.get("greenSlider").setColorBackground(color(0, map(gValue, 0, 255, 128, 192), 0, 255));
    cp5.get("greenSlider").setColorForeground(color(0, 255, 0, 255));
    cp5.get("greenSlider").setColorActive(color(0, 255, 0, 255));
  }
  
  else if (event.isFrom("blueSlider")) 
  {
    bValue = (int)cp5.get("blueSlider").getValue();
    cp5.get("blueSlider").setColorBackground(color(0, 0, map(bValue, 0, 255, 128, 192), 255));
    cp5.get("blueSlider").setColorForeground(color(0, 0, 255, 255));
    cp5.get("blueSlider").setColorActive(color(0, 0, 255, 255));
  }
  
  
  else if (event.isFrom("alphaSlider"))
  {
    aValue = (int)cp5.get("alphaSlider").getValue();
    cp5.get("alphaSlider").setColorBackground(color(0));
    cp5.get("alphaSlider").setColorForeground(color(255, 255, 255, map(aValue, 0, 255, 64, 255)));
    cp5.get("alphaSlider").setColorActive(color(255, 255, 255, map(aValue, 0, 255, 64, 255)));
  }
  
  else if (event.isFrom("white"))
  {
    rValue = 255;
    gValue = 255;
    bValue = 255;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  else if (event.isFrom("silver"))
  {
    rValue = 192;
    gValue = 192;
    bValue = 192;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("grey"))
  {
    rValue = 128;
    gValue = 128;
    bValue = 128;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("black"))
  {
    rValue = 0;
    gValue = 0;
    bValue = 0;
    aValue = 0;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("red"))
  {
    rValue = 255;
    gValue = 0;
    bValue = 0;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("maroon"))
  {
    rValue = 128;
    gValue = 0;
    bValue = 0;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("yellow"))
  {
    rValue = 255;
    gValue = 255;
    bValue = 0;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("olive"))
  {
    rValue = 128;
    gValue = 128;
    bValue = 0;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("lime"))
  {
    rValue = 0;
    gValue = 255;
    bValue = 0;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("green"))
  {
    rValue = 0;
    gValue = 128;
    bValue = 0;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
    
  else if (event.isFrom("aqua"))
  {
    rValue = 0;
    gValue = 255;
    bValue = 255;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("teal"))
  {
    rValue = 0;
    gValue = 128;
    bValue = 128;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
    
  else if (event.isFrom("blue"))
  {
    rValue = 0;
    gValue = 0;
    bValue = 255;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("navy"))
  {
    rValue = 0;
    gValue = 0;
    bValue = 128;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("pink"))
  {
    rValue = 255;
    gValue = 0;
    bValue = 255;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  else if (event.isFrom("purple"))
  {
    rValue = 128;
    gValue = 0;
    bValue = 128;
    aValue = 255;
    cp5.get("redSlider").setValue(rValue);
    cp5.get("greenSlider").setValue(gValue);
    cp5.get("blueSlider").setValue(bValue);
    cp5.get("alphaSlider").setValue(aValue);
  }
  
  currentColor = color(rValue, gValue, bValue, aValue);
}


void manageMenu()
{
   if (showMenu)
   {
      background = get();
      cp5.get("menu").setPosition(0, menuHeight - cp5.get("menu").getHeight());
      menuGroup.show();
   }
   else 
   {
      cp5.get("menu").setPosition(0, height - cp5.get("menu").getHeight());
      menuGroup.hide();
      for (int i=0; i<width; i++)
        for (int j=height - menuHeight - cp5.get("menu").getHeight(); j<height; j++)
          set(i, j, background.get(i,j));
   }
}

void setUpGUI()
{
  menuGroup = cp5.addGroup("menuGroup")
      .setHeight(menuHeight)
      .setBackgroundColor(color(30, 255))
      .setWidth(menuWidth)
      .hideBar()
      .setPosition(0, height - menuHeight)
      .setBackgroundHeight(menuHeight+1)
      ;
      
   cp5.addButton("menu")
       .setBroadcast(false)
       .setSize(menuWidth, menuHeight/10)
       .setBroadcast(true)
       ;
   
      
   cp5.addTextlabel("colorLabel")
       .setText("Color:")
       .setGroup(menuGroup)
       .setPosition(menuWidth/20, menuHeight/25)
       .setColorValue(0xffffffff)
       ;
       
   cp5.addTextlabel("strokeLabel")
       .setText("Stroke:")
       .setGroup(menuGroup)
       .setPosition(8*menuWidth/15, menuHeight/25)
       .setColorValue(0xffffffff)
       ;
       
   cp5.addSlider("redSlider")
       .setSize(menuWidth/14, menuHeight/3)
       .setPosition(menuWidth/13, menuHeight/10)
       .setRange(0, 255)
       .setNumberOfTickMarks(256)
       .setDecimalPrecision(0)
       .setValue(255)
       .setGroup(menuGroup)
       .showTickMarks(false)
       .setLabelVisible(false)
       ;
       
   cp5.addTextlabel("redLabel")
       .setText("Red")
       .setGroup(menuGroup)
       .setPosition(menuWidth/13, menuHeight/10 + cp5.get("redSlider").getHeight() + menuHeight/95)
       .setColorValue(0xffffffff)
       ;
       
   cp5.addSlider("greenSlider")
       .setSize(menuWidth/14, menuHeight/3)
       .setPosition(menuWidth/13 + menuWidth/12, menuHeight/10)
       .setRange(0, 255)
       .setNumberOfTickMarks(256)
       .setDecimalPrecision(0)
       .setValue(255)
       .setGroup(menuGroup)
       .showTickMarks(false)
       .setLabelVisible(false)
       ;
       
   cp5.addTextlabel("greenLabel")
       .setText("Green")
       .setGroup(menuGroup)
       .setPosition(menuWidth/13 + menuWidth/12, menuHeight/10 + cp5.get("greenSlider").getHeight() + menuHeight/95)
       .setColorValue(0xffffffff)
       ;
       
   cp5.addSlider("blueSlider")
       .setSize(menuWidth/14, menuHeight/3)
       .setPosition(menuWidth/13 + 2*menuWidth/12, menuHeight/10)
       .setRange(0, 255)
       .setNumberOfTickMarks(256)
       .setDecimalPrecision(0)
       .setValue(255)
       .setGroup(menuGroup)
       .showTickMarks(false)
       .setLabelVisible(false)
       ;
       
   cp5.addTextlabel("blueLabel")
       .setText("Blue")
       .setGroup(menuGroup)
       .setPosition(menuWidth/13 + 2*menuWidth/12, menuHeight/10 + cp5.get("blueSlider").getHeight() + menuHeight/95)
       .setColorValue(0xffffffff)
       ;
       
   cp5.addSlider("alphaSlider")
       .setSize(menuWidth/14, menuHeight/3)
       .setPosition(menuWidth/13 + 3*menuWidth/12, menuHeight/10)
       .setRange(0, 255)
       .setNumberOfTickMarks(256)
       .setDecimalPrecision(0)
       .setValue(255)
       .setGroup(menuGroup)
       .showTickMarks(false)
       .setLabelVisible(false)
       ;
       
   cp5.addTextlabel("alphaLabel")
       .setText("Alpha")
       .setGroup(menuGroup)
       .setPosition(menuWidth/13 + 3*menuWidth/12, menuHeight/10 + cp5.get("alphaSlider").getHeight() + menuHeight/95)
       .setColorValue(0xffffffff)
       ;
       
   cp5.addButton("color")
       .setBroadcast(false)
       .setSize(4*menuWidth/12, menuWidth/17)
       .setPosition(menuWidth/14, menuHeight/2)
       .setGroup(menuGroup)
       .setLabelVisible(false)
       .setColorActive(currentColor)
       .setColorForeground(currentColor)
       ;
       
   cp5.addSlider("stroke")
       .setSize(6*menuWidth/15, menuWidth/15)
       .setPosition(8*menuWidth/15, menuHeight/10)
       .setRange(0, 50)
       .setNumberOfTickMarks(26)
       .setDecimalPrecision(2)
       .setValue(1)
       .setGroup(menuGroup)
       .showTickMarks(false)
       .setLabelVisible(false)
       .setColorActive(color(0, 255))
       .setColorForeground(color(0, 255))
       .setColorBackground(color(215, 255))
       ;
       
   cp5.addButton("clear")
       .setBroadcast(false)
       .setSize(6*menuWidth/15, menuWidth/15)
       .setPosition(8*menuWidth/15, menuHeight/4)
       .setGroup(menuGroup)
       .setBroadcast(true)
       ;
       
   cp5.addButton("save")
       .setBroadcast(false)
       .setSize(6*menuWidth/15, menuWidth/15)
       .setPosition(8*menuWidth/15, menuHeight/4+1.5*menuWidth/15)
       .setGroup(menuGroup)
       .setBroadcast(true)
       ;
       
   cp5.addButton("undo")
       .setBroadcast(false)
       .setSize(6*menuWidth/15, menuWidth/15)
       .setPosition(8*menuWidth/15, menuHeight/4+3.0*menuWidth/15)
       .setGroup(menuGroup)
       .setBroadcast(true)
       ;
    
    setUpColorButtons();
    manageMenu();
}

void setUpColorButtons()
{
  
  cp5.addButton("white")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13, menuHeight/1.65)
     .setLabelVisible(false)
     .setColorActive(color(255, 255, 255))
     .setColorForeground(color(255, 255, 255))
     .setColorBackground(color(255, 255, 255))
     .setBroadcast(true)
     ;
     
  cp5.addButton("silver")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + menuWidth/12, menuHeight/1.65)
     .setLabelVisible(false)
     .setColorActive(color(192, 192, 192))
     .setColorForeground(color(192, 192, 192))
     .setColorBackground(color(192, 192, 192))
     .setBroadcast(true)
     ;
     
   cp5.addButton("grey")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + 2*menuWidth/12, menuHeight/1.65)
     .setLabelVisible(false)
     .setColorActive(color(128, 128, 128))
     .setColorForeground(color(128, 128, 128))
     .setColorBackground(color(128, 128, 128))
     .setBroadcast(true)
     ;
  
  cp5.addButton("black")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + 3*menuWidth/12, menuHeight/1.65)
     .setLabelVisible(false)
     .setColorActive(color(0, 0, 0))
     .setColorForeground(color(0, 0, 0))
     .setColorBackground(color(0, 0, 0))
     .setBroadcast(true)
     ;
     
  cp5.addButton("red")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13, menuHeight/1.65 + menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(255, 0, 0))
     .setColorForeground(color(255, 0, 0))
     .setColorBackground(color(255, 0, 0))
     .setBroadcast(true)
     ; 
     
   cp5.addButton("maroon")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + menuWidth/12, menuHeight/1.65 + menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(128, 0, 0))
     .setColorForeground(color(128, 0, 0))
     .setColorBackground(color(128, 0, 0))
     .setBroadcast(true)
     ;
     
  cp5.addButton("yellow")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + 2*menuWidth/12, menuHeight/1.65 + menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(255, 255, 0))
     .setColorForeground(color(255, 255, 0))
     .setColorBackground(color(255, 255, 0))
     .setBroadcast(true)
     ;
     
   cp5.addButton("olive")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + 3*menuWidth/12, menuHeight/1.65 + menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(128, 128, 0))
     .setColorForeground(color(128, 128, 0))
     .setColorBackground(color(128, 128, 0))
     .setBroadcast(true)
     ;
   
   cp5.addButton("lime")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13, menuHeight/1.65 + 2*menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(0, 255, 0))
     .setColorForeground(color(0, 255, 0))
     .setColorBackground(color(0, 255, 0))
     .setBroadcast(true)
     ;
     
   cp5.addButton("green")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + menuWidth/12, menuHeight/1.65+2*menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(0, 128, 0))
     .setColorForeground(color(0, 128, 0))
     .setColorBackground(color(0, 128, 0))
     .setBroadcast(true)
     ;
     
  cp5.addButton("aqua")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + 2*menuWidth/12, menuHeight/1.65+2*menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(0, 255, 255))
     .setColorForeground(color(0, 255, 255))
     .setColorBackground(color(0, 255, 255))
     .setBroadcast(true)
     ;
     
  cp5.addButton("teal")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + 3*menuWidth/12, menuHeight/1.65+2*menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(0, 128, 128))
     .setColorForeground(color(0, 128, 128))
     .setColorBackground(color(0, 128, 128))
     .setBroadcast(true)
     ;
     
  cp5.addButton("blue")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13, menuHeight/1.65 + 3*menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(0, 0, 255))
     .setColorForeground(color(0, 0, 255))
     .setColorBackground(color(0, 0, 255))
     .setBroadcast(true)
     ; 
     
  cp5.addButton("navy")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + menuWidth/12, menuHeight/1.65 + 3*menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(0, 0, 128))
     .setColorForeground(color(0, 0, 128))
     .setColorBackground(color(0, 0, 128))
     .setBroadcast(true)
     ;
     
  cp5.addButton("pink")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + 2*menuWidth/12, menuHeight/1.65 + 3*menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(255, 0, 255))
     .setColorForeground(color(255, 0, 255))
     .setColorBackground(color(255, 0, 255))
     .setBroadcast(true)
     ;
     
  cp5.addButton("purple")
     .setBroadcast(false)
     .setSize(menuWidth/15, menuHeight/15)
     .setGroup(menuGroup)
     .setValue(1)
     .setPosition(menuWidth/13 + 3*menuWidth/12, menuHeight/1.65 + 3*menuHeight/12)
     .setLabelVisible(false)
     .setColorActive(color(128, 0, 128))
     .setColorForeground(color(128, 0, 128))
     .setColorBackground(color(128, 0, 128))
     .setBroadcast(true)
     ;
}
