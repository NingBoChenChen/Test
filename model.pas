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
	f:file;
	len,i,ll:longint;
begin
	assign(f,fnm);
	reset(f);
	read(f,len);
	SetLength(sfc,len);
	for i:=0 to len-1 do begin
		read(f,ll);
		SetLength(sfc[i],ll);
		for j:=0 to ll-1 do begin
			read(f,sfc[i][j].x,sfc[i][j].y,sfc[i][j].z,
				sfc[i][j].r,sfc[i][j].g,sfc[i][j].b,sfc[i][j].a);
		end;
	end;
	close(f);
end;
procedure TModel.SaveToFile(fnm:string);
property TModel.Surfaces:TSurfaces read sfc write sfc;

end.