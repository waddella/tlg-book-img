FROM rocker/tidyverse:4.2.1

LABEL author="waddella"

ENV DEBIAN_FRONTEND=noninteractive

RUN install2.r --error \
    -r https://cloud.r-project.org/ \
    --deps TRUE \
    rtables \
    gt \
    Tplyr \
    huxtable \
    flextable \
    bookdown \
    yaml \
    checkmate \
  &&  R -e "remotes::install_github('insightsengineering/random.cdisc.data', repos = c('CRAN' = 'https://cloud.r-project.org/')))" \
  && R -e "remotes::install_github('insightsengineering/nestcolor', repos = c('CRAN' = 'https://cloud.r-project.org/')))" \
  && R -e "remotes::install_github('insightsengineering/tern', repos = c('CRAN' = 'https://cloud.r-project.org/'))"
