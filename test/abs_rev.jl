#=
 Copyright 2015-2016 Oliver Heimlich

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, see <http://www.gnu.org/licenses/>.
=#
#Language imports

#Test library imports
using Test

#Arithmetic library imports
using IntervalArithmetic

#Preamble
setprecision(53)
setprecision(Interval, Float64)
# setrounding(Interval, :correct)
@format full

@testset "minimal.absRevBin_test" begin
    @test abs_rev(∅, entireinterval(Float64))[2] == ∅
    @test abs_rev(Interval(0.0, 1.0), ∅)[2] == ∅
    @test abs_rev(Interval(0.0, 1.0), Interval(7.0, 9.0))[2] == ∅
    @test abs_rev(∅, Interval(0.0, 1.0))[2] == ∅
    @test abs_rev(Interval(-2.0, -1.0), entireinterval(Float64))[2] == ∅
    @test abs_rev(Interval(1.0, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
    @test abs_rev(Interval(0.0, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
    @test abs_rev(Interval(-1.0, -1.0), entireinterval(Float64))[2] == ∅
    @test abs_rev(Interval(0x1.fffffffffffffp1023, 0x1.fffffffffffffp1023), entireinterval(Float64))[2] == Interval(-0x1.fffffffffffffp1023, 0x1.fffffffffffffp1023)
    @test abs_rev(Interval(0x1p-1022, 0x1p-1022), entireinterval(Float64))[2] == Interval(-0x1p-1022, 0x1p-1022)
    @test abs_rev(Interval(-0x1p-1022, -0x1p-1022), entireinterval(Float64))[2] == ∅
    @test abs_rev(Interval(-0x1.fffffffffffffp1023, -0x1.fffffffffffffp1023), entireinterval(Float64))[2] == ∅
    @test abs_rev(Interval(1.0, 2.0), entireinterval(Float64))[2] == Interval(-2.0, 2.0)
    @test abs_rev(Interval(1.0, 2.0), Interval(0.0, 2.0))[2] == Interval(1.0, 2.0)
    @test abs_rev(Interval(0.0, 1.0), Interval(-0.5, 2.0))[2] == Interval(-0.5, 1.0)
    @test abs_rev(Interval(-1.0, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
    @test abs_rev(Interval(-1.0, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
    @test abs_rev(Interval(0.0, Inf), entireinterval(Float64))[2] == entireinterval(Float64)
    @test abs_rev(entireinterval(Float64), entireinterval(Float64))[2] == entireinterval(Float64)
    @test abs_rev(Interval(-Inf, 0.0), entireinterval(Float64))[2] == Interval(0.0, 0.0)
    @test abs_rev(Interval(1.0, Inf), Interval(-Inf, 0.0))[2] == Interval(-Inf, -1.0)
    @test abs_rev(Interval(-1.0, Inf), entireinterval(Float64))[2] == entireinterval(Float64)
    @test abs_rev(Interval(-Inf, -1.0), entireinterval(Float64))[2] == ∅
    @test abs_rev(Interval(-Inf, 1.0), entireinterval(Float64))[2] == Interval(-1.0, 1.0)
end
# FactCheck.exitstatus()
