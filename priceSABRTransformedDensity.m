function p = priceSABRTransformedDensity(isCall, strike, alpha, beta, nu, rho, forward, T, P, PL,PR, zmin, zmax, h) 
    ystrike = (strike^(1-beta)-forward^(1-beta))/(1-beta);
    zstrike = -1/nu*log((sqrt(1-rho^2+(rho+nu*ystrike/alpha)^2)-rho-nu*ystrike/alpha)/(1-rho));
  if (isCall)
    if (zstrike < zmin)
      p = forward-strike;
    else 
      if (zstrike > zmax)
        p = 0
      else
        k0 = ceil((zstrike-zmin)/h);
        ztilde = zmin+k0*h;
        ftilde = makeForward(alpha, beta, nu, rho, forward, ztilde);
        Fmax = makeForward(alpha, beta, nu, rho, forward, zmax);
        term = ftilde-strike;
        p = 0.5 * term * term *P(k0+1) + (Fmax - strike) * PR;
        k=k0+1:length(P)-2;
        zm = zmin + (k-0.5)*h;        
        Fm = makeForward(alpha, beta, nu, rho, forward, zm);     
        p = p + (Fm - strike) * h * P(k+1);
      end
    end
  else
    if (zstrike < zmin)
      p = 0;
    else
      if (zstrike > zmax)
        p = strike - forward;
      else
        k0 = ceil((zstrike-zmin)/h);
        Fmin = makeForward(alpha, beta, nu, rho, forward, zmin);
        ztilde = zmin+(k0)*h;
        ftilde = makeForward(alpha, beta, nu, rho, forward, ztilde);
        term = strike-ftilde;
        p = 0.5 * term * term * P(k0+1) + (strike-Fmin) * PL;
        k= 1:k0-1;
        zm = zmin + (k - 0.5) * h;
        Fm = makeForward(alpha, beta, nu, rho, forward, zm);
        p = p + (strike-Fm) * h * P(k+1);
      end
    end
  end
end
function F = makeForward(alpha, beta, nu, rho, forward, z) 
  y = alpha/nu*(sinh(nu*z)+rho*(cosh(nu*z)-1));
  F = (forward^(1-beta)+(1-beta)*y).^(1/(1-beta));
end
%{
forward = 1.0; T = 1.0;
alpha = 0.35; beta = 0.25; nu = 1.0; rho = -0.1;
N = 500; timesteps = 5; ieee(1);
[P, PL, PR, z, zmin, zmax, h] = makeTransformedDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, 5);
p = priceSABRTransformedDensity(1, forward, alpha, beta, nu, rho, forward, T, P, PL, PR, zmin, zmax, h)
plot(F,P)
t=cputime;[P, PL, PR, F, Fmin, Fmax, h] = makeDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, 0, 5);p = priceSABRDensity(1, forward, P, PL, PR, Fmin, Fmax, h);t=cputime()-t;
%}