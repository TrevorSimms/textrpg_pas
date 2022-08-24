unit PlayerLib;
interface

type 
    player = record
        health: integer;
        attack: integer;
        wmgPower: integer;
        bmgPower: integer;
        plName: string;
    end;

procedure initPlayer(var x: player; hp,atk,wmp,bmp: integer; plName: string);
procedure plAttack(var x,y: integer; s: string);
procedure plHeal(var health,val: integer; var plName: string);

implementation

procedure initPlayer(var x: player; hp,atk,wmp,bmp: integer; plName: string);
begin
    x.health := hp;
    x.attack := atk;
    x.wmgPower := wmp;
    x.bmgPower := bmp;
    x.plName := plName;
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

end.