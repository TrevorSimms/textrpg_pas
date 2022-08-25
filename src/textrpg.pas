program textrpg;
uses crt, PlayerLib, trUtils;

const
    keyContQuery = 'Press any key to continue...';
    instructions = '(A|a) for Attack'#10'(H|h) for heal'#10 + keyContQuery;
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

// commands to run before gameloop
procedure initGame;
begin
    bRun := true;
    bDebug := isDebug;
    // initialize player entities here
    initPlayer(hero, startVal, manaVal, attackVal, healVal, castVal, 'Hero');
    initPlayer(enemy, startVal, manaVal, attackVal, healVal, castVal, 'Enemy');
    clrscr;
    writeln(instructions);
    readkey;
end;


procedure battleStage(var x, y: player; dbug: Boolean);
begin
    clrscr;
    writeln('Health: ', x.health);
    if bDebug then
        writeln(y.plName,' Health: ', y.health);
    write('What will you do? ');
end;

//procedure 

{ main function }
begin
    initGame;
    while bRun do 
    begin
        battleStage(hero, enemy, bDebug);
        readln(usrInput);
        playerMove(hero, enemy, usrInput);
        playerMove(enemy, hero, 'a'); //enemy move
        bRun := not isBattleOver(hero.health, enemy.health);
        writeln(keyContQuery);
        readkey;
    end;
    if bDebug then
    begin
        writeln(
        'Debug Info:',
        #10'Final ',hero.plName,' Health: ',hero.health,
        #10'Final ',enemy.plName,' Health: ',enemy.health
        );
        writeln(keyContQuery);
        readkey;
    end;

    clrscr;
end.