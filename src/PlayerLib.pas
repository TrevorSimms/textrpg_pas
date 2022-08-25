unit PlayerLib;
interface

type 
    player = record
        health: integer;
        mana: integer;
        attack: integer;
        wmgPower: integer;
        bmgPower: integer;
        plName: string;
    end;

procedure initPlayer(var x: player; hp,mp,atk,wmp,bmp: integer; plName: string);
procedure plAttack(var x,y: player);
procedure plHeal(var x: player);
procedure playerMove(var x,y: player; str: string);

implementation

procedure initPlayer(var x: player; hp,mp,atk,wmp,bmp: integer; plName: string);
begin
    x.health := hp;
    x.mana := mp;
    x.attack := atk;
    x.wmgPower := wmp;
    x.bmgPower := bmp;
    x.plName := plName;
end;

procedure plAttack(var x,y: player);
begin
    x.health := x.health - y.attack;
    writeln(y.attack,' damage to ',x.plName,'!');
end;

procedure plHeal(var x: player);
begin
    if x.mana > 0 then 
    begin
        x.health := x.health + x.wmgPower;
        writeln('Restored ',x.wmgPower,' health to ',x.plName,'!');
        x.mana := x.mana - 3;
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
    end;
end;

end.