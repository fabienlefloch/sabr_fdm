function [P,PL,PR, zm, zmin, zmax, h] = makeTransformedDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, nd)
  %init h,F and Q
  zmin = -nd*sqrt(T);
  zmax = -zmin;
  if (beta < 1) 
    ybar = -forward^(1-beta)/(1-beta);
    zbar = -1/nu*log((sqrt(1-rho^2+(rho+nu*ybar/alpha)^2)-rho-nu*ybar/alpha)/(1-rho));
    if (zbar > zmin)
      zmin = zbar;
    end    
  end
  h0 = (zmax-zmin)/(N);  
  j0 = int32((0-zmin)/h0);
  h = (0-zmin)/(double(j0)-0.5);  
  z = (0:(N+1))*h + zmin;
  zm = z - 0.5*h;
  ym = alpha/nu*(sinh(nu*zm)+rho*(cosh(nu*zm)-1));
  Fm = (forward^(1-beta)+(1-beta)*ym).^(1/(1-beta));
  zmax = z(N+2);
  ymax = alpha/nu*(sinh(nu*zmax)+rho*(cosh(nu*zmax)-1));
  Fmax = (forward^(1-beta)+(1-beta)*ymax)^(1/(1-beta));
  ymin = alpha/nu*(sinh(nu*zmin)+rho*(cosh(nu*zmin)-1));
  Fmin = (forward^(1-beta)+(1-beta)*ymin)^(1/(1-beta));
  Fm(1) = 2*Fmin-Fm(2);
  Fm(N+2)= 2*Fmax - Fm(N+1);
  Cm = sqrt(alpha^2+2*rho*alpha*nu*ym+nu^2*ym.^2).*Fm.^(beta);
  Cm(1) = Cm(2);
  Cm(N+2) = Cm(N+1); 
  Gammam = (Fm.^beta-forward^beta)./(Fm-forward); 
  Gammam(j0+1) = beta/forward.^(1-beta);
  expiry = 0.0; %T-currentTime
  dt = T/timesteps;
  PL = 0.0; PR = 0.0;
  P = zeros(N+2,1); P(j0+1,1)=1.0/h;
  %Ptotal = sum(h*P(2:N+1))+PL+PR
  %Ftotal = Fm(2:N+1)*P(2:N+1)*h+Fmin*PL+Fmax*PR
  for t = 1:timesteps
    expiry = expiry + dt;
    Em = exp(rho*nu*alpha*Gammam*expiry);
    Em(1)= Em(2);
    Em(N+2)= Em(N+1);
    [P, PL, PR] = solveStep(Fm, Cm, Em, dt, h, P, PL, PR);
    %Ptotal = sum(h*P(2:N+1))+PL+PR
    %Ftotal = Fm(2:N+1)*P(2:N+1)*h+Fmin*PL+Fmax*PR
  end
end
function [P, PL, PR] = solveStep(Fm, Cm, Em, dt, h, P, PL, PR)
  frac = dt/(2*h); M = length(P);
  B(2:M-1) = 1.0 + frac*(Cm(2:M-1).*Em(2:M-1).*(1./(Fm(3:M)-Fm(2:M-1))+1./(Fm(2:M-1)-Fm(1:M-2))));
  C(2:M-1) = -frac* Cm(3:M).*Em(3:M)./(Fm(3:M)-Fm(2:M-1));
  A(1:M-2) = -frac* Cm(1:M-2).*Em(1:M-2)./(Fm(2:M-1)-Fm(1:M-2));
  B(1) = Cm(1)/(Fm(2)-Fm(1))*Em(1);
  C(1) = Cm(2)/(Fm(2)-Fm(1))*Em(2);
  B(M) = Cm(M)/(Fm(M)-Fm(M-1))*Em(M);
  A(M-1) = Cm(M-1)/(Fm(M)-Fm(M-1))*Em(M-1);  
  tri = diag(sparse(B))+diag(sparse(A),-1)+diag(sparse(C),1);
  P(1) = 0; P(M) = 0;
  P = tri\P;
  PL = PL + dt*Cm(2)/(Fm(2)-Fm(1))*Em(2)*P(2); %why T
  PR = PR + dt*Cm(M-1)/(Fm(M)-Fm(M-1))*Em(M-1)*P(M-1);
end
function F = makeForward(alpha, beta, nu, rho, forward, z) 
  y = alpha/nu*(sinh(nu*z)+rho*(cosh(nu*z)-1));
  F = (forward^(1-beta)+(1-beta)*y).^(1/(1-beta));
end
%{
forward = 1.0; T = 1.0;
alpha = 0.35; beta = 0.25; nu = 1.0; rho = -0.1;
N = 500; timesteps = 5; ieee(1); format long;
[P, PL, PR, zm, zmin, zmax, h] = makeTransformedDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, 3);
p = priceSABRDensity(1, forward, Q, QL, QR, Fmin, Fmax, h)
plot(F,Q)
%}