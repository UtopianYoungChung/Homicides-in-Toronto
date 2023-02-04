<!-- -*- mode: gfm -*- -->

# Homicides in Toronto

## Summary

In Toronto, there have been many homicides. This paper examined data from a portal, 'Open Data Toronto,' regarding homicides. The extracted information included Occurrence Year, Homicide Type (Shootings, Stabbings, Other.), and Neighborhood. Over the past sixteen years,

Toronto's homicide rate has remained high with no particular pattern, which is an intriguing aspect of the analysis. This study found no correlation between income and homicide in Toronto neighbourhoods with 20 or more homicides. This study also discovered that wealthy neighbourhoods had more homicides than poor ones. This is a significant finding that can assist the police department in distributing personnel accordingly.

### Code

Coding was done on Quarto. Quarto made it simple to use compared to R Markdown. Although it took some time to transition from R Markdown, it was relatively straightforward.

### Data

The raw data set was obtained from open source: [Open Data Toronto](https://open.toronto.ca/dataset/police-annual-statistical-report-homicide/) Data and files used in this paper can be found as described below:

-   [/inputs/data](https://github.com/UtopianYoungChung/Homicides-in-Toronto/tree/main/inputs/data)/ contains 'csv' extensions

-   [/outputs/paper/](https://github.com/UtopianYoungChung/Homicides-in-Toronto/tree/main/outputs/paper) contains 'bib' extension file (bibliography), pdf (Report paper), qmd (Main Quarto)

-   [/scripts/](https://github.com/UtopianYoungChung/Homicides-in-Toronto/tree/main/scripts) contains 'R' extension files (00-download_data, 00-simulation)
