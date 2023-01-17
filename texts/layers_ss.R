df <- data.frame(Groups = character(),
                 Drivers = character(),
                 FileName = character(),
                 Accronym = character(),
                 SpatRes = character(),
                 TempRes = character(),
                 Years = character(),
                 Units = character(),
                 Source = character(),
                 Overview = character(),
                 DataTrans = character(),
                 SourceLink = character(),
                 # Github = character(),
                 stringsAsFactors = F)


df[1,] <- c("Climate",
            "Sea bottom temperature anomalies",
            "bottom_water_temperature_anomalies_atlantic.6dba9a9f.bottomValues",
            "SBT",
            "",
            "",
            "",
            "",
            '',
            '',
            'Log-transformed and scaled (99th quantile)',
            '')

df[2,] <- c("Climate",
            "Negative sea surface temperature anomalies",
            "sea_surface_temperature_anomalies_dfo.3992e1a6.negative",
            "SST-",
            "\\(~2 km^2\\)",
            "Monthly",
            "1981-2010 vs. 2019-2021",
            "number (\\(n\\)) negative anomalies",
            "Galbraith et al. (2021). Physical Oceanographic Conditions in the Gulf of St. Lawrence during 2020. Department of Fisheries and Oceans.",
            '<p>The data used to characterize surface temperature anomalies come from the Department of Fisheries and Oceans’ (DFO) Atlantic Zone Monitoring Program <span class="citation">(AZMP; Galbraith et al., 2021)</span>. We provide a brief summary of data and methods to characterize surface temperature climatology and anomalies in this document. For more details, refer to <span class="citation">Galbraith et al. (2021)</span>.</p><p>The surface layer is characterized using a variety of methods:</p><ol style="list-style-type: decimal"><li>Temperature-salinity sensors installed on various ships and forming the shipboard thermosalinograph network,</li><li>Moored instruments recording water temperature every 30 minutes and forming the thermograph network,</li><li>Sea surface temperature (SST) monthly composite climatologies using Advanced Very High Resolution Radiometer (AVHRR) satellite images from the National Oceanic and Atmospheric Administration (NOAA) and European Organization for the Exploitation of Meteorological Satellites (EUMETSAT) available from the Maurice Lamontagne Institute sea surface temperature processing facility at a 1km resolution from 1985-2013 and from the Bedford Institute of Oceanography (BIO) Operational Remote Sensing group at a 1.5km resolution since 2014.</li></ol><p>Positive and negative surface temperature anomalies were identified following the same approach used for bottom temperature anomalies. Compared to the bottom temperature anomalies, however, data is available throughout the year. Only the months of April to November were included to avoid biases associated with anomalies measurements due to the presence of ice cover.</p><p>We used temperature anomalies, <em>i.e.</em> deviations from long-term normal conditions, to measure an annual index of stress associated with extreme temperatures between 2019 and 2021. Temperature anomalies were calculated using the difference between grid cell monthly climatologies to the associated long-term averages generated from the reference period between 1981 and 2010. Grid cells whose monthly value exceeded ±0.5 standard deviation (SD) from the long-term average were considered as anomalous <span class="citation">(Galbraith et al., 2018)</span>.</p><p>Outliers in the data were considered as those that fell beyond the interquartile range (IQR) * 3, identified as extreme outliers by <span class="citation">Tukey (1977)</span>. Outlier values were capped to correspond to the 5th and 95th percentiles. Anomalies were divided into positive and negative anomalies and summed for the months of April to November. By adding the monthly anomaly values, we essentially considered the summed deviation from the mean as an indicator of the annual intensity of surface temperature anomalies in the St. Lawrence. The months of December to March were removed to avoid biases associated with anomalies measurements due to the presence of ice cover.</p>',
            'Scaled (99th quantile)',
            "https://publications.gc.ca/site/eng/9.900562/publication.html")


df[3,] <- c("Climate",
            "Positive sea surface temperature anomalies",
            "sea_surface_temperature_anomalies_dfo.3992e1a6.positive",
            "SST+",
            "\\(~2 km^2\\)",
            "Monthly",
            "1981-2010 vs. 2019-2021",
            "number (\\(n\\)) positive anomalies",
            df[5,]$Source,
            df[5,]$Overview,
            'Scaled (99th quantile)',
            df[5,]$SourceLink)

