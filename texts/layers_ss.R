# source("texts/layers_ss.R")
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
            "Negative sea bottom temperature anomalies",
            "bottom_water_temperature_anomalies_atlantic.6dba9a9f.negative",
            "SBT-",
            "\\(0.2 degree\\)",
            "Annual",
            "2016-2019",
            "negative anomalies",
            "Fisheries, and ceans Canada (2022). Fisheries and Oceans Canada’s temperature data from the summer groundfish survey of Fisheries and Oceans Canada on the Scotian Shelf [Data accessed 2022-06-29]. Fisheries and Oceans Canada.",
            '<p>The data used to characterize bottom-water temperature anomalies come from the Department of Fisheries and Oceans’ (DFO) temperature data from the summer groundfish survey on the Scotian Shelf. Bottom-water temperatures are interpolated from conductivity-temperature-depth (CTD) sampling performed annually at a 0.2 degrees resolution <span class="citation">(Fisheries and ceans Canada, 2022)</span>. Anomalies are evaluated as a cell value for a given year minus that cell’s value from a climatology spanning YYYY to YYYY. Anomalies were divided into positive and negative anomalies and the absolute value of anomalies were used as the intensity of the surface-water temperature anomalies in a given cell. Grid cells that exceeded 0.5 were considered as anomalous for this assessment. The mean anomaly intensity between 2010 and 2015, and between 2016 and 2019, for each grid cell was used to generate the final index of bottom-water temperature anomalies for each period considered.</p>',
            'Log-transformed and scaled (99th quantile)',
            '')

df[2,] <- c("Climate",
            "Positive sea bottom temperature anomalies",
            "bottom_water_temperature_anomalies_atlantic.6dba9a9f.positive",
            "SBT+",
            "\\(0.2 degree\\)",
            "Annual",
            "2016-2019",
            "negative anomalies",
            "Fisheries, and ceans Canada (2022). Fisheries and Oceans Canada’s temperature data from the summer groundfish survey of Fisheries and Oceans Canada on the Scotian Shelf [Data accessed 2022-06-29]. Fisheries and Oceans Canada.",
            df[1,]$Overview,
            'Log-transformed and scaled (99th quantile)',
            '')

df[3,] <- c("Climate",
            "Negative sea surface temperature anomalies",
            "sea_surface_temperature_anomalies_dfo.3992e1a6.negative",
            "SST-",
            "\\(~2 km^2\\)",
            "Monthly",
            "2016-2021",
            "number (\\(n\\)) negative anomalies",
            "Galbraith et al. (2021). Physical Oceanographic Conditions in the Gulf of St. Lawrence during 2020. DFO Can. Sci. Advis. Sec. Res. Doc. 2021/045. Iv + 81 p. Department of Fisheries and Oceans.",
            '<p>The data used to characterize sea surface temperature anomalies come from the Atlantic Zone Monitorint Program [AZMP; <span class="citation">Galbraith et al. (2021)</span>] from the Department of Fisheries and Oceans (DFO). A full description of the data and methods can be found in <span class="citation">Galbraith et al. (2021)</span>, and we used a similar approach to that described by <span class="citation">Beauchesne et al. (2020)</span> to evaluate positive and negative temperature anomalies. Here, we provide a brief summary of the approach.</p> <p>The surface layer is characterized using sea surface-water temperature (SST) monthly composites from Advanced Very High Resolution Radiometer (AVHRR) satellite images obtained from the National Oceanic and Atmospheric Administration (NOAA) and European Organization for the Exploitation of Meteorological Satellites (EUMETSAT). Images used are from DFO’s Maurice Lamontagne Institute at a 1 km resolution from 1985-2013 and from DFO’s Bedford Institute of Oceanography (BIO) Operational Remote Sensing group at a 1.5 km resolution since 2014. Monthly anomalies were constructed as the difference between monthly averages and the 1985-2010 climatological mean for each month.</p> <p>We used temperature anomalies, <em>i.e.</em> deviations from long-term normal conditions between 1985 and 2010, to evaluate an annual index of stress associated with extreme temperatures between 2010 and 2021. Temperature anomalies were calculated using the difference between grid cell values with 1985-2010 climatological averages. Anomaly time series were normalized by their standard deviation (SD) to allow comparisons between areas with different temperature ranges. Grid cells whose monthly value exceeded ±0.5 standard deviation (SD) from the long-term average were considered as anomalous <span class="citation">(Galbraith et al., 2021)</span>. Outliers in the data were defined as those that fell beyond the interquartile range * 3, identified as extreme outliers by <span class="citation">Tukey (1977)</span>. Outlier values were capped to correspond to the 5th and 95th percentile values. Anomalies were divided into positive and negative anomalies and the absolute value of anomalies were used as the intensity of the surface-water temperature anomalies in a given cell. Only the months of May to November were included to avoid biases associated with the presence of ice cover. The sum of anomalies between 2010 and 2015, and between 2016 and 2021, were used to obtain a single value per cell per period considered for the assessment. The anomalies were then resampled on the study grid used for this assessment.</p>',
            'Scaled (99th quantile)',
            "https://publications.gc.ca/site/eng/9.900562/publication.html")


