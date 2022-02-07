using System;
using Xunit;

namespace UnitTests;

public class FileSystemWriteTests : FileSystemBase
{
    [Theory]
    [InlineData(null)]
    [InlineData("")]
    public void WriteValidatesEmptyInputData(string input)
    {
        Assert.Throws<Exception>(() => sut.Write(input));
    }

    [Fact]
    public void WriteChecksForAvailableSpace()
    {
        var input = "123456781234567812345678123456781234567812345678";

        Assert.Throws<Exception>(() => sut.Write(input));
    }

    [Theory]
    [InlineData("12")]
    [InlineData("123456789")]
    public void WriteChecksMultiplesOfEight(string input)
    {
        Assert.Throws<Exception>(() => sut.Write(input));
    }
}