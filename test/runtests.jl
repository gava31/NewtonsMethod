using NewtonsMethod
using Test

#Test method 1
f(x)=x^2-4.0
f′(x)=2x
@test newtonroot(f,f′,x₀=0.2)[1]==2.0

#Test method 2
f(x)=3x^2-5x+1
@test newtonroot(f,x₀=0.5)[1]≈0.23240824122077 atol=0.000001
