## Copyright (C) 2023 Alexandru Braslasu
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} heuristic_greedy (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-20

function [path] = heuristic_greedy (start_position, probabilities, Adj)
  [n m] = size(Adj);
  path = size(n, 1);
  vf = 1;
  path(vf) = start_position;
  visited = sparse(n);
  for i = 1 : n
    visited(i) = 0;
  endfor
  visited(start_position) = 1;
  while (vf > 0)
    position = path(vf);
    if (position == n - 1)
      break;
    endif
    max_prob = 0;
    for i = 1 : n - 1
      if (Adj(position, i) == 1 && visited(i) == 0 && probabilities(i) > max_prob)
        max_prob = probabilities(i);
        neigh = i;
      endif
    endfor
    if (max_prob != 0)
      visited(neigh) = 1;
      ++vf;
      path(vf) = neigh;
    elseif (max_prob == 0)
      --vf;
    endif
  endwhile
endfunction
