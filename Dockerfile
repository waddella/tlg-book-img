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
  && R -e "remotes::install_github('insightsengineering/random.cdisc.data')" \
  && R -e "remotes::install_github('insightsengineering/nestcolor')" \
  && R -e "remotes::install_github('insightsengineering/tern')"
