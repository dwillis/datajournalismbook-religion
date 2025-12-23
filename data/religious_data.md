# Public religious data for Maryland journalism classrooms

Based on comprehensive research across six major data categories, I've identified numerous high-quality, publicly available religious datasets suitable for teaching data journalism with R. These sources offer diverse analytical opportunities while addressing Maryland-specific needs and varying student skill levels.

## Financial transparency through IRS 990 data

The most robust financial data comes from **IRS Form 990 filings**, which religious nonprofits must submit annually. ProPublica's Nonprofit Explorer API provides free access to 1.8+ million tax filings since 2013 in JSON format, with the `RPublica` R package enabling direct API access without authentication requirements. This dataset includes 40-120 financial fields covering revenue, expenses, executive compensation, and assets—perfect for teaching API consumption and time series analysis.

For bulk analysis, the **IRS Tax Exempt Organization Search** offers complete Form 990 data as CSV and XML files, representing 60-65% of all filings submitted electronically. The AWS IRS 990 E-File Dataset provides all electronic filings from 2011-present in machine-readable format, though it requires more advanced data processing skills suitable for capstone projects.

The **National Center for Charitable Statistics (NCCS)** at Urban Institute offers 30+ years of processed nonprofit data with an accompanying `nccsdata` R package, making it ideal for beginners. Their standardized formats eliminate much of the data cleaning burden while still teaching fundamental analysis concepts.

For Maryland-specific analysis, the **Maryland Secretary of State Charity Database** provides financial statements for all registered charities raising over $25,000 annually, though data extraction requires web scraping techniques that offer valuable pedagogical opportunities.

## Religious census and attendance patterns

The **U.S. Religion Census (RCMS)** provides the most comprehensive congregational data, with the 2020 census covering 372 religious bodies and 350,000+ congregations at the county level. Available through the Association of Religion Data Archives (ARDA), this dataset offers decennial snapshots from 1952-2020 in multiple formats including CSV and SPSS, easily imported into R using the `haven` package.

The **National Congregations Study (NCS)** offers four waves of data (1998-2019) covering 5,333 congregations with detailed information about worship practices, programs, and demographics. The dataset includes crucial weight variables for both congregation and attendee perspectives, teaching students proper survey weighting techniques in R.

**Pew Research Center's 2023-24 Religious Landscape Study** surveyed 36,908 respondents, providing state-level religious composition data with a ±6.1 percentage point margin of error for Maryland. The free public-use files in SPSS format convert easily for R analysis, with comprehensive codebooks documenting variable construction.

## Survey microdata revealing beliefs and practices

The **General Social Survey (GSS)** offers unparalleled longitudinal religious data from 1972-2024, with 68,846+ cumulative respondents. The `gssr` R package provides direct access to all waves, eliminating data acquisition barriers. The GSS includes consistent religious variables like attendance (ATTEND), affiliation (RELIG), and importance (RELITEN), enabling 50-year trend analyses.

The **Baylor Religion Survey** provides six waves (2005-2021) with 400+ religious items covering beliefs, paranormal experiences, and technology intersection. Each wave includes 1,500+ respondents with complete SPSS files and codebooks available through ARDA, offering rich opportunities for hypothesis testing and multivariate analysis.

**PRRI's American Values Atlas** aggregates 500,000+ interviews from 2014-2023, providing county-level religious composition estimates through small-area modeling. Montgomery County, Maryland ranks as America's most religiously diverse county (diversity index: 0.886), offering compelling local analysis opportunities.

## Digital engagement and event data

The **YouTube Data API** offers robust metrics for analyzing religious content engagement, with 10,000 free daily quota units. Students can track view counts, subscriber growth, and engagement metrics for religious channels using the `tuber` R package. This contemporary data source resonates with students while teaching API authentication and rate limiting.

**Google Places API** provides comprehensive religious venue data including churches, mosques, synagogues, and temples. The API returns structured JSON with names, addresses, hours, and ratings, though it requires API key management and demonstrates real-world authentication workflows.

The discontinuation of Facebook Events API in 2023 presents a teachable moment about API deprecation and data source reliability. **VolunteerMatch API** (now Idealist) offers alternative event data through GraphQL queries, introducing students to modern API architectures while tracking faith-based volunteer opportunities.

## Demographic patterns through census integration

The **tidycensus** R package revolutionizes religious demographic analysis by providing seamless access to American Community Survey data. While the Census doesn't directly ask about religion, proxy variables offer insights: Arabic speakers (Muslim communities), Hebrew speakers (Jewish communities), and ancestry variables indicating religious heritage. Maryland county-level data downloads directly into R-ready dataframes with built-in geography for mapping.

