## Problem 8.1: Poniżej dane są dyskretne systemy, gdzie 𝑥[𝑛] oraz 𝑦[𝑛] oznacza odpowienio 
## ciąg wejściowy oraz ciąg wyjściowy. Określ dany system jest liniowy oraz niezmienny w 
## czasie.
## a) 𝑦[𝑛] = 2𝑥[𝑛] + 3
## b) 𝑦[𝑛] = 𝑥[𝑛]sin(2𝜋/7 * 𝑛 + 𝜋/6)
## c) 𝑦[𝑛] = 𝑥^2[𝑛]
## d) 𝑦[𝑛] = ∑^n (udolu)𝑚=−∞ 𝑥[𝑚]


## Problem 8.2: Dana jest ciąg 𝑥[𝑛] który reprezentuje ciąg przetwarzany przez system oraz ℎ[𝑛]
## będącą ciągiem odpowiadającym odpowiedzi impulsowej systemu. Wyznacz ciąg wyjściowy z
## systemu dany jako 𝑦[𝑛] = ℎ[𝑛] ∗ 𝑥[𝑛].
## a) 𝑥[𝑛] = 𝛿[𝑛] + 2𝛿[𝑛 − 1] + 𝛿[𝑛 − 2]
## ℎ[𝑛] = 𝑢[𝑛]
## b) 𝑥[𝑛] = 𝛿[𝑛 + 2] + 2𝛿[𝑛 + 1] + 𝛿[𝑛] + 𝛿[𝑛 − 1] + 𝛿[𝑛 − 2]
## ℎ[𝑛] = 𝛿[𝑛 + 2]
## c) 𝑥[𝑛] = 𝛼       𝑛𝑢[𝑛] 0 < 𝛼 < 1
## ℎ[𝑛] = 𝛽       𝑛𝑢[𝑛] 0 < 𝛽 < 1 ∧ 𝛽 ≠ 𝛼
## d) 𝑥[𝑛] = 𝑢[𝑛]
## ℎ[𝑛] = 𝛿[𝑛 − 2] − 𝛿[𝑛 − 3]


## Problem 8.3: Sprawdź czy system o danej odpowiedzi impulsowej ℎ[𝑛] jest stabilny.
## a) ℎ[𝑛] = 𝛿[𝑛 + 2]
## b) ℎ[𝑛] = (1/2)^𝑛 𝑢[𝑛]
## c) ℎ[𝑛] = 2^𝑛 * 𝑢[−𝑛]


## Problem 8.4: Oblicz odwrotną 𝒵-transformację poniższych systemów. Załóż że każdy z tych
## systemów jest liniowy, niezmienny w czasie, oraz przyczynowy.
## a) H(z) = (1-z^-1)/(1+1/2 * z^-1).....


## Problem 8.5: Ciąg Fibonacciego to rekurencyjny ciąg którego dwa pierwsze elementy przyjmują
## odpowiednio wartość 0 i 1, a kolejne elementy są wyrażone jako suma dwóch poprzednich
## elementów.
## a) Zaprojektuj równanie różnicowe opisujące system, który będzie generował na wyjściu ciąg
## Fibonacciego, to znaczy 𝑦[0] = 0, 𝑦[1] = 1, 𝑦[2] = 1, 𝑦[3] = 2 i tak dalej. 
## Przyjmij że wymuszeniu na wejściu systemy wynosi 𝑥[𝑛] = 0.
## b) Korzystająć z 𝒵-transformacji znajdź rozwiązanie tego równiania różnicowego, 
## tzn. nierekurencyjną zależnoźć na 𝑦[n].


## Problem 8.6: Dany jest system opisany następującym równaniem różnicowym:
## 12𝑦[𝑛] = 7𝑦[𝑛 − 1] − 𝑦[𝑛 − 2] − 12𝑥[𝑛] + 5𝑥[𝑛 − 1].
## Wiadomo że system ten składa się z dwóch niezależnych od siebie podsystemów o odpowiedziach
## impulsowych ℎ1 oraz ℎ2. Strukturę tego systemu można przedstawić następującym równaniem:
# 𝑦[𝑛] = ℎ1[𝑛] ∗ 𝑥[𝑛] + ℎ2[𝑛] ∗ 𝑥[𝑛].
## Wyznacz ℎ2[𝑛] przy założeniu że odpowiedź impulsowa ℎ1jest znana i wynosi:
## ℎ1[𝑛] = (1/3)^n * 𝑢[𝑛].


## Problem 8.7: Jeżeli sygnał wyjściowy 𝑦[𝑛] danego systemu jest wprost proporcjonalny do 
## sygnały wejściego 𝑥[𝑛], to 𝑥[𝑛] będzie tzn. funkcją własną tego systemu.
## Pokaż że sygnał 𝑥𝑒[𝑛] = 𝑧^𝑛 dla stałej 𝑧 ∈ ℂ jest funkcją własną liniowego oraz
## niezależnoego w czasie dyskretnego systemu,


## Problem 8.8: Rozważ przyczynowy, ciągły w czasie system o odpowiedzi impulsowej ℎ(𝑡) oraz
## transmitancji
## 𝐻(𝑠) = (𝑠 + 𝑎)/(𝑠 + 1)^2 + 𝑏^2.
## Korzystającz z metody niezmienności odpowiedzi impulsowej wyznacz 𝐻(𝑧) dyskretnego systemu,
## tak aby ℎ[𝑛] = ℎ(𝑛𝑇 ).