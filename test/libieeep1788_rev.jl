#=
 Copyright 2013-2015 Marco Nehmeier (nehmeier@informatik.uni-wuerzburg.de)
 Copyright 2015-2016 Oliver Heimlich

 Original author: Marco Nehmeier (unit tests in libieeep1788,
                  original license: Apache License 2.0)
 Converted into portable ITL format by Oliver Heimlich with minor corrections.

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

@testset "minimal_sqr_rev_test" begin
    @test sqr_rev(∅, -∞..∞)[2] == ∅
    @test sqr_rev(Interval(-10.0, -1.0), -∞..∞)[2] == ∅
    @test sqr_rev(Interval(0.0, Inf), -∞..∞)[2] == entireinterval(Float64)
    @test sqr_rev(Interval(0.0, 1.0), -∞..∞)[2] == Interval(-1.0, 1.0)
    @test sqr_rev(Interval(-0.5, 1.0), -∞..∞)[2] == Interval(-1.0, 1.0)
    @test sqr_rev(Interval(-1000.0, 1.0), -∞..∞)[2] == Interval(-1.0, 1.0)
    @test sqr_rev(Interval(0.0, 25.0), -∞..∞)[2] == Interval(-5.0, 5.0)
    @test sqr_rev(Interval(-1.0, 25.0), -∞..∞)[2] == Interval(-5.0, 5.0)
    @test sqr_rev(Interval(0x1.47ae147ae147bp-7, 0x1.47ae147ae147cp-7), -∞..∞)[2] == Interval(-0x1.999999999999bp-4, 0x1.999999999999bp-4)
    @test sqr_rev(Interval(0.0, 0x1.fffffffffffe1p+1), -∞..∞)[2] == Interval(-0x1.ffffffffffff1p+0, 0x1.ffffffffffff1p+0)
end

@testset "minimal_sqr_rev_bin_test" begin
    @test sqr_rev(∅, Interval(-5.0, 1.0))[2] == ∅
    @test sqr_rev(Interval(-10.0, -1.0), Interval(-5.0, 1.0))[2] == ∅
    @test sqr_rev(Interval(0.0, Inf), Interval(-5.0, 1.0))[2] == Interval(-5.0, 1.0)
    @test sqr_rev(Interval(0.0, 1.0), Interval(-0.1, 1.0))[2] == Interval(-0.1, 1.0)
    @test sqr_rev(Interval(-0.5, 1.0), Interval(-0.1, 1.0))[2] == Interval(-0.1, 1.0)
    @test sqr_rev(Interval(-1000.0, 1.0), Interval(-0.1, 1.0))[2] == Interval(-0.1, 1.0)
    @test sqr_rev(Interval(0.0, 25.0), Interval(-4.1, 6.0))[2] == Interval(-4.1, 5.0)
    @test sqr_rev(Interval(-1.0, 25.0), Interval(-4.1, 7.0))[2] == Interval(-4.1, 5.0)
    @test sqr_rev(Interval(1.0, 25.0), Interval(0.0, 7.0))[2] == Interval(1.0, 5.0)
    @test sqr_rev(Interval(0x1.47ae147ae147bp-7, 0x1.47ae147ae147cp-7), Interval(-0.1, Inf))[2] == Interval(-0.1, 0x1.999999999999bp-4)
    @test sqr_rev(Interval(0.0, 0x1.fffffffffffe1p+1), Interval(-0.1, Inf))[2] == Interval(-0.1, 0x1.ffffffffffff1p+0)
end

@testset "minimal_sqr_rev_dec_test" begin
end

@testset "minimal_sqr_rev_dec_bin_test" begin
end

@testset "minimal_abs_rev_test" begin
    @test abs_rev(∅, -∞..∞)[2] == ∅
    @test abs_rev(Interval(-1.1, -0.4), -∞..∞)[2] == ∅
    @test abs_rev(Interval(0.0, Inf), -∞..∞)[2] == entireinterval(Float64)
    @test abs_rev(Interval(1.1, 2.1), -∞..∞)[2] == Interval(-2.1, 2.1)
    @test abs_rev(Interval(-1.1, 2.0), -∞..∞)[2] == Interval(-2.0, 2.0)
    @test abs_rev(Interval(-1.1, 0.0), -∞..∞)[2] == Interval(0.0, 0.0)
    @test abs_rev(Interval(-1.9, 0.2), -∞..∞)[2] == Interval(-0.2, 0.2)
    @test abs_rev(Interval(0.0, 0.2), -∞..∞)[2] == Interval(-0.2, 0.2)
    @test abs_rev(Interval(-1.5, Inf), -∞..∞)[2] == entireinterval(Float64)
