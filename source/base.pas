unit base;
uses wpfobjects;

type
  typestate = (move, scale, rotate);
  
var
  m: point;//mouse position
  listobj: list<objectwpf>;
  cldef: color;// default objects color
  state: typestate;
  curindex: integer;
  md:boolean; //mousedown
  
function inrect(r: grect): boolean := m.X.Between(r.Left, r.Right) and m.Y.Between(r.Top, r.Bottom);
function curobj := listobj.ElementAt(curindex);
function isobj := curindex>=0;// current object is enable


procedure mousemove(x,y:real;mb:integer);
begin
  m:=pnt(x,y);
  
  if md and isobj then begin
    
    case state of 
      move: curobj.Center := m;
      scale: curobj.Size:=new GSize(m.X-curobj.Left,m.y-curobj.top);
      rotate: curobj.RotateToPoint(m.X,m.y);
    end;
  end;
end;

procedure mousedown(x,y:real;mb:integer);
begin
  if mb = 1 then curindex := listobj.findindex(o -> inrect(o.Bounds));
  md := mb = 1;
end;

procedure initWindow;
begin
  window.Maximize;
  window.Title:='UIMaker v0.0.1 alpha';
  window.Clear(rgb($25,$25,$25));
  //  
  cldef := rgb(150, 50, 200);
  listobj := new List<objectwpf>;
  onmousemove+=mousemove;
  onmousedown+=mousedown;
  onmouseup+=(x,y:real;mb:integer) -> (md:=false);
end;

begin end.