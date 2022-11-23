rm(list=ls())
gc()
library(rgbif)
library(usethis)
usethis::edit_r_environ()
name_backbone("Aristida adscensionis")$usageKey
gbif_download <- occ_download(pred("taxonKey", 2706277),format = "SIMPLE_CSV")

occ_download_wait(gbif_download)

d <- occ_download_get(gbif_download) %>%
  occ_download_import()
