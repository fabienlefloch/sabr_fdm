# Hagan CN oscillations

#--density 500 
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_500_40.txt', header=TRUE)
qplot(Strike, Density, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")
M0 = M[M$Scheme == "Hagan" | M$Scheme =="CN",]
qplot(Strike, Density, data=M0, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")+scale_color_manual(name="Method",values=c(1,2),labels=c("Hagan PDE", "Hagan Formula"))+scale_linetype_manual(name="Method", values=c(1,2),labels=c("Hagan PDE", "Hagan Formula"))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0.02,3))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_40.eps",width=8,height=4)
M0 = M[M$Scheme == "Hagan" | M$Scheme =="RAN",]
qplot(Strike, Density, data=M0, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")+scale_color_manual(name="Method",values=c(1,2),labels=c("Hagan PDE", "Hagan Formula"))+scale_linetype_manual(name="Method", values=c(1,2),labels=c("Hagan PDE", "Hagan Formula"))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0.02,3))



M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_500_5.txt', header=TRUE)
qplot(Strike, Density, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")
M0 = M[M$Scheme == "Hagan" | M$Scheme =="RAN" ,]
qplot(Strike, Density, data=M0, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")+scale_color_manual(name="Method",values=c(2,1),labels=c("Hagan Formula","Rannacher"))+scale_linetype_manual(name="Method", values=c(2,1),labels=c("Hagan Formula","Rannacher"))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0.02,3))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_ran_500_5.eps",width=5,height=4)
M0 = M[M$Scheme == "Hagan" | M$Scheme =="TRBDF2",]
qplot(Strike, Density, data=M0, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")+scale_color_manual(name="Method",values=c(2,1),labels=c("Hagan Formula","TR-BDF2"))+scale_linetype_manual(name="Method", values=c(2,1),labels=c("Hagan Formula","TR-BDF2"))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0.02,3))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_5.eps",width=5,height=4)
M0 = M[M$Scheme == "Hagan" | M$Scheme =="LMG3",]
qplot(Strike, Density, data=M0, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")+scale_color_manual(name="Method",values=c(2,1),labels=c("Hagan Formula","LMG3"))+scale_linetype_manual(name="Method", values=c(2,1),labels=c("Hagan Formula","LMG3"))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0.02,3))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_lmg3_500_5.eps",width=5,height=4)

# ---- 500  ----
#M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_40.txt', header=TRUE)
#qplot(Strike, Hagan, data=M, color="Hagan Formula", linetype="Hagan Formula", geom="line", ylab="probability density")+geom_line(aes(x=Strike,y=HaganPDE,color="Hagan PDE", linetype="Hagan PDE"))+scale_color_manual(name="Method",values=c(2,1))+scale_linetype_manual(name="Method", values=c(2,1))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0,3))
#ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_40.eps",width=5,height=4)


M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_40_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_40_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_1280_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_1280_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_640_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_640_5.eps",width=5,height=4)+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))

# CN 5
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_5_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cn_500_5_5.eps",width=5,height=4)

# LS
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_ls_500_5_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_ls_500_5_5.eps",width=5,height=4)

# LMG3
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_lm3_500_5_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_lmg3_500_5_5.eps",width=5,height=4)

# RAN
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_ran_500_5_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_ran_500_5_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_ran_500_5.txt', header=TRUE)
qplot(Strike, Hagan, data=M, color="Hagan Formula", linetype="Hagan Formula", geom="line", ylab="probability density")+geom_line(aes(x=Strike,y=HaganPDE,color="Rannacher", linetype="Rannacher"))+scale_color_manual(name="Method",values=c(2,1))+scale_linetype_manual(name="Method", values=c(2,1))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0,3))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_ran_500_5.eps",width=5,height=4)


# TRBDF2
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_10_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_10_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_10.txt', header=TRUE)
qplot(Strike, Hagan, data=M, color="Hagan Formula", linetype="Hagan Formula", geom="line", ylab="probability density")+geom_line(aes(x=Strike,y=HaganPDE,color="TR-BDF2", linetype="TR-BDF2"))+scale_color_manual(name="Method",values=c(2,1))+scale_linetype_manual(name="Method", values=c(2,1))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0,3))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_10.eps",width=5,height=4)

# LMG2
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_lmg2_500_10_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_lmg2_500_10_5.eps",width=5,height=4)

# TRBDF2
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_5_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_5_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_10.txt', header=TRUE)
qplot(Strike, Hagan, data=M, color="Hagan Formula", linetype="Hagan Formula", geom="line", ylab="probability density")+geom_line(aes(x=Strike,y=HaganPDE,color="TR-BDF2", linetype="TR-BDF2"))+scale_color_manual(name="Method",values=c(2,1))+scale_linetype_manual(name="Method", values=c(2,1))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0,3))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_10.eps",width=5,height=4)


# TRBDF3
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf3_500_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf3_500_5.eps",width=5,height=4)


# CNS
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cns_500_10_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cns_500_10_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cns_500_10.txt', header=TRUE)
qplot(Strike, Hagan, data=M, color="Hagan Formula", linetype="Hagan Formula", geom="line", ylab="probability density")+geom_line(aes(x=Strike,y=HaganPDE,color="Smooth Crank-Nicolson", linetype="Smooth Crank-Nicolson"))+scale_color_manual(name="Method",values=c(2,1))+scale_linetype_manual(name="Method", values=c(2,1))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0,3))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cns_500_10.eps",width=5,height=4)

