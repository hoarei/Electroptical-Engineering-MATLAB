%Problem 1
%Write MATLAB Function for matrix representation of thick lens
%Citation: eq (18.15) Pedrotti

%Explanation of variables:
    %n represents n_L (index of lens)
    %m represents n' and n, the index of air around the lens
    %t is lens thickness
    %R1 and R2 are radii of faces 

    function thick = thick(n, m, R2, t, R1)
    thick = [ 1 0 ; ((n-m)/(m*R2)) n/m ]*[1 t ; 0 1 ]*[ 1 0 ; ((m-n)/(n*R1)) m/n ];
end
