#=
 Copyright 2013 - 2015 Marco Nehmeier (nehmeier@informatik.uni-wuerzburg.de)
 Copyright 2015 Oliver Heimlich (oheim@posteo.de)
 
 Original author: Marco Nehmeier (unit tests in libieeep1788)
 Converted into portable ITL format by Oliver Heimlich with minor corrections.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
     http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
=#
#Language imports



#Preamble
setprecision(53)
setprecision(Interval, Float64)
setrounding(Interval, :tight)

@testset "minimal_sqrRev_test" begin
    @test sqr_rev(∅)[2] == ∅
    @test sqr_rev(Interval(-10.0, -1.0))[2] == ∅
    @test sqr_rev(Interval(0.0, Inf))[2] == entireinterval(Float64)
    @test sqr_rev(Interval(0.0, 1.0))[2] == Interval(-1.0, 1.0)
    @test sqr_rev(Interval(-0.5, 1.0))[2] == Interval(-1.0, 1.0)
    @test sqr_rev(Interval(-1000.0, 1.0))[2] == Interval(-1.0, 1.0)
    @test sqr_rev(Interval(0.0, 25.0))[2] == Interval(-5.0, 5.0)
    @test sqr_rev(Interval(-1.0, 25.0))[2] == Interval(-5.0, 5.0)
    @test sqr_rev(Interval(0x1.47ae147ae147bp-7, 0x1.47ae147ae147cp-7))[2] == Interval(-0x1.999999999999bp-4, 0x1.999999999999bp-4)
    @test sqr_rev(Interval(0.0, 0x1.fffffffffffe1p+1))[2] == Interval(-0x1.ffffffffffff1p+0, 0x1.ffffffffffff1p+0)
end

@testset "minimal_sqrRevBin_test" begin
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

@testset "minimal_sqrRev_dec_test" begin
    @test sqr_rev(DecoratedInterval(∅, trv)) == DecoratedInterval(∅, trv)
    @test decoration(sqr_rev(DecoratedInterval(∅, trv))) == decoration(DecoratedInterval(∅, trv))
    @test sqr_rev(DecoratedInterval(Interval(-10.0, -1.0), com)) == DecoratedInterval(∅, trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(-10.0, -1.0), com))) == decoration(DecoratedInterval(∅, trv))
    @test sqr_rev(DecoratedInterval(Interval(0.0, Inf), dac)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(0.0, Inf), dac))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
    @test sqr_rev(DecoratedInterval(Interval(0.0, 1.0), def)) == DecoratedInterval(Interval(-1.0, 1.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(0.0, 1.0), def))) == decoration(DecoratedInterval(Interval(-1.0, 1.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(-0.5, 1.0), dac)) == DecoratedInterval(Interval(-1.0, 1.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(-0.5, 1.0), dac))) == decoration(DecoratedInterval(Interval(-1.0, 1.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(-1000.0, 1.0), com)) == DecoratedInterval(Interval(-1.0, 1.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(-1000.0, 1.0), com))) == decoration(DecoratedInterval(Interval(-1.0, 1.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(0.0, 25.0), def)) == DecoratedInterval(Interval(-5.0, 5.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(0.0, 25.0), def))) == decoration(DecoratedInterval(Interval(-5.0, 5.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(-1.0, 25.0), dac)) == DecoratedInterval(Interval(-5.0, 5.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(-1.0, 25.0), dac))) == decoration(DecoratedInterval(Interval(-5.0, 5.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(0x1.47ae147ae147bp-7, 0x1.47ae147ae147cp-7), com)) == DecoratedInterval(Interval(-0x1.999999999999bp-4, 0x1.999999999999bp-4), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(0x1.47ae147ae147bp-7, 0x1.47ae147ae147cp-7), com))) == decoration(DecoratedInterval(Interval(-0x1.999999999999bp-4, 0x1.999999999999bp-4), trv))
    @test sqr_rev(DecoratedInterval(Interval(0.0, 0x1.fffffffffffe1p+1), def)) == DecoratedInterval(Interval(-0x1.ffffffffffff1p+0, 0x1.ffffffffffff1p+0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(0.0, 0x1.fffffffffffe1p+1), def))) == decoration(DecoratedInterval(Interval(-0x1.ffffffffffff1p+0, 0x1.ffffffffffff1p+0), trv))
end

