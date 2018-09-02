unit filesystem;

interface

type
	barr=array of byte;

type
	TFileSystem=class
		private
			f:file of byte;
		public
			constructor Create;
			procedure AssignFile(fnm:string;read:boolean);
			procedure FlushFile;
			procedure CloseFile;
			
			function Read(t:byte):barr;
			procedure Write(t:byte;a:barr);
			
			function ReadByte		:Byte;
			function ReadWord		:Word;
			function ReadDWord		:DWord;
			function ReadQWord		:QWord;
			function ReadShortInt	:ShortInt;
			function ReadInteger	:Integer;
			function ReadLongInt	:LongInt;
			function ReadInt64		:Int64;
			
			procedure WriteByte		(t:Byte);
			procedure WriteWord		(t:Word);
			procedure WriteDWord	(t:DWord);
			procedure WriteQWord	(t:QWord);
			procedure WriteShortInt	(t:ShortInt);
			procedure WriteInteger	(t:Integer);
			procedure WriteLongInt	(t:LongInt);
			procedure WriteInt64	(t:Int64);
	end;

implementation

constructor TFileSystem.Create;
begin
end;
procedure TFileSystem.AssignFile(fnm:string;read:boolean);
begin
	assign(f,fnm);
	if(read)then
		reset(f)
	else
		rewrite(f);
end;
procedure TFileSystem.FlushFile;
begin
	flush(f);
end;
procedure TFileSystem.CloseFile;
begin
	close(f);
end;

function TFileSystem.Read(t:byte):barr;
var
	a:barr;
begin
	SetLength(a,t);
	
end;
procedure TFileSystem.Write(t:byte;a:barr);
begin
	
end;

function TFileSystem.ReadByte		:Byte;
function TFileSystem.ReadWord		:Word;
function TFileSystem.ReadDWord		:DWord;
function TFileSystem.ReadQWord		:QWord;
function TFileSystem.ReadShortInt	:ShortInt;
function TFileSystem.ReadInteger	:Integer;
function TFileSystem.ReadLongInt	:LongInt;
function TFileSystem.ReadInt64		:Int64;

procedure TFileSystem.WriteByte		(t:Byte);
procedure TFileSystem.WriteWord		(t:Word);
procedure TFileSystem.WriteDWord	(t:DWord);
procedure TFileSystem.WriteQWord	(t:QWord);
procedure TFileSystem.WriteShortInt	(t:ShortInt);
procedure TFileSystem.WriteInteger	(t:Integer);
procedure TFileSystem.WriteLongInt	(t:LongInt);
procedure TFileSystem.WriteInt64	(t:Int64);

end.