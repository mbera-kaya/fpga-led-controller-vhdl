library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
    port (
        clk  : in  std_logic;
        rst  : in  std_logic;
        leds : out std_logic_vector(7 downto 0)
    );
end top;

architecture Behavioral of top is
    signal slow_clk : std_logic;
    signal led_reg  : std_logic_vector(7 downto 0) := "00000001";
begin

    clk_div : entity work.clock_divider
        generic map (
            CLK_FREQ => 100_000_000,
            OUT_FREQ => 1000      -- 🔥 HIZLI
        )
        port map (
            clk     => clk,
            rst     => rst,
            clk_out => slow_clk
        );

    process(slow_clk, rst)
    begin
        if rst = '1' then
            led_reg <= "00000001";
        elsif rising_edge(slow_clk) then
            led_reg <= led_reg(6 downto 0) & led_reg(7);
        end if;
    end process;

    leds <= led_reg;
end Behavioral;