df[4,] <- c("Climate",
            "Positive sea surface temperature anomalies",
            "sea_surface_temperature_anomalies_dfo.3992e1a6.positive",
            "SST+",
            "\\(~2 km^2\\)",
            "Monthly",
            "2016-2021",
            "number (\\(n\\)) positive anomalies",
            df[3,]$Source,
            df[3,]$Overview,
            'Scaled (99th quantile)',
            df[3,]$SourceLink)

df[5,] <- c("Coastal",
            "Coastal development",
            "night_lights.aba5e90a",
            "CD",
            "\\(15\\) \\(arc-second\\)",
            "Annual",
            "2016-2021",
            "\\(nanoWatts * cm^{-2} * sr^{-1}\\)",
            "Elvidge, C. D., Zhizhin, M., Ghosh, T., Hsu, F.-C., and Taneja, J. (2021). Annual Time Series of Global VIIRS Nighttime Lights Derived from Monthly Averages: 2012 to 2019. Remote Sensing 13, 922. doi:10.3390/rs13050922.",
            '<p>We used lights at night as a proxy of the presence of coastal infrastructure development, as stable lights mostly capture human settlements and industrial sites. We used data from the Nighttime Lights Time Series. Nighttime light products are compiled by the Earth Observation Group at the National Oceanic and Atmospheric Administration’s (NOAA) National Centers for Environmental Information (NCEI). They use globally available nighttime data obtained from the Visible Infrared Imaging Radiometer Suite (VIIRS) Day/Night Band (DNB) of the Defense Meteorological Satellite Program (DMSP) to characterize global average radiance (<span class="math inline">\\(nanoWatts\\)</span> <span class="math inline">\\(cm^{-2}\\)</span> <span class="math inline">\\(sr^{-1}\\)</span>) composite images at a 15 arc-second (~200 m) resolution.v We used the annual Version 2 Nighttime VIIRS DNB composites between 2012 and 2021 <span class="citation">(Elvidge et al., 2021)</span> to characterize coastal development in coastal areas of the Scotiain Shelf. As the effects of coastal development are likely acute in its direct vicinity, we extracted average radiance values using a 2 km buffer around grid cells within 2 km of the coast. In each grid cell, we used the mean annual radiance as a proxy of the effects of coastal development in coastal areas. The first period (2010-2015) only contains 4 years of data, since radiance values are unavailable prior to 2012.</p>',
            'Log-transformed and scaled (99th quantile)',
            '')


