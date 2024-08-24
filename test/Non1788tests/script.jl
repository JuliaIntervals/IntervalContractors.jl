using Test

using IntervalArithmetic
using IntervalContractors

c = emptyinterval()
d = entireinterval(Float64)
a,b = exp2_rev(c, d)
