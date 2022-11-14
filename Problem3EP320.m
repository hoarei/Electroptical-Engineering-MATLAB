clc
clear all
%Problem 3
fprintf('Problem 3');

%Consider an eyepiece with the following specifications.
    %L1, n=1.51680, t=29.500mm, R1=infinity, R2=-281.336mm
    %L2, n=1.58913, t=40.800mm, R1=112.518mm, R2=-67.511mm
    %L3, n=1.64831, t=9.800mm, R1=-67.511mm, R2=-350.068mm
    %L1 and L2 are separated by 102.44mm
    %L2 and L3 are cemented
%An object of height 60mm is located 30mm left of first lens

%(a) Use matrix method to determine the image location and size
fprintf('\n\n(a)')

%Define all variables for the 3 lenses and other given constants
%Lens 1 (L1)
n1 = 1.51680;
t1 = 29.500;
R11 = Inf;
R21 = -281.336;

%Lens 2 (L2)
n2 = 1.58913;
t2 = 40.800;
R12 = 112.518;
R22 = -67.511;

%Lens 3 (L3)
n3 = 1.64831;
t3 = 9.800;
R13 = -67.511;
R23 = -350.068;

%Constants
    %variable h is height of object, d is distance between L1 and L2, o is
    %distance between L1 and object, m is index n of air
h = 60;
d = 102.4;
o = 30;
m = 1;

%Next, use thick lens function to create values for matrices L1, L2, and L3.
L1 = thick(n1, m, R21, t1, R11);
L2 = thick(n2, m, R22, t2, R12);
L3 = thick(n3, m, R23, t3, R13);

%The translation matrix requires the propagation function for difference
    %between lenses
T = propagation(d);

%Create matrix of system
M = L3*L2*T*L1;

%Define A, B, C, D variables from matrix M (different method from problem2)
A = M(1,1);
B = M(1,2);
C = M(2,1);
D = M(2,2);

%Finally, plug in variables into image position and magnification equations
image = -((A*o)+B)/((C*o)+D);
mag = A+C*image;

%Print answer
fprintf('\n\n The image is located at %.2f mm',image)
fprintf('\n The image has a magnification of %.2f',mag)

%(b)Determine location of focal and principle planes
fprintf('\n\n(b)')

%Cardinal Points p, q, r, s, v, w
p = D/C;
q = -A/C;
r = (D-1)/C;
s = (1-A)/C;
v = (D-1)/C;
w = (1-A)/C;

%focal points f1 and f2
f1 = p-r;
f2 = q-s;

%Print results
fprintf('\n\nCardinal Points:')
fprintf('\n p = %.2f mm', p)
fprintf('\n q = %.2f mm', q)
fprintf('\n r = %.2f mm', r)
fprintf('\n s = %.2f mm', s)
fprintf('\n v = %.2f mm', v)
fprintf('\n w = %.2f mm', w)
fprintf('\n\nFocal Points:')
fprintf('\n f1 = %.2f mm', f1)
fprintf('\n f2 = %.2f mm', f2)