end

@testset "minimal_abs_rev_bin_test" begin
    @test abs_rev(∅, Interval(-1.1, 5.0))[2] == ∅
    @test abs_rev(Interval(-1.1, -0.4), Interval(-1.1, 5.0))[2] == ∅
    @test abs_rev(Interval(0.0, Inf), Interval(-1.1, 5.0))[2] == Interval(-1.1, 5.0)
    @test abs_rev(Interval(1.1, 2.1), Interval(-1.0, 5.0))[2] == Interval(1.1, 2.1)
    @test abs_rev(Interval(-1.1, 2.0), Interval(-1.1, 5.0))[2] == Interval(-1.1, 2.0)
    @test abs_rev(Interval(-1.1, 0.0), Interval(-1.1, 5.0))[2] == Interval(0.0, 0.0)
    @test abs_rev(Interval(-1.9, 0.2), Interval(-1.1, 5.0))[2] == Interval(-0.2, 0.2)
end

@testset "minimal_abs_rev_dec_test" begin
end

@testset "minimal_abs_rev_dec_bin_test" begin
end

@testset "minimal_pown_rev_test" begin

end

@testset "minimal_pown_rev_bin_test" begin

end

@testset "minimal_pown_rev_dec_test" begin

end

@testset "minimal_pown_rev_dec_bin_test" begin

end

@testset "minimal_sin_rev_test" begin
    @test sin_rev(∅, -∞..∞)[2] == ∅
    @test sin_rev(Interval(-2.0, -1.1), -∞..∞)[2] == ∅
    @test sin_rev(Interval(1.1, 2.0), -∞..∞)[2] == ∅
    @test sin_rev(Interval(-1.0, 1.0), -∞..∞)[2] == entireinterval(Float64)
    @test sin_rev(Interval(0.0, 0.0), -∞..∞)[2] == entireinterval(Float64)
    @test sin_rev(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), -∞..∞)[2] == entireinterval(Float64)
end

@testset "minimal_sin_rev_bin_test" begin
    @test sin_rev(∅, Interval(-1.2, 12.1))[2] == ∅
    @test sin_rev(Interval(-2.0, -1.1), Interval(-5.0, 5.0))[2] == ∅
    @test sin_rev(Interval(1.1, 2.0), Interval(-5.0, 5.0))[2] == ∅
    @test sin_rev(Interval(-1.0, 1.0), Interval(-1.2, 12.1))[2] == Interval(-1.2, 12.1)
    @test sin_rev(Interval(0.0, 0.0), Interval(-1.0, 1.0))[2] == Interval(0.0, 0.0)
    @test sin_rev(Interval(-0.0, -0.0), Interval(2.0, 2.5))[2] == ∅
    @test sin_rev(Interval(-0.0, -0.0), Interval(3.0, 3.5))[2] == Interval(0x1.921fb54442d18p+1, 0x1.921fb54442d19p+1)
    @test sin_rev(Interval(0x1.fffffffffffffp-1, 0x1p+0), Interval(1.57, 1.58))[2] == Interval(0x1.921fb50442d18p+0, 0x1.921fb58442d1ap+0)
    @test sin_rev(Interval(0.0, 0x1p+0), Interval(-0.1, 1.58))[2] == Interval(0.0, 1.58)
    @test sin_rev(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), Interval(3.14, 3.15))[2] == Interval(0x1.921fb54442d17p+1, 0x1.921fb54442d19p+1)
    @test sin_rev(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), Interval(3.14, 3.15))[2] == Interval(0x1.921fb54442d18p+1, 0x1.921fb54442d1ap+1)
    @test sin_rev(Interval(-0x1.72cece675d1fdp-52, 0x1.1a62633145c07p-53), Interval(3.14, 3.15))[2] == Interval(0x1.921fb54442d17p+1, 0x1.921fb54442d1ap+1)
    @test sin_rev(Interval(0.0, 1.0), Interval(-0.1, 3.15))[2] == Interval(0.0, 0x1.921fb54442d19p+1)
    @test sin_rev(Interval(0.0, 1.0), Interval(-0.1, 3.15))[2] == Interval(-0.0, 0x1.921fb54442d19p+1)
    @test sin_rev(Interval(-0x1.72cece675d1fdp-52, 1.0), Interval(-0.1, 3.15))[2] == Interval(-0x1.72cece675d1fep-52, 0x1.921fb54442d1ap+1)
    @test sin_rev(Interval(-0x1.72cece675d1fdp-52, 1.0), Interval(0.0, 3.15))[2] == Interval(0.0, 0x1.921fb54442d1ap+1)
    @test sin_rev(Interval(0x1.1a62633145c06p-53, 0x1p+0), Interval(3.14, 3.15))[2] == Interval(3.14, 0x1.921fb54442d19p+1)
    @test sin_rev(Interval(-0x1.72cece675d1fdp-52, 0x1p+0), Interval(1.57, 3.15))[2] == Interval(1.57, 0x1.921fb54442d1ap+1)
    @test sin_rev(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), Interval(-Inf, 3.15))[2] == Interval(-Inf, 0x1.921fb54442d19p+1)
    @test sin_rev(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), Interval(3.14, Inf))[2] == Interval(0x1.921fb54442d18p+1, Inf)
