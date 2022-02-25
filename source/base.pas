unit base;
uses wpfobjects;

type
  typestate = (move, scale, rotate);
  
var
  m: point;
  listobj: list<objectwpf>;
  cldef: color;
  state: typestate;
  
function inrect(r: grect): boolean := m.X.Between(r.Left, r.Right) and m.Y.Between(r.Top, r.Bottom);
//function curobj: objectwpf := listobj.Item[0];

procedure initWindow;
begin
  window.Maximize;
  window.Title:='UIMaker v0.0.1 alpha';
  window.Clear(rgb($25,$25,$25));
  //  
  cldef := rgb(150, 50, 200);
  listobj := new List<objectwpf>;
end;


begin end.