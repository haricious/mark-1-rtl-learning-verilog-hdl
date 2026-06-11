# Behavioral Modeling Practice Problems

Here is the markdown file containing the practice problems along with focused hints to guide your implementation.

---

## Easy Problems

### 1. The Glitch-Free 2-to-1 MUX
* **Problem:** Write a combinational block that models a simple 2-to-1 Multiplexer with inputs `a`, `b`, and a select signal `sel`. 
* **Hint:** Since this is pure combinational logic, use `always_comb` (or `always @(*)`) and blocking assignments (`=`). Make sure your conditional paths are fully covered to avoid creating a hidden latch.

### 2. The Synchronous Up-Counter
* **Problem:** Design a 4-bit counter that increments by 1 on every positive edge of the clock. It must include a synchronous active-high reset signal (`rst`) that forces the counter back to `4'b0000`.
* **Hint:** Use sequential logic (`always_ff @(posedge clk)`). Because it is a synchronous reset, the reset signal should not appear in the clock sensitivity list. Remember to use non-blocking assignments (`<=`).

### 3. The 2-to-4 Line Decoder
* **Problem:** Build a combinational 2-to-4 line decoder. It takes a 2-bit input binary code and activates exactly one of the four single-bit outputs (`y0`, `y1`, `y2`, `y3`). 
* **Hint:** A `case` statement is cleaner and more efficient here than a long `if-else` chain because the inputs are mutually exclusive. Don't forget the `default` statement.

---

## Medium Problems

### 4. BCD to Seven-Segment Decoder
* **Problem:** Create a combinational block that takes a 4-bit Binary Coded Decimal (BCD) input (representing numbers 0–9) and outputs a 7-bit signal to drive a standard 7-segment display digit. 
* **Hint:** Consider what happens if the input receives an invalid BCD code between 10 and 15 (`4'b1010` to `4'b1111`). Use a `default` branch to assign a safe state (like turning all segments off) to protect against unexpected input values and prevent latch inference.

### 5. 3-Stage Shift Register with Synchronous Enable
* **Problem:** Design a pipeline of three 8-bit registers chained together. Data enters `stage1`, moves to `stage2`, then `stage3`. The entire shift register must only shift when a global `shift_en` signal is high.
* **Hint:** This requires a sequential block with a clock enable structure. Ensure you use the correct assignment operator so that all three stages update simultaneously on the clock edge, rather than letting the input data race through all three stages in a single cycle.

### 6. The 4-Input Priority Encoder
* **Problem:** Write a combinational 4-bit priority encoder. It takes a 4-bit input vector `req[3:0]` and outputs a 2-bit binary ID `grant[1:0]` matching the highest active bit index of `req`. Bit 3 has the absolute highest priority, and Bit 0 has the lowest.
* **Hint:** Since the conditions overlap (multiple requests can be high at once), a parallel `case` statement will not work correctly without complex matching. An `if-else if` chain fits here because it naturally builds a serial priority MUX chain in silicon.

---

## Hard Problems

### 7. Glitch-Safe Priority Bus Arbiter with Lockout
* **Problem:** Design a 3-way request arbiter (`req0`, `req1`, `req2`) inside a clocked `always` block. `req0` has the highest priority. However, if a master is granted the bus, it must hold a `lock` signal high. As long as `lock` is active, the arbiter must ignore higher-priority requests and keep the current grant active.
* **Hint:** You need to nest your conditions. The outermost `if` check should evaluate if the current master is locking the bus. Only in the `else` branch should you evaluate the new priority requests using a MUX structure.

### 8. Fault-Tolerant Traffic Light Controller (FSM)
* **Problem:** Model a Finite State Machine (FSM) that controls a simple traffic light (`GREEN`, `YELLOW`, `RED`). Use a 3-bit state variable, but only encode these 3 valid states. Write the next-state logic as a combinational block. 
* **Hint:** Since 3 bits can represent up to 8 states, 5 states are completely unmapped. To satisfy strict safety standards, ensure that if a cosmic ray flips the state bits into one of those 5 illegal unmapped states, the FSM instantly recovers on the next cycle and forces the lights into a flashing safe `RED` state. 

### 9. Dual-Purpose Configurable ALU/Shifter Pipeline Stager
* **Problem:** Build a clocked execution unit stage. It takes two 16-bit data inputs, a control mode signal (`mode`), and an operation selection (`op`). If `mode = 0`, it acts as an arithmetic unit (ADD, SUB, MULT). If `mode = 1`, it acts as a barrel shifter (Logical Left, Logical Right). The final result must be registered.
* **Hint:** To optimize for high-frequency timing, avoid creating a massive combinational structure of adders and shifters stacked directly on top of each other. Try using a combinational block to calculate intermediate arithmetic and shifting values in parallel, and then use a sequential block to cleanly select and register the final output.