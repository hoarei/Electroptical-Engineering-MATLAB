%Problem 1
%Write MATLAB Function for matrix representation of reflection by a
    %spherical mirror
%Citation: eq (18.12) Pedrotti

function reflect = reflect (R)
    reflect = [1 0 ; 2/R 1];
end

