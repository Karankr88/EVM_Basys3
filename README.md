
# Voting Machine using Verilog on Basys3

## Introduction

This Verilog-based project simulates a voting machine designed to handle vote counting for three options: the National Democratic Alliance (NDA), Indian National Developmental Inclusive Alliance (INDIA), and None of the Above (NOTA). The voting system is interfaced with a seven-segment display to show the vote counts for each option. LEDs confirm the successful cast of votes for each party.

## Working Principle

### 1. Voting Machine Module

- **Vote Counting**: The module keeps track of the vote counts for each of the three categories (NDA, INDIA, NOTA) using registers (`NDA_COUNT`, `INDIA_COUNT`, `NOTA_COUNT`).
- **Vote Casting**: When a user presses a button (representing NDA, INDIA, or NOTA), the corresponding vote count is incremented.
- **Vote Confirmation**: A confirmation signal (`NDA_CONF`, `INDIA_CONF`, `NOTA_CONF`) is asserted for the selected category, which triggers an LED or another visual indicator to confirm that the vote has been cast.
- **Reset Feature**: A reset signal is available to reset all vote counts to zero, returning the system to its initial state.
- **Digit Conversion**: The vote counts are converted to four-digit representations (ones, tens, hundreds, thousands) using a separate digits module. These values are then displayed on a seven-segment display via the seven-segment display module.

### 2. Digits Module

- **Input Counts**: The digits module takes three inputs (`NDA_COUNT`, `INDIA_COUNT`, `NOTA_COUNT`).
- **Count Selection**: Based on control signals (`NDA_FIG`, `INDIA_FIG`, `NOTA_FIG`), the module selects which party's count to display. For example, if `NDA_FIG` is asserted, the module selects `NDA_COUNT` as the input.
- **Digit Breakdown**: The selected vote count is divided into its individual digits: ones, tens, hundreds, and thousands.
- **Output Signals**: The module outputs four-digit representations for the selected vote count, which are passed to the seven-segment display.

### 3. Seven-Segment Display Module

- **Digit Cycling**: The display cycles through the four digits (ones, tens, hundreds, thousands) rapidly, creating the illusion of all digits being displayed simultaneously. A 2-bit counter (`digit_select`) is used to select the active digit.
- **Timing Control**: The digit selection is controlled by a timer (`digit_timer`). Once the timer reaches its maximum count (99,999), it resets and increments the `digit_select` counter, refreshing each digit every 1 ms.
- **Binary to Segment Conversion**: For each selected digit, its 4-bit binary representation is converted into a seven-segment display pattern (`seg`) using a case statement. The patterns are based on predefined constants for numerals 0-9.

## Constraints on Board

- **Push Buttons**: Buttons are used to cast votes for NDA, INDIA, and NOTA. Each button press increments the corresponding vote count.
- **LEDs**: LEDs indicate that a vote has been successfully cast for NDA, INDIA, or NOTA.
- **Switches**: Switches allow the user to select which vote count (NDA, INDIA, or NOTA) will be displayed on the seven-segment display.
- **Seven-Segment Display**: The display uses digit selection (`digit[3:0]`) and segment selection (`seg[6:0]`) to show the current vote count for the selected party.

## How to Run the Project

1. **Load the Verilog code onto the Basys 3 FPGA board**.
2. **Connect the push buttons** to their corresponding inputs for NDA, INDIA, and NOTA.
3. **Observe the LEDs** for vote confirmation upon pressing a button.
4. **Use the switches** to select which party's vote count is displayed on the seven-segment display.
5. **Monitor the seven-segment display** to see the total votes for NDA, INDIA, or NOTA.

## Features

- **Real-time vote counting** for three categories (NDA, INDIA, NOTA).
- **Visual confirmation** through LEDs when a vote is successfully cast.
- **Reset functionality** to reset the vote count back to zero.
- **Seven-segment display** to show the vote counts for each party in a four-digit format.

## Files Included

- `voting_machine.v`: Contains the top-level Verilog code for the voting machine module.
- `digits_module.v`: Verilog code to break down the vote count into individual digits.
- `seven_segment_display.v`: Verilog code to handle the seven-segment display logic.

## Authors

- **Karan Kumar Singh**
