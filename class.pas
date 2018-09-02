{$mode objfpc}
type
	c1=class
		private
			t:longint;
		protected
			ttt:longint;
		public
			ttttt:longint;
			procedure aa(a:longint);
	end;
procedure c1.aa(a:longint);
begin
	t:=a;
	ttt:=a+2;
end;
type
	c2=class
		procedure aa(t:c1);
	end;
procedure c2.aa(t:c1);
begin
	writeln(t.t);
	writeln(t.ttt);
end;
type
	c3=class(c1)
		procedure aaa(tt:c1);
	end;
procedure c3.aaa(tt:c1);
begin
	writeln(tt.t);
	writeln(tt.ttt);
end;
var
	o1:c1;
	o2:c2;
	o3:c3;
begin
	o1:=c1.create;
	o1.aa(233);
	o2:=c2.create;
	o2.aa(o1);
	o1.t:=1;
	o3:=c3.create;
	o3.aaa(o1);
end.