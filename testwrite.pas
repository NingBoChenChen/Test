var
	f:file of extended;
begin
	assign(f,'testwrite.txt');
	rewrite(f);
	write(f,);
	close(f);
end.