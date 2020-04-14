with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Integer_Text_Io;

procedure DelC is
      
 --  type Char_Array is 
   --  array (1..256) of Character;
   type String_Type is 
     record
      Text : String(1..256);
      Length : Integer;
     end record;
   
   type Sex_Type is (Male, Female, Other);   
   type Species_Type is (Human, Elf, Orc, Halfling, Ogre, Lizardman);
   type Eye_Type is (Blue, Green, Brown, Gray, Yellow, Red, Black, Crazy); 
   type Hero_Type is
      record
	 Name : String_Type;
	 Age : Integer;
	 Sex : Sex_Type;
	 Weight : Float;
	 HColor : String_Type;
	 Species : Species_Type;
	 EyeC : Eye_Type;
      end record;
   
---------------------------------------
procedure Get(Item: out String_Type) is
   
begin
   for I in 1..256 loop
      Get(Item.Text(I));
      exit when End_Of_Line = True;
      
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
      if  Left.Text(I) /= Right.Text(I) then
	 return False;
      end if;
   end loop;
   return True;
	    	 
end "=";
---------------------------------------- 
----------------------------------------
procedure Get(Item: out Hero_Type) is
   
   ST: String_Type;
   I: Integer;
   F: Float;
   
begin
   
   Put("Välj ett namn på din hjälte: ");
   Get(ST);
   Item.Name := ST;
   
   Put("Ålder: ");
   Get(I);
   Item.Age := I;
   
   Put("Kön (Male, Female, Other): ");
   Get(ST);
   Item.Sex := Sex_Type'Value(ST.Text(1..ST.Length));
   
   Put("Vikt: ");
   Ada.Float_Text_Io.Get(F);
   Item.Weight := F;
  
   Put("Hårfärg: ");
   Get(ST);
   Item.HColor := ST;
   
   Put("Ras (Human, Elf, Orc, Halfling, Ogre, Lizardman): ");
   Get(ST);
   Item.Species := Species_Type'Value(ST.Text(1..ST.Length));
   
   Put("Ögonfärg (Blue, Green, Brown, Gray, Yellow, Red, Black, Crazy): ");
   Get(ST);
   Item.EyeC := Eye_Type'Value(ST.Text(1..ST.Length));
   
end Get;
-----------------------------------------
-----------------------------------------
procedure Put(Item: in Hero_Type) is
   
   XT: Sex_Type;
   ST: Species_Type;
   EC: Eye_Type;
   
begin
   
   Put("Namn: ");
   Put(Item.Name);
   
   New_Line;
   Put("Ålder: ");
   Put(Item.Age, Width =>0);
   
   New_Line;
   Put("Kön: ");
   XT := Item.Sex;
   Put(Sex_Type'Image(XT));
   
   New_Line;
   Put("Vikt: ");
   Ada.Float_Text_Io.Put(Item.Weight, 0, 1, 0);
   
   New_Line;
   Put("Hårfärg: ");
   Put(Item.HColor);
   
   New_Line;
   Put("Ras: ");
   ST := Item.Species;
   Put(Species_Type'Image(ST));
   
   New_Line;
   Put("Ögonfärg: ");
   EC := Item.EyeC;
   Put(Eye_Type'Image(EC));
		      		      
end Put;
-----------------------------------------
      
HT: Hero_Type;

      
begin
   
   Get(HT);
   PUT(HT);
   
end DelC;
