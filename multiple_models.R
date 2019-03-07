library(tidyverse)
library(modelr)
library(broom)

data = read_csv('baseball.csv', locale = locale(encoding = "CP932"))
data %>% ggplot(aes(x=team, y=salary)) + geom_boxplot()

# create list-column
data.by_team = data %>% group_by(team) %>% nest()
data.by_team$data[[1]]
salary_model = function(df) {
  lm(salary ~ HR, data = df)
}
data.by_team = data.by_team %>% mutate(model = map(data, salary_model))
# data.glance = data.by_team %>% mutate(glance = map(model, broom::glance)) %>% unnest(glance)
data.by_team.model = data.by_team %>% mutate(tidy = map(model, tidy)) %>% unnest(tidy)
data.by_team.model = data.by_team.model %>% select(team, term, estimate) %>% spread(key = term, value = estimate)
data.by_team.model %>% arrange(desc(HR))