df[4,] <- c("Coastal",
            "Coastal development",
            "night_lights.aba5e90a",
            "CD",
            "\\(15\\) \\(arc-second\\)",
            "Annual",
            "2015-2016",
            "\\(nanoWatts * cm^{-2} * sr^{-1}\\)",
            "Earth Observation Group (2019). Version 1 VIIRS Day/Night Band Nighttime Lights. NOAA National Centers for Environmental Information (NCEI).",
            '<p>We used lights at night as a proxy of coastal infrastructure development, as terrestrial stable lights at night represent light from human settlements and industrial sites with electricity.</p><p>The data comes from the Nighttime Lights Time Series. Nighttime light products are compiled by the Earth Observation Group at the National Oceanic and Atmospheric Administration’s (NOAA) National Centers for Environmental Information (NCEI). They use glogally available nighttime data obtained from the Visible Infrared Imaging Radiometer Suite (VIIRS) Day/Night Band (DNB) of the Defense Meteorological Satellite Program (DMSP) to characterize global average radiance (<span class="math inline">\\(nanoWatts\\)</span> <span class="math inline">\\(cm^{-2}\\)</span> <span class="math inline">\\(sr^{-1}\\)</span>) composite images at a 15 arc-second (~200 m) resolution.</p><p>We used the annual Version 1 Nighttime VIIRS DNB composites between 2015 and 2016 <span class="citation">(Earth Observation Group, 2019)</span> to characterize coastal development in coastal areas of the St. Lawrence. As the effects of coastal development are likely acute in its direct vicinity, we extracted average radiance values using a 2 km buffer around grid cells within 2 km of the coast. We used a weighted area average to extract the radiance values.</p>',
            'Log-transformed and scaled (99th quantile)',
            'https://www.ngdc.noaa.gov/eog/viirs/download_dnb_composites.html')


df[5,] <- c("Coastal",
             "Direct human impact",
             "direct_human_impact.99bb2d51",
             "DHI",
             "Modeled \\(1 km^2\\)",
             "Annual",
             "2011",
             "\\(population * 10km^{-2}\\)",
             "Statistics Canada (2017). Population and Dwelling Count Highlight Tables. 2016 Census. Statistics Canada Catalogue no. 98-402-X2016001. Ottawa. Released February 8, 2017.",
             '<p>As in <span class="citation">Halpern et al. (2008)</span> and <span class="citation">Halpern et al. (2015b)</span>, we used the sum of coastal populations as a proxy of direct human impact. We used Statistics Canada dissemination area population count from the 2016 census to obtain coastal population size around the St. Lawrence <span class="citation">(<span class="citeproc-not-found" data-reference-id="statscan2017">Statistics Canada, 2017</span>)</span>. Dissemination areas are the smallest standard geographic area in which census data are disseminated and they combine to cover all of Canada. The census provides population count within the boundary of each dissemination area, which we used to evaluate total coastal population.</p><p>As the effects of direct human impacts are likely acute mostly in coastal areas we calculated total population in grid cells within 2 km of the coast. Total population was measured in a 10 km buffer around each coastal cell. The total population in each buffer was the sum of intersecting dissemination areas divided by the intersection area between buffers and dissemination areas:</p><p><span class="math display">\\[DHI_j = \\sum_{k=1}^{n_j} P_k * \\frac{A_{j,k}}{A{tot, k}}\\]</span></p><p>where <span class="math inline">\\(j\\)</span> is a buffered grid cell, <span class="math inline">\\(k\\)</span> is a dissemination area intersecting <span class="math inline">\\(j\\)</span>, <span class="math inline">\\(P\\)</span> is the population in <span class="math inline">\\(k\\)</span>, <span class="math inline">\\(A\\)</span> is the area of the <span class="math inline">\\(k\\)</span> overlapping with <span class="math inline">\\(j\\)</span> and <span class="math inline">\\(A_{tot}\\)</span> is the total area of <span class="math inline">\\(k\\)</span>. This approach was favoured to reduce the effects of very large dissemination areas overlapping with buffers on a very small percentage of their total area.</p>',
             'Log-transformed and scaled (99th quantile)',
             'https://www12.statcan.gc.ca/census-recensement/index-eng.cfm')


df[6,] <- c("Coastal",
             "Agriculture cover",
             "watershed_activity_index.041a30d2.SummedRasters_AgriCover",
             "NL",
             "",
             "",
             "",
             "-",
             "",
             "",
             'Log-transformed and scaled (99th quantile)',
             "")
             