end

@testset "minimal_sin_rev_dec_test" begin
end

@testset "minimal_sin_rev_dec_bin_test" begin
end

@testset "minimal_cos_rev_test" begin
    @test cos_rev(∅, -∞..∞)[2] == ∅
    @test cos_rev(Interval(-2.0, -1.1), -∞..∞)[2] == ∅
    @test cos_rev(Interval(1.1, 2.0), -∞..∞)[2] == ∅
    @test cos_rev(Interval(-1.0, 1.0), -∞..∞)[2] == entireinterval(Float64)
    @test cos_rev(Interval(0.0, 0.0), -∞..∞)[2] == entireinterval(Float64)
    @test cos_rev(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), -∞..∞)[2] == entireinterval(Float64)
end

@testset "minimal_cos_rev_bin_test" begin
    @test cos_rev(∅, Interval(-1.2, 12.1))[2] == ∅
    @test cos_rev(Interval(-2.0, -1.1), Interval(-5.0, 5.0))[2] == ∅
    @test cos_rev(Interval(1.1, 2.0), Interval(-5.0, 5.0))[2] == ∅
    @test cos_rev(Interval(-1.0, 1.0), Interval(-1.2, 12.1))[2] == Interval(-1.2, 12.1)
    @test cos_rev(Interval(1.0, 1.0), Interval(-0.1, 0.1))[2] == Interval(0.0, 0.0)
    @test cos_rev(Interval(-1.0, -1.0), Interval(3.14, 3.15))[2] == Interval(0x1.921fb54442d18p+1, 0x1.921fb54442d1ap+1)
    @test cos_rev(Interval(0x1.1a62633145c06p-54, 0x1.1a62633145c07p-54), Interval(1.57, 1.58))[2] == Interval(0x1.921fb54442d17p+0, 0x1.921fb54442d19p+0)
    @test cos_rev(Interval(-0x1.72cece675d1fdp-53, -0x1.72cece675d1fcp-53), Interval(1.57, 1.58))[2] == Interval(0x1.921fb54442d18p+0, 0x1.921fb54442d1ap+0)
    @test cos_rev(Interval(-0x1.72cece675d1fdp-53, 0x1.1a62633145c07p-54), Interval(1.57, 1.58))[2] == Interval(0x1.921fb54442d17p+0, 0x1.921fb54442d1ap+0)
    @test cos_rev(Interval(0x1.1a62633145c06p-54, 1.0), Interval(-2.0, 2.0))[2] == Interval(-0x1.921fb54442d19p+0, 0x1.921fb54442d19p+0)
    @test cos_rev(Interval(0x1.1a62633145c06p-54, 1.0), Interval(0.0, 2.0))[2] == Interval(0.0, 0x1.921fb54442d19p+0)
    @test cos_rev(Interval(-0x1.72cece675d1fdp-53, 1.0), Interval(-0.1, 1.5708))[2] == Interval(-0.1, 0x1.921fb54442d1ap+0)
    @test cos_rev(Interval(-0x1p+0, -0x1.fffffffffffffp-1), Interval(3.14, 3.15))[2] == Interval(0x1.921fb52442d18p+1, 0x1.921fb56442d1ap+1)
    @test cos_rev(Interval(-0x1p+0, -0x1.fffffffffffffp-1), Interval(-3.15, -3.14))[2] == Interval(-0x1.921fb56442d1ap+1, -0x1.921fb52442d18p+1)
    @test cos_rev(Interval(-0x1p+0, -0x1.fffffffffffffp-1), Interval(9.42, 9.45))[2] == Interval(0x1.2d97c7eb321d2p+3, 0x1.2d97c7fb321d3p+3)
    @test cos_rev(Interval(0x1.87996529f9d92p-1, 1.0), Interval(-1.0, 0.1))[2] == Interval(-0x1.6666666666667p-1, 0.1)
    @test cos_rev(Interval(-0x1.aa22657537205p-2, 0x1.14a280fb5068cp-1), Interval(0.0, 2.1))[2] == Interval(0x1.fffffffffffffp-1, 0x1.0000000000001p+1)
    @test cos_rev(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), Interval(-Inf, 1.58))[2] == Interval(-Inf, 0x1.921fb54442d18p+0)
    @test cos_rev(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), Interval(-Inf, 1.5))[2] == Interval(-Inf, -0x1.921fb54442d17p+0)
    @test cos_rev(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), Interval(-1.58, Inf))[2] == Interval(-0x1.921fb54442d1ap+0, Inf)
    @test cos_rev(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), Interval(-1.5, Inf))[2] == Interval(0x1.921fb54442d19p+0, Inf)
