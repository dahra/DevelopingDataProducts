# Developing Data Products Project

##Assignment
Create a Shiny application and deploy it on Rstudio's servers. Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application.

##The App
This app allows user to choose a specific US State from s drop down box to:

1. Display a bar plot of rates per violent crime in the chosen US State in 1973
2. Calculate and display the rank of that state per crime out of all 50 states. 

   (the higher the rate, the higher the occurrence of the crime)


##Instructions
1. Navigate to app using the following url:  https://dahra.shinyapps.io/shiny
2. Choose a state from the drop down box under "Select a State"
3. Repeat step 2 to see the results of another state

The bar plot and ranking calculations will update automatically per selected state.

##The Data
USArrests {datasets}	R Documentation
Violent Crime Rates by US State

Description

This data set contains statistics, in arrests per 100,000 residents for assault, murder, and rape in each of the 50 US states in 1973. Also given is the percent of the population living in urban areas.

Usage

USArrests
Format

A data frame with 50 observations on 4 variables.

[,1]	 Murder	 numeric	 Murder arrests (per 100,000)
[,2]	 Assault	 numeric	 Assault arrests (per 100,000)
[,3]	 UrbanPop	 numeric	 Percent urban population
[,4]	 Rape	 numeric	 Rape arrests (per 100,000)
Source

World Almanac and Book of facts 1975. (Crime rates).

Statistical Abstracts of the United States 1975. (Urban rates).

References

McNeil, D. R. (1977) Interactive Data Analysis. New York: Wiley.

See Also

The state data sets.

Examples

require(graphics)
pairs(USArrests, panel = panel.smooth, main = "USArrests data")