df[7,] <- c("Coastal",
             "Nutrient loading",
             "watershed_activity_index.041a30d2.SummedRasters_NutrientLoading",
             "NL",
             "",
             "",
             "",
             "-",
             "",
             "",
             'Log-transformed and scaled (99th quantile)',
             "")

df[8,] <- c("Coastal",
             "Impervious surface",
             "watershed_activity_index.041a30d2.SummedRasters_ImperviousSurface",
             "NL",
             "",
             "",
             "",
             "-",
             "",
             "",
             'Log-transformed and scaled (99th quantile)',
             "")

df[9,] <- c("Coastal",
             "Population density",
             "watershed_activity_index.041a30d2.SummedRasters_PopDensity",
             "NL",
             "",
             "",
             "",
             "-",
             "",
             "",
             'Log-transformed and scaled (99th quantile)',
             "")

df[10,] <- c("Fisheries",
             "Demersal, destructive",
             "fisheries_intensity.e2b7e6c4.DD",
             "DD",
             "\\(Lat/long\\)",
             "Event based",
             "2010-2015",
             "\\(kg\\)",
             "Fisheries and Oceans Canada (2016). Departement of Fisheries and Oceans Canada’s Fisheries and Oceans Canada Zonal Interchange File Format (ZIFF) data. A compilation of landing data from logbook data between 2010 and 2015.",
             '<p>The impacts of fisheries activities in the St. Lawrence are evaluated using DFO fisheries logbooks program <span class="citation">(DFO, 2016)</span>. While logbooks are not mandatory for all fisheries in the St. Lawrence, they still provide a very thorough overview of the spatial distribution and intensity of fishing activities in the St. Lawrence. The data we used spans 6 years from 2010 to 2015 and details 218323 fishing events (36387 <span class="math inline">\\(\\pm\\)</span> 3147 fishing events per year). There were 31 targeted species and a total of 53 caught species in the dataset.</p><p>Fishing activities are performed using a variety of gear types: trap, trawl, dredge, driftnet, hand line, longline, scuba diving, purse seine, seine, beach seine and jig fishing. Intensity of fishing activities was divided among gear types and based on their respective types of environmental impacts. For example, traps and trawls have very different effects on a system. Gear classification was done using the classification presented in <span class="citation">Halpern et al. (2008)</span> and <span class="citation">Halpern et al. (2015a)</span> and is broken down into 5 distinct classes: demersal destructive (DD), demersal, non-destructive, low-bycatch (DNL), demersal, non-destructive, high-bycatch (DNH), pelagic, low-bycatch (PLB) and pelagic, high-bycatch (PHB). This categorization therefore divides the fisheries data into 5 distinct driver layers characterizing fishing activities.</p><p>Gear types can also be further classified into fixed or mobile engines based on their mobility. We used these two mobility classes to generate a buffer of impact around each fishing activity coordinates to consider potential spatial uncertainty associated with locations and the fact that mobile engines can be tracted over several kilometers during fishing activities and that we do not have the beginning and end points of mobile fishing events. Buffer sizes for fixed and mobile engine was of 200 and 2000 meters, respectively.</p><br/><p>Table 1. Classification of gear types in the fisheries dataset based on their environmental impact and mobility</p><table><thead><tr class="header"><th>Gear type</th><th>Classification</th><th>Mobility</th></tr></thead><tbody><tr class="odd"><td>Trap</td><td>DNH</td><td>Fixed</td></tr><tr class="even"><td>Trawl</td><td>DD</td><td>Mobile</td></tr><tr class="odd"><td>Dredge</td><td>DD</td><td>Mobile</td></tr><tr class="even"><td>Driftnet</td><td>PHB</td><td>Fixed</td></tr><tr class="odd"><td>Hand lines</td><td>PLB</td><td>Fixed</td></tr><tr class="even"><td>Longline</td><td>PHB</td><td>Fixed</td></tr><tr class="odd"><td>Scuba diving</td><td>DNL</td><td>Fixed</td></tr><tr class="even"><td>Purse seine</td><td>PLB</td><td>Fixed</td></tr><tr class="odd"><td>Seine</td><td>DNH</td><td>Fixed</td></tr><tr class="even"><td>Beach seine</td><td>DNH</td><td>Fixed</td></tr><tr class="odd"><td>Trap</td><td>DNH</td><td>Fixed</td></tr><tr class="even"><td>Jig fishing</td><td>PLB</td><td>Fixed</td></tr></tbody></table><br/><p>In order to characterize the intensity of fishing activities (<span class="math inline">\\(FI\\)</span>), we used a biomass yield density index. We multipled the total annual biomass captured in each grid cell <em>j</em>, regardless of species, by the proportion of fishing area in each grid cell:</p><p><span class="math display">\\[FI_j = \\sum_{k=1}^{n_j} B_{tot, k} * \\frac{A_{j,k}}{A_{tot,k}}\\]</span></p><p>where <span class="math inline">\\(j\\)</span> is a grid cell, <span class="math inline">\\(k\\)</span> is a fishing event, <span class="math inline">\\(B_{tot}\\)</span> is the total biomass of a fishing event <span class="math inline">\\(k\\)</span>, <span class="math inline">\\(A\\)</span> is the area of a fishing event <em>k</em> overlapping a cell <span class="math inline">\\(j\\)</span> and <span class="math inline">\\(A_{tot}\\)</span> is the total area of the fishing event <span class="math inline">\\(k\\)</span>. This formula gives an intensity measurement in biomass units, which is kg in our case. Since we measure the intensity within a 1 <span class="math inline">\\(km^2\\)</span> grid cell, the intensity evaluation is in <span class="math inline">\\(kg * km^{-2}\\)</span>. This metric distributes the biomass captured within each grid cell as a function of overlapping fishing area and provides an overview of how impacted each grid cell is in terms of extracted biomass.</p>',
             'Log-transformed and scaled (99th quantile)',
             '')


