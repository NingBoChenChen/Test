{$MODE DELPHI}
unit block;

interface

uses
	gl,
	player,texture,renderer;

type
	TOnMouseLeftFunc	=procedure(Sender:TPlayer);
	TOnMouseRightFunc	=procedure(Sender:TPlayer);
	TOnSelectFunc		=procedure(Sender:TPlayer);
	TOnCreateFunc		=procedure(Sender:TPlayer);
	TOnDestroyFunc		=procedure(Sender:TPlayer);

type
	TBlockEvent=class
		private
			MouseLeftFunc	:TOnMouseLeftFunc;
			MouseRightFunc	:TOnMouseRightFunc;
			SelectFunc		:TOnSelectFunc;
			CreateFunc		:TOnCreateFunc;
			DestroyFunc		:TOnDestroyFunc;
		public
			constructor Create;
			property OnMouseLeft	:TOnMouseLeftFunc
				read MouseLeftFunc	write MouseLeftFunc;
			property OnMouseRight	:TOnMouseRightFunc
				read MouseRightFunc	write MouseRightFunc;
			property OnSelect		:TOnSelectFunc
				read SelectFunc		write SelectFunc;
			property OnCreate		:TOnCreateFunc
				read CreateFunc		write CreateFunc;
			property OnDestroy		:TOnDestroyFunc
				read DestroyFunc	write DestroyFunc;
	end;

type
	TBlock=class
		private
			event:TBlockEvent;
		public
			constructor Create;
	end;
	
type
	TBlock_Solid=class(TBlock)
		private
			texture:array[0..7]of GLUint;
			facing:byte;
		public
			constructor	Create;
			procedure	LoadTexture(fce:byte;tnm:GLUint);
			procedure	ReDraw(rdr:TRenderer);
	end;

implementation

constructor TBlockEvent.Create;
begin
	MouseLeftFunc	:=NIL;
	MouseRightFunc	:=NIL;
	SelectFunc		:=NIL;
	CreateFunc		:=NIL;
	DestroyFunc		:=NIL;
end;

constructor TBlock.Create;
begin
	event:=TBlockEvent.Create;
end;

constructor TBlock_Solid.Create;
begin
	FillChar(texture,sizeof(texture),0);
	event:=TBlockEvent.Create;
end;
procedure TBlock_Solid.LoadTexture(fce:byte;tnm:GLUint);
begin
	if(fce>7)then
		exit;
	texture[fce]:=tnm;
end;
procedure TBlock_Solid.Redraw(rdr:TRenderer);
const
	s=0.2;
	a=0.5*s;
	b=1.0*s;
	c=0.87*s;
	h=0.5*s;
begin
	glBindTexture(GL_TEXTURE_2D,texture[0]);
	rdr.Init;
	rdr.TexCoord2f(-b*0.5+0.5, 0*0.5+0.5);rdr.Vertex3f(-b,h, 0);
	rdr.TexCoord2f(-a*0.5+0.5, c*0.5+0.5);rdr.Vertex3f(-a,h, c);
	rdr.TexCoord2f( a*0.5+0.5, c*0.5+0.5);rdr.Vertex3f( a,h, c);
	rdr.TexCoord2f( b*0.5+0.5, 0*0.5+0.5);rdr.Vertex3f( b,h, 0);
	rdr.TexCoord2f( a*0.5+0.5,-c*0.5+0.5);rdr.Vertex3f( a,h,-c);
	rdr.TexCoord2f(-a*0.5+0.5,-c*0.5+0.5);rdr.Vertex3f(-a,h,-c);
	rdr.Flush;
	
	glBindTexture(GL_TEXTURE_2D,texture[1]);
	rdr.Init;
	rdr.TexCoord2f(-b*s+s, 0*s+s);rdr.Vertex3f(-b,-h, 0);
	rdr.TexCoord2f(-a*s+s, c*s+s);rdr.Vertex3f(-a,-h, c);
	rdr.TexCoord2f( a*s+s, c*s+s);rdr.Vertex3f( a,-h, c);
	rdr.TexCoord2f( b*s+s, 0*s+s);rdr.Vertex3f( b,-h, 0);
	rdr.TexCoord2f( a*s+s,-c*s+s);rdr.Vertex3f( a,-h,-c);
	rdr.TexCoord2f(-a*s+s,-c*s+s);rdr.Vertex3f(-a,-h,-c);
	rdr.Flush;
	
	glBindTexture(GL_TEXTURE_2D,texture[2]);
	rdr.Init;
	rdr.TexCoord2f(0,0);rdr.Vertex3f(-a, h,c);
	rdr.TexCoord2f(0,1);rdr.Vertex3f(-a,-h,c);
	rdr.TexCoord2f(1,1);rdr.Vertex3f(-b,-h,0);
	rdr.TexCoord2f(1,0);rdr.Vertex3f(-b, h,0);
	rdr.Flush;
	
	glBindTexture(GL_TEXTURE_2D,texture[3]);
	rdr.Init;
	rdr.TexCoord2f(0,0);rdr.Vertex3f(-b, h, 0);
	rdr.TexCoord2f(0,1);rdr.Vertex3f(-b,-h, 0);
	rdr.TexCoord2f(1,1);rdr.Vertex3f(-a,-h,-c);
	rdr.TexCoord2f(1,0);rdr.Vertex3f(-a, h,-c);
	rdr.Flush;

	glBindTexture(GL_TEXTURE_2D,texture[4]);
	rdr.Init;
	rdr.TexCoord2f(0,0);rdr.Vertex3f(-a, h, c);
	rdr.TexCoord2f(0,1);rdr.Vertex3f(-a,-h, c);
	rdr.TexCoord2f(1,1);rdr.Vertex3f( a,-h, c);
	rdr.TexCoord2f(1,0);rdr.Vertex3f( a, h, c);
	rdr.Flush;
	
	glBindTexture(GL_TEXTURE_2D,texture[5]);
	rdr.Init;
	rdr.TexCoord2f(0,0);rdr.Vertex3f( a, h,c);
	rdr.TexCoord2f(0,1);rdr.Vertex3f( a,-h,c);
	rdr.TexCoord2f(1,1);rdr.Vertex3f( b,-h,0);
	rdr.TexCoord2f(1,0);rdr.Vertex3f( b, h,0);
	rdr.Flush;
	
	glBindTexture(GL_TEXTURE_2D,texture[6]);
	rdr.Init;
	rdr.TexCoord2f(0,0);rdr.Vertex3f( b, h, 0);
	rdr.TexCoord2f(0,1);rdr.Vertex3f( b,-h, 0);
	rdr.TexCoord2f(1,1);rdr.Vertex3f( a,-h,-c);
	rdr.TexCoord2f(1,0);rdr.Vertex3f( a, h,-c);
	rdr.Flush;

	glBindTexture(GL_TEXTURE_2D,texture[7]);
	rdr.Init;
	rdr.TexCoord2f(0,0);rdr.Vertex3f( a, h,-c);
	rdr.TexCoord2f(0,1);rdr.Vertex3f( a,-h,-c);
	rdr.TexCoord2f(1,1);rdr.Vertex3f(-a,-h,-c);
	rdr.TexCoord2f(1,0);rdr.Vertex3f(-a, h,-c);
	rdr.Flush;
end;

end.