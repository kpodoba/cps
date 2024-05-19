
## Problem 6.1 Oblicz dwu punktową dyskretną transformacje Fouriera (2-DFT) sygnału 𝑥 ∈ ℝ^2
## 𝑥 = (20, 5)

function dft(signal)

    N = length(signal)
    zeta = exp(-2*pi*im / N)
    
    [
    sum((
    signal[n + 1]*zeta^(f*n)
    for n in 0:(N - 1)
    ))
    for f in 0:(N - 1)
    ]
    
    end
    
    signal = [20, 5]
    signal_dft = dft(signal)
    
    ## Problem 6.2  Oblicz cztero punktową dyskretną transformacje Fouriera (4-DFT) sygnału 𝑥 ∈ℝ^4
    ## 𝑥 = (3, 2, 5, 1)
    
    function dft(signal)
    
    N = length(signal)
    zeta = exp(-2*pi*im / N)
    
    [
    sum((
    signal[n + 1]*zeta^(f*n)
    for n in 0:(N - 1)
    ))
    for f in 0:(N - 1)
    ]
    
    end
    
    signal = [3, 2, 5, 1]
    signal_dft = dft(signal)
    
    ## Problem 6.4 : Zaimplementuj funkcję dft: ℂ^𝑁 → ℂ^𝑁 dla 𝑁 ∈ ℕ^+, 
    ## która przekształci dyskretny sygnał 𝑥 ∈ ℂ^𝑁 z domeny czasu do odpowiadającego mu dyskretnego sygnału
    ## 𝑋 ∈ ℂ^𝑁 w domenie częstotliwości (dwustronne dyskretne widmo częstotliwościowe).
    ## Do obliczenia tego przekształcenia wykorzystaj dyskretną transformację 
    ## Fouriera oraz algorytm naiwny (tzn. bezpośrednio ze wzoru).
    using FFTW
    function dft(signal)
    
    N = length(signal)
    zeta = exp(-2*pi*im/N)
    
    [
    sum((
    signal[n + 1]*zeta^(n * f)
    for n in 0:(N - 1)
    ))
    for f in 0:(N - 1)
    ]
    
    end
    
    #from 2d lab problem 2.3
    using Random
    
    function complexSamplings(power)
    
    x = zeros(ComplexF64, 1000)
    
    for i in 1:1000
    x[i] = randn(ComplexF64) * sqrt(power)
    end
    return x
    
    end
    
    
    function dtft(signal)
    
    N = length(signal)
    zeta = exp(2*pi*im/N)
    
    [
    (1/N)*sum((
    signal[k + 1]*zeta^(k*f)
    for k in 0:(N - 1)
    ))
    for f in 0:(N - 1)
    ]
    
    end
    
    #test
    wektor = complexSamplings(0.25)
    signal_dft = dft(wektor)
    signal_julia_dft = fft(wektor)
    signal_dtft = dtft(signal_dft)
    
    #comparison of my dft and fft with using FFTW
    is_ap_wektor = isapprox(signal_dft, signal_julia_dft)
    
    minus = abs.(signal_dft - signal_julia_dft)
    
    #comparison of my dtft and dft
    is_ap_wektor = isapprox(signal_dtft, wektor)
    
    ## Problem 6.5 Zaimplementuj funkcję idft: ℂ^𝑁 → ℂ^𝑁 dla 𝑁 ∈ ℕ^+, 
    ## która przekształci dyskretny sygnał 𝑋 ∈ ℂ^𝑁 z domeny częstotliwości 
    ## (dwustronne dyskretne widmo częstotliwościowe) do odpowiadającego mu dyskretnego sygnału 𝑥 ∈ ℂ
    ## 𝑁 w domenie czasu. Do obliczenia tego przekształcenia wykorzystaj odwrotną dyskretną transformację
    ## Fouriera oraz algorytm naiwny (tzn. bezpośrednio ze wzoru).
    
    using FFTW
    
    function dtft(signal)
    
    N = length(signal)
    zeta = exp(2*pi*im/N)
    
    [
    (1/N)*sum((
    signal[k + 1]*zeta^(k*f)
    for k in 0:(N - 1)
    ))
    for f in 0:(N - 1)
    ]
    
    end
    
    
    #function from problem 6.4
    function dft(signal)
    
    N = length(signal)
    zeta = exp(-2*pi*im/N)
    
    [
    sum((
    signal[n + 1]*zeta^(n * f)
    for n in 0:(N - 1)
    ))
    for f in 0:(N - 1)
    ]
    
    end
    
    #from 2d lab problem 2.3
    using Random
    
    function complexSamplings(power)
    
    x = zeros(ComplexF64, 1000)
    
    for i in 1:1000
    x[i] = randn(ComplexF64) * sqrt(power)
    end
    return x
    
    end
    
    
    
    
    #test
    wektor = complexSamplings(0.25)
    signal_dft = dft(wektor)
    signal_julia_dft = fft(wektor)
    signal_dtft = dtft(signal_dft)
    
    #comparison of my dft and fft with using FFTW
    is_ap_wektor = isapprox(signal_dft, signal_julia_dft)
    
    minus = abs.(signal_dft - signal_julia_dft)
    
    #comparison of my dtft and dft
    is_ap_wektor = isapprox(signal_dtft, wektor)
    
    ## Problem 6.6 Zaimplementuj funkcję rdft: ℝ^𝑁 → ℂ^⌊𝑁/2]+1 dla 𝑁 ∈ ℕ^+, która przekształci
    ## dyskretny sygnał 𝑥 ∈ ℝ^𝑁 z domeny czasu do odpowiadającego mu dyskretnego sygnału 𝑋 ∈ ℂ^⌊𝑁/2]+1
    ## w domenie częstotliwości (jednostronne dyskretne widmo częstotliwościowe). 
    ## Do obliczenia tego przekształcenia wykorzystaj dyskretną transformację Fouriera oraz 
    ## algorytm naiwny (tzn. bezpośrednio ze wzoru).
    
    function rdft(signal)
    
    N = div(length(signal), 2) + 1
    zeta = exp(-2*pi*im / N)
    [
    sum((
    signal[n + 1]*zeta^(f*n)
    for n in 0:(N - 1)
    ))
    for f in 0:(N - 1)
    ]
    
    end
    
    ## Problem 6.7 Zaimplementuj funkcję irdft: ℂ^⌊𝑁/2]+1 → R^𝑁 dla 𝑁 ∈ ℕ^+, która przekształci
    ## dyskretny sygnał 𝑋 ∈ ℂ^⌊𝑁/2]+1 z domeny częstotliwości (jednostronne dyskretne widmo częstotliwościowe) 
    ## do odpowiadającego mu dyskretnego sygnału 𝑥 ∈ ℝ^𝑁 w domenie czasu.
    ## Do obliczenia tego przekształcenia wykorzystaj odwrotną dyskretną transformację Fouriera oraz 
    ## naiwny algorytm (tzn. bezpośrednio ze wzoru).
    ## idk czy to ten kod
    function dft(signal)
    
    N = length(signal)
    zeta = exp(-2*pi * im / N)
    
    [
    sum((
    signal[n + 1] * zeta^(n * f)
    for n in 0:(N - 1)
    ))
    for f in 0:(N - 1)
    ]
    
    end
    
    signal = [3,4,2,6]
    signal_dft = dft(signal)