df[6,] <- c("Coastal",
             "Direct human impact",
             "direct_human_impact.99bb2d51",
             "DHI",
             "\\(< 1 to > 40000 km^2\\)",
             "Annual",
             "2016,2021",
             "\\(population * 10km^{-2}\\)",
             "<p>Statistics Canada (2016a). Dissemination Area Boundary File, 2016 Census. Statistics Canada Catalogue no. 92-169-X. Statistics Canada.</p> <p>Statistics Canada (2016b). Population and dwelling counts, for dissemination areas, 2016 Census. Statistics Canada.</p> <p>Statistics Canada (2017). Boundary Files, Reference Guide, Second edition, 2016 Census. Statistics Canada Catalogue no. 92-160-G. Statistics Canada.</p> <p>Statistics Canada (2022a). 2021 Census - Boundary files. Statistics Canada.</p> <p>Statistics Canada (2022b). Boundary Files, Reference Guide Second edition, Census year 2021. Statistics Canada Catalogue no. 92-160-G. Statistics Canada.</p> <p>Statistics Canada (2022c). Population and dwelling counts: Canada, provinces and territories, census subdivisions and dissemination areas. Statistics Canada.",
             '<p>We used the sum of coastal populations as a proxy of direct human impact in coastal areas of the Scotian Shelf. We used Statistics Canada dissemination area and associated population counts from the 2016 <span class="citation">(Statistics Canada, 2016a, 2016b, 2017)</span> and 2021 <span class="citation">(Statistics Canada, 2022a, 2022b, 2022c)</span> censuses to evaluated the population size in coastal areas. Dissemination areas are the smallest standard geographic area in which census data are disseminated. They combine to cover all of Canada and are highly variable in shapes and sizes. The census provides population count within the boundary of each dissemination area, which we used to evaluate total coastal population.</p><p>As the effects of direct human impacts are likely acute mostly in coastal areas we calculated total population in grid cells within 2 km of the coast. Total population was measured in a 10 km buffer around each coastal cell. The total population in each buffer was the sum of intersecting dissemination areas divided by the intersection area between buffers and dissemination areas:</p> <p><span class="math display">\\[DHI_j = \\sum_{k=1}^{n_j} P_k * \\frac{A_{j,k}}{A{tot, k}}\\]</span></p> <p>where <span class="math inline">\\(j\\)</span> is a buffered grid cell, <span class="math inline">\\(k\\)</span> is a dissemination area intersecting <span class="math inline">\\(j\\)</span>, <span class="math inline">\\(P\\)</span> is the population in <span class="math inline">\\(k\\)</span>, <span class="math inline">\\(A\\)</span> is the area of the <span class="math inline">\\(k\\)</span> overlapping with <span class="math inline">\\(j\\)</span> and <span class="math inline">\\(A_{tot}\\)</span> is the total area of <span class="math inline">\\(k\\)</span>. This approach was favoured to reduce the effects of very large dissemination areas overlapping with buffers on a very small percentage of their total area. We used the mean values from the 2016 and 2021 census for both periods of the assessment, as we did not have the data for the period between 2010 and 2015.</p>',
             'Log-transformed and scaled (99th quantile)',
             'https://www12.statcan.gc.ca/census-recensement/index-eng.cfm')


df[7,] <- c("Coastal",
             "Inorganic pollution",
             "watershed_activity_index.041a30d2.SummedRasters_AgriCover",
             "IP",
             "\\(Modeled 100 m^2\\)",
             "-",
             "Betwen 2010 and 2019",
             "\\(% cover agriculture land\\)",
             "Guijarro-Sabaniel, J., and Kelly, N. E. (2022). Land use atlas for coastal watersheds in the Maritimes Region. Department of Fisheries and Oceans.",
             '<p>The data used to characterize the intensity of inorganic pollution, organic pollution, population density and nutrient input in coastal areas come from an atlas of land use for coastal watershed in the Maritimes Region, hereafter the Land Use Atlas <span class="citation">(Guijarro-Sabaniel and Kelly, 2022)</span>. We provide a brief summary of data and methods in this document. For more details, refer to <span class="citation">Guijarro-Sabaniel and Kelly (2022)</span>.</p> <p>Coastal watershed boundaries in the Scotian Shelf Biogeographic Marine Management Sub-region were delineated using a digital elevation model (DEM) for each province was combined with national hydrographic data and calculating the flow direction and accumulation for each DEM. Stream orders for the stream network were then evaluated to locate the highest flow accumulation value for each watershed and given a value between 1 (lowest) and 4 (highest). The locations of these values were then used to identify pour points (<em>e.g.</em> river mouths) along the coast for each watershed. Spread of land stressors into coastal and marine environments was then modeled using a diffusive plume model using a density decay buffer based on stream order of the main pour points.</p> <p>The following sections describes how this model was used to characterize the intensity of inorganic pollution, nutrient input, organic pollution and population density in coastal areas of the Scotian Shelf.</p> <p>The intensity of inorganic pollution was modelled using the percent area covered by impervious surfaces in each watershed. Impervious surfaces refer to articifial structures such as roads and parking lots and industrial areas such as ports that are covered by water-resistan materials. Impervious surfaces are used as a proxy of inorganic pollution under the assumption that most of this pollution comes from urban runoff. Impervious surfaces were identified in watershed using a combination of multiple datasets from the provinces New Brunswick and Nova Scotia. Refer to the <em>Land cover</em> section and Table 1 of the Material and Methods in <span class="citation">Guijarro-Sabaniel and Kelly (2022)</span> for more details.</p>',
             'Log-transformed and scaled (99th quantile)',
             "")
             
