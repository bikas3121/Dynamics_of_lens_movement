function [u] = u_opt(A, B, T, t_0,t_i, W, g, x_0, x_1)
% The function u_opt calucates the minimum energy control using the
% expression (7) in the paper. 

% Determine the optimal control
phi = expm(A*(T-t_i));
u_ab_1 = conj(phi*B);

syms s
expr_1 = (expm(A*(T-s))*B)*conj(expm(A*(T-s))*B)';
u_ab_2 =int(expr_1, t_0,T);
u_ab_2 = double(u_ab_2);
u_ab_2 = inv(u_ab_2);

% syms d;
expr_2 = expm(A*(T-s))*W*g;
u_ab_3 = x_1 - expm(A*(T-t_0))*x_0 - int(expr_2, 0, T) ;
u_ab_3 = double(u_ab_3);

% Control opt
u = u_ab_1'*u_ab_2*u_ab_3;
end