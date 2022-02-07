using Xunit;

namespace UnitTests;

public class FileSystemReadTests : FileSystemBase
{
    [Fact]
    public void CanPrintEmptyFileSystem()
    {
        Assert.Equal("[] -> [] -> [] -> [] -> []", sut.Read());
    }

    [Fact]
    public void CanPrintContentsOfTheFileSystem()
    {
        sut.Write("12345678qwertyui");

        Assert.Equal("[12345678] -> [qwertyui] -> [] -> [] -> []", sut.Read());
    }
}