@testset "minimal_sqrRev_dec_bin_test" begin
    @test sqr_rev(DecoratedInterval(∅, trv), DecoratedInterval(Interval(-5.0, 1.0), def)) == DecoratedInterval(∅, trv)
    @test decoration(sqr_rev(DecoratedInterval(∅, trv), DecoratedInterval(Interval(-5.0, 1.0), def))) == decoration(DecoratedInterval(∅, trv))
    @test sqr_rev(DecoratedInterval(Interval(-10.0, -1.0), com), DecoratedInterval(Interval(-5.0, 1.0), dac)) == DecoratedInterval(∅, trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(-10.0, -1.0), com), DecoratedInterval(Interval(-5.0, 1.0), dac))) == decoration(DecoratedInterval(∅, trv))
    @test sqr_rev(DecoratedInterval(Interval(0.0, Inf), def), DecoratedInterval(Interval(-5.0, 1.0), dac)) == DecoratedInterval(Interval(-5.0, 1.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(0.0, Inf), def), DecoratedInterval(Interval(-5.0, 1.0), dac))) == decoration(DecoratedInterval(Interval(-5.0, 1.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(0.0, 1.0), dac), DecoratedInterval(Interval(-0.1, 1.0), def)) == DecoratedInterval(Interval(-0.1, 1.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(0.0, 1.0), dac), DecoratedInterval(Interval(-0.1, 1.0), def))) == decoration(DecoratedInterval(Interval(-0.1, 1.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(-0.5, 1.0), def), DecoratedInterval(Interval(-0.1, 1.0), dac)) == DecoratedInterval(Interval(-0.1, 1.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(-0.5, 1.0), def), DecoratedInterval(Interval(-0.1, 1.0), dac))) == decoration(DecoratedInterval(Interval(-0.1, 1.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(-1000.0, 1.0), com), DecoratedInterval(Interval(-0.1, 1.0), def)) == DecoratedInterval(Interval(-0.1, 1.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(-1000.0, 1.0), com), DecoratedInterval(Interval(-0.1, 1.0), def))) == decoration(DecoratedInterval(Interval(-0.1, 1.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(0.0, 25.0), def), DecoratedInterval(Interval(-4.1, 6.0), com)) == DecoratedInterval(Interval(-4.1, 5.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(0.0, 25.0), def), DecoratedInterval(Interval(-4.1, 6.0), com))) == decoration(DecoratedInterval(Interval(-4.1, 5.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(-1.0, 25.0), dac), DecoratedInterval(Interval(-4.1, 7.0), def)) == DecoratedInterval(Interval(-4.1, 5.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(-1.0, 25.0), dac), DecoratedInterval(Interval(-4.1, 7.0), def))) == decoration(DecoratedInterval(Interval(-4.1, 5.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(1.0, 25.0), dac), DecoratedInterval(Interval(0.0, 7.0), def)) == DecoratedInterval(Interval(1.0, 5.0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(1.0, 25.0), dac), DecoratedInterval(Interval(0.0, 7.0), def))) == decoration(DecoratedInterval(Interval(1.0, 5.0), trv))
    @test sqr_rev(DecoratedInterval(Interval(0x1.47ae147ae147bp-7, 0x1.47ae147ae147cp-7), def), DecoratedInterval(Interval(-0.1, Inf), dac)) == DecoratedInterval(Interval(-0.1, 0x1.999999999999bp-4), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(0x1.47ae147ae147bp-7, 0x1.47ae147ae147cp-7), def), DecoratedInterval(Interval(-0.1, Inf), dac))) == decoration(DecoratedInterval(Interval(-0.1, 0x1.999999999999bp-4), trv))
    @test sqr_rev(DecoratedInterval(Interval(0.0, 0x1.fffffffffffe1p+1), dac), DecoratedInterval(Interval(-0.1, Inf), dac)) == DecoratedInterval(Interval(-0.1, 0x1.ffffffffffff1p+0), trv)
    @test decoration(sqr_rev(DecoratedInterval(Interval(0.0, 0x1.fffffffffffe1p+1), dac), DecoratedInterval(Interval(-0.1, Inf), dac))) == decoration(DecoratedInterval(Interval(-0.1, 0x1.ffffffffffff1p+0), trv))
end

@testset "minimal_absRev_test" begin
    @test abs_rev(∅)[2] == ∅
    @test abs_rev(Interval(-1.1, -0.4))[2] == ∅
    @test abs_rev(Interval(0.0, Inf))[2] == entireinterval(Float64)
    @test abs_rev(Interval(1.1, 2.1))[2] == Interval(-2.1, 2.1)
    @test abs_rev(Interval(-1.1, 2.0))[2] == Interval(-2.0, 2.0)
    @test abs_rev(Interval(-1.1, 0.0))[2] == Interval(0.0, 0.0)
    @test abs_rev(Interval(-1.9, 0.2))[2] == Interval(-0.2, 0.2)
    @test abs_rev(Interval(0.0, 0.2))[2] == Interval(-0.2, 0.2)
    @test abs_rev(Interval(-1.5, Inf))[2] == entireinterval(Float64)
end

@testset "minimal_absRevBin_test" begin
    @test abs_rev(∅, Interval(-1.1, 5.0))[2] == ∅
    @test abs_rev(Interval(-1.1, -0.4), Interval(-1.1, 5.0))[2] == ∅
    @test abs_rev(Interval(0.0, Inf), Interval(-1.1, 5.0))[2] == Interval(-1.1, 5.0)
    @test abs_rev(Interval(1.1, 2.1), Interval(-1.0, 5.0))[2] == Interval(1.1, 2.1)
    @test abs_rev(Interval(-1.1, 2.0), Interval(-1.1, 5.0))[2] == Interval(-1.1, 2.0)
    @test abs_rev(Interval(-1.1, 0.0), Interval(-1.1, 5.0))[2] == Interval(0.0, 0.0)
    @test abs_rev(Interval(-1.9, 0.2), Interval(-1.1, 5.0))[2] == Interval(-0.2, 0.2)
end

