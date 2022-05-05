x
exit
gmshToFoam tank.msh
paraFoam 
pisoFoam 
paraFoam 
exit
pisoFoam 
ls
rm -rf 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5
ls
cd
exit
