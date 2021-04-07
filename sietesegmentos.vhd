Library IEEE; 
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

Entity sietesegmentos is
	port (
			reloj : in std_logic;
			display: out std_logic_vector(3 downto 0)
			);
	end sietesegmentos;
	
architecture multi of sietesegmentos is
	
	signal cuenta : integer range 0 to 100000;
	signal seleccion : std_logic_vector(1 downto 0) :="00";
	signal mostrar : std_logic_vector(3 downto 0) :="0000";
	
begin
	conteo_clk: process(reloj)
	begin
		if rising_edge(reloj) then
			if cuenta < 100000 then 
				cuenta<=cuenta+1;
			else
					seleccion<=seleccion+1;
					cuenta<=0;
			end if;
		end if;
	end process; 

	mostrar_display: process(seleccion)
	begin
		case seleccion is
			when "00" =>
				mostrar<="1110";
			when "01" =>
				mostrar<="1110";
			when "10" =>
				mostrar<="1110";
			when "11" =>
				mostrar<="1110";				
			when others =>
				mostrar<="1111";
		end case;
	end process;
	display<=mostrar;
end multi;