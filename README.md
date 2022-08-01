# DR-GEM
The Dynamic Regional General Equilibrium Model (DR-GEM) is a dynamic multiregion and multi-industry intertemporal computable general equilibrium (CGE) model of the US economy with international trade. CGE models combine detailed economic data with formulas that describe economic behavior to project how an economy will respond to a policy over time. For each policy scenario, the model calculates the changes in the supply and demand of producer and consumer goods by households and firms in each region and the corresponding changes in market-clearing prices.

DR-GEM shares many features with the Goulder-Hafstead Energy-Environment-Economy (E3) model.\footnote{For a complete description of the E3 model, see Goulder and Hafstead (2017).} Each regional economy is modeled as a collection of forward-looking agents: firms representing distinct industries within that region, a single representative household for that region, and regional and federal governments. The model captures the interactions among agents both within and across regions and solves for market-clearing prices in each period. Each agent has perfect foresight, and the model is solved in each period until it converges to a new steady-state balanced-growth equilibrium. 

DR-GEM version 1.0 utilizes a national market assumption for trade across domestic regions. Producers in each region can choose between supplying their own market and a national market. Consumers (both producers and households) can choose to demand goods from either their own market or the national market.  Prices are solved to clear both the regional markets and the national market.

DR-GEM originally used regional social accounting matrix (SAM) from the IMPLAN group, \cite{IMPLAN}, and the most up-to-date code shows how this data is utilized. However, the IMPLAN data is proprietary and cannot be used in open source codes. Work is currently being done to utilize regional social accounting matrices from the Wisconsin National Data Consortium (WiNDC).  

The model will be periodically updated with new data and features. For a full description of the DR-GEM model, please see [here](https://media.rff.org/documents/DR_GEM_Model_Documentation_2.pdf?_ga=2.109427077.1410951694.1659370309-752896534.1659370309).
