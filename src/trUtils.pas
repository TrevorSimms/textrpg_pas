unit trUtils;
interface

function isDebug: Boolean;
function isDead(val: integer): Boolean;
function isBattleOver(val1,val2: integer): Boolean;

implementation

function isDebug: Boolean;
begin
    if (ParamCount > 0) and (ParamStr(1) = 'debug') then
        isDebug := true
    else
        isDebug := false
end;

function isDead(val: integer): Boolean;
begin
    if val < 1 then
        isDead := true
    else
        isDead := false
end;

function isBattleOver(val1,val2: integer): Boolean;
begin
    if isDead(val1) then
    begin
        writeln('You died, oh noes :(');
        isBattleOver := false;
    end
    else if isDead(val2) then
    begin
        writeln('You won, good job :D');
        isBattleOver := false;
    end
    else
        isBattleOver := true;
end;

end.