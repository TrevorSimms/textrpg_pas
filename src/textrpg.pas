program textrpg(clsarg);
uses crt;

const
    instructions = '(A|a) for Attack'#10'(H|h) for heal';
    usrPrompt = 'What will you do? ';
    startVal = 100;
    attackVal = 10;
    healVal = 5;

type
    player = record
        health: integer;
        attack: integer;
        wmgPower: integer;
        bmgPower: integer;
        plName: string;
    end;

var
    bRun: Boolean;
    bDebug: Boolean;
    usrInput: string;
    hero, enemy: player;

procedure initGame(var x,y: player);
begin
    x.health := startVal;
    x.attack := attackVal;
    x.wmgPower := healVal;
    y.health := startVal;
    y.attack := attackVal
end;

procedure namePlayer(str: string; var myStr: string);
begin
    myStr := str
end;

procedure plAttack(var x,y: integer; s: string);
begin
    x := x - y;
    writeln(y,' damage to ',s,'!');
end;

procedure plHeal(var health,val: integer; var plName: string);
begin
    health := health + Val;
    writeln('Restored ',health,' health to ',plName,'!');
end;

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

begin
    clrscr;
    bRun := true;
    bDebug := isDebug;
    initGame(hero, enemy);
    namePlayer('hero', hero.plName);
    namePlayer('enemy', enemy.plName); 
    writeln(instructions);
    while bRun do 
    begin
        writeln('Health: ', hero.health);
        if bDebug then
            writeln('Enemy Health: ', enemy.health);
        write(usrPrompt);
        readln(usrInput);
        case usrInput of
            'a': plAttack(enemy.health, hero.attack, enemy.plName);
            'h': plHeal(hero.health, hero.wmgPower, hero.plName);
        else
            writeln('Not a valid action.');
        end;
        plAttack(hero.health, enemy.attack, hero.plName);
        // make function
        bRun := isBattleOver(hero.health, enemy.health);
    end;
    if bDebug then
        writeln('Final Hero Health: ',hero.health,#10'Final Enemy Health: ',enemy.health);
    readkey;
    clrscr;
end.