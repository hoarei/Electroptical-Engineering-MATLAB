clc
clear all
%Problem 2
fprintf('Problem 2 \n');
%A lens system consists of a thin lens with focal length f1=50mm and
    %another thin lens with a focal length of f2=25mm
    %The two thin lenses are separated by 40mm

%(a) Find the system matrix
fprintf('\n(a) \n')

f1 = 50;
f2 = 25;
L = 40;

%Functions

%Matrix of system, M
M = thin(f2) * propagation(L) * thin(f1);
disp(M)
fprintf ('Matrix of system = [ %.2f %.3f ; %.1f %.2f ] \n', M);

%(b) Find the Cardinal Points and Planes 
fprintf('\n(b)')

%Define ABCD values from system matrix
    %Citation:
A = 1-L/f1;
B = L;
C = (1/f2)*((L/f1)-1)-(1/f1);
D = 1-(L/f2);
feq = (1/f1)+(1/f2)-L/(f1*f2);

%The cardinal points are p, q, r, s, v, w
    %Citation: Table (18.2) Pedrotti
p = D/C;
q = -A/C;
r = (feq/f2)*L;
s = (1-A)/C;
v = (D-1)/C;
w = -(feq/f1)*L;

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

%Sketch of lens diagram
sketch = imshow('sketch.jpg');
fprintf('\nSee sketch of diagram in figure window.')

%(c)An object is 10.00mm above the optic axis and 100mm from the first
    %lens. Find the position of the image and magnification
fprintf('\n\n(c)')

%Position of the image
%variable s is the distance from the first lens
    %distance s will be the separation between the lens and the object,
    %implement pythogorean theorem to find the hypotenuse 
h = 10;
d = 100;
s = sqrt(h^2 + d^2);
image = -((A*s)+B)/((C*s)+D);
fprintf('\n\n The image is located at %.2f mm',image)

%magnification of image
mag = A+(C*image);
fprintf('\n The magnification of the image is %.3f', mag)

