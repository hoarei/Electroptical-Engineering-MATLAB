%Problem 1
%Write MATLAB Function for matrix representation of refraction at a
    %spherical interface
%Citation: eq (18.10) Pedrotti

%m will serve as the variable representing n'

function refract = refract(R, n, m)
    refract = [ 1 0 ; (1/R)*((n/m)-1) n/m ];
end