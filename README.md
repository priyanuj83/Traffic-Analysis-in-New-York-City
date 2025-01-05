# Traffic-Analysis-in-New-York-City
## Project Overview 
This project analyzes and optimizes traffic congestion patterns in New York City using the Automated Traffic Volume Counts dataset from the NYC Open Data platform. The goal is to identify key intersections with high traffic congestion, understand bottlenecks, and propose actionable interventions to improve traffic flow.
## Key Features
### Dataset
1. Utilized NYC Open Data's traffic volume dataset containing 1.71 million rows and 14 columns.
   ![image](https://github.com/user-attachments/assets/c4ad850a-605f-4dca-89f6-f0e28e5a2614)
   
2. Cleaned and transformed data, merging columns for date and time representation, resulting in a more structured dataset with 11 columns.
   ![image](https://github.com/user-attachments/assets/6f0c75e9-df7c-4238-9221-ff334cee96e5)

### Tools & Technologies
1. **PostgreSQL**: Managed and queried the large dataset efficiently.
2. **SQL**: Conducted data transformation, aggregation, and exploratory queries.
3. **Python:**
     - Performed advanced analysis and data visualization in Jupyter Notebook.
     - Used libraries like pandas, networkx, and matplotlib for data manipulation, network modeling, and visualization.
     - Conducted Monte Carlo simulations to test hypothetical traffic interventions.
### Analysis & Highlights
1. Identified congested intersections using network analysis, modeling intersections as nodes and streets as edges.
2. Determined critical intersections and bottlenecks using centrality measures like betweenness.
3. Simulated traffic flow improvements, achieving a 20% reduction in congestion at the most affected intersections.
### Future Work
1. Expand the scope to include other boroughs or time intervals.
2. Integrate real-time traffic data for live monitoring and predictions.
3. Explore machine learning techniques for traffic pattern predictions.
