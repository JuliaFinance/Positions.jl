module Positions

using Reexport
@reexport using FinancialInstruments
export Position

struct Position{F<:FinancialInstrument,A<:Real}
    amount::A
end
Position(p::FI,a::A) where FI where A = Position{typeof(p)}(a)

Base.:+(p1::Position{FI},p2::Position{FI}) where FI = Position{FI}(p1.amount+p2.amount)
Base.:-(p1::Position{FI},p2::Position{FI}) where FI = Position{FI}(p1.amount-p2.amount)

Base.:/(p1::Position{FI},p2::Position{FI}) where FI = p1.amount/p2.amount
Base.:/(p::Position{FI},k::R) where FI where R<:Real = Position{FI}(p.amount/k)

Base.:*(p::Position{FI},k::R) where FI where R<:Real = Position{FI}(p.amount*k)
Base.:*(k::R,p::Position{FI}) where FI where R<:Real = p*k

end # module
