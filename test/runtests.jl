using NewtonsMethod
using Test

#Test method 1
f(x)=x^2-4.0
f′(x)=2x
@test newtonroot(f,f′,x₀=0.2)[1]≈2.0 atol=0.000001

f(x)=log(x)-20
f′(x)=1/x
@test newtonroot(f,f′,x₀=0.2)[1]≈4.851651954097909e8 atol=0.000001

f(x)=3x^2-5x+1
f′(x)=6x-5
@test newtonroot(f,f′,x₀=0.2)[1]≈0.23240824122077 atol=0.000001

f(x)=-10x^3-5x^2+20
f′(x)=-20x^2-10x
@test newtonroot(f,f′,x₀=0.2)[1]≈1.11338619006481 atol=0.000001

#Test method 2
f(x)=x^2-4.0
@test newtonroot(f,x₀=0.2)[1]≈2.0 atol=0.000001

f(x)=log(x)-20
@test newtonroot(f,x₀=0.2)[1]≈4.851651954097909e8 atol=0.000001

f(x)=3x^2-5x+1
@test newtonroot(f,x₀=0.2)[1]≈0.23240824122077 atol=0.000001

f(x)=-10x^3-5x^2+20
@test newtonroot(f,x₀=0.2)[1]≈1.11338619006481 atol=0.000001

#Test non-convergence (return nothing)
f(x)=2+x^2
@test newtonroot(f,x₀=0.2)==nothing


