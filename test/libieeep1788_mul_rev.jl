@testset "minimal_mulRevToPair_test" begin

    @test isequal_interval(mul_rev_to_pair(emptyinterval(), interval(1.0, 2.0))[1] === emptyinterval() && mul_rev_to_pair(emptyinterval(), interval(1.0, 2.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(1.0, 2.0), emptyinterval())[1] === emptyinterval() && mul_rev_to_pair(interval(1.0, 2.0), emptyinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(emptyinterval(), emptyinterval())[1] === emptyinterval() && mul_rev_to_pair(emptyinterval(), emptyinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(-2.1, -0.4))[1] === interval(0x1.999999999999AP-3, 0x1.5P+4) && mul_rev_to_pair(interval(-2.0, -0.1), interval(-2.1, -0.4))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(-2.1, -0.4))[1] === interval(0x1.999999999999AP-3, Inf) && mul_rev_to_pair(interval(-2.0, 0.0), interval(-2.1, -0.4))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(-2.1, -0.4))[1] === interval(-Inf, -0x1.745D1745D1745P-2) && mul_rev_to_pair(interval(-2.0, 1.1), interval(-2.1, -0.4))[2], interval(0x1.999999999999AP-3, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(-2.1, -0.4))[1] === interval(-Inf, -0x1.745D1745D1745P-2) && mul_rev_to_pair(interval(0.0, 1.1), interval(-2.1, -0.4))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(-2.1, -0.4))[1] === interval(-0x1.A400000000001P+7, -0x1.745D1745D1745P-2) && mul_rev_to_pair(interval(0.01, 1.1), interval(-2.1, -0.4))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(-2.1, -0.4))[1] === emptyinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(-2.1, -0.4))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(-2.1, -0.4))[1] === interval(0.0, 0x1.5P+4) && mul_rev_to_pair(interval(-Inf, -0.1), interval(-2.1, -0.4))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(-2.1, -0.4))[1] === interval(0.0, Inf) && mul_rev_to_pair(interval(-Inf, 0.0), interval(-2.1, -0.4))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(-2.1, -0.4))[1] === interval(-Inf, -0x1.745D1745D1745P-2) && mul_rev_to_pair(interval(-Inf, 1.1), interval(-2.1, -0.4))[2], interval(0.0, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(-2.1, -0.4))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(-2.0, Inf), interval(-2.1, -0.4))[2], interval(0x1.999999999999AP-3, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(-2.1, -0.4))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(0.0, Inf), interval(-2.1, -0.4))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(-2.1, -0.4))[1] === interval(-0x1.A400000000001P+7, 0.0) && mul_rev_to_pair(interval(0.01, Inf), interval(-2.1, -0.4))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(-2.1, -0.4))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(entireinterval(), interval(-2.1, -0.4))[2], interval(0.0, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(-2.1, 0.0))[1] === interval(0.0, 0x1.5P+4) && mul_rev_to_pair(interval(-2.0, -0.1), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(-2.1, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 0.0), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(-2.1, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 1.1), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(-2.1, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 1.1), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(-2.1, 0.0))[1] === interval(-0x1.A400000000001P+7, 0.0) && mul_rev_to_pair(interval(0.01, 1.1), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(-2.1, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(-2.1, 0.0))[1] === interval(0.0, 0x1.5P+4) && mul_rev_to_pair(interval(-Inf, -0.1), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(-2.1, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 0.0), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(-2.1, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 1.1), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(-2.1, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, Inf), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(-2.1, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, Inf), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(-2.1, 0.0))[1] === interval(-0x1.A400000000001P+7, 0.0) && mul_rev_to_pair(interval(0.01, Inf), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(-2.1, 0.0))[1] === entireinterval() && mul_rev_to_pair(entireinterval(), interval(-2.1, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(-2.1, 0.12))[1] === interval(-0x1.3333333333333P+0, 0x1.5P+4) && mul_rev_to_pair(interval(-2.0, -0.1), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(-2.1, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 0.0), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(-2.1, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 1.1), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(-2.1, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 1.1), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(-2.1, 0.12))[1] === interval(-0x1.A400000000001P+7 , 0x1.8P+3) && mul_rev_to_pair(interval(0.01, 1.1), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(-2.1, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(-2.1, 0.12))[1] === interval(-0x1.3333333333333P+0, 0x1.5P+4) && mul_rev_to_pair(interval(-Inf, -0.1), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(-2.1, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 0.0), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(-2.1, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 1.1), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(-2.1, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, Inf), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(-2.1, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, Inf), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(-2.1, 0.12))[1] === interval(-0x1.A400000000001P+7 , 0x1.8P+3) && mul_rev_to_pair(interval(0.01, Inf), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(-2.1, 0.12))[1] === entireinterval() && mul_rev_to_pair(entireinterval(), interval(-2.1, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(0.0, 0.12))[1] === interval(-0x1.3333333333333P+0, 0.0) && mul_rev_to_pair(interval(-2.0, -0.1), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(0.0, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 0.0), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(0.0, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 1.1), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(0.0, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 1.1), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(0.0, 0.12))[1] === interval(0.0, 0x1.8P+3) && mul_rev_to_pair(interval(0.01, 1.1), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(0.0, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(0.0, 0.12))[1] === interval(-0x1.3333333333333P+0, 0.0) && mul_rev_to_pair(interval(-Inf, -0.1), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(0.0, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 0.0), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(0.0, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 1.1), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(0.0, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, Inf), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(0.0, 0.12))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, Inf), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(0.0, 0.12))[1] === interval(0.0, 0x1.8P+3) && mul_rev_to_pair(interval(0.01, Inf), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(0.0, 0.12))[1] === entireinterval() && mul_rev_to_pair(entireinterval(), interval(0.0, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(0.01, 0.12))[1] === interval(-0x1.3333333333333P+0, -0x1.47AE147AE147BP-8) && mul_rev_to_pair(interval(-2.0, -0.1), interval(0.01, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(0.01, 0.12))[1] === interval(-Inf, -0x1.47AE147AE147BP-8) && mul_rev_to_pair(interval(-2.0, 0.0), interval(0.01, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(0.01, 0.12))[1] === interval(-Inf, -0x1.47AE147AE147BP-8) && mul_rev_to_pair(interval(-2.0, 1.1), interval(0.01, 0.12))[2], interval(0x1.29E4129E4129DP-7, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(0.01, 0.12))[1] === interval(0x1.29E4129E4129DP-7, Inf) && mul_rev_to_pair(interval(0.0, 1.1), interval(0.01, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(0.01, 0.12))[1] === interval(0x1.29E4129E4129DP-7, 0x1.8P+3) && mul_rev_to_pair(interval(0.01, 1.1), interval(0.01, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(0.01, 0.12))[1] === emptyinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(0.01, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(0.01, 0.12))[1] === interval(-0x1.3333333333333P+0, 0.0) && mul_rev_to_pair(interval(-Inf, -0.1), interval(0.01, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(0.01, 0.12))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(-Inf, 0.0), interval(0.01, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(0.01, 0.12))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(-Inf, 1.1), interval(0.01, 0.12))[2], interval(0x1.29E4129E4129DP-7, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(0.01, 0.12))[1] === interval(-Inf, -0x1.47AE147AE147BP-8) && mul_rev_to_pair(interval(-2.0, Inf), interval(0.01, 0.12))[2], interval(0.0, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(0.01, 0.12))[1] === interval(0.0, Inf) && mul_rev_to_pair(interval(0.0, Inf), interval(0.01, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(0.01, 0.12))[1] === interval(0.0, 0x1.8P+3) && mul_rev_to_pair(interval(0.01, Inf), interval(0.01, 0.12))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(0.01, 0.12))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(entireinterval(), interval(0.01, 0.12))[2], interval(0.0, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(0.0, 0.0))[1] === interval(0.0, 0.0) && mul_rev_to_pair(interval(-2.0, -0.1), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(0.0, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 0.0), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(0.0, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 1.1), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(0.0, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 1.1), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(0.0, 0.0))[1] === interval(0.0, 0.0) && mul_rev_to_pair(interval(0.01, 1.1), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(0.0, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(0.0, 0.0))[1] === interval(0.0, 0.0) && mul_rev_to_pair(interval(-Inf, -0.1), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(0.0, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 0.0), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(0.0, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 1.1), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(0.0, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, Inf), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(0.0, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, Inf), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(0.0, 0.0))[1] === interval(0.0, 0.0) && mul_rev_to_pair(interval(0.01, Inf), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(0.0, 0.0))[1] === entireinterval() && mul_rev_to_pair(entireinterval(), interval(0.0, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(-Inf, -0.1))[1] === interval(0x1.999999999999AP-5, Inf) && mul_rev_to_pair(interval(-2.0, -0.1), interval(-Inf, -0.1))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(-Inf, -0.1))[1] === interval(0x1.999999999999AP-5 , Inf) && mul_rev_to_pair(interval(-2.0, 0.0), interval(-Inf, -0.1))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(-Inf, -0.1))[1] === interval(-Inf , -0x1.745D1745D1745P-4) && mul_rev_to_pair(interval(-2.0, 1.1), interval(-Inf, -0.1))[2], interval(0x1.999999999999AP-5 , Inf))

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(-Inf, -0.1))[1] === interval(-Inf, -0x1.745D1745D1745P-4) && mul_rev_to_pair(interval(0.0, 1.1), interval(-Inf, -0.1))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(-Inf, -0.1))[1] === interval(-Inf, -0x1.745D1745D1745P-4) && mul_rev_to_pair(interval(0.01, 1.1), interval(-Inf, -0.1))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(-Inf, -0.1))[1] === emptyinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(-Inf, -0.1))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(-Inf, -0.1))[1] === interval(0.0, Inf) && mul_rev_to_pair(interval(-Inf, -0.1), interval(-Inf, -0.1))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(-Inf, -0.1))[1] === interval(0.0, Inf) && mul_rev_to_pair(interval(-Inf, 0.0), interval(-Inf, -0.1))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(-Inf, -0.1))[1] === interval(-Inf, -0x1.745D1745D1745P-4) && mul_rev_to_pair(interval(-Inf, 1.1), interval(-Inf, -0.1))[2], interval(0.0, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(-Inf, -0.1))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(-2.0, Inf), interval(-Inf, -0.1))[2], interval(0x1.999999999999AP-5 , Inf))

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(-Inf, -0.1))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(0.0, Inf), interval(-Inf, -0.1))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(-Inf, -0.1))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(0.01, Inf), interval(-Inf, -0.1))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(-Inf, -0.1))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(entireinterval(), interval(-Inf, -0.1))[2], interval(0.0, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(-Inf, 0.0))[1] === interval(0.0, Inf) && mul_rev_to_pair(interval(-2.0, -0.1), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(-Inf, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 0.0), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(-Inf, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 1.1), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(-Inf, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 1.1), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(-Inf, 0.0))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(0.01, 1.1), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(-Inf, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(-Inf, 0.0))[1] === interval(0.0, Inf) && mul_rev_to_pair(interval(-Inf, -0.1), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(-Inf, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 0.0), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(-Inf, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 1.1), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(-Inf, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, Inf), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(-Inf, 0.0))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, Inf), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(-Inf, 0.0))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(0.01, Inf), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(-Inf, 0.0))[1] === entireinterval() && mul_rev_to_pair(entireinterval(), interval(-Inf, 0.0))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(-Inf, 0.3))[1] === interval(-0x1.8P+1, Inf) && mul_rev_to_pair(interval(-2.0, -0.1), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(-Inf, 0.3))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 0.0), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(-Inf, 0.3))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 1.1), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(-Inf, 0.3))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 1.1), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(-Inf, 0.3))[1] === interval(-Inf, 0x1.EP+4) && mul_rev_to_pair(interval(0.01, 1.1), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(-Inf, 0.3))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(-Inf, 0.3))[1] === interval(-0x1.8P+1, Inf) && mul_rev_to_pair(interval(-Inf, -0.1), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(-Inf, 0.3))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 0.0), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(-Inf, 0.3))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 1.1), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(-Inf, 0.3))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, Inf), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(-Inf, 0.3))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, Inf), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(-Inf, 0.3))[1] === interval(-Inf, 0x1.EP+4) && mul_rev_to_pair(interval(0.01, Inf), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(-Inf, 0.3))[1] === entireinterval() && mul_rev_to_pair(entireinterval(), interval(-Inf, 0.3))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(-0.21, Inf))[1] === interval(-Inf , 0x1.0CCCCCCCCCCCDP+1) && mul_rev_to_pair(interval(-2.0, -0.1), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(-0.21, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 0.0), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(-0.21, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 1.1), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(-0.21, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 1.1), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(-0.21, Inf))[1] === interval(-0x1.5P+4, Inf) && mul_rev_to_pair(interval(0.01, 1.1), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(-0.21, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(-0.21, Inf))[1] === interval(-Inf, 0x1.0CCCCCCCCCCCDP+1) && mul_rev_to_pair(interval(-Inf, -0.1), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(-0.21, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 0.0), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(-0.21, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 1.1), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(-0.21, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, Inf), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(-0.21, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, Inf), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(-0.21, Inf))[1] === interval(-0x1.5P+4, Inf) && mul_rev_to_pair(interval(0.01, Inf), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(-0.21, Inf))[1] === entireinterval() && mul_rev_to_pair(entireinterval(), interval(-0.21, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(0.0, Inf))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(-2.0, -0.1), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(0.0, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 0.0), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(0.0, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 1.1), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(0.0, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 1.1), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(0.0, Inf))[1] === interval(0.0, Inf) && mul_rev_to_pair(interval(0.01, 1.1), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(0.0, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(0.0, Inf))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(-Inf, -0.1), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(0.0, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 0.0), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(0.0, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 1.1), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(0.0, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, Inf), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(0.0, Inf))[1] === entireinterval() && mul_rev_to_pair(interval(0.0, Inf), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(0.0, Inf))[1] === interval(0.0, Inf) && mul_rev_to_pair(interval(0.01, Inf), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(0.0, Inf))[1] === entireinterval() && mul_rev_to_pair(entireinterval(), interval(0.0, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), interval(0.04, Inf))[1] === interval(-Inf, -0x1.47AE147AE147BP-6) && mul_rev_to_pair(interval(-2.0, -0.1), interval(0.04, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), interval(0.04, Inf))[1] === interval(-Inf, -0x1.47AE147AE147BP-6) && mul_rev_to_pair(interval(-2.0, 0.0), interval(0.04, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), interval(0.04, Inf))[1] === interval(-Inf, -0x1.47AE147AE147BP-6) && mul_rev_to_pair(interval(-2.0, 1.1), interval(0.04, Inf))[2], interval(0x1.29E4129E4129DP-5, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), interval(0.04, Inf))[1] === interval(0x1.29E4129E4129DP-5, Inf) && mul_rev_to_pair(interval(0.0, 1.1), interval(0.04, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), interval(0.04, Inf))[1] === interval(0x1.29E4129E4129DP-5, Inf) && mul_rev_to_pair(interval(0.01, 1.1), interval(0.04, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), interval(0.04, Inf))[1] === emptyinterval() && mul_rev_to_pair(interval(0.0, 0.0), interval(0.04, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), interval(0.04, Inf))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(-Inf, -0.1), interval(0.04, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), interval(0.04, Inf))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(-Inf, 0.0), interval(0.04, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), interval(0.04, Inf))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(interval(-Inf, 1.1), interval(0.04, Inf))[2], interval(0x1.29E4129E4129DP-5, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), interval(0.04, Inf))[1] === interval(-Inf, -0x1.47AE147AE147BP-6) && mul_rev_to_pair(interval(-2.0, Inf), interval(0.04, Inf))[2], interval(0.0, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), interval(0.04, Inf))[1] === interval(0.0, Inf) && mul_rev_to_pair(interval(0.0, Inf), interval(0.04, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), interval(0.04, Inf))[1] === interval(0.0, Inf) && mul_rev_to_pair(interval(0.01, Inf), interval(0.04, Inf))[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), interval(0.04, Inf))[1] === interval(-Inf, 0.0) && mul_rev_to_pair(entireinterval(), interval(0.04, Inf))[2], interval(0.0, Inf))

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, -0.1), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, -0.1), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 0.0), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 0.0), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, 1.1), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, 1.1), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 1.1), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 1.1), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, 1.1), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(0.01, 1.1), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, 0.0), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(0.0, 0.0), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, -0.1), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, -0.1), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 0.0), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 0.0), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-Inf, 1.1), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(-Inf, 1.1), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(-2.0, Inf), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(-2.0, Inf), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.0, Inf), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(0.0, Inf), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(interval(0.01, Inf), entireinterval())[1] === entireinterval() && mul_rev_to_pair(interval(0.01, Inf), entireinterval())[2], emptyinterval())

    @test isequal_interval(mul_rev_to_pair(entireinterval(), entireinterval())[1] === entireinterval() && mul_rev_to_pair(entireinterval(), entireinterval())[2], emptyinterval())

