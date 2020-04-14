with Ada.Integer_Text_Io; use Ada.Integer_Text_Io;
with Ada.Text_Io; use Ada.Text_Io;

procedure DelA is
   type Ten_Ints_Array_Type is
     array (1..10) of Integer;
   -------------------------------
  procedure Get(Item: out Ten_Ints_Array_Type) is
      
  begin
      --Item'Range
     for I in 1..Item'last loop
	Get(Item(I));
     end loop;
     
  end Get;
   -------------------------------
  procedure Put(Item: in Ten_Ints_Array_Type) is
      
  begin
     
     for I in 1..Item'Last loop
	Put(Item(I), Width => 0);
	Put(" ");
     end loop;
      
  end Put;
  -------------------------------
  -------------------------------
  procedure Find_Maximum(Item : in Ten_Ints_Array_Type) is
     
     Max : Integer := Ten_Ints_Array_Type'First;
     Position : Integer;
     
  begin
     
     for I in Item'Range loop
	if Item(I) > Max then
	   Max := Item(I);
	   Position := I;
	end if;
     end loop;   
     
  Put("Maxtalet är: ");
  Put(Max, Width => 0);
  Put(" i position ");
  Put(Position, Width => 0);
     
  end Find_Maximum;
  ------------------------------- 
  -------------------------------
  function Flip(Item : in Ten_Ints_Array_Type) return Ten_Ints_Array_type is  
     
     A : Ten_Ints_Array_Type := Item;

  
  begin
     for I in Item'Range loop
	A(I) := Item(Item'Last-I+1);
     end loop;
    
     
     return A;
 
  end Flip;
  -------------------------------
     
     
  TIAT: Ten_Ints_Array_Type;
  Position, Max : Integer := 0;
   
begin
   
  Put("Skriv in  10 heltal: ");
  Get(TIAT);
  Put(TIAT);
  New_Line;
  Find_Maximum(TIAT);
  New_Line;
  Put(Flip(TIAT)); 
  
     
   
end DelA;
