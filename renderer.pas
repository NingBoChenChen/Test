library renderer;

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

