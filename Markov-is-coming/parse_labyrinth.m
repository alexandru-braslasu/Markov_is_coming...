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
## @deftypefn {} {@var{retval} =} parse_labyrinth (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Alexandru Braslasu <Alexandru Braslasu@DESKTOP-ANP6DNN>
## Created: 2023-04-19

function [Labyrinth] = parse_labyrinth (file_path)
  f = fopen(file_path, "r");
  n = 0; m = 0;
  dim = fscanf(f, "%f", [1 1]);
  n = dim(1, 1);
  dim = fscanf(f, "%f", [1 1]);
  m = dim(1, 1);
  Labyrinth = sparse(n, m);
  for i = 1 : n
    for j = 1 : m
      dim = fscanf(f, "%f", [1 1]);
      Labyrinth(i, j) = dim(1, 1);
    endfor
  endfor
endfunction
