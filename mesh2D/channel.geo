//Parameters
Ne_wz=	8;
Ne_wx=	15;
Ne_xz=	30;



b_wx=4;


// - Points
Point(1) = {0,  -1, 0};
Point(2) = {0,   1, 0};

Point(5) = {3.14,  -1, 0};
Point(6) = {3.14,   1, 0};

// - Bottom Lines (x-z plane)
Line(1) = {1, 2};
Transfinite Curve{1} = Ne_wx Using Bump 1/b_wx;

Line(5) = {5, 1};
Transfinite Curve{5} = Ne_xz Using Progression 1;
Line(6) = {6, 2};
Transfinite Curve{6} = Ne_xz Using Progression 1;

Line(9) = {5, 6};
Transfinite Curve{9} = Ne_wx Using Bump 1/b_wx;


// - Bottom Horizontal Surfaces:
Line Loop(2) = {9, 6, -1, -5};
Plane Surface(2) = {2};




Transfinite Surface "*";
Recombine Surface "*";
Mesh 2;
SetOrder 2;
Physical Line("inlet", 1) = {1};
Physical Line("outlet", 2) = {9};
Physical Line("w ", 3) = {5,6};
Physical Surface("fluid", 8) = {2};