@testset "minimal_absRev_dec_test" begin
    @test abs_rev(DecoratedInterval(∅, trv)) == DecoratedInterval(∅, trv)
    @test decoration(abs_rev(DecoratedInterval(∅, trv))) == decoration(DecoratedInterval(∅, trv))
    @test abs_rev(DecoratedInterval(Interval(-1.1, -0.4), dac)) == DecoratedInterval(∅, trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(-1.1, -0.4), dac))) == decoration(DecoratedInterval(∅, trv))
    @test abs_rev(DecoratedInterval(Interval(0.0, Inf), dac)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(0.0, Inf), dac))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
    @test abs_rev(DecoratedInterval(Interval(1.1, 2.1), com)) == DecoratedInterval(Interval(-2.1, 2.1), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(1.1, 2.1), com))) == decoration(DecoratedInterval(Interval(-2.1, 2.1), trv))
    @test abs_rev(DecoratedInterval(Interval(-1.1, 2.0), def)) == DecoratedInterval(Interval(-2.0, 2.0), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(-1.1, 2.0), def))) == decoration(DecoratedInterval(Interval(-2.0, 2.0), trv))
    @test abs_rev(DecoratedInterval(Interval(-1.1, 0.0), dac)) == DecoratedInterval(Interval(0.0, 0.0), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(-1.1, 0.0), dac))) == decoration(DecoratedInterval(Interval(0.0, 0.0), trv))
    @test abs_rev(DecoratedInterval(Interval(-1.9, 0.2), com)) == DecoratedInterval(Interval(-0.2, 0.2), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(-1.9, 0.2), com))) == decoration(DecoratedInterval(Interval(-0.2, 0.2), trv))
    @test abs_rev(DecoratedInterval(Interval(0.0, 0.2), def)) == DecoratedInterval(Interval(-0.2, 0.2), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(0.0, 0.2), def))) == decoration(DecoratedInterval(Interval(-0.2, 0.2), trv))
    @test abs_rev(DecoratedInterval(Interval(-1.5, Inf), def)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(-1.5, Inf), def))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
end

@testset "minimal_absRev_dec_bin_test" begin
    @test abs_rev(DecoratedInterval(∅, trv), DecoratedInterval(Interval(-1.1, 5.0), com)) == DecoratedInterval(∅, trv)
    @test decoration(abs_rev(DecoratedInterval(∅, trv), DecoratedInterval(Interval(-1.1, 5.0), com))) == decoration(DecoratedInterval(∅, trv))
    @test abs_rev(DecoratedInterval(Interval(-1.1, -0.4), dac), DecoratedInterval(Interval(-1.1, 5.0), dac)) == DecoratedInterval(∅, trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(-1.1, -0.4), dac), DecoratedInterval(Interval(-1.1, 5.0), dac))) == decoration(DecoratedInterval(∅, trv))
    @test abs_rev(DecoratedInterval(Interval(0.0, Inf), def), DecoratedInterval(Interval(-1.1, 5.0), def)) == DecoratedInterval(Interval(-1.1, 5.0), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(0.0, Inf), def), DecoratedInterval(Interval(-1.1, 5.0), def))) == decoration(DecoratedInterval(Interval(-1.1, 5.0), trv))
    @test abs_rev(DecoratedInterval(Interval(1.1, 2.1), dac), DecoratedInterval(Interval(-1.0, 5.0), def)) == DecoratedInterval(Interval(1.1, 2.1), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(1.1, 2.1), dac), DecoratedInterval(Interval(-1.0, 5.0), def))) == decoration(DecoratedInterval(Interval(1.1, 2.1), trv))
    @test abs_rev(DecoratedInterval(Interval(-1.1, 2.0), com), DecoratedInterval(Interval(-1.1, 5.0), def)) == DecoratedInterval(Interval(-1.1, 2.0), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(-1.1, 2.0), com), DecoratedInterval(Interval(-1.1, 5.0), def))) == decoration(DecoratedInterval(Interval(-1.1, 2.0), trv))
    @test abs_rev(DecoratedInterval(Interval(-1.1, 0.0), def), DecoratedInterval(Interval(-1.1, 5.0), def)) == DecoratedInterval(Interval(0.0, 0.0), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(-1.1, 0.0), def), DecoratedInterval(Interval(-1.1, 5.0), def))) == decoration(DecoratedInterval(Interval(0.0, 0.0), trv))
    @test abs_rev(DecoratedInterval(Interval(-1.9, 0.2), dac), DecoratedInterval(Interval(-1.1, 5.0), def)) == DecoratedInterval(Interval(-0.2, 0.2), trv)
    @test decoration(abs_rev(DecoratedInterval(Interval(-1.9, 0.2), dac), DecoratedInterval(Interval(-1.1, 5.0), def))) == decoration(DecoratedInterval(Interval(-0.2, 0.2), trv))
end

@testset "minimal_pownRev_test" begin
    
end

@testset "minimal_pownRevBin_test" begin
    
end

@testset "minimal_pownRev_dec_test" begin
    
end

@testset "minimal_pownRev_dec_bin_test" begin
    
end

@testset "minimal_sinRev_test" begin
    @test sin_rev(∅)[2] == ∅
    @test sin_rev(Interval(-2.0, -1.1))[2] == ∅
    @test sin_rev(Interval(1.1, 2.0))[2] == ∅
    @test sin_rev(Interval(-1.0, 1.0))[2] == entireinterval(Float64)
    @test sin_rev(Interval(0.0, 0.0))[2] == entireinterval(Float64)
    @test sin_rev(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53))[2] == entireinterval(Float64)
end

