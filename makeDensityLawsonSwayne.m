function [Q,QL,QR, F, Fmin, Fmax, h] = makeDensityLawsonSwayne(alpha, beta, nu, rho, forward, T, N, timesteps, Fmin, Fmax)
  %init h,F and Q
  h0 = (Fmax-Fmin)/N;
  j0 = (forward-Fmin)/h0;
  h = (forward-Fmin)/(j0-0.5);
  F = Fmin-0.5*h:h:Fmin+(N-1.5)*h;
  Fmax = Fmin + (N-2)*h;
  Q = zeros(N,1); Q(j0+1,1)=1.0/h;
  dt = T/timesteps;
  %Lawson Swayne params
  b = 1 - sqrt(2)/2;
  dt1 = dt*b; dt2 = dt*(1-2*b);
  %compute cache
  forwardonebeta = forward.^(1-beta);
  C0 = forward.^beta;
  f = abs(F);
  C = f.^beta;
  fonebeta = f./C;
  z = (fonebeta - forwardonebeta)/(alpha*(1-beta));
  M = C.*C*0.5*alpha*alpha.*(1+2*rho*nu*z+nu.^2*z.^2);
  gam = (C - C0) ./ (f - forward); gam(j0+1) = beta/forwardonebeta;
  M1cache = exp(rho*nu*alpha*gam*dt1); M2cache = exp(rho*nu*alpha*gam*dt2);
  %solve
  QL = 0.0; QR = 0.0;
  for t = 1:timesteps
    [M, Q1, QL1, QR1] = solveStep(M, M1cache, dt1, h, Q, QL, QR);
    [M, Q2, QL2, QR2] = solveStep(M, M1cache, dt1, h, Q1, QL1, QR1);
    Q=(sqrt(2)+1)*Q2-sqrt(2)*Q1;
    QL=(sqrt(2)+1)*QL2-sqrt(2)*QL1;
    QR=(sqrt(2)+1)*QR2-sqrt(2)*QR1;
    M = M.*M2cache;
  end
end
function [M, Q1, QL1, QR1] = solveStep(M, M1cache, dt1, h, Q, QL, QR)
  M = M .* M1cache;
  frac = dt1/(h.^2); N = length(Q);
  tri = diag(sparse(1+2*frac*M))+diag(sparse(-frac*M(1:N-1)),-1)+diag(sparse(-frac*M(2:N)),1);
%  tri = diag(1+2*frac*M)+diag(-frac*M(1:N-1),-1)+diag(-frac*M(2:N),1);
  tri(1,1:2)= sparse([M(1) M(2)]); tri(N,N-1:N)=sparse([M(end-1) M(end)]);
  Q(1) = 0; Q(N) = 0;
  Q1 = tri\Q;
  %a = [0 -frac*M(1:N-2) M(end-1)];
  %b = [M(1) 1+2*frac*M(2:N-1) M(end)];
  %c = [M(2) -frac*M(3:N) 0];
  %Q1 = TDMAsolver(a,b,c,Q);
  QL1 = QL + dt1/h*(M(2)*Q1(2)-M(1)*Q1(1));
  QR1 = QR - dt1/h*(M(N)*Q1(N)-M(N-1)*Q1(N-1));
end
