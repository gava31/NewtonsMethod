using NewtonsMethod
using Test

#Test method 1
f(x)=x^2-4.0
f′(x)=2x
@test newtonroot(f,f′,x₀=0.2)[1]≈2.0

f(x)=log(x)-20
f′(x)=1/x
@test newtonroot(f,f′,x₀=0.2)[1]≈4.851651954097909e8

f(x)=3x^2-5x+1
f′(x)=6x-5
@test newtonroot(f,f′,x₀=0.2)[1]≈2.32408120756001784480129727405038536389084291259026547774006206530426035584922e-01

f(x)=-10x^3-5x^2+20
f′(x)=-20x^2-10x
@test newtonroot(f,f′,x₀=0.2)[1]≈1.113386205687796447877673190361708447749219094960359587626412934254462034979434


#Test method 2
f(x)=x^2-4.0
@test newtonroot(f,x₀=0.2)[1]≈2.0

f(x)=log(x)-20
@test newtonroot(f,x₀=0.2)[1]≈4.851651954097909e8

f(x)=3x^2-5x+1
@test newtonroot(f,x₀=0.2)[1]≈2.32408120756001784480129727405038536389084291259026547774006206530426035584922e-01

f(x)=-10x^3-5x^2+20
@test newtonroot(f,x₀=0.2)[1]≈1.113386205687796447877673190361708447749219094960359587626412934254462034979434


#Test Big Float (Not really sure what to do here)
#(I set all parameters to be BigFloat)
f(x)=3x^2-5x+1
@test newtonroot(f,x₀= BigFloat(0.2),tolerance = BigFloat(1E-100), maxiter = BigFloat(1000))[1]  ≈  2.32408120756001784480129727405038536389084291259026547774006206530426035584922e-01

#Test non-convergence (return nothing)
f(x)=2+x^2
@test newtonroot(f,x₀=0.2)==nothing


#Test maxiter (first should return the value, second should return nothing)
f(x)=log(x)-20
a=newtonroot(f,x₀=0.2)[1] #Algorithm needs 17 iterations in this case
b=newtonroot(f,x₀=0.2,maxiter=5)
@testset "maxiter" begin
  @test a≈4.851651954097909e8
  @test b==nothing
 end;


#Test tolerance (As tolerance parameter increases, the code is less accurate)
f(x)=3x^2-5x+1
a=newtonroot(f,x₀=1)[1]
b=newtonroot(f,x₀=1, tolerance=0.0005)[1]
c=newtonroot(f,x₀=1, tolerance=0.05)[1]
@test f(a)<f(b)<f(c)
