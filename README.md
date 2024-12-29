# Suicide Rates and Mental Health Resources: A Data Analysis

## Overview
This project investigates the relationship between the availability of mental health institutions, mental healthcare personnel, and suicide rates among young people aged 20-29 globally. Using data analysis techniques in R, this study explores potential correlations and provides insights into the factors influencing youth suicide rates.

## Objective
To determine whether the availability of mental health facilities and personnel has a significant impact on the suicide rates of young people.

## Data Sources
The analysis utilizes three datasets:
1. **Global Suicide Data (2016):** Suicide rates by age and gender.
2. **Mental Health Facilities Data:** Availability of mental health institutions (hospitals and health units) per 100,000 population.
3. **Mental Healthcare Personnel Data:** Number of psychiatrists and psychologists per 100,000 population.

## Key Analytical Steps
1. **Exploratory Data Analysis (EDA):**
   - Visualized the distribution of suicide rates and mental health resources using boxplots.
   - Generated scatter plots to examine potential relationships between suicide rates and the availability of mental health resources.
   
2. **Statistical Analysis:**
   - Performed linear regression models to evaluate the correlation between mental health facilities/personnel and suicide rates.
   - Integrated multiple factors into a comprehensive regression model to identify any combined effects.

3. **Evaluation and Limitations:**
   - Assessed the statistical significance and explanatory power of the models.
   - Discussed limitations such as data size, confounding variables, and potential biases.

## Findings
- No significant correlation was found between the availability of mental health facilities or personnel and the suicide rates of young people.
- The combined regression model also failed to provide evidence of a relationship, with low R-squared values indicating limited explanatory power.
- The analysis highlights the complexity of suicide rates and the need for multifaceted approaches beyond merely increasing mental health resources.

## Conclusion
This study suggests that addressing youth suicide rates requires broader societal and policy interventions. Recommendations include reducing financial stress, adjusting educational workloads, and implementing supportive institutional policies to alleviate stressors.

## Technologies Used
- **Language:** R
- **Libraries:** ggplot2, dplyr, tidyr, and other R packages for data manipulation and visualization.

## Limitations and Future Work
- **Data Size:** The dataset contains approximately 150 rows, which may limit the generalizability of the findings.  
- **Additional Variables:** Factors like socioeconomic conditions, urbanization, and cultural influences were not included but are critical for future research.  
- **Bi-directional Effects:** Potential feedback loops between mental health resource availability and suicide rates should be explored further.

## References
1. Yeh, H. H., et al. (2019). Diagnosed mental health conditions and risk of suicide mortality. *Psychiatric Services*, 70(9), 750-757. [Link](https://ps.psychiatryonline.org/doi/full/10.1176/appi.ps.201800346)  
2. Da Cruz, D., et al. (2011). Emergency department contact prior to suicide in mental health patients. *Emergency Medicine Journal*, 28(6), 467-471. [Link](https://emj.bmj.com/content/28/6/467.short)
