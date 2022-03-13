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
  
procedure initfile(fname:string);
begin
  var f:text;
  assign(f,fname);
  f.Reset(system.Text.Encoding.UTF8);
  sname.Text:=f.Lines.ToArray[0];
  swidth.Value:=f.Lines.ToArray[1].Chars[1].Code;
  sheight.Value:=f.Lines.ToArray[1].Chars[2].Code;
  f.Close;
end;

procedure runfile(fname:string);
begin
  var f:text;
  assign(f,fname);
  f.Rewrite(system.Text.Encoding.UTF8);
  f.Writeln(sname.Text);
  f.Writeln(char(swidth.Value),char(sheight.Value));
  f.Close;
end;

procedure RunNewProject;
begin 
  runfile('source/save.uims');
  process.Start('source\UIMaker.exe');
  window.Close;
end;
procedure RunWithOpenProject;
begin 
  var ofd := openfiledialog('','UIMaker''s projects|*.uims');
  if ofd.ShowDialog then runfile(ofd.FileName);
  process.Start('source\UIMaker.exe');
  window.Close;
end;

procedure UI;
begin
  canvas := SetMainControl.AsCanvas;
  canvas.Color:=rgb($30,$3b,$4f);
  logo := new textblockwpf(90,15,'UIMaker',0,48);
  logo.FontName:='Consolas';
  BNew:=new ButtonWPF(20,90,'New',100,18);
  BNew.Click:=RunNewProject;
  BOpen:=new ButtonWPF(20,140,'Open',100,18);
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
  initfile('source/save.uims');
end;

begin
  init;
end.