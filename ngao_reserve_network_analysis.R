

library(sf)
library(rgdal)
library(sp)
library(riverdist)

setwd('~/Desktop/Thailand_Shit/')

mae_ngao = st_read('network_preprune_linrefsys_WGS_1984_UTM_Zone_47N_02.shp', bbox = c)
mae_ngao$bbox


mae_ngao_nw = line2network(layer = 'network_preprune_linrefsys_WGS_1984_UTM_Zone_47N_02', tolerance = 1)
reserves = st_read('reserve_pts_WGS_1984_UTM_Zone_47N_02.shp')
cleanup(mae_ngao_nw)

reserve_vert = pointshp2segvert(layer = 'reserve_pts_WGS_1984_UTM_Zone_47N_02', rivers = mae_ngao_nw)
head(reserve_vert)
reserve_dist_matrix = riverdistancemat(reserve_vert$seg, reserve_vert$vert, mae_ngao_nw, stopiferror = FALSE)

hist(reserve_vert$snapdist)


plot(mae_ngao$geometry, col = 'blue')
plot(reserves$geometry, add = TRUE, pch = 19, col = 'red')
