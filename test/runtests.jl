using NewtonsMethod
using Test


f(x)=x^2-4
f′(x)=2x
@testset newtonroot(f,f′,x⁠₀=0.2)=2.0
