unit PlayerLib;
interface

type 
    player = record
        health: integer;
        mana: integer;
        attack: integer;
        wmgPower: integer;
        bmgPower: integer;
        accuracy: integer;
        focus: integer;
        plName: string;
    end;

procedure initPlayer(var x: player; hp,mp,atk,wmp,bmp,acc,crit: integer; plName: string);
procedure plAttack(var x,y: player);
procedure plHeal(var x: player);
procedure playerMove(var x,y: player; str: string);

implementation

procedure initPlayer(var x: player; hp,mp,atk,wmp,bmp,acc,crit: integer; plName: string);
begin
    x.health := hp;
    x.mana := mp;
    x.attack := atk;
    x.wmgPower := wmp;
    x.bmgPower := bmp;
    x.accuracy := acc;
    x.focus := crit;
    x.plName := plName;
end;

procedure plAttack(var x,y: player);
begin
    if random(y.accuracy) = 0 then 
    begin
        writeln(y.plName,' missed!');
    end
    else if random(y.focus) = 0 then
    begin
        x.health := x.health - (y.attack * 2);
        writeln(
        'Critical hit!!!!'#10,
        (y.attack * 2),' damage to ',x.plName,'!'); 
    end
    else
    begin
        x.health := x.health - y.attack;
        writeln(y.attack,' damage to ',x.plName,'!');
    end
end;

procedure plHeal(var x: player);
const
    MANA_COST = 3;
begin
    if x.mana >= MANA_COST then 
    begin
        x.health := x.health + x.wmgPower;
        writeln('Restored ',x.wmgPower,' health to ',x.plName,'!');
        x.mana := x.mana - MANA_COST;
    end
    else 
        writeln('Not enough mana!');
    writeln('Mana remaining: ',x.mana);
end;

procedure playerMove(var x,y: player; str: string);
begin
    case str of
        'a': plAttack(y, x);
        'h': plHeal(x);
    else
        writeln('Not a valid action.');
    end
end;

end.