# TRBDF2 3
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_3.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_500_3.eps",width=5,height=4)


# TRBDF3 3
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf3_500_3.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf3_500_3.eps",width=5,height=4)

# PERF 500
M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_hagan_500.txt', header=TRUE)
M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_hagan_500_all.txt', header=TRUE)

qplot(TimeSteps, Error, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_hagan_500_steps_all.eps",width=5,height=4)

qplot(Time, Error, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Error", xlab="Time(s)")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_hagan_500_time_all.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_ah_500_all.txt', header=TRUE)

qplot(TimeSteps, Error, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_ah_500_steps_all.eps",width=5,height=4)

qplot(Time, Error, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Error", xlab="Time(s)")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_ah_500_time_all.eps",width=5,height=4)

#perf trbdf23
M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_density_hagan_500_d.txt', header=TRUE)
Md <- M[M$Scheme == "TRBDF2" | M$Scheme=="TRBDF3",]
qplot(TimeSteps, MaxError, data=Md, color=Scheme, linetype=Scheme, geom="line", ylab="Density Max Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_density_hagan_500_steps_d.eps",width=6,height=4)
qplot(Time, MaxError, data=Md, color=Scheme, linetype=Scheme, geom="line", ylab="Density Max Error", xlab="time")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_density_hagan_500_time_d.eps",width=6,height=4)
M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_vol_ah_500_d.txt', header=TRUE)
Md <- M[M$Scheme == "TRBDF2" | M$Scheme=="TRBDF3",]
qplot(TimeSteps, MaxError, data=Md, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Max Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_vol_ah_500_steps_d.eps",width=6,height=4)
qplot(Time, MaxError, data=Md, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Max Error", xlab="time")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_vol_ah_500_time_d.eps",width=6,height=4)

#perf dens all
M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_density_hagan_500_all.txt', header=TRUE)

qplot(TimeSteps, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Density Max Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_density_hagan_500_steps.eps",width=6,height=4)

qplot(Time, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Density Max Error", xlab="time")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_density_hagan_500_time.eps",width=6,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_density_ah_500.txt', header=TRUE)

qplot(TimeSteps, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Density Max Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_density_ah_500_steps.eps",width=6,height=4)

qplot(Time, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Density Max Error", xlab="time")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_density_ah_500_time.eps",width=6,height=4)

#perf vol 500
M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_vol_hagan_500.txt', header=TRUE)

qplot(TimeSteps, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Max Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_vol_hagan_500_steps.eps",width=5,height=4)

qplot(Time, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Max Error", xlab="time")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_vol_hagan_500_time.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_vol_ah_500_d.txt', header=TRUE)

M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_vol_ah_500_full.txt', header=TRUE)

qplot(TimeSteps, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Max Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_vol_ah_500_steps.eps",width=6,height=4)

qplot(Time, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Max Error", xlab="time")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_vol_ah_500_time.eps",width=6,height=4)

#perf 250
M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_hagan_250_all.txt', header=TRUE)

qplot(TimeSteps, Error, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_hagan_250_steps_all.eps",width=5,height=4)

qplot(Time, Error, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Error", xlab="Time(s)")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_hagan_250_time_all.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_ah_200_all.txt', header=TRUE)

qplot(TimeSteps, Error, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_ah_250_steps_all.eps",width=5,height=4)

qplot(Time, Error, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Volatility Error", xlab="Time(s)")+scale_y_log10()+scale_x_log10()
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_ah_250_time_all.eps",width=5,height=4)


# M on 5 steps
M<-read.table('/home/fabien/mypapers/sabr_fdm/densitym_hagan_cn_500_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line")
+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))

M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_ls_500_5_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
qplot(F, M0, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))

# ---- 640  ----
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cn_640_40.txt', header=TRUE)
qplot(Strike, Hagan, data=M, color="Hagan Formula", linetype="Hagan Formula", geom="line", ylab="probability density")+geom_line(aes(x=Strike,y=HaganPDE,color="Hagan PDE", linetype="Hagan PDE"))+scale_color_manual(name="Method",values=c(2,1))+scale_linetype_manual(name="Method", values=c(2,1))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cn_640_40.eps",width=5,height=4)


M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cn_640_40_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cn_640_40_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cn_640_1280_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cn_640_1280_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_cn_640_640_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_cn_640_640_5.eps",width=5,height=4)+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))

# LMG2
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_lmg2_640_10_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_lmg2_640_10_5.eps",width=5,height=4)

# TRBDF2
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_640_10_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab="probability density")+coord_cartesian(xlim=c(0.95,1.05))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_640_10_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_640_10.txt', header=TRUE)
qplot(Strike, Hagan, data=M, color="Hagan Formula", linetype="Hagan Formula", geom="line", ylab="probability density")+geom_line(aes(x=Strike,y=HaganPDE,color="TR-BDF2", linetype="TR-BDF2"))+scale_color_manual(name="Method",values=c(2,1))+scale_linetype_manual(name="Method", values=c(2,1))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_trbdf2_640_10.eps",width=5,height=4)




library(rgl)
plot3d(M$F, M$t, M$Q)
