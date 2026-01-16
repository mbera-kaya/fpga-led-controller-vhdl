library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_top is
end tb_top;

architecture Behavioral of tb_top is
    signal clk  : std_logic := '0';
    signal rst  : std_logic := '1';
    signal leds : std_logic_vector(7 downto 0);
begin

    uut : entity work.top
        port map (
            clk  => clk,
            rst  => rst,
            leds => leds
        );

    -- CLOCK: 10 ns period (100 MHz)
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for 5 ns;
            clk <= '1';
            wait for 5 ns;
        end loop;
    end process;

    -- RESET
    stim_proc : process
    begin
        wait for 50 ns;
        rst <= '0';        -- reset bırak
        wait;
    end process;

end Behavioral;
