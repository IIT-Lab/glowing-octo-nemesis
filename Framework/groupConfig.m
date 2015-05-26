
currentPath = path;

if isempty(strfind(currentPath,'cvx'))
    if isunix
        cd ~/codes/solvers/cvx_linux;
        cvx_setup;
        cd ~/codes/glowing-octo-nemesis;
    else
        cd ..\solvers\cvx;
        cvx_setup;
        cd ..\..\glowing-octo-nemesis;
    end
end

display('Added Path Variables !');
