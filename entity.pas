{$MODE OBJFPC}
unit entity;

interface

uses
	model,camera;

type
	TPosition=record
		x,y,z:extended;
	end;
	
type
	TEntity=class;
	
type
	TOnMouseLeftFunc	=procedure(Sender:TEntity);
	TOnMouseRightFunc	=procedure(Sender:TEntity);
	TOnSelectFunc		=procedure(Sender:TEntity);
	TOnCreateFunc		=procedure(Sender:TEntity);
	TOnDestroyFunc		=procedure(Sender:TEntity);

type
	TEntityEvent=class
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
	TEntity=class
		private
			pos:TPosition;
			mdl:TModel;
			lkud,lkar:extended;
			cmr:TCamera;
			event:TEntityEvent;
		public
			constructor Create;
			constructor Create(p:TPosition;c:TCamera;e:TEntityEvent);
			procedure Redraw;
			procedure Trs(p:TPosition);
			procedure Mov(t:longint);
			procedure Rot(ud,ar:extended);
			property Models:TModel read mdl write mdl;
	end;

implementation

constructor TentityEvent.Create;
begin
	MouseLeftFunc	:=NIL;
	MouseRightFunc	:=NIL;
	SelectFunc		:=NIL;
	CreateFunc		:=NIL;
	DestroyFunc		:=NIL;
end;

constructor TEntity.Create;
begin
	event:=TEntityEvent.Create;
	with pos do begin
		x:=0;
		y:=0;
		z:=0;
	end;
	lkud:=0;
	lkar:=0;
	cmr:=NIL;
end;
constructor TEntity.Create(p:TPosition;c:TCamera;e:TEntityEvent);
begin
	event:=e;
	pos:=p;
	cmr:=c;
	lkud:=0;
	lkar:=0;
end;
procedure TEntity.Redraw;
begin
end;
procedure TEntity.Trs(p:TPosition);
begin
end;
procedure TEntity.Mov(t:longint);
begin
end;
procedure TEntity.Rot(ud,ar:extended);
begin
end;

end.