unit trUtils;
interface

function isDebug: Boolean;
function isDead(val: integer): Boolean;
function isBattleOver(val1,val2: integer): Boolean;

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

end.