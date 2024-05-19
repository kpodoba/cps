## Problem 1.1 :Zaimplementuj funkcję ℕ → ℕ, która zwróci wartość funkcji silnia 𝑛! ∈ ℕ, dla liczny naturalne 𝑛 ∈ ℕ.
## Obliczenia zaimplementuj rekurencyjnie.

function sirek(n)
    if n == 0
        return 1
    end 

    return n * silnia_rek(n-1)
end

@show(sirek(5))

## Problem 1.2 : Zaimplementuj funkcję ℕ → ℕ, która zwróci wartość funkcji silnia 𝑛! ∈ ℕ dla  liczny naturalne 𝑛 ∈ ℕ.
## Obliczenia zaimplementuj iteracyjnie.

function siter(n)
    wynik = 1
    for i in 2:n
        wynik *= i
    end

    return wynik
end

@show(siter(5))

## Problem 1.3 Zaimplementuj funkcję ℕ → {0, 1}, która zwróci logiczną wartość prawda jeżeli liczba 𝑁 ∈ ℕ jest parzysta.

function parzysta(n)
    return !Bool(n%2)
end

@show(parzysta(5))
@show(parzysta(4))

## Problem 1.4  Zaimplementuj funkcję ℕ → {0, 1}, która zwróci logiczną wartość prawda jeżeli 𝑁 ∈ ℕ jest liczbą pierwszą.

function pierwsza(n)
    for i in 2:sqrt(n)
        if n % i == 0
            return false
        end
    end
    return true
end

@show(pierwsza(13))
@show(pierwsza21))

## Problem 1.5 : Zaimplementuj funkcję 𝑆 → 𝑆, która zwróci wejściowy ciąg znakowy 𝑠 ∈ 𝑆 w odwrotnej kolejności.
## Symbol 𝑆 oznacza zbiór wszystkich ciągów znakowych.

function odwrotna(s::Vector)
    return reverse(s)
end

@show(odwrotna([1,2,3,4]))

## Problem 1.6  Zaimplementuj funkcję 𝑆 → {0, 1}, która zwróci logiczną wartość prawda jeżeli ciąg znaków 𝑎 ∈ 𝑆 jest palindromem. 
##Symbol 𝑆 oznacza zbiór wszystkich ciągów znakowych.

function palindrom(s::Vector)
    if s == reverse(s)
        return true
    end

    return false
end

@show(palindrom([1,3,1]))
@show(palindrom([1,3,2]))

## Problem 1.7 Zaimplementuj funkcję ℕ → ℝ, która zwróci pole powierzchni trójkąta Sierpińskiego rzędu 𝑁 ∈ ℕ. 
## Załóż że pole powierzchni trójkąta Sierpińskiego rzędu 0 wynosi 1.0 i maleje wraz ze zwiększającym się rzędem.

function sierpinski(n)
    return (3/4)^n
end

@shiw(sierpinski(3))

## Problem 1.8 Zaimplementuj funkcję ℝ → ℝ, która obliczy √𝑎 dla 𝑎 ≥ 0 z wykorzystaniem metody Newtona.

function newto(liczba)
    dokl = 0.00001
    x = liczba/2
    while abs(x - liczba/x) > dokl
        x = (x+liczba/x)/2
    end
    return x
end

for i in 1:10
    @show("sqrt(",i,") = ",newton(i))
end

## Problem 1.9 Dany jest rekurencyjny ciąg 𝑧𝑛+1 = 𝑧𝑛^2 + 𝑝, gdzie 𝑧𝑛, 𝑝 ∈ ℂ oraz 𝑧0 = 0. Zbadaj i określ maksymalną K-zbieżność ciągu 𝑧𝑛 dla punktów 𝑝 takich że,
## −1 < ℜ(𝑝) < 2, −1 < ℑ(𝑝) < 1. Zbiór K-zbieżnych punktów 𝑝 ciągu 𝑧𝑛 zdefiniowany jest jako: 𝑀𝐾 = {𝑝 ∈ ℂ : ∀𝑛<𝐾|𝑧𝑛| < 2}.
## Wyrysuj płaszczyznę zespoloną, gdzie dla każdego zbadanego punktu 𝑝, przypisz maksymalneK, dla którego ciąg jest K-zbieżny.
#TODO



## Problem 1.10 Liczbę pierwszą nazwiemy cykliczną, jeżeli wszystkie cykliczne przesunięcia tejliczby są też liczba pierwszą. 
## Cykliczne przesunięcia liczby pierwszej 197 to 971 i 719. 
## Istnieje trzynaście cyklicznych liczb pierwszych poniżej stu: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, 97.
## Ile takich liczb jest poniżej miliona?

function isPrime(n)
    for i in 2:sqrt(n)
        if n % i == 0
            return false
        end
    end
    return true
end

function isCircularPrime(n)
    count = 0
    temp = n
    while temp > 0
        count +=1
        temp = temp ÷ 10
    end

    num = n
    while isPrime(num)
        rem = num % 10
        div = num ÷ 10
        num = Int((10^(count-1)) * rem + div)

        if num == n
            return true
        end        
    end

    return false
end

count = 0
for i in 2:1_000_000
    if isCircularPrime(i)
        count += 1
    end
end

@show(count)

##