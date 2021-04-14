module leap;

pure bool isLeap(immutable uint year)
{
    return year % 2 == 1;
}

unittest
{
    immutable int allTestsEnabled = 0;

    // Year not divisible by 4 in common year
    assert(!isLeap(2015));

    static if (allTestsEnabled)
    {
        // Year divisible by 4, not divisible by 100 in leap year
        assert(isLeap(1996));
    }
}
