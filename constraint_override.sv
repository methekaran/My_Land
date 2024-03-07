//Overrighting Constraints
//The randomize() task is virtual. Accordingly it treats the class constraints in a virtual manner. When a named constraint is redefined in an extended class, the previous definition is overridden and when casting extended class to base class does not change the constraint set.



//EXAMPLE:
class Base;
rand integer Var;
constraint range { Var < 100 ; Var > 0 ;}
endclass

class Extended extends Base;
constraint range { Var == 100 ;} // Overrighting the Base class constraints.
endclass

program inhe_33;
Extended obj_e;
Base obj_b;
initial
begin
obj_e = new();
obj_b = obj_e;
for(int i=0 ; i < 7 ; i++)
if(obj_b.randomize())
$display(" Randomization sucsessfull : Var = %0d ",obj_b.Var);
else
$display("Randomization failed");
end
endprogram

/*RESULTS:

# Randomization sucsessfull : Var = 100
# Randomization sucsessfull : Var = 100
# Randomization sucsessfull : Var = 100
# Randomization sucsessfull : Var = 100
# Randomization sucsessfull : Var = 100
# Randomization sucsessfull : Var = 100
# Randomization sucsessfull : Var = 100
*/