df[11,] <- c("Fisheries",
             "Demersal, non-destructive, high-bycatch",
             "fisheries_intensity.e2b7e6c4.DNH",
             "DNH",
             "\\(Lat/long\\)",
             "Event based",
             "2010-2015",
             "\\(kg\\)",
             df[15,]$Source,
             df[15,]$Overview,
             'Log-transformed and scaled (99th quantile)',
             '')


df[12,] <- c("Fisheries",
             "Demersal, non-destructive, low-bycatch",
             "fisheries_intensity.e2b7e6c4.DNL",
             "DNL",
             "\\(Lat/long\\)",
             "Event based",
             "2010-2015",
             "\\(kg\\)",
             df[15,]$Source,
             df[15,]$Overview,
             'Log-transformed and scaled (99th quantile)',
             '')


df[13,] <- c("Fisheries",
             "Pelagic, high-bycatch",
             "fisheries_intensity.e2b7e6c4.PHB",
             "PHB",
             "\\(Lat/long\\)",
             "Event based",
             "2010-2015",
             "\\(kg\\)",
             df[15,]$Source,
             df[15,]$Overview,
             'Log-transformed and scaled (99th quantile)',
             '')


df[14,] <- c("Fisheries",
             "Pelagic, low-bycatch",
             "fisheries_intensity.e2b7e6c4.PLB",
             "PLB",
             "\\(Lat/long\\)",
             "Event based",
             "2010-2015",
             "\\(kg\\)",
             df[15,]$Source,
             df[15,]$Overview,
             'Log-transformed and scaled (99th quantile)',
             '')


df[15,] <- c("Marine traffic",
             "Invasive species",
             "invasive_species_richness.84b6ea0b.Present_Richness",
             "INV",
             "",
             "",
             "",
             "",
             "",
             "",
             'Log-transformed and scaled (99th quantile)',
             "")


df[16,] <- c("Marine traffic",
             "Shipping",
             "shipping_intensity.72312316.interpolated_vessels",
             "SHP",
             "",
             "",
             "",
             "",
             "",
             "",
             'Log-transformed and scaled (99th quantile)',
             "")




# Order table
df <- df[order(df$Groups, df$Drivers), ]

# Add colors
# Colors
gg_color_hue <- function(n) {
  hues = seq(15, 375, length = n + 1)
  hcl(h = hues, l = 65, c = 100, alpha = .5)[1:n]
}

# Transparency
transparency <- c('FF','DD','BB','99','77','55','33','11')
nGroup <- length(unique(df$Groups))
df$col <- gg_color_hue(nGroup)[as.numeric(as.factor(df$Groups))]
for(i in unique(df$Groups)) {
  id <- which(df$Groups == i)
  nId <- length(id)
  for(j in 1:nId) {
    df$col[id[j]] <- paste0(substr(df$col[id[j]],1,7), transparency[j])
  }
}


# Export table
layers_ss <- df
save(layers_ss, file = './data/layers_ss.RData')
