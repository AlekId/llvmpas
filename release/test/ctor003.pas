(*
<test>
  <description>以类引用调用构造函数</description>
  <command>%%pc -dump-code %%source </command>
  <expect>
    <output action="contains">IsClassrefPrefix=true</output>
  </expect>
</test>
*)
unit ctor003;
interface
type
	tmyobj = class
		destructor destroy; override;
	end;

	tmyclass = class of tmyobj;

procedure test(klass: tmyclass);

implementation

destructor tmyobj.destroy; 
begin
	//inherited;
end;

procedure test(klass: tmyclass);
var
	obj: tmyobj;
begin
	obj := klass.Create;
	obj.Free;
end;

end.