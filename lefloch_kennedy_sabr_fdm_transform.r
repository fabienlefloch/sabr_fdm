M<-read.table('/home/fabien/mypapers/sabr_fdm/fz.txt', header=TRUE)
qplot(z, F, data=M,  ylab="F(z)")
ggsave(file="/home/fabien/mypapers/sabr_fdm/fz.eps",width=4,height=4)

M<-read.table('/home/fabien/mypapers/sabr_fdm/perf_hagan_500_theta.txt', header=TRUE)

qplot(TimeSteps, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab=expression(theta)+" Max Error", xlab="Number of time steps")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_theta_hagan_500_steps.eps",width=6,height=4)

qplot(Time, MaxError, data=M, color=Scheme, linetype=Scheme, geom="line", ylab="Density Max Error", xlab="time")+scale_y_log10()+scale_x_log10()+opts(legend.direction = "vertical", legend.position = c(0.75,0.5))
ggsave(file="/home/fabien/mypapers/sabr_fdm/perf_theta_hagan_500_time.eps",width=6,height=4)
