# gbif.R
# query species occurence data from GBIF
# clean up the data
# save it to a csv file
# create a map to display the species occurence points

#list of packages
packages<-c("tidyverse", "rgbif", "usethis", "CoordinateCleaner", "leaflet", "mapview")

# install packages not yet installed
installed_packages<-packages %in% rownames(installed.packages())
if(any(installed_packages==FALSE)){
  install.packages(packages[!installed_packages])
}

# Packages loading, with library function
invisible(lapply(packages, library, character.only=TRUE))


usethis::edit_r_environ()


salamanderBackbone<-name_backbone(name="Columbia torrent salamander")
speciesKey<-salamanderBackbone$usageKey

occ_download(pred("taxonKey", 2431179), format="SIMPLE_CSV")

#<<gbif download>>
#Your download is being processed by GBIF:
# https://www.gbif.org/occurrence/download/0022281-240216155721649
#Most downloads finish within 15 min.
#Check status with
#occ_download_wait('0022281-240216155721649')
#After it finishes, use
#to retrieve your download.
#Download Info:
#Username: rwright
#E-mail: wrightr1@arizona.edu
#Format: SIMPLE_CSV
#Download key: 0022281-240216155721649
#Created: 2024-02-27T13:09:36.297+00:00
#Citation Info:  
#Please always cite the download DOI when using this data.
#https://www.gbif.org/citation-guidelines
#DOI: 10.15468/dl.eqe8pd
#Citation:
#GBIF Occurrence Download https://doi.org/10.15468/dl.eqe8pd Accessed from R via rgbif (https://github.com/ropensci/rgbif) on 2024-02-27

d <- occ_download_get('0022281-240216155721649', path="data/") %>%
  occ_download_import()

write_csv(d, "data/rawData.csv")

#cleaning

fData<-d %>%
  filter(!is.na(decimalLatitude), !is.na(decimalLongitude))

fData<-fData %>%
  filter(countryCode %in% c("US", "CA", "MX"))

#fData<-fData %>%
#  filter(countryCode=="US" | countryCode=="CA" | countryCode=="MX")

fData<- fData %>%
  filter(!basisOfRecord %in% c("FOSSIL_SPECIMEN", "LIVING_SPECIMEN"))

fData<-fData %>%
  cc_sea(lon="decimalLongitude", lat="decimalLatitude")

# remove duplicates
fData<-fData %>%
  distinct(decimalLongitude, decimalLatitude, speciesKey, datasetKey, .keep_all = TRUE)

# one fell swoop
# cleanData<- %>%
# filter(!is.na(decimalLatitude), !is.na(decimalLongitude))
# filter(countryCode %in% c("US", "CA", "MX"))
# filter(!basisOfRecord %in% c("FOSSIL_SPECIMEN", "LIVING_SPECIMEN"))
# cc_sea(lon="decimalLongitude", lat="decimalLatitude")
# distinct(decimalLongitude, decimalLatitude, speciesKey, datasetKey, .keep_all = TRUE)

write.csv(fData, "data/cleanedData.csv")