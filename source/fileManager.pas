unit fileManager;
uses controls, base, wpfobjects;

function openProj(fname:string): project;
begin
  var f:text;
  var pw,ph:integer;
  var pn:string;
  assign(f,fname);
  f.Reset(system.Text.Encoding.UTF8);
  pn:=f.Lines.ToArray[0];
  pw:=f.Lines.ToArray[1].Chars[1].Code;
  ph:=f.Lines.ToArray[1].Chars[2].Code;
  result := new project(pw,ph,pn);
  f.Close;
end;
procedure saveProj(fname:string;p:project);
begin
  var f:text;
  assign(f,fname);
  f.Rewrite(system.Text.Encoding.UTF8);
  f.Writeln(p.name);
  f.Writeln(char(p.width),char(p.height));
  f.Writeln();
  f.Close;
end;

function ofname(filt:string): string;
begin
  var ofd := openfiledialog('', filt);
  if ofd.ShowDialog then result := ofd.FileName;
end;

function sfname(filt:string): string;
begin
  var ofd := savefiledialog('', filt);
  if ofd.ShowDialog then result := ofd.FileName;
end;
 


begin
  
end.
