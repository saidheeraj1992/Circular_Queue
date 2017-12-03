     PRESERVE8
     THUMB
     AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		 
        MOV r5, #0x20000000 ; tail address
		MOV r3, #0x20000000 ; head address
		MOV r1, #0x11;       initial value
		MOV r2, #0xA;       queue size
		
loop 	CMP r2,#0; Push data (All 10 elements) 
        STR r1,[r5];
        ADD r5,#0x4;
		EOR r1,r1,r2; Randomness added
		SUBGT r2,r2,#1;
		BGT loop;
		
		MOV r2,#0x4;
loop1	CMP r2,#0; POP some data (4 elements)
        MOV r1,#0;		
        STR r1,[r3];
        ADD r3,#0x4;
		SUBGT r2,r2,#1;
		BGT loop1;
			  
		MOV r5, #0x20000000;
		MOV r2,#0x4;
loop2 	CMP r2,#0; PUSH some data
		EOR r1,r1,r2;
        STR r1,[r5];
        ADD r5,#0x4; 
		SUBGT r2,r2,#1;
		BGT loop2;
			  
		MOV r2,#0x6;
loop3	CMP r2,#0; Pop some data (6 elements)
        MOV r1,#0;		
        STR r1,[r3];
        ADD r3,#0x4;
		SUBGT r2,r2,#1;
		BGT loop3;
			  
		MOV r3, #0x20000000;
		MOV r2,#0x4;
loop4	CMP r2,#0; (pop all data)
        MOV r1,#0;		
        STR r1,[r4];
        ADD r3,#0x4;
		SUBGT r2,r2,#1;
		BGT loop4;				
       
stop B stop ; stop program
     ENDFUNC
     END
