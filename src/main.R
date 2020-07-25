library(incidence)
library(readxl)
library(EpiEstim)

covid <- read_excel("covid.xlsx")
View(covid)
names(covid)

covid$Data <- as.Date(covid$Data)
plot(as.incidence(covid$Inc_VSA, dates = covid$Data))

res_parametric_si <- estimate_R(covid$Inc_VSA, 
                                method="parametric_si",
                                config = make_config(list(
                                        mean_si = 7, 
                                        std_si = 2.5))
)
head(res_parametric_si$R)
plot(res_parametric_si, legend = FALSE)