end

@testset "minimal_cos_rev_dec_test" begin
end

@testset "minimal_cos_rev_dec_bin_test" begin
end

@testset "minimal_tan_rev_test" begin
    @test tan_rev(∅, -∞..∞)[2] == ∅
    @test tan_rev(Interval(-1.0, 1.0), -∞..∞)[2] == entireinterval(Float64)
    @test tan_rev(Interval(-156.0, -12.0), -∞..∞)[2] == entireinterval(Float64)
    @test tan_rev(Interval(0.0, 0.0), -∞..∞)[2] == entireinterval(Float64)
    @test tan_rev(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), -∞..∞)[2] == entireinterval(Float64)
end

@testset "minimal_tan_rev_bin_test" begin
    @test tan_rev(∅, Interval(-1.5708, 1.5708))[2] == ∅
    @test tan_rev(entireinterval(Float64), Interval(-1.5708, 1.5708))[2] == Interval(-1.5708, 1.5708)
    @test tan_rev(Interval(0.0, 0.0), Interval(-1.5708, 1.5708))[2] == Interval(0.0, 0.0)
    @test tan_rev(Interval(0x1.d02967c31cdb4p+53, 0x1.d02967c31cdb5p+53), Interval(-1.5708, 1.5708))[2] == Interval(-0x1.921fb54442d1bp+0, 0x1.921fb54442d19p+0)
    @test tan_rev(Interval(-0x1.1a62633145c07p-53, -0x1.1a62633145c06p-53), Interval(3.14, 3.15))[2] == Interval(0x1.921fb54442d17p+1, 0x1.921fb54442d19p+1)
    @test tan_rev(Interval(0x1.72cece675d1fcp-52, 0x1.72cece675d1fdp-52), Interval(-3.15, 3.15))[2] == Interval(-0x1.921fb54442d19p+1, 0x1.921fb54442d1ap+1)
    @test tan_rev(Interval(-0x1.d02967c31p+53, 0x1.d02967c31p+53), Interval(-Inf, 1.5707965))[2] == Interval(-Inf, +0x1.921fb82c2bd7fp0)
    @test tan_rev(Interval(-0x1.d02967c31p+53, 0x1.d02967c31p+53), Interval(-1.5707965, Inf))[2] == Interval(-0x1.921fb82c2bd7fp0, Inf)
    @test tan_rev(Interval(-0x1.d02967c31p+53, 0x1.d02967c31p+53), Interval(-1.5707965, 1.5707965))[2] == Interval(-0x1.921fb82c2bd7fp0, +0x1.921fb82c2bd7fp0)
    @test tan_rev(Interval(-0x1.d02967c31cdb5p+53, 0x1.d02967c31cdb5p+53), Interval(-1.5707965, 1.5707965))[2] == Interval(-1.5707965, 1.5707965)
end

@testset "minimal_tan_rev_dec_test" begin
end

@testset "minimal_tan_rev_dec_bin_test" begin
end

@testset "minimal_cosh_rev_test" begin

end

@testset "minimal_cosh_rev_bin_test" begin

end

@testset "minimal_cosh_rev_dec_test" begin

end

@testset "minimal_cosh_rev_dec_bin_test" begin

end
# FactCheck.exitstatus()