df[8,] <- c("Coastal",
             "Nutrient loading",
             "watershed_activity_index.041a30d2.SummedRasters_NutrientLoading",
             "NL",
             "\\(Modeled 100 m^2\\)",
             "-",
             "Betwen 2010 and 2019",
             "\\(kg N yr^{-1}\\)",
             "<p>Kelly, N. E., Guijarro-Sabaniel, J., and Zimmerman, R. (2021). Anthropogenic nitrogen loading and risk of eutrophication in the coastal zone of Atlantic Canada. Estuarine, Coastal and Shelf Science 263, 107630. doi:10.1016/j.ecss.2021.107630.<p></p>Guijarro-Sabaniel, J., and Kelly, N. E. (2022). Land use atlas for coastal watersheds in the Maritimes Region. Department of Fisheries and Oceans.",
             '<p>The data used to characterize the intensity of inorganic pollution, organic pollution, population density and nutrient input in coastal areas come from an atlas of land use for coastal watershed in the Maritimes Region, hereafter the Land Use Atlas <span class="citation">(Guijarro-Sabaniel and Kelly, 2022)</span>. We provide a brief summary of data and methods in this document. For more details, refer to <span class="citation">Guijarro-Sabaniel and Kelly (2022)</span>.</p> <p>Coastal watershed boundaries in the Scotian Shelf Biogeographic Marine Management Sub-region were delineated using a digital elevation model (DEM) for each province was combined with national hydrographic data and calculating the flow direction and accumulation for each DEM. Stream orders for the stream network were then evaluated to locate the highest flow accumulation value for each watershed and given a value between 1 (lowest) and 4 (highest). The locations of these values were then used to identify pour points (<em>e.g.</em> river mouths) along the coast for each watershed. Spread of land stressors into coastal and marine environments was then modeled using a diffusive plume model using a density decay buffer based on stream order of the main pour points.</p> <p>The following sections describes how this model was used to characterize the intensity of inorganic pollution, nutrient input, organic pollution and population density in coastal areas of the Scotian Shelf.</p> <p>We used data from <span class="citation">Kelly et al. (2021)</span> to obtain the intensity of nutrient input in coastal areas of the Scotian Shelf. <span class="citation">Kelly et al. (2021)</span> used data from the Land Use Atlas to estimate nitrogen loading in coastal areas with the Nitrogen Loading Model (NLM) framework <span class="citation">(McIver et al., 2015; Nagel et al., 2018; Valiela et al., 1997; Valiela et al., 2000)</span> to estimate total (dissolved) nitrogen from point and non-point source inputs in coastal areas from atmospheric deposition, fertilizer use, and wastewater disposal. Data and methods used to apply the NLM framework are described in details in <span class="citation">Kelly et al. (2021)</span>.</p>',
             'Log-transformed and scaled (99th quantile)',
             "")

