# Repository for Making Species Occurance and Distribution Maps for the Columbia Torrent Salamander (*Rhyacotriton kezeri*)
Group 6 SSA / Species Distribution Modeling

Rian Sidney Wright, Jessica Hernandez, Ashley Phan, Spencer Klaebisch

[![DOI](https://zenodo.org/badge/753736949.svg)](https://zenodo.org/doi/10.5281/zenodo.11051208)



![Rhyacotriton kezeri, Columbia Torrent Salamander](images/R_kezeri.jpg)
[INat Image](https://www.inaturalist.org/photos/47406394)

## Overview
Our species is *Rhyacotriton kezeri*, also known as the the Columbia Torrent Salamander. The Columbia Torrent Salamander, primarily found along the Coast of Oregon and Washington, inhabits cold streams, seepages, and waterfall splash zones within mature coastal coniferous forests (Emel, et al. 2019). These areas provide the necessary habitat features such as cold, clear water with gravel or rock rubble and low silt levels (Russell, K. R., Mabee, T. J., & Cole, M. B., 2004) . 

*R. kezeri*, is a small species typically measuring around 2.25 inches in length (WDFW, n.d). Its body features a distinctive coloration of brown on the upper surface and yellow to orange-yellow on the sides (Good & Wake, 1992). 

The NatureServe status of *R. kezeri* is listed as Imperiled. This species is scheduled up for review by the US Fish & Wildlife Service in 2024 in the R1 region. This repository serves as a source for examining occurrences and generating current and future distribution models for *R. kezeri*. Data gathered from the Global Biodiversity Information Facility (GBIF), an open-access source of biodiversity data from sources including iNaturalist, USGS, and museum collections, was utilized in this project. This project was done in collaboration between students of Lewis & Clark College and University of Arizona.

## Dependencies
The project uses the following additional R packages, which can be downloaded using packages.R file:
            tidyverse", 
            "rgbif", 
            "usethis", 
            "CoordinateCleaner", 
            "leaflet", 
            "mapview", 
            "webshot2",
            "sf",
            "rnaturalearth",
            "sp",
            "raster",
            "dismo",
            "terra",
            "ENMeval",
            "geodata", 
            "rJava", 
            "maps"

## Data
- rawData.csv: data harvested from GBIF for Columbia Torrent Salamander.
- It is important to note that this data has limited data points (234 recordings).

## Homework
- organization of each of our homeworks
- HW 3: group testing out collaborating on Posit, using Command-Push-Pull to write each of our names and favorite species within an R Markdown file.
- HW 4: creating occurrence maps for *R. kezeri*.
- HW 6: creating current and future SDMs for *R. kezeri*.

## Output
- maxent_outputs
    -maxent.log
- cleanedData.csv: a cleaned up version of rawData.csv
- rhyacotritonCurrentSdm.jpg: a picture of the current *R. kezeri*. species distribution model we generated.
- rhyacotritonFutureSdm.jpg: a picture of the future *R. kezeri*. species distribution model we generated for 70 years from now.
- rhyacotritonOccurenceMap.png: a picture of the occurrence map for *R. kezeri*. that we generated.

## Scripts
- CurrentSdm.R: to create the occurrence map of the GBIF data *R. kezeri*. And code for generating the current species distribution model for *R. kezeri*.
- gbif.R: code for obtaining the GBIF data for *R. kezeri*.
- FutureSdm.R: code for generating the future species distribution model for *R. kezeri*, 70 years from now.
- packages.R: to download necessary packages needed

## Running the code
Run the scripts in the following order:

1. packages.R
2. gbif.R
3. CurrentSdm.R
4. FutureSdm.R

## Caveats
- It is important to note that this data has limited data points (234 recordings).
- The species was not recognized as its on species until 1992. This species, Rhyacotriton kezeri, was delineated in 1992 by Good and Wake, who demonstrated its distinctness from Rhyacotriton olympicus.

## Our favorite Species
**Spencer's Favorite Species:** My favorite species is *Ursus arctos*, the Brown Bear. I just think everything about them is fascinating. They've got one of the strongest senses of smell on the planet (in terms of effective range), they're super intelligent and unbelievably strong, and they're really cute and fuzzy. Frankly, there's nothing about them I don't like, they're just the best, and it's a real shame that there numbers and range have been going down over time because of human actions.

**Ashley's Favorite Species:** My favorite species is the *Provica capensis*, commonly known as the rock hyrax. Rock hyraxes are small, stub-tailed, and rabbit-like. They are mammals and their closest living relatives are elephants. These animals can be found on the continents of Asia and Africa and like to live in arid areas with many rocks and cavities. My favorite thing about them is their interesting behavior known as "hyraceum." Hyraxes constantly urinate in the same place, which are known as latrines. Their urine contains lots of calcium carbonate so it turns their latrines a white color. Hyraceum is the product of the excrement in the latrines after it has been aged. 

**Rian's Favorite Species:** My favorite species is the *Onorhynchus mykiss*, also known as the Rainbow Trout. These are common fish native to tributaries on the pacific coast. These are a cold water fish, and while being native to the pacific, they can be found in every continent but Antarctica. These are not endangered fish, in fact, are sometimes considered invasive, and are often stocked into rivers and streams for sport fishing. They are such a fascinating fish because they are extremely intelligent, for a fish. They are known to avoid fisherman and are notoriously difficult to catch due to their intuition. I love them because they are a beautiful rainbow color, and they are a very fun fish to catch and eat. 

**Jessica's Favorite Species:** My favorite species is the *Enhydra Lutris*, known as the Sea Otter. Being from California and seeing Marine Life such as Otters, fascinated me. Southern Sea Otters are among the smallest of marine mammals with adult females averaging 46 and 64 pounds. Due to the fact, that Sea Otters lack blubber, they rely on their dense fur coat and elevated metabolism to stay warm. Sea Otters consume an amount of food equivalent to about 25 percent of their body mass per day. They are social mammals and usually are in a cluster to keep them from drifting they wrap themselves up in kelp or seagrass. Sea Otters are creative in using tools, typically a rock is used to break open a hard-shelled prey.
