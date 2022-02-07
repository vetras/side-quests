using System.Text;

namespace SimpleFileSystem;

public class Node
{
    public Node Next { get; set; } = null!;

    private string Block { get; set; } = string.Empty;

    public void Write(string data)
    {
        if (string.IsNullOrEmpty(data) || data.Length % SimpleFileSystemOptions.CHUNK_SIZE != 0)
        {
            throw new Exception("Invalid data to write");
        }

        var nbrOfChunks = data.Length / SimpleFileSystemOptions.CHUNK_SIZE;

        if (!hasFreeSpace(nbrOfChunks))
        {
            throw new Exception("There is not enough space on the file system");
        }

        var current = this;

        var ptr = 0;
        for (var i = 1; i <= nbrOfChunks; i++)
        {
            var chunk = data.Substring(ptr, SimpleFileSystemOptions.CHUNK_SIZE);

            ptr = 8 * i;

            current.Block = chunk;
            current = current.Next;
        }
    }

    public string Read()
    {
        var sb = new StringBuilder();

        var currentNode = this;

        while (currentNode.Next != null)
        {
            sb.Append(currentNode.Print());

            currentNode = currentNode.Next;

            if (currentNode.Next != null)
            {
                sb.Append(SimpleFileSystemOptions.ARROW);
            }
        }
        return sb.ToString();
    }

    private string Print()
    {
        return $"[{Block}]";
    }

    private bool hasFreeSpace(int nbrOfChunks)
    {
        var currentNode = this;
        var nbrOfNodes = 0;

        while (currentNode.Next != null)
        {
            nbrOfNodes++;
            currentNode = currentNode.Next;
        }

        return nbrOfChunks <= nbrOfNodes;
    }
}