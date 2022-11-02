module Comparator(lesseq, a, b, c, d);

//  within the modules, wires are implied?we can put them in if we want to

	parameter  		delay = 10;			
	output     		lesseq;			  		// Ouputs: lesseq
	input      		a, b, c, d;	 		  	// Inputs: to compare, cd and ab
	
        // This is a structural model
        //   We're building a gate level model...  with propagation delay
        //   YOU DO NOT HAVE TO TYPE THESE COMMENT LINES.

        //  Gate instantiation format:
        //  name-of-module #(prop. delay) assigned-name (outputs-list, inputs_list)

        and     			#delay	and1(term0, notC, notD);
        and     			#delay	and2(term1, a,b);
        and     			#delay	and3(term2, a, c, notD);
        and     			#delay	and4(term3, b, notC);
        and     			#delay	and5(term4, a, notC);

        not     			#delay	inv0(notC, c);
        not     			#delay	inv1(notD,d);

        or      			#delay	or1(lesseq, term0, term1, term2, term3, term4);

endmodule     		//close Comparator module 
 
 