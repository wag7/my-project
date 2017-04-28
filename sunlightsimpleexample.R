sunlight = read.table("sun.txt", header=T)
par(mar=c(5,6,3,2))
boxplot(sunlight$Kdown_direct~sunlight$month,
        ylab="Downwelling Solar\n kj/m2/day",
        xlab="month", col="orange")
View(sunlight)

# total radiation monthly 
sun.mth = aggregate(sunlight, by=list(sunlight$month, sunlight$year), sum)
View(sun.mth)
sun.mth[1:3,]
par(mar=c(5,6,3,2))
boxplot(sun.mth$Kdown_direct~sun.mth$month,
        ylab="Downwelling Solar\n kj/m2/mth",
        xlab="month", col="orange")

View(sun.mth)

# what is the maximum radiation received in any month
result=which.max(sun.mth$Kdown_direct)
sun.mth[result,]

# prettier
sun.mth[result,c("Group.1","Group.2","Kdown_direct")]
# clean up
sun.mth$month=as.integer(sun.mth$Group.1)
sun.mth$year= as.integer(sun.mth$Group.2)
sun.mth[result,c("month","year","Kdown_direct")]