df[9,] <- c("Coastal",
             "Organic pollution",
             "watershed_activity_index.041a30d2.SummedRasters_ImperviousSurface",
             "OP",
             "\\(Modeled 100 m^2\\)",
             "-",
             "Betwen 2010 and 2019",
             "\\(% cover impervious surface\\)",
             "Guijarro-Sabaniel, J., and Kelly, N. E. (2022). Land use atlas for coastal watersheds in the Maritimes Region. Department of Fisheries and Oceans.",
             '<p>The data used to characterize the intensity of inorganic pollution, organic pollution, population density and nutrient input in coastal areas come from an atlas of land use for coastal watershed in the Maritimes Region, hereafter the Land Use Atlas <span class="citation">(Guijarro-Sabaniel and Kelly, 2022)</span>. We provide a brief summary of data and methods in this document. For more details, refer to <span class="citation">Guijarro-Sabaniel and Kelly (2022)</span>.</p> <p>Coastal watershed boundaries in the Scotian Shelf Biogeographic Marine Management Sub-region were delineated using a digital elevation model (DEM) for each province was combined with national hydrographic data and calculating the flow direction and accumulation for each DEM. Stream orders for the stream network were then evaluated to locate the highest flow accumulation value for each watershed and given a value between 1 (lowest) and 4 (highest). The locations of these values were then used to identify pour points (<em>e.g.</em> river mouths) along the coast for each watershed. Spread of land stressors into coastal and marine environments was then modeled using a diffusive plume model using a density decay buffer based on stream order of the main pour points.</p> <p>The following sections describes how this model was used to characterize the intensity of inorganic pollution, nutrient input, organic pollution and population density in coastal areas of the Scotian Shelf.</p> <p>We used the percent cover of agriculture land use in each watershed as a proxy of the intensity organic pollution in each watershed. The percent area covered by agricultural land in each watershed was identified in watershed using a combination of multiple datasets from the provinces New Brunswick and Nova Scotia. Refer to the <em>Land cover</em> section and Table 1 of the Material and Methods in <span class="citation">Guijarro-Sabaniel and Kelly (2022)</span> for more details.</p>',
             'Log-transformed and scaled (99th quantile)',
             "")

df[10,] <- c("Coastal",
             "Population density",
             "watershed_activity_index.041a30d2.SummedRasters_PopDensity",
             "PD",
             "\\(Modeled 100 m^2\\)",
             "-",
             "Betwen 2010 and 2019",
             "\\(person ha^{-1}\\)",
             "Guijarro-Sabaniel, J., and Kelly, N. E. (2022). Land use atlas for coastal watersheds in the Maritimes Region. Department of Fisheries and Oceans.",
             '<p>The data used to characterize the intensity of inorganic pollution, organic pollution, population density and nutrient input in coastal areas come from an atlas of land use for coastal watershed in the Maritimes Region, hereafter the Land Use Atlas <span class="citation">(Guijarro-Sabaniel and Kelly, 2022)</span>. We provide a brief summary of data and methods in this document. For more details, refer to <span class="citation">Guijarro-Sabaniel and Kelly (2022)</span>.</p> <p>Coastal watershed boundaries in the Scotian Shelf Biogeographic Marine Management Sub-region were delineated using a digital elevation model (DEM) for each province was combined with national hydrographic data and calculating the flow direction and accumulation for each DEM. Stream orders for the stream network were then evaluated to locate the highest flow accumulation value for each watershed and given a value between 1 (lowest) and 4 (highest). The locations of these values were then used to identify pour points (<em>e.g.</em> river mouths) along the coast for each watershed. Spread of land stressors into coastal and marine environments was then modeled using a diffusive plume model using a density decay buffer based on stream order of the main pour points.</p> <p>The following sections describes how this model was used to characterize the intensity of inorganic pollution, nutrient input, organic pollution and population density in coastal areas of the Scotian Shelf.</p> <p>This intensity of stress caused by watershed population in coastal areas was modelled using the population density in each watershed in <span class="math inline">\\(person * ha^{-1}\\)</span>. Total population was estimated as the number of civic address datasets from New Brunswick and Nova Scotia multiplied by the average number of residents per household (<em>i.e.</em> 2.3) obtained from Statistics Canada. Population density was then evaluated as the total population in a watershed divided by the watershed area in hectares.</p>',
             'Log-transformed and scaled (99th quantile)',
             "")

