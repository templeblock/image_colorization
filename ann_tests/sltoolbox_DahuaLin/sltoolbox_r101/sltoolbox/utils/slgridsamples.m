function X = slgridsamples(varargin)
%SLGRIDSAMPLES Generate the sample vectors on grid points
% 
% $ Syntax $
%   - X = slgridsamples(x1, x2, ..., xd)
%   - X = slgridsamples({x1, x2, ..., xd}) 
%
% $ Description $
%   - X = slgridsamples(x1, x2, ..., xd) generates a d x (n1xn2x...xnd)
%     sample matrix, provided that x1, x2, ... xd are vectors storing the
%     the sampled values along dimensions with lengths n1, n2, ..., nd.
%
%   - X = slgridsamples({x1, x2, ..., xd}) is similar to the previous 
%     syntax, except that the dimension sample value vectors are groupped
%     into a cell array.
%
% $ Remarks $
%   - The orders of the samples are determined in following manner that
%     the indices of the grids are generated by slallcombs.
%   - If input arguments are empty, the resulting X would be empty.
%
% $ History $
%   - Created by Dahua Lin on Dec 28th, 2005
%

%% parse and verify input arguments
if nargin == 0
    X = [];
    return;
end
if iscell(varargin{1})
    vars = varargin{1};
else
    vars = varargin;
end

%% Prepare
d = length(vars);
ns = zeros(1, d);
for i = 1 : d
    ns(i) = length(vars{i});
end
ntotal = prod(ns);
X = zeros(d, ntotal);
if ntotal == 0
    return;
end

%% Genertae
inds = slallcombs(ns);
for i = 1 : d
    X(i, :) = vars{i}(inds(i, :));
end



    

