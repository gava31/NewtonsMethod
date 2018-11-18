using NewtonsMethod
using Test


f(x)=x^2-4.0
f′(x)=2x
@testset newtonroot(f,f′,x₀=0.2)[1]==2.0
