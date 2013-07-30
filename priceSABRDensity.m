function p = priceSABRDensity(isCall, strike, Q, QL,QR, Fmin, Fmax, h) 
  if (isCall)
    if (strike < Fmin)
      p = forward-strike;
    else 
      if (strike > Fmax)
        p = 0
      else
        k0 = ceil((strike-Fmin)/h);
        term = Fmin+k0*h-strike;
        p = 0.5 * term * term * Q(k0+1) + (Fmax - strike) * QR;
        k=k0+1:length(Q)-2;
        p = p + sum((Fmin + (k - 0.5) * h - strike) * h .* Q(k+1));
      end
    end
  else
    if (strike < Fmin)
      p = 0;
    else
      if (strike > Fmax)
        p = strike - forward;
      else
        k0 = ceil((strike-Fmin)/h);
        term = strike-Fmin-(k0-1)*h;
        p = 0.5 * term * term * Q(k0+1) + (strike-Fmin) * QL;
        k=1:k0-1;
        p = p + sum((strike-Fmin - (k - 0.5) * h ) * h .* Q(k+1));
      end
    end
  end
end

%{
forward = 1.0; T = 1.0;
alpha = 0.35; beta = 0.25; nu = 1.0; rho = -0.1;
N = 500; timesteps = 5; ieee(1);
[Q, QL, QR, F, Fmin, Fmax, h] = makeDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, 0, 5);
p = priceSABRDensity(1, forward, Q, QL, QR, Fmin, Fmax, h)
plot(F,Q)
t=cputime;[Q, QL, QR, F, Fmin, Fmax, h] = makeDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, 0, 5);p = priceSABRDensity(1, forward, Q, QL, QR, Fmin, Fmax, h);t=cputime()-t;
%}