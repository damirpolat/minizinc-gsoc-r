% Colouring Australia using nc colours
int: nc = 3;

var 1..nc: wa;   var 1..nc: nt;

constraint wa != nt;
solve satisfy;

output ["wa=\(wa)\t nt=\(nt)\t"];