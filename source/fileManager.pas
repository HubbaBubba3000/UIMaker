unit fileManager;
uses controls, base;

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
