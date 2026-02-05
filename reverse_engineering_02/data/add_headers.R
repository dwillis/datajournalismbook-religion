# This script adds column headers to the FiveThirtyEight CSV
# and creates additional data files for the assignment.
# Run this once to prepare the data directory.

library(tidyverse)

# Column names from the original Python script
religions <- c("Buddhist", "Catholic", "Evangelical Protestant",
               "Hindu", "Historically Black Protestant",
               "Jehovahs Witness", "Jewish", "Mainline Protestant",
               "Mormon", "Muslim", "Orthodox Christian", "Unaffiliated")

# Read the simulation output (101 rows: year 0 through year 100)
simulation <- read_csv("data/current.csv", col_names = religions)
simulation <- simulation |>
  mutate(year = row_number() - 1, .before = 1)

write_csv(simulation, "data/simulation_results.csv")

# Create the transition matrix as a CSV
# Each row = raised-in religion, each column = current religion
# Values are probabilities (row sums to 1.0)
trans_matrix <- tribble(
  ~raised_in, ~Buddhist, ~Catholic, ~`Evangelical Protestant`, ~Hindu, ~`Historically Black Protestant`, ~`Jehovahs Witness`, ~Jewish, ~`Mainline Protestant`, ~Mormon, ~Muslim, ~`Orthodox Christian`, ~Unaffiliated,
  "Buddhist",            0.390296314, 0.027141947, 0.06791021,  0.001857564, 0,           0,           0.011166082, 0.059762879, 0,           0,           0,           0.396569533,
  "Catholic",            0.005370791, 0.593173325, 0.103151608, 0.000649759, 0.010486747, 0.005563864, 0.002041424, 0.053825329, 0.004760476, 0.001130529, 0.000884429, 0.199488989,
  "Evangelical Protestant", 0.00371836,  0.023900817, 0.650773331, 0.000250102, 0.016774503, 0.003098214, 0.001865491, 0.122807467, 0.004203107, 0.000186572, 0.002123778, 0.151866648,
  "Hindu",               0,           0,           0.0033732,   0.804072618, 0,           0.001511151, 0,           0.01234639,  0,           0.00209748,  0,           0.17659916,
  "Historically Black Protestant", 0.002051357, 0.016851659, 0.09549708,  0,           0.699214315, 0.010620473, 0.000338804, 0.024372871, 0.000637016, 0.009406884, 0.000116843, 0.129892558,
  "Jehovahs Witness",    0,           0.023278276, 0.109573979, 0,           0.077957568, 0.336280578, 0,           0.074844833, 0.007624035, 0,           0,           0.35110361,
  "Jewish",              0.006783201, 0.004082693, 0.014329604, 0,           0,           0.000610585, 0.745731278, 0.009587587, 0,           0,           0.002512334, 0.184058682,
  "Mainline Protestant",  0.005770357, 0.038017215, 0.187857555, 0.000467601, 0.008144075, 0.004763516, 0.003601208, 0.451798506, 0.005753587, 0.000965543, 0.00109818,  0.25750798,
  "Mormon",              0.007263135, 0.01684885,  0.06319935,  0.000248467, 0.0059394,   0,           0.001649896, 0.03464334,  0.642777489, 0.002606278, 0,           0.208904711,
  "Muslim",              0,           0.005890381, 0.023573308, 0,           0.011510643, 0,           0.005518343, 0.014032084, 0,           0.772783807, 0,           0.15424369,
  "Orthodox Christian",  0.004580353, 0.042045841, 0.089264134, 0,           0.00527346,  0,           0,           0.061471387, 0.005979218, 0.009113978, 0.526728084, 0.243246723,
  "Unaffiliated",        0.006438308, 0.044866331, 0.1928814,   0.002035375, 0.04295005,  0.010833621, 0.011541439, 0.09457963,  0.01365141,  0.005884336, 0.002892072, 0.525359211
)

write_csv(trans_matrix, "data/transition_matrix.csv")

# Create the initial distribution
initial <- tibble(
  religion = religions,
  share = c(.007, .208, .254, .007, .065, .008, .019, .147, .016, .009, .005, .228)
)

write_csv(initial, "data/initial_distribution.csv")

# Create fertility rates
fertility <- tibble(
  religion = religions,
  children_per_woman = c(2.1, 2.3, 2.3, 2.1, 2.5, 2.1, 2.0, 1.9, 3.4, 2.8, 2.1, 1.7)
)

write_csv(fertility, "data/fertility_rates.csv")

cat("All data files created in data/\n")
