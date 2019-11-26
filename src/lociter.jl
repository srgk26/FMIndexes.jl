struct LocationIterator{w,T}
    range::UnitRange{Int}
    index::FMIndex{w,T}
end

Base.length(iter::LocationIterator) = length(iter.range)
@inline function Base.iterate(iter::LocationIterator, state=1)
    if i >= length(iter.range)
        return nothing
    end

    return (sa_value(iter.range[i], iter.index) + 1, state + 1)
end
