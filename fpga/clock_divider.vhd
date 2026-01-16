library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
    generic (
        CLK_FREQ : integer := 100_000_000; -- FPGA clock
        OUT_FREQ : integer := 1000         -- 🔥 SİMÜLASYON İÇİN HIZLI
    );
    port (
        clk     : in  std_logic;
        rst     : in  std_logic;
        clk_out : out std_logic
    );
end clock_divider;

architecture Behavioral of clock_divider is
    constant DIVISOR : integer := CLK_FREQ / (2 * OUT_FREQ);
    signal counter  : integer := 0;
    signal clk_reg  : std_logic := '0';
begin
    process(clk, rst)
    begin
        if rst = '1' then
            counter <= 0;
            clk_reg <= '0';
        elsif rising_edge(clk) then
            if counter = DIVISOR - 1 then
                counter <= 0;
                clk_reg <= not clk_reg;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_out <= clk_reg;
end Behavioral;
