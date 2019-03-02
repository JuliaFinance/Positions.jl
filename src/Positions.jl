module Positions

using Reexport
@reexport using FinancialInstruments
export Position

struct Position{F<:FinancialInstrument,A<:Real}
    amount::A
end
Position(p::FI,a::A) where FI where A = Position{typeof(p),typeof(a)}(a)

Base.:+(p1::Position{FI,A},p2::Position{FI,A}) where FI where A = Position{FI,A}(p1.amount+p2.amount)
Base.:-(p1::Position{FI,A},p2::Position{FI,A}) where FI where A = Position{FI,A}(p1.amount-p2.amount)

Base.:/(p1::Position{FI,A},p2::Position{FI,A}) where FI where A = p1.amount/p2.amount
Base.:/(p::Position{FI,A},k::R) where FI where A where R<:Real = Position{FI,A}(p.amount/k)

Base.:*(k::R,p::Position{FI,A}) where FI where A where R<:Real = Position{FI,A}(p.amount*k)
Base.:*(p::Position{FI,A},k::R) where FI where A where R<:Real = k*p

Base.show(io::IO,c::Position{Cash{C}}) where C = print(io,c.amount," ",C())
Base.show(io::IO,::MIME"text/plain",c::Position{Cash{C}}) where C = print(io,c.amount," ",C())

end # module
