# PAPR Reduction Simulator Using SLM and PTS

![](https://github.com/IlyaMichlin/SLMvsPTS/blob/master/images/MainWindow.jpg)

1. Simulation
    * OFDM: check to simulate OFDM signal and measure its PAPR
    * SLM: check to simulate OFDM signal, apply SLM technique and measure its PAPR
    * PTS: check to simulate OFDM signal, apply PTS technique and measure its PAPR

2. Modulation
    * QAM: desired QAM order
    * Carriers: number of OFDM carriers

3. OFDM
    * N: OFDM's IFFT size
    * OFDM Symbols: number of OFDM symbols (number of IFFTs)

4. PAPR Reduction
    * Phase Resolution: PAPR reduction technique rotational phase resolution
    * SLM
        * SLM Attempts: number of attempts to reduce PAPR using SLM
    * PTS
        * Partition Number: number of disjoint signal partitions 
        * PTS Attempts: number of attempts to reduce PAPR using PTS

5. Parameter Simulation: run simulation several tymes with different configuration for comparison
    * Parameter: defines which parameter to change each simulation (if NONE, run simulation once)

6. Graph
    * Text box: saved graph name .jpg is added automatically (if empty then "figure.jpg")
    * Save Graph: check to save displayed graph (must be set befor running simulation)

7. Simulate: start simulation button

8. Log Bar: displays last log

Notice: run the 'PAPR_GUI.m' and NOT 'PAPR_GUI.fig'!
