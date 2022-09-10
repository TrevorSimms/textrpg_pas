program textrpg;
uses crt, EntityLib, trUtils;

const
    INSTRUCTIONS = 
        '(A|a) for Attack,'#9' 10 damage'#10 +
        '(H|h) for Heal,'#9#9' -3 mana'#10 +
        '(T|t) for Thunder Attack,'#9' -9 mana'#10 + 
        'Press any key to continue...';
    START_VAL = 100;
    MANA_VAL = 12;
    ATTACK_VAL = 10;
    HEAL_VAL = 15;
    CAST_VAL = 30;
    ACC_VAL = 10;
    LUCK_VAL = 20;
    WSTART_W = 10;
    WSTART_H = 10;
    WIN_W = 30;
    WIN_H = 15;

var
    bRun: Boolean;
    bDebug: Boolean;
    usrInput: string;
    hero, enemy: entity;

// commands to run before gameloop
procedure initGame;
begin
    bRun := true;
    bDebug := isDebug;
    clrscr;
    Sound(400);
    delay(100);
    TextBackground(Black);
    TextColor(Cyan);
    Window(WSTART_W,WSTART_H,(WSTART_W + WIN_W),(WSTART_H + WIN_H));
    randomize;
    // initialize player entities here
    initEntity(hero, START_VAL, MANA_VAL, ATTACK_VAL, HEAL_VAL, CAST_VAL, ACC_VAL, LUCK_VAL, 'Hero', true);
    initEntity(enemy, START_VAL, MANA_VAL, ATTACK_VAL, HEAL_VAL, CAST_VAL, ACC_VAL, LUCK_VAL, 'Enemy', false);
    clrscr;
    writeln(INSTRUCTIONS);
    readkey;
end;

//procedure 

{ main function }
begin
    initGame;
    while bRun do 
    begin
        dispTurn(hero, enemy, bDebug, usrInput);
        entityMove(hero, enemy, usrInput);
        bRun := not isBattleOver(hero.health, enemy.health);
        if not bRun then
        begin
            writeln('Press any key to continue...');
            readkey;
            break;
        end;
        entityMove(enemy, hero, entityAI(enemy)); //enemy move
        bRun := not isBattleOver(hero.health, enemy.health);
        writeln('Press any key to continue...');
        readkey;
    end;
    if bDebug then
    begin
        writeln(
        'Debug Info:',
        #10'Final ',hero.entName,' Health: ',hero.health,
        #10'Final ',enemy.entName,' Health: ',enemy.health
        );
        writeln('Press any key to continue...');
        readkey;
    end;
    window(1,1,80,25);
    clrscr;
end.