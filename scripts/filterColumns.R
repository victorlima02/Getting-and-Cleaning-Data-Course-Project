basicInformationColumns <- seq(c("Subject", "Activity", "Group"))
meanOrSdtColumns <- grep("mean\\(\\)|std\\(\\)", names(dta))

remainingColumns <- c(basicInformationColumns,meanOrSdtColumns )
dta <- dta[, remainingColumns]