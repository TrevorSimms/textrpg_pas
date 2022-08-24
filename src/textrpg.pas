program textrpg;
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
    end;

var
    bRun: Boolean;
    usrInput: string;
    hero, enemy: player;

procedure initGame;
begin
    hero.health := startVal;
    hero.attack := attackVal;
    enemy.health := startVal;
    enemy.attack := attackVal
end;

procedure heroAttack;
begin
    enemy.health := enemy.health - hero.attack;
    writeln(hero.attack,' damage to enemy!');
end;

procedure heroHeal;
begin
    hero.health := hero.health + healVal;
    writeln('Restored ',hero.health,' health!');
end;

function isDead(val: integer): Boolean;
begin
    if val < 1 then
        isDead := true
    else
        isDead := false
end;

function battleOver(val1,val2: integer): Boolean;
begin
    if isDead(val1) then
    begin
        writeln('You died, oh noes :(');
        battleOver := false;
    end
    else if isDead(val2) then
    begin
        writeln('You won, good job :D');
        battleOver := false;
    end
    else
        battleOver := true;
end;

begin
    clrscr;
    bRun := true;
    initGame;
    writeln(instructions);
    while bRun do 
    begin
        writeln('Health: ', hero.health);
        write(usrPrompt);
        readln(usrInput);
        case usrInput of
            'a': heroAttack;
            'h': heroHeal;
        else
            writeln('Not a valid action.');
        end;
        hero.health := hero.health - enemy.attack;
        writeln('10 damage to Hero.');
        // make function
        bRun := battleOver(hero.health,enemy.health);
    end;
    readkey;
    clrscr;
end.