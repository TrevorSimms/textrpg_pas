program textrpg;
uses crt, PlayerLib, trUtils;

const
    instructions = '(A|a) for Attack'#10'(H|h) for heal'#10'Press any key to continue...';
    startVal = 100;
    manaVal = 30;
    attackVal = 10;
    healVal = 11;
    castVal = 0;

var
    bRun: Boolean;
    bDebug: Boolean;
    usrInput: string;
    hero, enemy: player;

{ main function }
begin
    bRun := true;
    bDebug := isDebug;
    initPlayer(hero, startVal, manaVal, attackVal, healVal, castVal, 'hero');
    initPlayer(enemy, startVal, manaVal, attackVal, healVal, castVal, 'enemy');

    clrscr;
    writeln(instructions);
    readkey;
    while bRun do 
    begin
        clrscr;
        writeln('Health: ', hero.health);
        if bDebug then
            writeln('Enemy Health: ', enemy.health);
        write('What will you do? ');
        readln(usrInput);
        case usrInput of
            'a': plAttack(enemy, hero);
            'h': plHeal(hero);
        else
            writeln('Not a valid action.');
        end;
        plAttack(hero, enemy);
        bRun := isBattleOver(hero.health, enemy.health);
        writeln('...');
        readkey;
    end;
    if bDebug then
        writeln('Final Hero Health: ',hero.health,#10'Final Enemy Health: ',enemy.health);
    readkey;
    clrscr;
end.