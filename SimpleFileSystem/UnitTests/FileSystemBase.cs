using SimpleFileSystem;

namespace UnitTests;

public abstract class FileSystemBase
{
    // System Under Test -- http://xunitpatterns.com/SUT.html
    protected readonly Node sut;

    protected FileSystemBase()
    {
        sut = new Node();

        var currentNode = sut;
        for (var i = 0; i < 5; i++)
        {
            currentNode.Next = new Node();
            currentNode = currentNode.Next;
        }
    }
}