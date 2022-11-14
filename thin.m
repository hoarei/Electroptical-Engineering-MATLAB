%Problem 1
%Write MATLAB Function for matrix representation of thin lens
%Citation: Table (18.1) Pedrotti

%f represents the focal length of the lens

function thin = thin(f)
    thin = [ 1 0 ; -1/f 1 ];
end
