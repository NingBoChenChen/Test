{$MODE DELPHI}
unit entity;

interface

uses
	model,camera;

type
	TPosition=record
		x,y,z:extended;
	end;

type
	TEntity=class
		private
			pos:TPosition;
			mdl:TModel;
			lkud,lkar:extended;
		public
			constructor Create;
			procedure Redraw;
			procedure Trs(p:TPosition);
			procedure Mov(t:longint);
			procedure Rot(ud,ar:extended);
	end;
	
type
	TPlayer=class(TEntity)
		private
			
		public
	end;

implementation

end.