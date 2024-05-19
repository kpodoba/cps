begin
    using Plots
    using Statistics
    using LinearAlgebra
    using Random
    using Waveforms
end
## Problem 2.1 Oblicz wektor 𝑥 ∈ ℝ^256, zawierający kolejne próbki pobrane z szybkością 1000 próbek na sekundę 
## ciągłego rzeczywsitego syganłu harmonicznego o amplitudzie 2, częstotliwości oscylacji 25 Hz, oraz przesunięciu fazowym 𝜋/4. 
## Pierwsza próbka 𝑥1 powinna być pobrana w momencie 0.25 s

A = 2 # Amplituda 2
f = 25 # Częstotliwość 25 Hz
n = 1000 # Szybkość 1000 próbek na sekundę
fi = pi/4 # Przesunięcie fazowe pi/4
t1 = 0.25 # Początek próbkowania
N = 256 # Rozmiar wektora
t2 = t1+((N-1)/n)
t = range(t1, t2, N) # Zakres x
y = A*sin.(2*pi*f*t .+ fi) # Sygnał y
# Wykres
lines(t, y)

#MCH---------------------------------------------
'sampling_rate = 1000
sample_step = 1 / sampling_rate
first_sample_time = 0.25
sample_count = 256

A = 2
f₀ = 25
ϕ = π / 4

t = range(;
    start=first_sample_time,
    step=sample_step,
    length=sample_count
)
signal = A * cos.(2π * f₀ * t .+ ϕ)

plot(t, signal)'


## Problem 2.2 Oblicz wektor 𝑥 ∈ ℂ 𝑁 , zawierający kolejne próbki pobrane z szybkością 2048 próbek na sekundę 
## ciągłego zespolonego syganłu harmonicznego o amplitudzie 0.25, częstotliwości oscylacji 𝜋/2 Hz, oraz przesunięciu fazowym 𝜋.\
## Pierwsza próbka 𝑥1  powinna być pobrana w momencie 5.0 s, natomiast ostatnia próbka 𝑥𝑁 powinna zostać pobrana w momencie 10.0 s.

function K(N)
    
A = 0.25 # Amplituda
f = pi/2 # Częstotliwość
n = 2048# Szybkość próbek na sekundę
fi = pi # Przesunięcie fazowe
t1 = 5 # Początek próbkowania
N = # Rozmiar wektora nieznany
t2 = 10

t = range(t1, t2; length=n*(t2-t1)) # Zakres x
y = A*exp.(im*(2*pi*f*t.+fi))# Sygnał y

# Wykres
lines(t, real(y))
lines!(t, imag(y))
current_figure()

#MCH------------------------------------
'sampling_rate = 2048
sample_step = 1 / sampling_rate
first_sample_time = 5
last_sample_time = 10

A = 0.25
f₀ = π / 2
ϕ = π

t = range(;
    start=first_sample_time,
    stop=last_sample_time,
    step=sample_step
)
signal = A * exp.(im * (2π * f₀ * t .+ ϕ))

p1 = plot(signal)
plot(
    plot(t, real(signal)),
    plot(t, imag(signal)),
    layout=(2, 1),
    title=["real" "imaginary"],
    label=["re" "im"]
)'
#MCH################################
## Problem 2.3
function white_noise(n, power)
    noise = sqrt(power) * randn(n)
    return noise
end
signal = white_noise(1000, 0.25)
var(signal)

#zpc
'function noise(power, n)
    matrix=Float64[]
    for i in 1:1:n
        push!(matrix, (sqrt(power)*cos(i)-sqrt(power)*sin(i)))
    end 
return matrix
end
using CairoMakie

f = Figure()
lines(range(1,100,1000), sin.(range(1,100,1000).+noise(0.25,1000)))
f
@show noise(0.25, 1000)'
    
## Problem 2.4
function complex_white_noise(n, power)
    noise = sqrt(power) * (randn(ComplexF64, n))
    return noise
end
signal = complex_white_noise(1000, 3)
var(signal)

## Problem 2.5
function cw_rectangular(T, t)
    impulse_value = 1 / T


end
######################################

## Problem 2.7 Zaimplementuj funkcję cw_literka_M: ℝ × ℝ → ℝ, zwracającą impuls przypominający literę M o szerokości 𝑇 ∈ ℝ w chwili 𝑡 ∈ ℝ.

function cw_literka_M(T::Real, t::Real)
    if abs(t) < T/2
        if t< 0
            return (T/2 - (t*2))
        else
            return (T/2 + (t*2))
        end
    else
        return 0.0 
    end
