module NewtonsMethod

using ForwardDiff, LinearAlgebra

function newtonroot(f, f′; x₀, tolerance = 1E-7, maxiter = 1000)
    # setup the algorithm
    x_old = x₀
    normdiff = Inf
    iter = 1
    while normdiff > tolerance && iter <= maxiter
        x_new = x_old - f(x_old)/f′(x_old) # use the passed in map
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    return (root = x_old, normdiff = normdiff, iter = iter) # A named tuple
end

D(f) = x -> ForwardDiff.derivative(f, x)

newtonroot(f; x₀, tolerance = 1E-7, maxiter = 1000) = newtonroot(f, D(f), x₀=x₀, tolerance = tolerance, maxiter = maxiter)

export newtonroot
end # module
