% Simple SAT instance

array[1..4] of var bool: ps;
ps = [p1, p2, p3, p4];
var bool: p1; var bool: p2;
var bool: p3; var bool: p4;

array[1..7] of bool: hs = [true, true, true, true, true, true, true];
int: c = 0;
bool: install = true;
bool: hard = true;

%define clauses
constraint hs[1] = (not p1) \/ p2 \/ p3;
constraint hs[2] = (not p2) \/ p3;
constraint hs[3] = (not p3) \/ p2;
constraint hs[4] = (not p4) \/ p2;
constraint hs[5] = (not p4) \/ p3;
constraint hs[6] = (not p1) \/ (not p4);
constraint hs[7] = (not p3) \/ (not p4);
%constraint install = p1 /\ p2 /\ p3 /\ p4;
constraint c = bool2int(p1=true) + bool2int(p2=true) + bool2int(p3=true) + bool2int(p4=true);

output[show(ps)];
solve satisfy;