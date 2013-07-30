     function [max, idx] = vmax (v)
       idx = 1;
       max = v (idx);
       for i = 2:length (v)
         if (v (i) > max)
           max = v (i);
           idx = i;
         endif
       endfor
     endfunction
     
function [M1, Q1, QL1, QR1] = solveStep(M0, M1cache, dt1, h, Q, QL, QR)
  M1 = M0 .* M1cache;
  frac = dt1/(h^2); N = length(Q);
  tri = diag(1+2*frac*M)+diag(-frac*M1(1:N-1),-1)+diag(-frac*M1(2:N),1);
  tri(1,:) = zeros(1,N); tri(1,1:2)= [M1(1) M1(2)];
  tri(N,:)= zeros(1,N); tri(N,N-1:N)=[M1(end-1) M1(end)];
  Q(1) = 0; Q(N) = 0;
  Q1 = tri\Q;
  QL1 = QL + dt1/h*(M1(2)*Q1(2)-M1(1)*Q1(1));
  QR1 = QR - dt1/h*(M1(N)*Q1(N)-M1(N-1)*Q1(N-1));
endfunction

function [Q,QL,QR, F, Fmin, Fmax, h] = makeDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, Fmin, Fmax)
  %init h,F and Q
  h0 = (Fmax-Fmin)/N
  j0 = (forward-Fmin)/h0
  h = (forward-Fmin)/(j0-0.5)
  F = Fmin-0.5*h:h:Fmin+(N-1.5)*h
  Fmax = Fmin + (N-2)*h
  Q = zeros(N,1); Q(j0+1,1)=1.0/h
  dt = T/timesteps
  %Lawson Swayne params
  b = 1 - sqrt(2)/2
  dt1 = dt*b; dt2 = dt*(1-2*b)
  %compute cache
  forwardonebeta = forward^(1-beta)
  C0 = forward^beta
  f = abs(F)
  C = f^beta
  fonebeta = f./C
  z = (fonebeta - forwardonebeta)/(alpha*(1-beta))
  M = C.*C*0.5*alpha*alpha.*(1+2*rho*nu*z+nu^2*z^2)
  gam = (C - C0) ./ (f - forward); gam(j0+1) = beta/forwardonebeta
  M1cache = exp(rho*nu*alpha*gam*dt1); M2cache = exp(rho*nu*alpha*gam*dt2)
  %solve
  QL = 0.0; QR = 0.0
  for t = 1:timesteps
    [M, Q1, QL1, QR1] = solveStep(M, M1cache, dt1, h, Q, QL, QR)
    [M, Q2, QL2, QR2] = solveStep(M, M1cache, dt1, h, Q1, QL1, QR1)
    Q=(sqrt(2)+1)*Q2-sqrt(2)*Q1
    QL=(sqrt(2)+1)*QL2-sqrt(2)*QL1
    QR=(sqrt(2)+1)*QR2-sqrt(2)*QR1
    M = M.*M2cache
  end
endfunction

function p = price(isCall, strike, Q, QL,QR, Fmin, Fmax, h) 
  if isCall then
    if strike < Fmin then
      p = forward-strike
    else 
      if strike > Fmax then
        p = 0
      else
        k0 = ceil((strike-Fmin)/h)
        term = Fmin+k0*h-strike
        p = 0.5 * term * term * Q(k0+1) + (Fmax - strike) * QR
        k=k0+1:N-2
        p = p + sum((Fmin + (k - 0.5) * h - strike) * h * Q(k+1))
      end
    end
  else
    if strike < Fmin then
      p = 0
    else
      if strike > Fmax then
        p = strike - forward
      else
        k0 = ceil((strike-Fmin)/h)
        term = strike-Fmin-(k0-1)*h
        p = 0.5 * term * term * Q(k0+1) + (strike-Fmin) * QL
        k=1:k0-1
        p = p + sum((strike-Fmin - (k - 0.5) * h ) * h * Q(k+1))
      end
    end
  end
endfunction

%{
forward = 1.0; T = 1.0;
alpha = 0.35; beta = 0.25; nu = 1.0; rho = -0.1;
N = 500; timesteps = 5; ieee(1);
[Q, QL, QR, F, Fmin, Fmax, h] = makeDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, 0, 5);
p = price(%T, forward, Q, QL, QR, Fmin, Fmax, h)
plot(F,Q)
timer();[Q, QL, QR, F, Fmin, Fmax, h] = makeDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, 0, 5);p = price(%T, forward, Q, QL, QR, Fmin, Fmax, h);timer()
%}