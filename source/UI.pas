unit UI;
uses controls,wpfobjects,base;

type typeUX = class
  private
    r,g,b:sliderwpf;
    curx,cury,rot:integerboxwpf;
    textbox:textboxwpf;
    mousestatus:statusbarwpf;
    
    procedure changeColor;
    begin
      listobj.Last.Color:=rgb(r.value,g.Value,b.value);
    end;
    procedure changePos;
    begin
      listobj.Last.Center:=pnt(curx.Value,cury.value);
    end;
    
    procedure _menu;
    begin
      var m := menu;
      m.AddRange('file', 'create', 'state');
      m[0].AddRange('open project','save project', 'save');
      m[1].AddRange('rectangle', 'text', 'picture', 'roundrect', 'ellipse');
      m[1][0].Click := procedure -> listobj.Add(new RectangleWPF(0,0, 100, 100, cldef));
      m[1][1].Click := procedure -> listobj.Add(new TextWPF(0,0, 'TEXT', cldef));
      //m[1][2].Click := procedure -> listobj.Add(new PictureWPF(0,0, ofname('picture|*.png')));
      m[1][3].Click := procedure -> listobj.Add(new RoundRectWPF(0,0, 100, 100, 30, cldef));
      m[1][4].Click := procedure -> listobj.Add(new EllipseWPF(0,0, 30, 30, cldef));
      m[2].AddRange('moving', 'scaling', 'rotating');
      m[2][0].Click := procedure -> (state := move);
      m[2][1].Click := procedure -> (state := scale);
      m[2][2].Click := procedure -> (state := rotate);
    end;
  public 
    constructor;
    begin
      initwindow;
      _menu;
      leftpanel(180,rgb($30,$3b,$4f));
      //
      r := Slider('red: ',0,255,255,5);
      r.Enabled:=listobj.Count<>0;
      r.FontSize:=14;
      //
      g := Slider('green: ',0,255,255,5);
      g.ValueChanged:=changecolor;
      g.FontSize:=14;
      //
      b := Slider('blue: ',0,255,255,5);
      b.ValueChanged:=changecolor;
      b.FontSize:=14;
      //
      curX := integerbox('x',0,800);
      curx.ValueChanged:=changePos;
      curx.FontSize:=14;
      //
      cury := integerbox('y',0,600);
      cury.ValueChanged:=changepos;
      cury.FontSize:=14;
      //
      rot := integerbox('angle',0,600);
      rot.FontSize:=14;
      //
      textbox := controls.textbox('text');
      textbox.FontSize:=14;
      //
      mousestatus:= statusbar;
      mousestatus.FontSize:=14;
      
    end;

   
end;

begin end.