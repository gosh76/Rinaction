mydata=women
(cvfit1=DAAG::CVlm(data=mydata,form.lm = lm(weight~height,data=mydata),m=3,plotit = "Observed"))