end

T = 2.0
t = -2.5:0.01:2.5

x = [cw_literka_M(T,t) for t in t]
using CairoMakie
lines(t,x)
litera_M(1,1,0.1)

#MCH################################################
## problem 2.9
function ramp_wave(x)
    output = 2 * rem(x, 1, RoundNearest)
    return output
end

x = 0:0.001:2
plot(x, ramp_wave.(x))
###########################################################
## Problem 2.10 Zaimplementuj funkcję sawtooth_wave: ℝ → ℝ, zwracającą wartości okresowego sygnału fali piłokształtnej z opadającym zboczem w chwili 𝑡 ∈ ℝ. 
## Sygnał powinien posiadać następujące parametry: amplituda 1, okres 1 sekunda, składowa stała 0, sawtooth_wave(0) = 0,
## oraz 𝜕sawtooth_wave/ 𝜕𝑡| 𝑡=0 = −1.

#MCH###############################
function sawtooth_wave(x)
    output = -2 * rem(x, 1, RoundNearest)
    return output
end

x = 0:0.001:2
plot(x, sawtooth_wave.(x))
#####################################
    #zpc
'function sawtooth_wave(offset, time)
    x=Float64[]
    y=Float64[]
    push!(x,offset)
    push!(y,0)
    for i in 1:1:time*100
            push!(x, i/100+offset)
        end
    for i in 1:1:time
        for k in 1:1:100
            push!(y, k*(-1)/100+0.5)
        end
    end
    return [x,y]
end

using CairoMakie
f = Figure()
matrix = sawtooth_wave(2, 10)
lines(matrix[1], matrix[2])
@show matrix '
    
## Problem 2.11 : Zaimplementuj funkcję triangular_wave: ℝ → ℝ, zwracającą wartości okresowego sygnału fali trójkątnej w chwili 𝑡 ∈ ℝ.
## Sygnał powinien posiadać następujące parametry: amplituda 1, okres 1 sekunda, składowa stała 0, triangular_wave(0) = 0, oraz
## 𝜕 triangular_wave/ 𝜕𝑡| 𝑡=0 = 2

#MCH##########################################
    function triangle_wave(x)
    #FIXME: conflicting requirements
end

x = 0:0.001:2
plot(x, triangle_wave.(x))
##zpc
    
'function triangular_wave(offset, time)
    x=Float64[]
    y=Float64[]
    push!(x,offset)
    push!(y,0)
    for i in 1:1:time*400+100
            push!(x, i/100+offset)
        end
    for k in 1:1:100
        push!(y, k/100)
    end
    for i in 1:1:time
        for k in 1:1:200
            push!(y, k/100*(-1)+1)
        end
        for k in 1:1:200
            push!(y, k/100-1)
        end
    end
    return [x,y]
end

using CairoMakie
f = Figure()
matrix = triangular_wave(2, 10)
lines(matrix[1], matrix[2])
## problem 2.12
function square_wave(x)
    ifelse(rem(x, 1) < 0.5, 1, -1)
end

trianglewave1(x)

x = 0:0.001:2
plot(x, square_wave.(x))'

## problem 2.13
function pulse_wave(x, ρ)
    ifelse(rem(x, 1) < ρ, 1, 0)
end

x = 0:0.001:2
plot(x, pulse_wave.(x, 0.2))

########################################################
## Problem 2.14 Zaimplementuj funkcję impulse_reapeter: 𝐹 × ℝ × ℝ → 𝐹, która zwróci funkcję 𝑓 ∈ 𝐹, gdzie 𝐹 oznacza zbiór funkcji ℝ → ℝ. Funkcja 𝑓 powinna zwracać wartość sygnału 𝑓(𝑡) ∈ ℝ w momencie 𝑡 ∈ ℝ. 
##  Sygnał 𝑓(𝑡) jest sygnałem okresowym o okresie 𝑇 = 𝑡2 − 𝑡1, gdzie 𝑡1,𝑡2 ∈ ℝ oraz 𝑡1 < 𝑡2. Funkcja 𝑓 jest związany z funkcją wymuszającą 𝑔 ∈ 𝐹 poprzez warunek t2∫t1(𝑓(𝑡) − 𝑔(𝑡))^2 dt = 0.

