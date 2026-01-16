library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity led_controller is
    generic (
        LED_COUNT : integer := 8
    );
    port (
        clk  : in  std_logic;
        rst  : in  std_logic;
        leds : out std_logic_vector(LED_COUNT-1 downto 0)
    );
end led_controller;

architecture rtl of led_controller is
    signal led_reg : std_logic_vector(LED_COUNT-1 downto 0) := (others => '0');
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                led_reg <= (others => '0');
                led_reg(0) <= '1';
            else
                led_reg <= led_reg(LED_COUNT-2 downto 0) & led_reg(LED_COUNT-1);
            end if;
        end if;
    end process;

    leds <= led_reg;

end rtl;