@testset "minimal_sinRevBin_test" begin
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

@testset "minimal_sinRev_dec_test" begin
    @test sin_rev(DecoratedInterval(∅, trv)) == DecoratedInterval(∅, trv)
    @test decoration(sin_rev(DecoratedInterval(∅, trv))) == decoration(DecoratedInterval(∅, trv))
    @test sin_rev(DecoratedInterval(Interval(-2.0, -1.1), com)) == DecoratedInterval(∅, trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-2.0, -1.1), com))) == decoration(DecoratedInterval(∅, trv))
    @test sin_rev(DecoratedInterval(Interval(1.1, 2.0), dac)) == DecoratedInterval(∅, trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(1.1, 2.0), dac))) == decoration(DecoratedInterval(∅, trv))
    @test sin_rev(DecoratedInterval(Interval(-1.0, 1.0), com)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-1.0, 1.0), com))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
    @test sin_rev(DecoratedInterval(Interval(0.0, 0.0), dac)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(0.0, 0.0), dac))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
    @test sin_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), def)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), def))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
end

@testset "minimal_sinRev_dec_bin_test" begin
    @test sin_rev(DecoratedInterval(∅, trv), DecoratedInterval(Interval(-1.2, 12.1), com)) == DecoratedInterval(∅, trv)
    @test decoration(sin_rev(DecoratedInterval(∅, trv), DecoratedInterval(Interval(-1.2, 12.1), com))) == decoration(DecoratedInterval(∅, trv))
    @test sin_rev(DecoratedInterval(Interval(-2.0, -1.1), def), DecoratedInterval(Interval(-5.0, 5.0), def)) == DecoratedInterval(∅, trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-2.0, -1.1), def), DecoratedInterval(Interval(-5.0, 5.0), def))) == decoration(DecoratedInterval(∅, trv))
    @test sin_rev(DecoratedInterval(Interval(1.1, 2.0), dac), DecoratedInterval(Interval(-5.0, 5.0), com)) == DecoratedInterval(∅, trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(1.1, 2.0), dac), DecoratedInterval(Interval(-5.0, 5.0), com))) == decoration(DecoratedInterval(∅, trv))
    @test sin_rev(DecoratedInterval(Interval(-1.0, 1.0), com), DecoratedInterval(Interval(-1.2, 12.1), def)) == DecoratedInterval(Interval(-1.2, 12.1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-1.0, 1.0), com), DecoratedInterval(Interval(-1.2, 12.1), def))) == decoration(DecoratedInterval(Interval(-1.2, 12.1), trv))
    @test sin_rev(DecoratedInterval(Interval(0.0, 0.0), dac), DecoratedInterval(Interval(-1.0, 1.0), def)) == DecoratedInterval(Interval(0.0, 0.0), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(0.0, 0.0), dac), DecoratedInterval(Interval(-1.0, 1.0), def))) == decoration(DecoratedInterval(Interval(0.0, 0.0), trv))
    @test sin_rev(DecoratedInterval(Interval(-0.0, -0.0), def), DecoratedInterval(Interval(2.0, 2.5), trv)) == DecoratedInterval(∅, trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-0.0, -0.0), def), DecoratedInterval(Interval(2.0, 2.5), trv))) == decoration(DecoratedInterval(∅, trv))
    @test sin_rev(DecoratedInterval(Interval(-0.0, -0.0), def), DecoratedInterval(Interval(3.0, 3.5), dac)) == DecoratedInterval(Interval(0x1.921fb54442d18p+1, 0x1.921fb54442d19p+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-0.0, -0.0), def), DecoratedInterval(Interval(3.0, 3.5), dac))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d18p+1, 0x1.921fb54442d19p+1), trv))
    @test sin_rev(DecoratedInterval(Interval(0x1.fffffffffffffp-1, 0x1p+0), dac), DecoratedInterval(Interval(1.57, 1.58), dac)) == DecoratedInterval(Interval(0x1.921fb50442d18p+0, 0x1.921fb58442d1ap+0), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(0x1.fffffffffffffp-1, 0x1p+0), dac), DecoratedInterval(Interval(1.57, 1.58), dac))) == decoration(DecoratedInterval(Interval(0x1.921fb50442d18p+0, 0x1.921fb58442d1ap+0), trv))
    @test sin_rev(DecoratedInterval(Interval(0.0, 0x1p+0), com), DecoratedInterval(Interval(-0.1, 1.58), dac)) == DecoratedInterval(Interval(0.0, 1.58), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(0.0, 0x1p+0), com), DecoratedInterval(Interval(-0.1, 1.58), dac))) == decoration(DecoratedInterval(Interval(0.0, 1.58), trv))
    @test sin_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), com), DecoratedInterval(Interval(3.14, 3.15), def)) == DecoratedInterval(Interval(0x1.921fb54442d17p+1, 0x1.921fb54442d19p+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), com), DecoratedInterval(Interval(3.14, 3.15), def))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d17p+1, 0x1.921fb54442d19p+1), trv))
    @test sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), com), DecoratedInterval(Interval(3.14, 3.15), dac)) == DecoratedInterval(Interval(0x1.921fb54442d18p+1, 0x1.921fb54442d1ap+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), com), DecoratedInterval(Interval(3.14, 3.15), dac))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d18p+1, 0x1.921fb54442d1ap+1), trv))
    @test sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, 0x1.1a62633145c07p-53), dac), DecoratedInterval(Interval(3.14, 3.15), com)) == DecoratedInterval(Interval(0x1.921fb54442d17p+1, 0x1.921fb54442d1ap+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, 0x1.1a62633145c07p-53), dac), DecoratedInterval(Interval(3.14, 3.15), com))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d17p+1, 0x1.921fb54442d1ap+1), trv))
    @test sin_rev(DecoratedInterval(Interval(0.0, 1.0), def), DecoratedInterval(Interval(-0.1, 3.15), def)) == DecoratedInterval(Interval(0.0, 0x1.921fb54442d19p+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(0.0, 1.0), def), DecoratedInterval(Interval(-0.1, 3.15), def))) == decoration(DecoratedInterval(Interval(0.0, 0x1.921fb54442d19p+1), trv))
    @test sin_rev(DecoratedInterval(Interval(0.0, 1.0), dac), DecoratedInterval(Interval(-0.1, 3.15), com)) == DecoratedInterval(Interval(-0.0, 0x1.921fb54442d19p+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(0.0, 1.0), dac), DecoratedInterval(Interval(-0.1, 3.15), com))) == decoration(DecoratedInterval(Interval(-0.0, 0x1.921fb54442d19p+1), trv))
    @test sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, 1.0), def), DecoratedInterval(Interval(-0.1, 3.15), def)) == DecoratedInterval(Interval(-0x1.72cece675d1fep-52, 0x1.921fb54442d1ap+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, 1.0), def), DecoratedInterval(Interval(-0.1, 3.15), def))) == decoration(DecoratedInterval(Interval(-0x1.72cece675d1fep-52, 0x1.921fb54442d1ap+1), trv))
    @test sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, 1.0), com), DecoratedInterval(Interval(0.0, 3.15), dac)) == DecoratedInterval(Interval(0.0, 0x1.921fb54442d1ap+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, 1.0), com), DecoratedInterval(Interval(0.0, 3.15), dac))) == decoration(DecoratedInterval(Interval(0.0, 0x1.921fb54442d1ap+1), trv))
    @test sin_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1p+0), def), DecoratedInterval(Interval(3.14, 3.15), com)) == DecoratedInterval(Interval(3.14, 0x1.921fb54442d19p+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1p+0), def), DecoratedInterval(Interval(3.14, 3.15), com))) == decoration(DecoratedInterval(Interval(3.14, 0x1.921fb54442d19p+1), trv))
    @test sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, 0x1p+0), dac), DecoratedInterval(Interval(1.57, 3.15), com)) == DecoratedInterval(Interval(1.57, 0x1.921fb54442d1ap+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, 0x1p+0), dac), DecoratedInterval(Interval(1.57, 3.15), com))) == decoration(DecoratedInterval(Interval(1.57, 0x1.921fb54442d1ap+1), trv))
    @test sin_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), com), DecoratedInterval(Interval(-Inf, 3.15), dac)) == DecoratedInterval(Interval(-Inf, 0x1.921fb54442d19p+1), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), com), DecoratedInterval(Interval(-Inf, 3.15), dac))) == decoration(DecoratedInterval(Interval(-Inf, 0x1.921fb54442d19p+1), trv))
    @test sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), com), DecoratedInterval(Interval(3.14, Inf), dac)) == DecoratedInterval(Interval(0x1.921fb54442d18p+1, Inf), trv)
    @test decoration(sin_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), com), DecoratedInterval(Interval(3.14, Inf), dac))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d18p+1, Inf), trv))
