{$MODE OBJFPC}
unit renderer;

interface

uses
	gl;

type
	TRenderer=class
		private
			Textured,Colored:boolean;
			Vertexes,vp,tp,cp:longint;
			VertexArray,TexcoordArray,ColorArray:^GLFloat;
			TexcoordX,TexcoordY:GLFloat;
			ColorR,ColorG,ColorB:GLFloat;
		public
			procedure Init;
			procedure Vertex3f(x,y,z:GLFloat);
			procedure TexCoord2f(x,y:GLFloat);
			procedure Color3f(r,g,b:GLFloat);
			procedure Flush;
	end;

implementation

procedure TRenderer.Init;
begin
    glEnableClientState(GL_VERTEX_ARRAY);
    glEnableClientState(GL_TEXTURE_COORD_ARRAY);
    glEnableClientState(GL_COLOR_ARRAY);
    glEnable(GL_COLOR_MATERIAL);
 	Freemem(VertexArray);vp:=0;
	Freemem(TexcoordArray);tp:=0;
	Freemem(ColorArray);cp:=0;
	VertexArray:=Getmem($1000*3*sizeof(GLFloat));
	TexcoordArray:=Getmem($1000*2*sizeof(GLFloat));
	ColorArray:=Getmem($1000*3*sizeof(GLFloat)); 
	Vertexes:=0;
	Textured:=FALSE;
	Colored:=FALSE;
end;
procedure TRenderer.Vertex3f(x,y,z:GLFloat);
begin
	if Textured=TRUE then begin
		TexCoordArray[tp]:=texcoordX;tp:=tp+1;
		TexCoordArray[tp]:=texcoordY;tp:=tp+1;
	end;
	if Colored=TRUE then begin
		ColorArray[cp]:=colorR;cp:=cp+1;
		ColorArray[cp]:=colorG;cp:=cp+1;
		ColorArray[cp]:=colorB;cp:=cp+1;
	end;
	Vertexes:=Vertexes+1;
	VertexArray[vp]:=x;vp:=vp+1;
	VertexArray[vp]:=y;vp:=vp+1;
	VertexArray[vp]:=z;vp:=vp+1;
end;
procedure TRenderer.TexCoord2f(x,y:GLFloat);
begin
	TexcoordX:=x;
	TexcoordY:=y;
	Textured:=TRUE;
end;
procedure TRenderer.Color3f(r,g,b:GLFloat);
begin
	colorR:=r;
	colorG:=g;
	colorB:=b;
	Colored:=TRUE;
end;
procedure TRenderer.Flush;
begin
	if vertexes>0 then begin
		if Textured=TRUE then
			glTexcoordPointer(2,GL_FLOAT,0,TexcoordArray);
		if colored=TRUE then
			glColorPointer(3,GL_FLOAT,0,ColorArray);
		glVertexPointer(3,GL_FLOAT,0,VertexArray);
		glDrawArrays(GL_TRIANGLE_FAN,0,vertexes);
		Init();
	end;

end;

end.