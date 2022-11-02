/**************************************************************
*	Title:			Lab 1 part 2: : Modeling, Simulating, and Testing a MultiFunction Logic Block
*	Model type:		Gate level
*	Description:		
*	Programmer:	HHH
*	Date:	        	Date typed 03.06.2022
**************************************************************/
/**************************************************************
*	Define the test bench module.
**************************************************************/

module testBench;
//  wires connect things together
	wire             res, a, b, sel1, sel2;

	multiFunction		myFunc (res, a, b, sel1, sel2);
	TestModule		myTester (a,b,sel1, sel2, res);
	
endmodule	


/**************************************************************
*	Define the multiFunction module.
**************************************************************/
module multiFunction ( sel1, sel2, a,b, res);

parameter delay=0;
output res;
input sel1,sel2,a,b;
//

not #delay inv0(notSel1, sel1);
not #delay inv1(notSel2, sel2);
and #delay and1(termAnd1,a,b);
or #delay or1(termOr1,a,b);
xor #delay xor1(termXor1,a,b);
and #delay and2(termAnd2,notSel1,termAnd1,notSel2);
and #delay and3(termAnd3,notSel1,termOr1,sel2);
and #delay and4(termAnd4,sel1, notSel2, termXor1);

or #delay orRes(res,termAnd2,termAnd3,termAnd4);

endmodule

/**************************************************************
*	Define the tester module.
**************************************************************/

module TestModule (a,b,sel1,sel2, res);        // declare test module
//  Declare variables:

input         		 res;                    		// Module inputs
output        		a,b,sel1,sel2;           		// Module outputs
parameter     	stimDelay = 0;          	// Delay between generating stimuli
reg           		a,b,sel1,sel2;                		// regs for setting values for checking outputs
                                          					// a variable must be of type reg in order to
                                           					// assign a value to it

initial                                  				// this initial block assigns initializing
begin                                    				// values to the designated variables 
a = 0;                                      
b = 0;
sel1 = 0;
sel2 = 0;
end	

// run the simulation

//  this block of code is run one time

initial                                   				// this initial block will apply the test vectors

begin                                     			// begin initial loop
// *  obtain graphical waveform output of signals 
// *  '$display("?"), simply displays the text that is between quotes to the screen. 
// *  '$monitor("?",..,..)' displays the variables stated to
	// *  the right of the quotes-using the format specified between the quotes.
	// *  Formats for . '$display and $monitor... 
	// *  %b - binary digit output format 
	// *  \t - tab (default: 5 spaces) 
	// *  $time - Verilog's automatic time keeper variable
	//    output states of signals to screen
//  display the results in an output log 
    
$display("      INPUTS                      OUTPUT\t\tTIME");
$display("   a  --  b  --   sel1  --  sel2--  res  --\t\t------"); 
$monitor("  %b     %b        %b        %b     %b" ,a,b,sel1,sel2,res,$time);

 
//  The following is our test code or test vectors.
              
//  begin a second block to perform the simulation

repeat (2)                               	      		// repeat this process twice for illustration

begin                                              		// begin REPEAT loop

// we write in decimal and the compiler translates to binary
#stimDelay {a,b,sel1,sel2} = 0;                   
#stimDelay {a,b,sel1,sel2} = 1;                    
#stimDelay {a,b,sel1,sel2} = 2;                   
#stimDelay {a,b,sel1,sel2} = 3;                  

#stimDelay {a,b,sel1,sel2} = 4;                   
#stimDelay {a,b,sel1,sel2}= 5;                    
#stimDelay {a,b,sel1,sel2} = 6;                    
#stimDelay {a,b,sel1,sel2}= 7;                  

#stimDelay {a,b,sel1,sel2} = 8;                    
#stimDelay {a,b,sel1,sel2} = 9;                   
#stimDelay {a,b,sel1,sel2} = 10;                 
#stimDelay {a,b,sel1,sel2}= 11;                  

#stimDelay {a,b,sel1,sel2} = 12; 		       
#stimDelay {a,b,sel1,sel2} = 13;                  
#stimDelay {a,b,sel1,sel2} = 14;                 
#stimDelay {a,b,sel1,sel2} = 15;                  

end   			             				// close the REPEAT loop


    // the following code illustrates how we can test for aberrant conditions
    // we use the specific SEQUENCE of events to cause a glitch - were there others



#(2*stimDelay);                                    	// needed to see END of simulation
$stop;                                                		// temporarily stops simulation
                                                          		// goto Verilog interactive mode
                                                          		// need to type 1.1 or '$finish;'
$finish;                                              		// finish simulation

                                                    		// close second initial loop
end
endmodule                                               		// close test-module