end

@testset "minimal_cosRev_test" begin
    @test cos_rev(∅)[2] == ∅
    @test cos_rev(Interval(-2.0, -1.1))[2] == ∅
    @test cos_rev(Interval(1.1, 2.0))[2] == ∅
    @test cos_rev(Interval(-1.0, 1.0))[2] == entireinterval(Float64)
    @test cos_rev(Interval(0.0, 0.0))[2] == entireinterval(Float64)
    @test cos_rev(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53))[2] == entireinterval(Float64)
end

@testset "minimal_cosRevBin_test" begin
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

@testset "minimal_cosRev_dec_test" begin
    @test cos_rev(DecoratedInterval(∅, trv)) == DecoratedInterval(∅, trv)
    @test decoration(cos_rev(DecoratedInterval(∅, trv))) == decoration(DecoratedInterval(∅, trv))
    @test cos_rev(DecoratedInterval(Interval(-2.0, -1.1), def)) == DecoratedInterval(∅, trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-2.0, -1.1), def))) == decoration(DecoratedInterval(∅, trv))
    @test cos_rev(DecoratedInterval(Interval(1.1, 2.0), dac)) == DecoratedInterval(∅, trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(1.1, 2.0), dac))) == decoration(DecoratedInterval(∅, trv))
    @test cos_rev(DecoratedInterval(Interval(-1.0, 1.0), com)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-1.0, 1.0), com))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
    @test cos_rev(DecoratedInterval(Interval(0.0, 0.0), def)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(0.0, 0.0), def))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
    @test cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), dac)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), dac))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
end

