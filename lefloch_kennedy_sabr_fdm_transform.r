M<-read.table('/home/fabien/mypapers/sabr_fdm/fz.txt', header=TRUE)
qplot(z, F, data=M,  ylab="F(z)")
ggsave(file="/home/fabien/mypapers/sabr_fdm/fz.eps",width=4,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_hagan_500_theta.txt', header=TRUE)

qplot(TimeSteps, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab=expression(paste(theta," Max Error")), xlab="Number of time steps")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_theta_hagan_500_steps.eps",width=6,height=4)

qplot(Time, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab=expression(paste(theta," Max Error")), xlab="time")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_theta_hagan_500_time.eps",width=6,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_ah_500_theta.txt', header=TRUE)

qplot(TimeSteps, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab=expression(paste(theta," Max Error")), xlab="Number of time steps")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_theta_ah_500_steps.eps",width=6,height=4)

qplot(Time, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab=expression(paste(theta," Max Error")), xlab="time")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_theta_ah_500_time.eps",width=6,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_vol_ah_500_theta.txt', header=TRUE)

qplot(TimeSteps, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Implied Volatility Max Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_vol_theta_ah_500_steps.eps",width=6,height=4)

qplot(Time, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Implied Volatility Max Error", xlab="time")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_vol_theta_ah_500_time.eps",width=6,height=4)
###
M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_theta_500_80.txt', header=TRUE)
M0 = M[M$Scheme == "Hagan" | M$Scheme =="CN" ,]
qplot(Strike, Density, data=M0, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")+scale_color_manual(name="Method",values=c(2,1),labels=c("Hagan Formula","Crank-Nicolson"))+scale_linetype_manual(name="Method", values=c(2,1),labels=c("Hagan Formula","Crank-Nicolson"))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0.02,3),ylim=c(-0.5,1.5))


M<-read.table('/home/fabien/mypapers/sabr_fdm/density_hagan_theta_500_5.txt', header=TRUE)
M0 = M[M$Scheme == "Hagan" | M$Scheme =="CN" ,]
qplot(Strike, Density, data=M0, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")+scale_color_manual(name="Method",values=c(2,1),labels=c("Hagan Formula","Rannacher"))+scale_linetype_manual(name="Method", values=c(2,1),labels=c("Hagan Formula","Rannacher"))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0.02,3),ylim=c(-0.5,1.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_theta_cn_500_5.eps",width=5,height=4)
qplot(Strike, Density, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")
M0 = M[M$Scheme == "Hagan" | M$Scheme =="RAN" ,]
qplot(Strike, Density, data=M0, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")+scale_color_manual(name="Method",values=c(2,1),labels=c("Hagan Formula","Rannacher"))+scale_linetype_manual(name="Method", values=c(2,1),labels=c("Hagan Formula","Rannacher"))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0.02,3),ylim=c(-0.5,1.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_theta_ran_500_5.eps",width=5,height=4)
M0 = M[M$Scheme == "Hagan" | M$Scheme =="TRBDF2",]
qplot(Strike, Density, data=M0, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")+scale_color_manual(name="Method",values=c(2,1),labels=c("Hagan Formula","TR-BDF2"))+scale_linetype_manual(name="Method", values=c(2,1),labels=c("Hagan Formula","TR-BDF2"))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0.02,3),ylim=c(-0.5,1.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_theta_trbdf2_500_5.eps",width=5,height=4)
M0 = M[M$Scheme == "Hagan" | M$Scheme =="LMG3",]
qplot(Strike, Density, data=M0, color=Scheme, linetype=Scheme, geom="line", ylab="probability density")+scale_color_manual(name="Method",values=c(2,1),labels=c("Hagan Formula","LMG3"))+scale_linetype_manual(name="Method", values=c(2,1),labels=c("Hagan Formula","LMG3"))+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))+coord_cartesian(xlim=c(0.02,3),ylim=c(-0.5,1.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/density_hagan_theta_lmg3_500_5.eps",width=5,height=4)

###
M<-read.table('/home/fabien/mypapers/sabr_fdm/theta_hagan_cn_500_320.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab=expression(theta))+coord_cartesian(xlim=c(0.975,1.025))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/theta_hagan_cn_500_320.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/theta_hagan_cn_500_10240.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab=expression(theta))+coord_cartesian(xlim=c(0.975,1.025))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/theta_hagan_cn_500_10240.eps",width=5,height=4)

###
# CN 5
M<-read.table('/home/fabien/mypapers/sabr_fdm/theta_hagan_cn_500_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab=expression(theta))+coord_cartesian(xlim=c(0.975,1.025))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/theta_hagan_cn_500_5.eps",width=5,height=4)

# LS
M<-read.table('/home/fabien/mypapers/sabr_fdm/theta_hagan_ls_500_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab=expression(theta))+coord_cartesian(xlim=c(0.975,1.025))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/theta_hagan_ls_500_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/theta_hagan_lmg2_500_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab=expression(theta))+coord_cartesian(xlim=c(0.975,1.025))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/theta_hagan_lmg2_500_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/theta_hagan_lmg3_500_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab=expression(theta))+coord_cartesian(xlim=c(0.975,1.025))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/theta_hagan_lmg3_500_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/theta_hagan_ran_500_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab=expression(theta))+coord_cartesian(xlim=c(0.975,1.025))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/theta_hagan_ran_500_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/theta_hagan_trbdf2_500_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab=expression(theta))+coord_cartesian(xlim=c(0.975,1.025))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/theta_hagan_trbdf2_500_5.eps",width=5,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/theta_hagan_trbdf3_500_5.txt', header=TRUE)
qplot(F, Q, data=M, color=factor(round(1.0-t,digits=4)), linetype=factor(round(1.0-t,digits=4)), geom="line", ylab=expression(theta))+coord_cartesian(xlim=c(0.975,1.025))+scale_color_discrete(name="t")+scale_linetype_discrete(name="t")+opts(legend.direction = "vertical", legend.position = c(0.75,0.75))
ggsave(file="/home/fabien/mypapers/sabr_fdm/theta_hagan_trbdf3_500_5.eps",width=5,height=4)
