clc
clear all
%Problem 4
fprintf('Problem 4');

%Define constants, Rp is primary radius of curvature, Rs is secondary
    %radius of curavture, L is distance between primary and secondary
    %mirrors, o is object distance from first cardinal plane, a is angular
    %size of the object

Rp = -750;
Rs = -250;
L = 280;
o = 1000000;
%Use the matrix method to do the following

%(a)Determine the location of the focal plane and principal planes
    %First, create matrices of reflection for primary and secondary mirrors and
    %translation matrix
    %After, create matrix M of the system

Mp = reflect(Rp);
Ms = reflect(Rs);
T = propagation(L);

M = Ms*T*Mp;
    
    %Define A,B,C,D variables from matrix M
    A = M(1,1);
    B = M(1,2);
    C = M(2,1);
    D = M(2,2);

    %Determine cardinal points, and focal points
    p = D/C;
    q = -A/C;
    r = (D-((A*D)-(B*C)))/C;
    s = (1-A)/C;
    v = (D-1)/C;
    w = (((A*D)-(B*C))-A)/C;

    f1 = p-r;
    f2 = q-s;

%Print solution to part (a)
fprintf('\n\n(a)')
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

%(b)If an object is 1000m away from first cardinal plane, determine the
    %location of the image and the magnification.

    %Define the first cardinal plane as cardinal plane located furthest to the
        %left of the system, which will be s in this case. dist is the distance
        %between the cardinal plane and the object, and d is the distance
        %between the object and the system
    dist = 1000000;
    d = dist+abs(s);

    %Image and magnification of image
    image = -((A*d)+B)/((C*d)+D);
    mag = A+C*image;

%Print solution to part (b)
fprintf('\n\n(b)')
fprintf('\n\n The image is located at %.2f mm',image)
fprintf('\n The image has a magnification of %.2d',mag)

%(c)If the angular size of the object from the first principle plane is
    %0.60 degrees, what is the heigh of the image on the image plane?

    %constant a will serve as the angular size 0.60
a = 0.60;
    %x will be the image position subtracting the cardinal point s, and h
    %will be the height of the image on the image plane.
    x = image - s;
    h = x*tand(a);

%Print solution to part (c)
fprintf('\n\n(c)')
fprintf('\n\n The image will be found at %.3f mm on the image plane.',h)
