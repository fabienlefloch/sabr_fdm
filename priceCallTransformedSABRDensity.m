function p = priceCallTransformedSABRDensity(strike, alpha, beta, nu, rho, forward, T, P, PL,PR, zmin, zmax, h) 
  ystrike = (strike^(1-beta)-forward^(1-beta))/(1-beta);
  zstrike = -1/nu*log((sqrt(1-rho^2+(rho+nu*ystrike/alpha)^2)-rho-nu*ystrike/alpha)/(1-rho));
  if (zstrike < zmin)
    p = forward-strike;
  else 
    if (zstrike > zmax)
      p = 0;
    else
      Fmax = makeForward(alpha, beta, nu, rho, forward, zmax);
      p = (Fmax - strike) * PR;
      k0 = ceil((zstrike-zmin)/h);
      ztilde = zmin + k0*h;
      ftilde = makeForward(alpha, beta, nu, rho, forward, ztilde);
      term = ftilde - strike;
      if (term > 1e-5)
        zm = zmin + (k0-0.5) * h;
        Fm = makeForward(alpha, beta, nu, rho, forward, zm); 
        dFdz = (ftilde-Fm) / (ztilde - zm);
        p = p + 0.5 * term * term * P(k0+1)/dFdz;
      end
      k = k0+1:length(P)-2;
      zm = zmin + (k-0.5) * h;        
      Fm = makeForward(alpha, beta, nu, rho, forward, zm);     
      p = p + (Fm - strike) * h * P(k+1);
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
N = 500; timesteps = 5; ieee(1); format long;
[P, PL, PR, zm, zmin, zmax, h] = makeTransformedSABRDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, 4);
p = priceCallTransformedSABRDensity(forward, alpha, beta, nu, rho, forward, T, P, PL, PR, zmin, zmax, h)
plot(F,Q)
%}
