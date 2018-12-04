function p = Kochsnowflake(n,A,B,C)

AlterPunkt_AB = [A,B];
AlterPunkt_BC = [B,C];
AlterPunkt_CA = [C,A];

NeuerPunkt_AB = [];
NeuerPunkt_BC = [];
NeuerPunkt_CA = [];

AdditionsPunkt_AB = [];
AdditionsPunkt_BC = [];
AdditionsPunkt_CA = [];

Winkel = 60;
Radiant = -pi/180*Winkel;
Index = 1;
Iteration = n;
Iteration2 = 0;
Vergleich = 1;
Iteration_Vergleich = 0;
Runde = 0;

while 1
    Iteration2 = Iteration2+1;
    Runde = Runde + 1;
    if Iteration_Vergleich == Iteration
        break
    end
    for Index2 = 1:3

        if Index2 == 1 || Index2 == 3
            Drehung = 1;
        end
        if Index2 == 2
            Drehung = [cos(Radiant),-sin(Radiant);sin(Radiant),cos(Radiant)];
        end

        Punkt_AB = 1/3.*(Drehung *(AlterPunkt_AB(:,Runde+1)-AlterPunkt_AB(:,Runde)));
        Punkt_BC = 1/3.*(Drehung *(AlterPunkt_BC(:,Runde+1)-AlterPunkt_BC(:,Runde)));
        Punkt_CA = 1/3.*(Drehung *(AlterPunkt_CA(:,Runde+1)-AlterPunkt_CA(:,Runde)));

        if Index2 == 1
            Punkt_AB = Punkt_AB+AlterPunkt_AB(:,Runde);
            Punkt_BC = Punkt_BC+AlterPunkt_BC(:,Runde);
            Punkt_CA = Punkt_CA+AlterPunkt_CA(:,Runde);
            Platzhalter_AB = Punkt_AB(:,1);
            Platzhalter_BC = Punkt_BC(:,1);
            Platzhalter_CA = Punkt_CA(:,1);
        end
        if Index2 == 2 || Index2 == 3
            Punkt_AB = Platzhalter_AB+Punkt_AB(:,1);
            Punkt_BC = Platzhalter_BC+Punkt_BC(:,1);
            Punkt_CA = Platzhalter_CA+Punkt_CA(:,1);
        end

        NeuerPunkt_AB = [NeuerPunkt_AB,Punkt_AB];
        NeuerPunkt_BC = [NeuerPunkt_BC,Punkt_BC];
        NeuerPunkt_CA = [NeuerPunkt_CA,Punkt_CA];

    end
    AdditionsPunkt_AB = [AdditionsPunkt_AB, NeuerPunkt_AB];
    AdditionsPunkt_BC = [AdditionsPunkt_BC, NeuerPunkt_BC];
    AdditionsPunkt_CA = [AdditionsPunkt_CA, NeuerPunkt_CA];
    
    NeuerPunkt_AB = [];
    NeuerPunkt_BC = [];
    NeuerPunkt_CA = [];
    
    if Iteration2 == Vergleich
        Vergleich = Vergleich*4;
        Iteration2 = 0;
        Runde = 0;
        Iteration_Vergleich = Iteration_Vergleich+1;
        for x = (length(AdditionsPunkt_AB)/3):-1:1

        AlterPunkt_AB = [AlterPunkt_AB(:,1:x),AdditionsPunkt_AB(:,(x*3-2):(x*3)),AlterPunkt_AB(:,(x+1):end)];
        AlterPunkt_BC = [AlterPunkt_BC(:,1:x),AdditionsPunkt_BC(:,(x*3-2):(x*3)),AlterPunkt_BC(:,(x+1):end)];
        AlterPunkt_CA = [AlterPunkt_CA(:,1:x),AdditionsPunkt_CA(:,(x*3-2):(x*3)),AlterPunkt_CA(:,(x+1):end)];
        end
        AdditionsPunkt_AB = [];
        AdditionsPunkt_BC = [];
        AdditionsPunkt_CA = [];
    end
end


p = [AlterPunkt_AB,AlterPunkt_BC,AlterPunkt_CA];