df[11,] <- c("Fisheries",
             "Demersal, destructive",
             "fisheries_intensity.e2b7e6c4.DD",
             "DD",
             "\\(Lat/long\\)",
             "Event based",
             "2016-2020",
             "\\(kg\\)",
             "Fisheries, and ceans Canada (2021). Fisheries and Oceans Canada’s Zonal Interchange File Format (ZIFF) data. A compilation of landing data from logbook data between 2000 and 2020. [Data accessed 2021-06-11]. Fisheries and Oceans Canada.",
             '<p>The intensity and distribution of commercial fisheries on the Scotian Shelf was assessed using the Department of Fisheries and Oceans’s logbook program <span class="citation">(Fisheries and ceans Canada, 2021)</span>; these logbooks provide a thorough, if not exhaustive, overview of fisheries in eastern Canada. We used data between 2010 and 2021 to characterize the distribution and the intensity of commercial fisheries on the Scotian Shelf. This period was characterized by 2986667 fishing activities targeting 80 species and a total of 111 species were captured when considering bycatch.</p> <p>Fishing activities are performed using a variety of gear types (<em>e.g.</em> trap, trawl, dredge, driftnet, hand line, longline, scuba diving, purse seine, seine, beach seine and jig fishing), which can have different effects on species and habitats. Fisheries activities were therefore divided based on the type of environmental effects attributed to specific gear types according to the categories suggested by <span class="citation">Halpern et al. (2008)</span> and used by <span class="citation">Beauchesne et al. (2020)</span> for the Estuary and Gulf of St. Lawrence (Table 1): demersal, destructive, high bycatch (DD) demersal, non-destructive, high bycatch (DNH) demersal, non-destructive, low bycatch (DNL) pelagic, high bycatch (PHB) pelagic, low bycatch (PLB)</p> <p>Gear types can be further classified into fixed or mobile gear (Table 1). We used the type of mobility to evaluate an expected area of effect for each fishing event, using radii of 200 and 2000 meters for fixed and mobile gear types, respectively <span class="citation">(Beauchesne et al., 2020)</span>. This approach, while decreasing precision, considers the potential uncertainty associated with fishing activity coordinates, gear mobility, and the absence of start and end coordinates for mobile gear.</p><br/><p>Table 1. Classification of gear types in the fisheries dataset based on their environmental impact and mobility</p><table><thead><tr class="header"><th>Gear type</th><th>Classification</th><th>Mobility</th></tr></thead><tbody><tr class="odd"><td>Trap</td><td>DNH</td><td>Fixed</td></tr><tr class="even"><td>Trawl</td><td>DD</td><td>Mobile</td></tr><tr class="odd"><td>Dredge</td><td>DD</td><td>Mobile</td></tr><tr class="even"><td>Driftnet</td><td>PHB</td><td>Fixed</td></tr><tr class="odd"><td>Hand lines</td><td>PLB</td><td>Fixed</td></tr><tr class="even"><td>Longline</td><td>PHB</td><td>Fixed</td></tr><tr class="odd"><td>Scuba diving</td><td>DNL</td><td>Fixed</td></tr><tr class="even"><td>Purse seine</td><td>PLB</td><td>Fixed</td></tr><tr class="odd"><td>Seine</td><td>DNH</td><td>Fixed</td></tr><tr class="even"><td>Beach seine</td><td>DNH</td><td>Fixed</td></tr><tr class="odd"><td>Trap</td><td>DNH</td><td>Fixed</td></tr><tr class="even"><td>Jig fishing</td><td>PLB</td><td>Fixed</td></tr></tbody></table><br/> <p>To characterize the intensity of fishing activities, we used a biomass yield density index by summing the total annual biomass captured in each grid cell covering the Scotian Shelf, yielding an assessment in kg per cell surface, <em>i.e.</em> <span class="math inline">\\(kg * km^{-2}\\)</span> in this case. For each period considered in the assessment (2010-2015 and 2016-2021) and each fishing category, we used the mean annual biomass captured per grid cell to capture the intensity and distribution of as the assessment of the intensity and distribution of fisheries on the Scotian Shelf.</p>',
             'Log-transformed and scaled (99th quantile)',
             '')