@testset "minimal_cosRev_dec_bin_test" begin
    @test cos_rev(DecoratedInterval(∅, trv), DecoratedInterval(Interval(-1.2, 12.1), def)) == DecoratedInterval(∅, trv)
    @test decoration(cos_rev(DecoratedInterval(∅, trv), DecoratedInterval(Interval(-1.2, 12.1), def))) == decoration(DecoratedInterval(∅, trv))
    @test cos_rev(DecoratedInterval(Interval(-2.0, -1.1), dac), DecoratedInterval(Interval(-5.0, 5.0), com)) == DecoratedInterval(∅, trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-2.0, -1.1), dac), DecoratedInterval(Interval(-5.0, 5.0), com))) == decoration(DecoratedInterval(∅, trv))
    @test cos_rev(DecoratedInterval(Interval(1.1, 2.0), dac), DecoratedInterval(Interval(-5.0, 5.0), com)) == DecoratedInterval(∅, trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(1.1, 2.0), dac), DecoratedInterval(Interval(-5.0, 5.0), com))) == decoration(DecoratedInterval(∅, trv))
    @test cos_rev(DecoratedInterval(Interval(-1.0, 1.0), dac), DecoratedInterval(Interval(-1.2, 12.1), def)) == DecoratedInterval(Interval(-1.2, 12.1), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-1.0, 1.0), dac), DecoratedInterval(Interval(-1.2, 12.1), def))) == decoration(DecoratedInterval(Interval(-1.2, 12.1), trv))
    @test cos_rev(DecoratedInterval(Interval(1.0, 1.0), def), DecoratedInterval(Interval(-0.1, 0.1), dac)) == DecoratedInterval(Interval(0.0, 0.0), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(1.0, 1.0), def), DecoratedInterval(Interval(-0.1, 0.1), dac))) == decoration(DecoratedInterval(Interval(0.0, 0.0), trv))
    @test cos_rev(DecoratedInterval(Interval(-1.0, -1.0), com), DecoratedInterval(Interval(3.14, 3.15), dac)) == DecoratedInterval(Interval(0x1.921fb54442d18p+1, 0x1.921fb54442d1ap+1), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-1.0, -1.0), com), DecoratedInterval(Interval(3.14, 3.15), dac))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d18p+1, 0x1.921fb54442d1ap+1), trv))
    @test cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-54, 0x1.1a62633145c07p-54), def), DecoratedInterval(Interval(1.57, 1.58), def)) == DecoratedInterval(Interval(0x1.921fb54442d17p+0, 0x1.921fb54442d19p+0), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-54, 0x1.1a62633145c07p-54), def), DecoratedInterval(Interval(1.57, 1.58), def))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d17p+0, 0x1.921fb54442d19p+0), trv))
    @test cos_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-53, -0x1.72cece675d1fcp-53), dac), DecoratedInterval(Interval(1.57, 1.58), dac)) == DecoratedInterval(Interval(0x1.921fb54442d18p+0, 0x1.921fb54442d1ap+0), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-53, -0x1.72cece675d1fcp-53), dac), DecoratedInterval(Interval(1.57, 1.58), dac))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d18p+0, 0x1.921fb54442d1ap+0), trv))
    @test cos_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-53, 0x1.1a62633145c07p-54), com), DecoratedInterval(Interval(1.57, 1.58), dac)) == DecoratedInterval(Interval(0x1.921fb54442d17p+0, 0x1.921fb54442d1ap+0), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-53, 0x1.1a62633145c07p-54), com), DecoratedInterval(Interval(1.57, 1.58), dac))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d17p+0, 0x1.921fb54442d1ap+0), trv))
    @test cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-54, 1.0), def), DecoratedInterval(Interval(-2.0, 2.0), com)) == DecoratedInterval(Interval(-0x1.921fb54442d19p+0, 0x1.921fb54442d19p+0), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-54, 1.0), def), DecoratedInterval(Interval(-2.0, 2.0), com))) == decoration(DecoratedInterval(Interval(-0x1.921fb54442d19p+0, 0x1.921fb54442d19p+0), trv))
    @test cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-54, 1.0), dac), DecoratedInterval(Interval(0.0, 2.0), def)) == DecoratedInterval(Interval(0.0, 0x1.921fb54442d19p+0), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-54, 1.0), dac), DecoratedInterval(Interval(0.0, 2.0), def))) == decoration(DecoratedInterval(Interval(0.0, 0x1.921fb54442d19p+0), trv))
    @test cos_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-53, 1.0), def), DecoratedInterval(Interval(-0.1, 1.5708), dac)) == DecoratedInterval(Interval(-0.1, 0x1.921fb54442d1ap+0), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-53, 1.0), def), DecoratedInterval(Interval(-0.1, 1.5708), dac))) == decoration(DecoratedInterval(Interval(-0.1, 0x1.921fb54442d1ap+0), trv))
    @test cos_rev(DecoratedInterval(Interval(-0x1p+0, -0x1.fffffffffffffp-1), dac), DecoratedInterval(Interval(3.14, 3.15), def)) == DecoratedInterval(Interval(0x1.921fb52442d18p+1, 0x1.921fb56442d1ap+1), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-0x1p+0, -0x1.fffffffffffffp-1), dac), DecoratedInterval(Interval(3.14, 3.15), def))) == decoration(DecoratedInterval(Interval(0x1.921fb52442d18p+1, 0x1.921fb56442d1ap+1), trv))
    @test cos_rev(DecoratedInterval(Interval(-0x1p+0, -0x1.fffffffffffffp-1), def), DecoratedInterval(Interval(-3.15, -3.14), com)) == DecoratedInterval(Interval(-0x1.921fb56442d1ap+1, -0x1.921fb52442d18p+1), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-0x1p+0, -0x1.fffffffffffffp-1), def), DecoratedInterval(Interval(-3.15, -3.14), com))) == decoration(DecoratedInterval(Interval(-0x1.921fb56442d1ap+1, -0x1.921fb52442d18p+1), trv))
    @test cos_rev(DecoratedInterval(Interval(-0x1p+0, -0x1.fffffffffffffp-1), def), DecoratedInterval(Interval(9.42, 9.45), dac)) == DecoratedInterval(Interval(0x1.2d97c7eb321d2p+3, 0x1.2d97c7fb321d3p+3), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-0x1p+0, -0x1.fffffffffffffp-1), def), DecoratedInterval(Interval(9.42, 9.45), dac))) == decoration(DecoratedInterval(Interval(0x1.2d97c7eb321d2p+3, 0x1.2d97c7fb321d3p+3), trv))
    @test cos_rev(DecoratedInterval(Interval(0x1.87996529f9d92p-1, 1.0), dac), DecoratedInterval(Interval(-1.0, 0.1), def)) == DecoratedInterval(Interval(-0x1.6666666666667p-1, 0.1), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(0x1.87996529f9d92p-1, 1.0), dac), DecoratedInterval(Interval(-1.0, 0.1), def))) == decoration(DecoratedInterval(Interval(-0x1.6666666666667p-1, 0.1), trv))
    @test cos_rev(DecoratedInterval(Interval(-0x1.aa22657537205p-2, 0x1.14a280fb5068cp-1), com), DecoratedInterval(Interval(0.0, 2.1), dac)) == DecoratedInterval(Interval(0x1.fffffffffffffp-1, 0x1.0000000000001p+1), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-0x1.aa22657537205p-2, 0x1.14a280fb5068cp-1), com), DecoratedInterval(Interval(0.0, 2.1), dac))) == decoration(DecoratedInterval(Interval(0x1.fffffffffffffp-1, 0x1.0000000000001p+1), trv))
    @test cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), com), DecoratedInterval(Interval(-Inf, 1.58), dac)) == DecoratedInterval(Interval(-Inf, 0x1.921fb54442d18p+0), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), com), DecoratedInterval(Interval(-Inf, 1.58), dac))) == decoration(DecoratedInterval(Interval(-Inf, 0x1.921fb54442d18p+0), trv))
    @test cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), def), DecoratedInterval(Interval(-Inf, 1.5), dac)) == DecoratedInterval(Interval(-Inf, -0x1.921fb54442d17p+0), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), def), DecoratedInterval(Interval(-Inf, 1.5), dac))) == decoration(DecoratedInterval(Interval(-Inf, -0x1.921fb54442d17p+0), trv))
    @test cos_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), dac), DecoratedInterval(Interval(-1.58, Inf), dac)) == DecoratedInterval(Interval(-0x1.921fb54442d1ap+0, Inf), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), dac), DecoratedInterval(Interval(-1.58, Inf), dac))) == decoration(DecoratedInterval(Interval(-0x1.921fb54442d1ap+0, Inf), trv))
    @test cos_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), def), DecoratedInterval(Interval(-1.5, Inf), dac)) == DecoratedInterval(Interval(0x1.921fb54442d19p+0, Inf), trv)
    @test decoration(cos_rev(DecoratedInterval(Interval(-0x1.72cece675d1fdp-52, -0x1.72cece675d1fcp-52), def), DecoratedInterval(Interval(-1.5, Inf), dac))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d19p+0, Inf), trv))
