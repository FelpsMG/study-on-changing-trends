# Study on Changing Trends

This repository contains instructions and files that can aid in the experimentation of the article reader "Study on Changing Trends in Climatic Extremes in the Brazilian Territory".

## Dataset 

The used data of the chosen cities can be find in https://drive.google.com/drive/folders/1YgKtz9SP66BbXTb9O0_YejgWYrZFIxYB?usp=sharing . These data have already been treated by code "MakeDataBase.m" and are in the format required by the RClimDex library (https://github.com/ECCC-CDAS/RClimDex) for the extraction of extreme weather indicators.

## Trends

After acquiring the data obtained by RClimDex, the data is subjected to simplified trend analysis in "script_to_IdentifyTrends.R".

## Warming Stripes Plot

To plot the warming stripes, the data needs to be grouped annually with the data in https://drive.google.com/drive/folders/1a3V8w4RnPNCq3iWIMf_QEDYJUMUV_wdO?usp=sharing , as is done in the file "groupData.m".
To generate the warming stripes the script "script_to_PlotWarmingStripes.R" is used.