df[12,] <- c("Fisheries",
             "Demersal, non-destructive, high-bycatch",
             "fisheries_intensity.e2b7e6c4.DNH",
             "DNH",
             "\\(Lat/long\\)",
             "Event based",
             "2016-2020",
             "\\(kg\\)",
             df[11,]$Source,
             df[11,]$Overview,
             'Log-transformed and scaled (99th quantile)',
             '')


df[13,] <- c("Fisheries",
             "Demersal, non-destructive, low-bycatch",
             "fisheries_intensity.e2b7e6c4.DNL",
             "DNL",
             "\\(Lat/long\\)",
             "Event based",
             "2016-2020",
             "\\(kg\\)",
             df[11,]$Source,
             df[11,]$Overview,
             'Log-transformed and scaled (99th quantile)',
             '')


df[14,] <- c("Fisheries",
             "Pelagic, high-bycatch",
             "fisheries_intensity.e2b7e6c4.PHB",
             "PHB",
             "\\(Lat/long\\)",
             "Event based",
             "2016-2020",
             "\\(kg\\)",
             df[11,]$Source,
             df[11,]$Overview,
             'Log-transformed and scaled (99th quantile)',
             '')


df[15,] <- c("Fisheries",
             "Pelagic, low-bycatch",
             "fisheries_intensity.e2b7e6c4.PLB",
             "PLB",
             "\\(Lat/long\\)",
             "Event based",
             "2016-2020",
             "\\(kg\\)",
             df[11,]$Source,
             df[11,]$Overview,
             'Log-transformed and scaled (99th quantile)',
             '')


df[16,] <- c("Marine traffic",
             "Invasive species",
             "invasive_species_richness.84b6ea0b.Present_Richness",
             "INV",
             "\\(0.01 degree\\)",
             "Annual",
             "-",
             "\\(n species\\)",
             "Lyons, D. A., Lowen, J. B., Therriault, T. W., Brickman, D., Guo, L., Moore, A. M., et al. (2020). Identifying marine invasion hotspots using stacked species distribution models. Biological Invasions 22, 3403–3423. doi:10.1007/s10530-020-02332-3.",
             '<p>The data used to characterize invasive species comes from <span class="citation">Lyons et al. (2020)</span>. They used over 12 years of survey data on invasive species to characterize the present day and future distribution of known and established species. They assessed their potential distribution at a 0.01 degree resolution using species distribution models and stacked the resulting individual distributions to identify areas at risk from invasive species. We used the resulting stacked distributions, representing invasive species richness, as a proxy of risk from invasive species in our study area by resampling their 0.01 degree resolution grid to our own study grid.</p>',
             'Log-transformed and scaled (99th quantile)',
             "")


df[17,] <- c("Marine traffic",
             "Shipping",
             "shipping_intensity.72312316.interpolated_vessels",
             "SHP",
             "\\(0.1 degree\\)",
             "Monthly",
             "2017-2020",
             "\\(n ship lanes\\)",
             "Global Fishing Watch (2022). AIS global shipping dat as monthly rasters at 0.1 degree resolution including the number of vessels and total hours of vessel presence. Global Fishing Watch.",
             '<p>The data used to characterize shipping come the Global Fishing Watch, which provides shipping data from Automatic Identification System (AIS) data globally. We obtained data between 2017 and 2020 that characterize monthly commercial shipping (<em>e.g.</em> cargo, reefer, tanker, bunker) as rasters with a 0.1 degree resolution, either as the number of vessels or the total hours of vessel presence in each grid cell <span class="citation">(Global Fishing Watch, 2022)</span>. The data was also available either as direct observations from the AIS data, or interpolated to a regular interval of five minutes between points. We used the sum of monthly interpolated number of all vessel types in each grid cell to obtain an assessment of annual shipping intensity on the Scotian Shelf. When then resampled the 0.1 degree resolution grid to our own study grid. We used the mean annual shipping intensity value between 2017 and 2020 for both periods considered in the assessment.</p>',
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
