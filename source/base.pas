unit base;
uses wpfobjects;

type
  typestate = (move, scale, rotate);
  

const curobjPath = 'curobj.png';  

var
  m: point;//mouse position
  listobj: list<objectwpf>;
  cldef: color;// default objects color
  state: typestate;
  rotatebuf:real;
  curindex: integer;
  md:boolean; //mousedown
  curobjIm:picturewpf;
  
function inrect(r: grect): boolean := m.X.Between(r.Left, r.Right) and m.Y.Between(r.Top, r.Bottom);
function curobj := listobj.ElementAt(curindex);
function isobj := curindex>=0;// current object is enable

procedure updateIm;
begin
  curobjim.Visible := isobj;
  curobjim.Width:=curobj.Width+5;
  curobjim.Height:=curobj.Height+5;
  curobjim.Center:=curobj.Center;
  curobjim.RotateAngle:=curobj.RotateAngle;
  curobjim.ToFront;
end;

procedure keydown(k:key);
begin
  case k of
    key.i:if curindex<listobj.Count-1 then curindex+=1;
    key.k:if curindex>0 then curindex-=1;
  end;
end;

procedure mousemove(x,y:real;mb:integer);
begin
  m:=pnt(x,y);
  
  if md and isobj then begin
    
    case state of 
      move: curobj.Center := m;
      scale: begin 
        if not isobj then exit;
        if curobj.RotateAngle<>0 then (rotatebuf,curobj.rotateangle):=(curobj.rotateangle,0);
        if (m.y-curobj.Left>0)and(m.X-curobj.top>0) then curobj.Size:=new GSize(m.X-curobj.Left,m.y-curobj.top);
        (rotatebuf,curobj.rotateangle):=(0,rotatebuf);
      end;
      rotate: curobj.RotateToPoint(m.X,m.y);
    end;end;
end;

procedure mousedown(x,y:real;mb:integer);
begin
  if mb = 1 then (curindex,md) := (listobj.findindex(o -> inrect(o.Bounds)),true);
  
end;

procedure initWindow;
begin
  window.Maximize;
  window.Title:='UIMaker v0.0.2 alpha';
  window.Clear(rgb($25,$25,$25));
  //  
  cldef := rgb(150, 50, 200);
  listobj := new List<objectwpf>;
  curobjim:=new pictureWPF(0,0,curobjpath);
  curobjim.Visible:=false;
  curindex:=-1;
  //
  onkeydown+=keydown;
  onmousemove+=mousemove;
  onmousedown+=mousedown;
  onmouseup+=(x,y:real;mb:integer) -> (md:=false);
  //--DEBUG---
  
end;

begin end.