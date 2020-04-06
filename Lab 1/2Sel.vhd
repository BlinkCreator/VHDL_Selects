entity wgen1 is
 port (d : in bit_vector(1 downto 0); a,b,c,z: out bit);
end entity wgen1;
architecture behaviour of wgen1 is
 signal a1, b1,c1: bit;
begin
 process
 	begin
 	 a1 <= '1','0' after 2 ns, '1' after 6 ns,'0' after 8 ns;
 	 b1 <= '0','1' after 2 ns, '0' after 4 ns,'1' after 6 ns;
 	 c1 <= '1','0' after 2 ns, '1' after 4 ns,'0' after 6 ns,'1' after 8 ns;
 	 wait for 10 ns;
 	end process;

 process(a1,b1,c1,d)
	 begin
	  if(d = "00") then
	   z <= a1 or b1 or c1;
	  elsif(d = "01") then
	   z <= b1 xor c1;
	  elsif(d = "10") then
	   z <= a1 and b1;
	  else
	   z <= '0';
	  end if;
	 a <=a1; b <=b1; c <=c1;
 end process;
end architecture behaviour; 

