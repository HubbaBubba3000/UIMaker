unit UI;
uses controls,wpfobjects,base, filemanager;

type typeUX = class
  private
    r,g,b:sliderwpf;
    curx,cury,rot,curw,curh:integerboxwpf;
    textbox:textboxwpf;
    status:statusbarwpf;
    curobjIm:picturewpf;
    procedure changeColor;
    begin
      if not md and isobj then curobj.Color:=rgb(r.value,g.Value,b.value);
    end;
    procedure changePos;
    begin
      if not md and isobj then curobj.Center:=pnt(curx.Value,cury.value);
    end;
    procedure changesize;
    begin
      if not md and isobj then (curobj.Width,curobj.Height):=(curw.Value,curh.Value);
    end;
    procedure _menu;
    begin
      var m := menu;
      m.AddRange('file', 'create', 'state');
      m[0].AddRange('open project','save project', 'save');
      m[1].AddRange('rectangle', 'text', 'picture', 'roundrect', 'ellipse');
      m[1][0].Click := procedure -> listobj.Add(new RectangleWPF(0,0, 100, 100, cldef));
      m[1][1].Click := procedure -> listobj.Add(new TextWPF(0,0, 'TEXT', cldef));
      m[1][2].Click := procedure -> listobj.Add(new PictureWPF(0,0, ofname('picture|*.png')));
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
      onmousemove += (x,y:real;mb:integer) -> if isobj and md then updateUI;
      onkeydown   += (k:key) -> if isobj then updateUI;
      //----------
      leftpanel(180,rgb($30,$3b,$4f));
      //
      r := Slider('red: ',0,255,255,5);
      r.ValueChanged:=changecolor;
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
      curw := integerbox('width',0,800);
      curw.ValueChanged:=changesize;
      curw.FontSize:=14;
      //
      curh := integerbox('height',0,600);
      curh.ValueChanged:=changesize;
      curh.FontSize:=14;
      //
      rot := integerbox('angle',0,360);
      rot.ValueChanged:= procedure -> curobj.RotateAngle:=rot.Value;
      rot.FontSize:=14;
      //
      textbox := controls.textbox('text');
      textbox.ValueChanged:= procedure -> curobj.Text:=textbox.Text;
      textbox.FontSize:=14;
      //---------------
      status:= statusbar;
      status.FontSize:=14;
    end;

    procedure updateUI;
    begin
      updateIm;
      r.Value:=curobj.Color.R;
      g.Value:=curobj.Color.g;
      b.Value:=curobj.Color.b;
      curx.Value:=curobj.Center.X.Round;
      cury.Value:=curobj.Center.y.Round;
      curw.Value:=curobj.Width.Round;
      curh.Value:=curobj.Height.Round;
      rot.Value:=curobj.RotateAngle.Round;
      textbox.Text:=curobj.Text;
      status.Text:=curobj.gettype.ToString.Remove(0,11) + $' ({curindex})';
    end;
end;

begin end.