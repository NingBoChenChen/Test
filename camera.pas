{$MODE OBJFPC}
unit camera;

interface

uses
	gl,glu,glut;
	
type
	TCamera=class
		private
			x,y,z:extended;
			rd,ud:extended;
		public
			constructor Create;
			procedure Move(t:extended);
			procedure MoveY(t:extended);
			procedure Turn(drd,dud:extended);
			procedure Modify;
	end;

implementation

constructor TCamera.Create;
begin
	x:=0;
	y:=0;
	z:=0;
	rd:=0;
	ud:=0;
end;
procedure TCamera.Move(t:extended);
begin
	x:=x+sin(rd*PI/180)*t;
	z:=z+cos(rd*PI/180)*t;
end;
procedure TCamera.MoveY(t:extended);
begin
	y:=y-t;
end;
procedure TCamera.Turn(drd,dud:extended);
begin
	rd:=rd+drd;
	if(rd>359)then
		rd:=0;
	if(rd<-359)then
		rd:=0;
	ud:=ud+dud;
	if(ud>89)then
		ud:=89;
	if(ud<-89)then
		ud:=-89;
end;
procedure TCamera.Modify;
begin
	glRotatef(ud,1,0,0);
	glRotatef(360-rd,0,1,0);
	glTranslatef(x,y,z);
end;

end.