//Parameters
Ne_wz=	8;
Ne_wx=	15;
Ne_xz=	30;



b_wx=4;


// - Points
Point(1) = {0,  -1, 0};
Point(2) = {0,   1, 0};
Point(3) = {0,   1,  2};
Point(4) = {0,   -1, 2};

Point(5) = {3.14,  -1, 0};
Point(6) = {3.14,   1, 0};
Point(7) = {3.14,   1, 2};
Point(8) = {3.14,  -1,  2};

// - Bottom Lines (x-z plane)
Line(1) = {1, 2};
Transfinite Curve{1} = Ne_wx Using Bump 1/b_wx;
Line(2) = {4, 3};
Transfinite Curve{2} = Ne_wx Using Bump 1/b_wx;
Line(3) = {1, 4};
Transfinite Curve{3} = Ne_wz Using Progression 1;
Line(4) = {2, 3};
Transfinite Curve{4} = Ne_wz Using Progression 1;

Line(5) = {5, 1};
Transfinite Curve{5} = Ne_xz Using Progression 1;
Line(6) = {6, 2};
Transfinite Curve{6} = Ne_xz Using Progression 1;
Line(7) = {3, 7};
Transfinite Curve{7} = Ne_xz Using Progression 1;
Line(8) = {4, 8};
Transfinite Curve{8} = Ne_xz Using Progression 1;

Line(9) = {5, 6};
Transfinite Curve{9} = Ne_wx Using Bump 1/b_wx;
Line(10) = {6, 7};
Transfinite Curve{10} =  Ne_wz Using Progression 1.0;
Line(11) = {8, 7};
Transfinite Curve{11} = Ne_wx Using Bump 1/b_wx;
Line(12) = {5, 8};
Transfinite Curve{12} = Ne_wz Using Progression 1.0;


// - Bottom Horizontal Surfaces:
Line Loop(1) = {1, 4, -2, -3};
Plane Surface(1) = {1};
Line Loop(2) = {9, 6, -1, -5};
Plane Surface(2) = {2};
Line Loop(3) = {-6, 10, -7, -4};
Plane Surface(3) = {3};
Line Loop(4) = {2, 7, -11, -8};
Plane Surface(4) = {4};
Line Loop(5) = {5, 3, 8, -12};
Plane Surface(5) = {5};
Line Loop(6) = {9, 10, -11, -12};
Plane Surface(6) = {6};

// - Bottom Solids
Surface Loop(2) = {2, 3, 4, 5, 1, 6};
Volume(2) = {2};




Transfinite Surface "*";
Recombine Surface "*";
Transfinite Volume "*";
Recombine Volume "*";
Mesh 3;
SetOrder 2;
Physical Surface("inlet", 1) = {1};
Physical Surface("outlet", 2) = {6};
Physical Surface("w ", 3) = {3,5};
Physical Surface("left", 5) = {2};
Physical Surface("right", 6) = {4};
Physical Volume("fluid", 8) = {2};


