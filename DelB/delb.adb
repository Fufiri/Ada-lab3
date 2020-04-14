with Ada.Text_Io; use Ada.Text_Io;

procedure DelB is
   
   type Char_Array is 
     array (1..256) of Character;
   type String_Type is 
      record
      Text : Char_Array;
      Length : Integer;
      end record;
    
 ---------------------------------------
 procedure Get(Item: out String_Type) is
	 
 begin
    for I in 1..256 loop
       Get(Item.Text(I));
       exit when End_Of_Line;
       
       Item.Length := I+1;
    end loop;
		 	    
 end Get;
 ---------------------------------------
 ---------------------------------------
 procedure Put(Item: in String_type) is
	 
 begin
    
    for I in 1..Item.Length loop
       Put(Item.Text(I));
    end loop;
	 	 
 end Put;
 ---------------------------------------
 ---------------------------------------
 function "="(Left, Right: in String_Type) return Boolean is
	 
 begin
    
    if Left.Length /= Right.Length then
       return False;
    end if;
    
    for I in 1..Left.Length loop
       if Left.Text(I) /= Right.Text(I) then
	  return False;
       end if;
    end loop;
    return True;
	    
 end "=";
 ----------------------------------------    
      Test2: String_Type;
      Test3: String_Type;
      
begin
   
  Put("Skriv in ett ord: ");
  Get(Test2);
  Put("Du skrev in: ");
  Put(Test2);
  New_Line;
  
  Put("Skriv in ett ord: ");
  Get(Test2);
  Put("Skriv in ett till ord: ");
  Get(Test3);
  if Test2 = Test3 then
     Put ("Orden är lika");
     else Put ("Orden är olika");
  end if;
  
  
end DelB;
