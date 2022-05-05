SetFactory("OpenCASCADE");

H=2;
W=1;
Ho=0.2;
Do=0.05;
NH=40;
NW=20;
NHo=NH/H*Ho+1;
NDo=5;

Point(1) = {0, 0, 0, 1.0};
Point(2) = {0, Ho, 0, 1.0};
Point(3) = {0, Ho+Do, 0, 1.0};
Point(4) = {0, H, 0, 1.0};
Point(5) = {W, 0, 0, 1.0};
Point(6) = {W, Ho, 0, 1.0};
Point(7) = {W, Ho+Do, 0, 1.0};
Point(8) = {W, H, 0, 1.0};
Point(9) = {W+Do, Ho, 0, 1.0};
Point(10) = {W+Do, Ho+Do, 0, 1.0};

Line(1) = {1, 2};
Line(2) = {5, 6};
Line(3) = {2, 6};
Line(4) = {3, 7};
Line(5) = {1, 5};
Line(6) = {4, 8};
Line(7) = {2, 3};
Line(8) = {6, 7};
Line(9) = {9, 10};
Line(10) = {7, 10};
Line(11) = {6, 9};
Line(12) = {3, 4};
Line(13) = {7, 8};
Curve Loop(1) = {6, -13, -4, 12};
Plane Surface(1) = {1};
Curve Loop(2) = {7, 4, -8, -3};
Plane Surface(2) = {2};
Curve Loop(3) = {10, -9, -11, 8};
Plane Surface(3) = {3};
Curve Loop(4) = {1, 3, -2, -5};
Plane Surface(4) = {4};

Transfinite Curve {12, 13} = NH Using Progression 1.02;
Transfinite Curve {6, 5} = NW Using Progression 1;
Transfinite Curve {4, 3} = NW Using Progression 1;
Transfinite Curve {1, 2} = NHo Using Progression 0.7;
Transfinite Curve {7, 8, 9} = NDo Using Progression 1;
Transfinite Curve {10, 11} = NDo Using Progression 1;
Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {3};
Transfinite Surface {4};
Recombine Surface {1, 2, 3, 4};
Extrude {0, 0, 0.2} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; Layers {5}; Recombine;
}

Physical Surface("top", 37) = {5};
Physical Surface("fixedwall", 38) = {8, 10, 18, 20, 19, 16, 14, 6};
Physical Surface("outlet", 39) = {15};
Physical Surface("empty", 40) = {1, 2, 4, 9, 13, 21};
//+
Physical Surface("empty", 40) += {9, 1, 13, 2, 4, 21, 17, 3};
//+
Physical Volume("volume", 41) = {1, 2, 4, 3};