## Problem 2.15 Zaimplementuj funkcję ramp_wave_bl: ℝ × ℝ^+ × ℝ^+ × ℝ^+ → ℝ. Funkcja powinna zwracać wartość sygnału fali piłokształtnej z narastającmym zboczem w chwili 𝑡 ∈ ℝ(podobnie jak w Problem 2.9).
## Dodatkowo zwracany sygnał powinien mieć amplitudę 𝐴 ∈ ℝ$+, okres trwający 𝑇 ∈ ℝ+ sekund oraz pasmo tego sygnału powinno być ograniczone od dołu i góry przez częstotliwości |𝐵| ∈ ℝ^+.


## Problem 2.22 Zaimplementuj funkcję kronecker : ℤ → ℝ, zwracającą wartość dyskretnego impulsu jednostkowego (delta Kroneckera) dla 𝑛 ∈ ℤ.

    #zpc
    function kronecker(n)
    x=Float64[]
    y=Float64[]
    if (n < 0)
        push!(x,2*n)
        push!(y,0)
        for i in n*2:1:0
            if (i == n)
                push!(x, i-0.0000001)
                push!(x, i)
                push!(x, i+0.0000001)
            else
                push!(x, i)
            end
        end
        for i in 2*n:1:0
            if (i == n)
                push!(y, 0)
                push!(y, 1)
                push!(y, 0)
            else
                push!(y, 0)
            end
        end
    end
    if (n > 0)
        push!(x,0)
        push!(y,0)
        for i in 0:1:2*n
            if (i == n)
                push!(x, i-0.000001)
                push!(x, i)
                push!(x, i+0.000001)
            else
                push!(x, i)
            end
        end
        for i in 0:1:2*n
            if (i == n)
                push!(y, 0)
                push!(y, 1)
                push!(y, 0)
            else
                push!(y, 0)
            end
        end
    end
    if (n == 0)
        push!(x,-n)
        push!(y,0)
        for i in 0:1:10
            if (i-5 == 0)
                push!(x, i-5-0.00001)
                push!(x, i-5)
                push!(x, i-5+0.00001)
            else
                push!(x, i-5)
            end
        end
        for i in 0:1:10
            if (i-5 == 0)
                push!(y, 0)
                push!(y, 1)
                push!(y, 0)
            else
                push!(y, 0)
            end
        end
    end
    return [x,y]
end

using CairoMakie
f = Figure()
matrix = kronecker(10)
scatterlines(matrix[1], matrix[2])
    
## Problem 2.23 Zaimplementuj funkcję heaviside : ℤ → ℝ, zwracającą wartość dyskretnego skoku jednostkowego (funkcja skokowa Heaviside’a) dla 𝑛 ∈ 
    #zpc
    function heaviside(n)
    x=Float64[]
    y=Float64[]
    if (n < 0)
        push!(x,2*n)
        push!(y,0)
        for i in n*2+1:1:0
            if (i == n)
                push!(x, i-0.000001)
                push!(x, i)
            else
                push!(x, i)
            end
        end
        for i in 2*n:1:0
            if (i >= n)
                push!(y, 1)
            else
                push!(y, 0)
            end
        end
    end
    if (n > 0)
        push!(x,0)
        push!(y,0)
        for i in 1:1:2*n
            if (i == n)
                push!(x, i-0.000001)
                push!(x, i)
            else
                push!(x, i)
            end
        end
        for i in 1:1:2*n+1
            if (i > n)
                push!(y, 1)
            else
                push!(y, 0)
            end
        end
    end
    if (n == 0)
        push!(x,-5)
        push!(y,0)
        for i in -5:1:5
            if (i == 0)
                push!(x, i-0.000001)
                push!(x, i)
                push!(x, i+0.000001)
            else
                push!(x, i)
            end
        end
        for i in -5:1:7
            if (i > n)
                push!(y, 1)
            else
                push!(y, 0)
            end
        end
    end
    return [x,y]
end

using CairoMakie
f = Figure()
matrix = heaviside(0)
scatterlines(matrix[1], matrix[2])
@show matrix[1]
@show matrix[2]

## Problem 2.26 Zaimplementuj funkcję hanning : ℕ+ → ℝ^𝑁 , zwracającą wektor 𝑥 ∈ ℝ^𝑁 z próbkami dyskretnego okna Hanninga o długości 𝑁 > 0.

#zpc    
using CairoMakie

function hanning(N)
    if N <= 0
        error("N must be greater than zero")
    end
    
    n = collect(0:N-1)
    return 0.5 .- 0.5 .* cos.(2π * n / (N - 1))
end

N = 100
x = hanning(N)
lines(1:N, x)
