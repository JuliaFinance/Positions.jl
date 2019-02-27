module Positions

using Reexport
@reexport using FinancialInstruments
export Position

struct Position{F<:FinancialInstrument}
    amount::Float64
end
Position(p::FI,a::Float64) where FI<:FinancialInstrument = Position{typeof(p)}(a)

Base.:+(p1::Position{FI},p2::Position{FI}) where FI<:FinancialInstrument = Position{FI}(p1.amount+p2.amount)
Base.:-(p1::Position{FI},p2::Position{FI}) where FI<:FinancialInstrument = Position{FI}(p1.amount-p2.amount)

Base.:/(p1::Position{FI},p2::Position{FI}) where FI<:FinancialInstrument = p1.amount/p2.amount
Base.:/(p::Position{FI},k::R) where FI<:FinancialInstrument where R<:Real = Position{FI}(c.amount/k)

Base.:*(p::Position{FI},k::R) where FI<:FinancialInstrument where R<:Real = Position{FI}(p.amount*k)
Base.:*(k::R,p::Position{FI}) where FI<:FinancialInstrument where R<:Real = p*k

end # module