end

@testset "minimal_tanRev_test" begin
    @test tan_rev(∅)[2] == ∅
    @test tan_rev(Interval(-1.0, 1.0))[2] == entireinterval(Float64)
    @test tan_rev(Interval(-156.0, -12.0))[2] == entireinterval(Float64)
    @test tan_rev(Interval(0.0, 0.0))[2] == entireinterval(Float64)
    @test tan_rev(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53))[2] == entireinterval(Float64)
end

@testset "minimal_tanRevBin_test" begin
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

@testset "minimal_tanRev_dec_test" begin
    @test tan_rev(DecoratedInterval(∅, trv)) == DecoratedInterval(∅, trv)
    @test decoration(tan_rev(DecoratedInterval(∅, trv))) == decoration(DecoratedInterval(∅, trv))
    @test tan_rev(DecoratedInterval(Interval(-1.0, 1.0), com)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(-1.0, 1.0), com))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
    @test tan_rev(DecoratedInterval(Interval(-156.0, -12.0), dac)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(-156.0, -12.0), dac))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
    @test tan_rev(DecoratedInterval(Interval(0.0, 0.0), def)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(0.0, 0.0), def))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
    @test tan_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), com)) == DecoratedInterval(entireinterval(Float64), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(0x1.1a62633145c06p-53, 0x1.1a62633145c07p-53), com))) == decoration(DecoratedInterval(entireinterval(Float64), trv))
end

