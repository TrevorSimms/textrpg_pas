program textrpg;
uses crt, PlayerLib;

const
    instructions = '(A|a) for Attack'#10'(H|h) for heal';
    startVal = 100;
    attackVal = 10;
    healVal = 5;
    castVal = 0;

var
    bRun: Boolean;
    bDebug: Boolean;
    usrInput: string;
    hero, enemy: player;

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

{ main function }
begin
    bRun := true;
    bDebug := isDebug;
    initPlayer(hero, startVal, attackVal, healVal, castVal, 'hero');
    initPlayer(enemy, startVal, attackVal, healVal, castVal, 'enemy');

    clrscr;
    writeln(instructions);
    while bRun do 
    begin
        writeln('Health: ', hero.health);
        if bDebug then
            writeln('Enemy Health: ', enemy.health);
        write('What will you do? ');
        readln(usrInput);
        case usrInput of
            'a': plAttack(enemy.health, hero.attack, enemy.plName);
            'h': plHeal(hero.health, hero.wmgPower, hero.plName);
        else
            writeln('Not a valid action.');
        end;
        plAttack(hero.health, enemy.attack, hero.plName);
        bRun := isBattleOver(hero.health, enemy.health);
    end;
    if bDebug then
        writeln('Final Hero Health: ',hero.health,#10'Final Enemy Health: ',enemy.health);
    readkey;
    clrscr;
end.