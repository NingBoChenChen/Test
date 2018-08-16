{$MODE OBJFPC}
unit model;

interface

type
	Vertexes=record
		x,y,z:extended;
		r,g,b,a:extended;
	end;
	TSurface=array of Vertexes;
	TSurfaces=array of TSurface;

type
	TModel=class
		private
			sfc:TSurfaces;
		public
			constructor Create;
			procedure LoadFromFile(fnm:string);
			procedure SaveToFile(fnm:string);
			property Surfaces:TSurfaces read sfc write sfc;
	end;

implementation

constructor TModel.Create;
begin
	SetLength(sfc,0);
end;
procedure TModel.LoadFromFile(fnm:string);
var
	f:file of extended;
	len,i,ll,j:longint;
	t:extended;
begin
	assign(f,fnm);
	reset(f);
	read(f,t);
	len:=round(t);
	SetLength(sfc,len);
	for i:=0 to len-1 do begin
		read(f,t);
		ll:=round(t);
		SetLength(sfc[i],ll);
		for j:=0 to ll-1 do begin
			read(f,sfc[i][j].x,sfc[i][j].y,sfc[i][j].z,
				sfc[i][j].r,sfc[i][j].g,sfc[i][j].b,sfc[i][j].a);
		end;
	end;
	close(f);
end;
procedure TModel.SaveToFile(fnm:string);
var
	f:file of extended;
	len,i,ll,j:longint;
	t:extended;
begin
	assign(f,fnm);
	reset(f);
	len:=length(sfc);
	t:=len;
	write(f,t);
	for i:=0 to len-1 do begin
		ll:=length(sfc[i]);
		t:=ll;
		write(f,t);
		for j:=0 to ll-1 do begin
			write(f,sfc[i][j].x,sfc[i][j].y,sfc[i][j].z,
				sfc[i][j].r,sfc[i][j].g,sfc[i][j].b,sfc[i][j].a);
		end;
	end;
	close(f);
end;

end.