**PRRI's 2023 Census of American Religion** provides the most detailed county-level religious demographics, showing Montgomery County's remarkable diversity: 9.3% Jewish, 3.2% Muslim, 2.7% Buddhist, 2.7% Hindu, alongside traditional Christian denominations. The methodology combining 40,000 annual interviews with Bayesian modeling offers advanced statistical learning opportunities.

The **Association of Religion Data Archives** provides 1,375+ datasets including county-level adherence rates for Maryland from 1980-2020, enabling longitudinal demographic analysis. Their free download portal offers multiple formats with consistent geographic identifiers (FIPS codes) for easy dataset joining.

## Geographic visualization through open data

**OpenStreetMap via Overpass API** provides the most accessible geographic data with 1.2+ million global places of worship already geocoded. The Overpass Turbo interface enables visual query building while teaching spatial data concepts. Direct CSV exports with coordinates eliminate geocoding requirements, and the `osmdata` R package provides programmatic access.

For Maryland-specific mapping, **Baltimore County's Houses of Worship GIS layer** offers official 2018 data as a shapefile with pre-geocoded locations. This government-validated dataset provides high accuracy for local analysis while teaching `sf` package fundamentals for spatial data manipulation.

The **IRS Exempt Organizations Business Master File** contains addresses for all religious 501(c)(3) organizations, though it requires geocoding using the `tidygeocoder` package. This two-step process—data acquisition then geocoding—mirrors real-world workflows while teaching multiple R packages.

## Pedagogical implementation strategies

These datasets support scaffolded learning approaches. Begin with **ProPublica's Nonprofit Explorer API** using the `RPublica` package for structured API practice. Progress to **tidycensus** for demographic analysis with built-in R integration. Advance to **OpenStreetMap** data requiring spatial joins and coordinate system transformations. Culminate with multi-source integration projects combining financial, demographic, and geographic data.

For **Maryland-focused projects**, combine Baltimore County's official worship site data with PRRI's county-level religious diversity metrics and IRS financial filings. This local relevance increases student engagement while demonstrating real-world data triangulation techniques.

**Data quality lessons** emerge naturally from these sources. IRS data lags 12-18 months, teaching temporal limitations. OpenStreetMap's volunteer-maintained data varies by region, demonstrating crowdsourced data challenges. Denomination-specific transparency differences reveal reporting bias issues.

Consider **ethical implications** throughout. Religious data analysis risks reinforcing stereotypes or enabling discrimination. Emphasize aggregate analysis over individual-level identification. Discuss privacy implications of combining public datasets. These conversations prepare students for responsible data journalism practice.

## Technical implementation guidance

Essential **R packages** include: `tidyverse` for data manipulation, `tidycensus` for demographic data, `sf` for spatial analysis, `haven` for SPSS/Stata imports, `httr` and `jsonlite` for API access, `rvest` for web scraping, and `leaflet` for interactive mapping. The `survey` and `srvyr` packages handle complex survey weights properly.

**Data format considerations** vary by source. Government data often arrives as CSV or Excel files requiring minimal processing. Academic surveys provide SPSS files needing `haven::read_sav()`. APIs return JSON requiring parsing with `jsonlite`. Spatial data comes as shapefiles or GeoJSON working with `sf::st_read()`.

**Rate limiting and authentication** provide real-world constraints. Google Places API requires key management and billing awareness. YouTube API's 10,000-unit daily quota teaches resource planning. IRS bulk downloads avoid rate limits but require local storage management. These limitations mirror professional data journalism challenges.

## Maryland-specific opportunities

Montgomery County's distinction as America's most religiously diverse county creates compelling local stories. Students can analyze the correlation between religious diversity and economic indicators, educational attainment, or political participation using combined datasets.

Baltimore's religious landscape offers urban-rural contrasts. Compare downtown Baltimore's historic churches with suburban megachurches using attendance data, financial filings, and YouTube engagement metrics. Track gentrification impacts on religious institutions using longitudinal census and property data.

The Archdiocese of Baltimore, America's oldest diocese, provides historical depth. Combine archival church records from Maryland State Archives with contemporary IRS filings to trace institutional evolution. This temporal analysis demonstrates data journalism's capacity for historical investigation.

These comprehensive data sources, from structured APIs to complex survey microdata, provide robust materials for teaching contemporary data journalism skills while exploring religious life in Maryland and beyond. The variety of formats, access methods, and analytical approaches ensures students develop versatile competencies applicable across journalistic domains.