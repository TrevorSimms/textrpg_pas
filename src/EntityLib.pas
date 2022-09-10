unit EntityLib;
interface

type 
    entity = record
        health: integer;
        mana: integer;
        attack: integer;
        wmgPower: integer;
        bmgPower: integer;
        accuracy: integer;
        focus: integer;
        entName: string;
        bPlayable: Boolean;
    end;

procedure initEntity(var x: entity; hp,mp,atk,wmp,bmp,acc,crit: integer; entName: string; entFlag: Boolean);
procedure entAttack(var x,y: entity);
procedure entHeal(var x: entity);
procedure entThunder(var x,y: entity);
function entityAI(var x: entity): string;
procedure entityMove(var x,y: entity; str: string);

implementation

procedure initEntity(var x: entity; hp,mp,atk,wmp,bmp,acc,crit: integer; entName: string; entFlag: Boolean);
begin
    x.health := hp;
    x.mana := mp;
    x.attack := atk;
    x.wmgPower := wmp;
    x.bmgPower := bmp;
    x.accuracy := acc;
    x.focus := crit;
    x.entName := entName;
    x.bPlayable := entFlag;
end;

procedure entAttack(var x,y: entity);
begin
    if random(x.accuracy) = 0 then 
    begin
        writeln(x.entName,' missed!');
    end
    else if random(x.focus) = 0 then
    begin
        y.health := y.health - (x.attack * 2);
        writeln(
            'Critical hit!!!!'#10,
            (x.attack * 2),' damage to ',y.entName,'!'
        ); 
    end
    else
    begin
        y.health := y.health - x.attack;
        writeln(x.attack,' damage to ',y.entName,'!');
    end
end;

procedure entHeal(var x: entity);
const
    MANA_COST = 3;
begin
    if x.mana >= MANA_COST then 
    begin
        x.health := x.health + x.wmgPower;
        writeln('Restored ',x.wmgPower,' health to ',x.entName,'!');
        x.mana := x.mana - MANA_COST;
    end
    else 
        writeln(x.entName,' out of mana!');
end;

procedure entThunder(var x,y: entity);
const
    MANA_COST = 6;
begin
    if x.mana >= MANA_COST then 
    begin
        y.health := y.health - x.bmgPower;
        writeln(
            'Cast Thunder!'#10,
            x.bmgPower,' damage to ',y.entName,'!'
        );
        x.mana := x.mana - MANA_COST;
    end
    else 
        writeln(y.entName,' out of mana!');
end;

function entityAI(var x: entity): string;
begin
    if x.mana > 0 then
    begin
        if (x.health <= 80) and (x.mana >= 3) and (random(5) = 0) then
        begin
            entityAI := 'h';
        end
        else if (x.health <= 60) and (x.mana >= 9) and (random(3) = 0) then
        begin
            entityAI := 't';
        end
        else
        begin
            entityAI := 'a';
        end
    end
    else
    begin
        entityAI := 'a';
    end
end;

procedure entityMove(var x,y: entity; str: string);
begin
    case str of
        'a': entAttack(x, y);
        'A': entAttack(x, y);
        'h': entHeal(x);
        'H': entHeal(x);
        't': entThunder(x, y);
        'T': entThunder(x, y);
    else
        writeln('Not a valid action.');
    end
end;

end.