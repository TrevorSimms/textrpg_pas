program textrpg;
uses crt, PlayerLib, trUtils;

const
    KEY_CONST_QUERY = 'Press any key to continue...';
    INSTRUCTIONS = 
        '(A|a) for Attack,'#9' 10 damage'#10 +
        '(H|h) for Heal -3,'#9' mana'#10 +
        '(T|t) for Thunder Attack,'#9' -9 mana'#10 + 
        KEY_CONST_QUERY;
    START_VAL = 100;
    MANA_VAL = 12;
    ATTACK_VAL = 10;
    HEAL_VAL = 15;
    CAST_VAL = 50;
    ACC_VAL = 10;
    LUCK_VAL = 20;

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
    randomize;
    // initialize player entities here
    initPlayer(hero, START_VAL, MANA_VAL, ATTACK_VAL, HEAL_VAL, CAST_VAL, ACC_VAL, LUCK_VAL, 'Hero');
    initPlayer(enemy, START_VAL, MANA_VAL, ATTACK_VAL, HEAL_VAL, CAST_VAL, ACC_VAL, LUCK_VAL, 'Enemy');
    clrscr;
    writeln(INSTRUCTIONS);
    readkey;
end;


procedure battleStage(var x, y: player; dbug: Boolean);
begin
    clrscr;
    writeln(x.plName,' Health: ', x.health);
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
        writeln(KEY_CONST_QUERY);
        readkey;
    end;
    if bDebug then
    begin
        writeln(
        'Debug Info:',
        #10'Final ',hero.plName,' Health: ',hero.health,
        #10'Final ',enemy.plName,' Health: ',enemy.health
        );
        writeln(KEY_CONST_QUERY);
        readkey;
    end;

    clrscr;
end.