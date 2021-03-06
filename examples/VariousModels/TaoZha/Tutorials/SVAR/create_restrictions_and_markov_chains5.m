function [restrictions,markov_chains,switch_prior]=create_restrictions_and_markov_chains5(markov_chains,switch_prior)
% create_restrictions_and_markov_chains5 -- creates restrictions and
% markov chains for the SVAR model in which both coefficients and variance
% for the monetary policy equation are changing with two independent Markov
% processes
%
% Syntax
% -------
% ::
%
%   [lin_restr,nonlin_restr,tpl]=create_restrictions_and_markov_chains5(tpl)
%
% Inputs
% -------
%
% - **markov_chains** [empty|struct]: structure of previously defined
% markov chains
%
% Outputs
% --------
%
% - **lin_restr** [cell]: cell array of restrictions (see below). 
%
% - **nonlin_restr** [cell]: cell array of inequality restrictions 
%
% - **markov_chains** [struct]: modified markov chains
%
% More About
% ------------
%
% - The syntax to construct a restriction
%   --> ai(eqtn)
%   --> ai(eqtn,vbl)
%   --> ai(eqtn,vbl,chain_name,state)
%   --> a(eqtn)
%   --> a(eqtn,vbl)
%   --> a(eqtn,vbl,chain_name,state)
%   - **eqtn** [integer]: integer 
%   - **vbl** [integer|char]: integer or variable name
%   - **i** [integer]: lag
%   - **chain_name** [char]: name of the markov chain
%   - **state** [integer]: state number
%
% - The lag coefficients are labelled a0, a1, a2,...,ak, for a model with k
% lags. Obviously, a0 denotes the contemporaneous coefficients.
%
% - The constant terms labelled c_1_1, c_2_2,...,c_n_n, for a model with n
% endogenous variables.
%
% - The standard deviations labelled s_1_1, s_2_2,...,s_n_n, for a
% model with n endogenous variables.
%
% Examples
% ---------
%
% See also:

if nargin==0||isempty(markov_chains)
    
    markov_chains=struct('name',{},...
        'number_of_states',{},...
        'controlled_parameters',{},...
        'endogenous_probabilities',{},...
        'probability_parameters',{});
    
    switch_prior=struct();
    
end

% The parameter restrictions are identical to those in the model
% with regime switching in the policy coefficients only. Hence the mp_coef
% markov chain will also be common to those two models.
[restrictions,markov_chains,switch_prior]=create_restrictions_and_markov_chains3(markov_chains,switch_prior);

% We add the volatility Markov chain from the model in which only the
% volatility of the monetary policy equation changes. N.B: In the process,
% we want to make sure we do not over-write the restrictions above!
%--------------------------------------------------------------------------
[~,markov_chains,switch_prior]=create_restrictions_and_markov_chains4(markov_chains,switch_prior);

end