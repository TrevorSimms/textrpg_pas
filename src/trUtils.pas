unit trUtils;
interface
uses EntityLib, crt;

function isDebug: Boolean;
function isDead(val: integer): Boolean;
function isBattleOver(val1,val2: integer): Boolean;

procedure dispTurn(var x, y: entity; dbug: Boolean; var opt: string);

implementation

function isDebug: Boolean;
begin
    isDebug := (ParamCount > 0) and (ParamStr(1) = 'debug');
end;

function isDead(val: integer): Boolean;
begin
    isDead := val < 1;
end;

function isBattleOver(val1,val2: integer): Boolean;
begin
    if isDead(val1) then
    begin
        writeln('You died, oh noes :(');
        isBattleOver := true;
    end
    else if isDead(val2) then
    begin
        writeln('You won, good job :D');
        isBattleOver := true;
    end
    else
        isBattleOver := false;
end;

procedure dispTurn(var x, y: entity; dbug: Boolean; var opt: string);
begin
    clrscr;
    writeln(x.entName,' Health: ', x.health,#10,x.entName,' Mana: ', x.mana);
    if dbug then
        writeln(y.entName,' Health: ', y.health,#10,y.entName,' Mana: ', y.mana);
    write('What will you do? ');
    readln(opt);
end;

end.