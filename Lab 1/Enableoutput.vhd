entity wgen2 is
 port (d : in bit_vector(1 downto 0); enable : in bit; a,b,c,z: out bit);
end entity wgen2;
architecture behaviour of wgen2 is
 signal a1, b1,c1,z1: bit;
begin
 process
 	begin
	
 	 a1 <= '1','0' after 2 ns, '1' after 6 ns,'0' after 8 ns;
 	 b1 <= '0','1' after 2 ns, '0' after 4 ns,'1' after 6 ns;
 	 c1 <= '1','0' after 2 ns, '1' after 4 ns,'0' after 6 ns,'1' after 8 ns;
	
	wait for 10 ns;
 	end process;

 process(a1,b1,c1)
	 begin
	  if(d = "00") then
	   z1 <= a1 or b1 or c1;
	  elsif(d = "01") then
	   z1 <= b1 xor c1;
	  elsif(d = "10") then
	   z1 <= a1 and b1;
	  else
	   z1 <= '0';
	  end if;
 end process;
a <=a1 when enable = '1' else '0'; 
b <=b1 when enable = '1' else '0'; c <=c1 when enable = '1' else '0';
z<=z1 when enable = '1' else '0';
end architecture behaviour; 

