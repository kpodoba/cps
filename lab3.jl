using CairoMakie

## Problem 3.1 Zaimplementuj funkcję mean: ℂ^𝑁 → ℂ zwracającą wartość średnią dyskretnego sygnału 𝑥 ∈ ℂ^𝑁 .

function mean(n1, n2, x)
    sum = zero(eltype(x))
    for i in n1:n2
        sum += x[i]
    end
    return (1 / (n2 - n1 + 1)) .* sum
end

## Problem 3.2 Zaimplementuj funkcję peak2peak: ℝ^𝑁 → ℝ zwracającą wartość międzyszczytową dyskretnego sygnału 𝑥 ∈ ℝ^𝑁 .

function peak2peak(x::AbstractVector)::Real
    return max(x) - min(x)
end

## Problem 3.3 Zaimplementuj funkcję energy: ℂ ^𝑁 → ℝ zwracającą energię dyskretnego sygnału 𝑥 ∈ ℂ^𝑁 .
## gpt

function energy(x::Vector{Complex})
    """
    Oblicza energię dyskretnego sygnału x ∈ ℂ^𝑁.

    Parametry:
    x (Vector{Complex}): Wektor sygnału w dziedzinie czasu.

    Zwraca:
    Float64: Wartość energii sygnału.
    """
    return sum(abs.(x).^2)
end
x = range(1,100,100)
y = sin.(x)

@show energy(y)
## Problem 3.4 Zaimplementuj funkcję power: ℂ^𝑁 → ℝ zwracającą moc dyskretnego sygnału 𝑥 ∈ ℂ^𝑁 .
## gpt

function power(x::Vector{Complex})
    """
    Oblicza moc dyskretnego sygnału x ∈ ℂ^𝑁.

    Parametry:
    x (Vector{Complex}): Wektor sygnału w dziedzinie czasu.

    Zwraca:
    Float64: Wartość mocy sygnału.
    """
    return energy(x) / length(x)
end

x = range(1,100,100)
y = sin.(x)

@show power(y)
## Problem 3.5 Zaimplementuj funkcję rms: ℂ^𝑁 → ℝ zwracającą wartość skuteczną dyskretnego sygnału 𝑥 ∈ ℂ^𝑁 .
## gpt 

function rms(x::Vector{Complex})
    """
    Oblicza wartość skuteczną dyskretnego sygnału x ∈ ℂ^𝑁.

    Parametry:
    x (Vector{Complex}): Wektor sygnału w dziedzinie czasu.

    Zwraca:
    Float64: Wartość skuteczna sygnału.
    """
    return sqrt(energy(x) / length(x))
end
x = range(1,100,100)
y = sin.(x)

@show rms(y)