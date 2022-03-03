uses 
  GraphWPF, 
  Controls,
  System.Diagnostics;

var 
  canvas:canvaswpf;
  logo:textblockwpf;
  BOpen,BNew:Buttonwpf;
  
  Sname:textboxwpf;
  Swidth,Sheight:integerboxwpf;

procedure RunNewProject;
begin 
  process.Start('source\UIMaker.exe');
  window.Close;
end;
procedure RunWithOpenProject;
begin 
  
end;

procedure UI;
begin
  canvas := SetMainControl.AsCanvas;
  canvas.Color:=rgb($30,$3b,$4f);
  logo := new textblockwpf(90,15,'UIMaker',0,48);
  logo.FontName:='Consolas';
  BNew:=new ButtonWPF(20,90,'New',100,18);
  BNew.Click:=RunNewProject;
  BOpen:=new ButtonWPF(20,140,'Open (soon)',100,18);
  BOpen.Click:=RunWithOpenProject;
  sname:= new TextBoxWPF(150,80,'name');
  swidth:= new integerboxWPF(150,130,'width',0,2000,50);
  sheight:= new integerboxWPF(220,130,'height',0,2000,50);
  textblock(10,380,'© Hubba_Bubba_3000',120,12);
end;

procedure init;
begin
  window.Title:='UIM Launcher';
  window.SetSize(300,400);
  UI;
end;



begin
  init;
end.