end

# @testset "minimal_mulRevToPair_dec_test" begin

#     @test isnai(mul_rev_to_pair(nai(), Decoratedinterval(interval(1.0,2.0), def))[1]) && isnai(mul_rev_to_pair(nai(), Decoratedinterval(interval(1.0,2.0), def))[2])

#     @test isnai(mul_rev_to_pair(Decoratedinterval(interval(1.0,2.0), com), nai())[1]) && isnai(mul_rev_to_pair(Decoratedinterval(interval(1.0,2.0), com), nai())[2])

#     @test isnai(mul_rev_to_pair(nai(), nai())[1]) && isnai(mul_rev_to_pair(nai(), nai())[2])

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(emptyinterval(), trv), Decoratedinterval(interval(1.0, 2.0), def))[1] === Decoratedinterval(emptyinterval(), trv) && mul_rev_to_pair(Decoratedinterval(emptyinterval(), trv), Decoratedinterval(interval(1.0, 2.0), def))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(1.0, 2.0), com), Decoratedinterval(emptyinterval(), trv))[1] === Decoratedinterval(emptyinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(1.0, 2.0), com), Decoratedinterval(emptyinterval(), trv))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(emptyinterval(), trv), Decoratedinterval(emptyinterval(), trv))[1] === Decoratedinterval(emptyinterval(), trv) && mul_rev_to_pair(Decoratedinterval(emptyinterval(), trv), Decoratedinterval(emptyinterval(), trv))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), com), Decoratedinterval(interval(-2.1, -0.4), com))[1] === Decoratedinterval(interval(0x1.999999999999AP-3, 0x1.5P+4), com) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), com), Decoratedinterval(interval(-2.1, -0.4), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-2.1, -0.4), com))[1] === Decoratedinterval(interval(0x1.999999999999AP-3, Inf), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-2.1, -0.4), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), com), Decoratedinterval(interval(-2.1, -0.4), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.745D1745D1745P-2), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), com), Decoratedinterval(interval(-2.1, -0.4), dac))[2], Decoratedinterval(interval(0x1.999999999999AP-3, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), trv), Decoratedinterval(interval(-2.1, -0.4), def))[1] === Decoratedinterval(interval(-Inf, -0x1.745D1745D1745P-2), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), trv), Decoratedinterval(interval(-2.1, -0.4), def))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), com), Decoratedinterval(interval(-2.1, -0.4), com))[1] === Decoratedinterval(interval(-0x1.A400000000001P+7, -0x1.745D1745D1745P-2), com) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), com), Decoratedinterval(interval(-2.1, -0.4), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-2.1, -0.4), def))[1] === Decoratedinterval(emptyinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-2.1, -0.4), def))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-2.1, -0.4), dac))[1] === Decoratedinterval(interval(0.0, 0x1.5P+4), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-2.1, -0.4), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), def), Decoratedinterval(interval(-2.1, -0.4), com))[1] === Decoratedinterval(interval(0.0, Inf), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), def), Decoratedinterval(interval(-2.1, -0.4), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), trv), Decoratedinterval(interval(-2.1, -0.4), def))[1] === Decoratedinterval(interval(-Inf, -0x1.745D1745D1745P-2), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), trv), Decoratedinterval(interval(-2.1, -0.4), def))[2], Decoratedinterval(interval(0.0, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-2.1, -0.4), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-2.1, -0.4), dac))[2], Decoratedinterval(interval(0x1.999999999999AP-3, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), def), Decoratedinterval(interval(-2.1, -0.4), com))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), def), Decoratedinterval(interval(-2.1, -0.4), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), def), Decoratedinterval(interval(-2.1, -0.4), def))[1] === Decoratedinterval(interval(-0x1.A400000000001P+7, 0.0), def) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), def), Decoratedinterval(interval(-2.1, -0.4), def))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-2.1, -0.4), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-2.1, -0.4), dac))[2], Decoratedinterval(interval(0.0, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(interval(0.0, 0x1.5P+4), dac) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(interval(-0x1.A400000000001P+7, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(interval(0.0, 0x1.5P+4), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(interval(-0x1.A400000000001P+7, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-2.1, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-2.1, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(interval(-0x1.3333333333333P+0, 0x1.5P+4), def) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(interval(-0x1.A400000000001P+7 , 0x1.8P+3), def) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(interval(-0x1.3333333333333P+0, 0x1.5P+4), def) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(interval(-0x1.A400000000001P+7 , 0x1.8P+3), def) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), def), Decoratedinterval(interval(-2.1, 0.12), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), def), Decoratedinterval(interval(-2.1, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), com), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(interval(-0x1.3333333333333P+0, 0.0), com) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), com), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), com), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), com), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), com), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), com), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), com), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), com), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), com), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(interval(0.0, 0x1.8P+3), com) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), com), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), com), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), com), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(interval(-0x1.3333333333333P+0, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(interval(0.0, 0x1.8P+3), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(0.0, 0.12), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(0.0, 0.12), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(-0x1.3333333333333P+0, -0x1.47AE147AE147BP-8), dac) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.47AE147AE147BP-8), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.47AE147AE147BP-8), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(interval(0x1.29E4129E4129DP-7, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(0x1.29E4129E4129DP-7, Inf), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(0x1.29E4129E4129DP-7, 0x1.8P+3), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(emptyinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(-0x1.3333333333333P+0, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(interval(0x1.29E4129E4129DP-7, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.47AE147AE147BP-8), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(interval(0.0, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(0.0, Inf), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(0.0, 0x1.8P+3), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(0.01, 0.12), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(0.01, 0.12), dac))[2], Decoratedinterval(interval(0.0, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), com), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(interval(0.0, 0.0), com) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), com), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), com), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), com), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), com), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), com), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), com), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), com), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), com), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(interval(0.0, 0.0), com) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), com), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), com), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), com), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(interval(0.0, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(interval(0.0, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(0.0, 0.0), com))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(0.0, 0.0), com))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(0x1.999999999999AP-5, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(0x1.999999999999AP-5 , Inf), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(-Inf , -0x1.745D1745D1745P-4), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(interval(0x1.999999999999AP-5 , Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.745D1745D1745P-4), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.745D1745D1745P-4), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(emptyinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(0.0, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(0.0, Inf), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.745D1745D1745P-4), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(interval(0.0, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(interval(0x1.999999999999AP-5 , Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-Inf, -0.1), dac))[2], Decoratedinterval(interval(0.0, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(interval(0.0, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(interval(0.0, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-Inf, 0.0), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(interval(-0x1.8P+1, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(interval(-Inf, 0x1.EP+4), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(interval(-0x1.8P+1, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(interval(-Inf, 0x1.EP+4), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-Inf, 0.3), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(interval(-Inf , 0x1.0CCCCCCCCCCCDP+1), dac) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(interval(-0x1.5P+4, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(interval(-Inf, 0x1.0CCCCCCCCCCCDP+1), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(interval(-0x1.5P+4, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-0.21, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(-0.21, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(interval(0.0, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(interval(0.0, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(0.0, Inf), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(0.0, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.47AE147AE147BP-6), dac) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.47AE147AE147BP-6), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.47AE147AE147BP-6), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(interval(0x1.29E4129E4129DP-5, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(0x1.29E4129E4129DP-5, Inf), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(0x1.29E4129E4129DP-5, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(emptyinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(interval(0x1.29E4129E4129DP-5, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(-Inf, -0x1.47AE147AE147BP-6), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(interval(0.0, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(0.0, Inf), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(0.0, Inf), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(0.04, Inf), dac))[1] === Decoratedinterval(interval(-Inf, 0.0), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(interval(0.04, Inf), dac))[2], Decoratedinterval(interval(0.0, Inf), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), dac) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, -0.1), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 0.0), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, 1.1), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 1.1), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, 1.1), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, 0.0), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), dac) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, -0.1), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 0.0), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-Inf, 1.1), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(-2.0, Inf), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(interval(0.0, Inf), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), dac) && mul_rev_to_pair(Decoratedinterval(interval(0.01, Inf), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

#     @test isequal_interval(mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(entireinterval(), dac))[1] === Decoratedinterval(entireinterval(), trv) && mul_rev_to_pair(Decoratedinterval(entireinterval(), dac), Decoratedinterval(entireinterval(), dac))[2], Decoratedinterval(emptyinterval(), trv))

# end