@testset "minimal_tanRev_dec_bin_test" begin
    @test tan_rev(DecoratedInterval(∅, trv), DecoratedInterval(Interval(-1.5708, 1.5708), def)) == DecoratedInterval(∅, trv)
    @test decoration(tan_rev(DecoratedInterval(∅, trv), DecoratedInterval(Interval(-1.5708, 1.5708), def))) == decoration(DecoratedInterval(∅, trv))
    @test tan_rev(DecoratedInterval(entireinterval(Float64), def), DecoratedInterval(Interval(-1.5708, 1.5708), dac)) == DecoratedInterval(Interval(-1.5708, 1.5708), trv)
    @test decoration(tan_rev(DecoratedInterval(entireinterval(Float64), def), DecoratedInterval(Interval(-1.5708, 1.5708), dac))) == decoration(DecoratedInterval(Interval(-1.5708, 1.5708), trv))
    @test tan_rev(DecoratedInterval(Interval(0.0, 0.0), com), DecoratedInterval(Interval(-1.5708, 1.5708), def)) == DecoratedInterval(Interval(0.0, 0.0), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(0.0, 0.0), com), DecoratedInterval(Interval(-1.5708, 1.5708), def))) == decoration(DecoratedInterval(Interval(0.0, 0.0), trv))
    @test tan_rev(DecoratedInterval(Interval(0x1.d02967c31cdb4p+53, 0x1.d02967c31cdb5p+53), dac), DecoratedInterval(Interval(-1.5708, 1.5708), def)) == DecoratedInterval(Interval(-0x1.921fb54442d1bp+0, 0x1.921fb54442d19p+0), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(0x1.d02967c31cdb4p+53, 0x1.d02967c31cdb5p+53), dac), DecoratedInterval(Interval(-1.5708, 1.5708), def))) == decoration(DecoratedInterval(Interval(-0x1.921fb54442d1bp+0, 0x1.921fb54442d19p+0), trv))
    @test tan_rev(DecoratedInterval(Interval(-0x1.1a62633145c07p-53, -0x1.1a62633145c06p-53), def), DecoratedInterval(Interval(3.14, 3.15), dac)) == DecoratedInterval(Interval(0x1.921fb54442d17p+1, 0x1.921fb54442d19p+1), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(-0x1.1a62633145c07p-53, -0x1.1a62633145c06p-53), def), DecoratedInterval(Interval(3.14, 3.15), dac))) == decoration(DecoratedInterval(Interval(0x1.921fb54442d17p+1, 0x1.921fb54442d19p+1), trv))
    @test tan_rev(DecoratedInterval(Interval(0x1.72cece675d1fcp-52, 0x1.72cece675d1fdp-52), com), DecoratedInterval(Interval(-3.15, 3.15), com)) == DecoratedInterval(Interval(-0x1.921fb54442d19p+1, 0x1.921fb54442d1ap+1), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(0x1.72cece675d1fcp-52, 0x1.72cece675d1fdp-52), com), DecoratedInterval(Interval(-3.15, 3.15), com))) == decoration(DecoratedInterval(Interval(-0x1.921fb54442d19p+1, 0x1.921fb54442d1ap+1), trv))
    @test tan_rev(DecoratedInterval(Interval(-0x1.d02967c31p+53, 0x1.d02967c31p+53), def), DecoratedInterval(Interval(-Inf, 1.5707965), def)) == DecoratedInterval(Interval(-Inf, 0x1.921fb82c2bd7fp0), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(-0x1.d02967c31p+53, 0x1.d02967c31p+53), def), DecoratedInterval(Interval(-Inf, 1.5707965), def))) == decoration(DecoratedInterval(Interval(-Inf, 0x1.921fb82c2bd7fp0), trv))
    @test tan_rev(DecoratedInterval(Interval(-0x1.d02967c31p+53, 0x1.d02967c31p+53), com), DecoratedInterval(Interval(-1.5707965, Inf), dac)) == DecoratedInterval(Interval(-0x1.921fb82c2bd7fp0, Inf), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(-0x1.d02967c31p+53, 0x1.d02967c31p+53), com), DecoratedInterval(Interval(-1.5707965, Inf), dac))) == decoration(DecoratedInterval(Interval(-0x1.921fb82c2bd7fp0, Inf), trv))
    @test tan_rev(DecoratedInterval(Interval(-0x1.d02967c31p+53, 0x1.d02967c31p+53), com), DecoratedInterval(Interval(-1.5707965, 1.5707965), com)) == DecoratedInterval(Interval(-0x1.921fb82c2bd7fp0, 0x1.921fb82c2bd7fp0), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(-0x1.d02967c31p+53, 0x1.d02967c31p+53), com), DecoratedInterval(Interval(-1.5707965, 1.5707965), com))) == decoration(DecoratedInterval(Interval(-0x1.921fb82c2bd7fp0, 0x1.921fb82c2bd7fp0), trv))
    @test tan_rev(DecoratedInterval(Interval(-0x1.d02967c31cdb5p+53, 0x1.d02967c31cdb5p+53), dac), DecoratedInterval(Interval(-1.5707965, 1.5707965), def)) == DecoratedInterval(Interval(-1.5707965, 1.5707965), trv)
    @test decoration(tan_rev(DecoratedInterval(Interval(-0x1.d02967c31cdb5p+53, 0x1.d02967c31cdb5p+53), dac), DecoratedInterval(Interval(-1.5707965, 1.5707965), def))) == decoration(DecoratedInterval(Interval(-1.5707965, 1.5707965), trv))
end


# FactCheck.exitstatus()
