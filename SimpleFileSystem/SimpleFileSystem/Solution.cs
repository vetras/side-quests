//
// File System Exercise:
//
// 1. We are creating a little virtual filesystem called SimpleFS. You don't have to worry about how it's laid out on disk, but you will have access to a series of blocks.
//    Each block has a next pointer to the next one and can contain up to 8 bytes or characters of data. The filesystem has a fixed size.
//    You can initialize it with 5 blocks, for example.
// 2. Write a Print() function to show it in its empty state. Use arrows to show the connections between the blocks.
//    Don't print a trailing arrow. `[] -> [] -> []`
// 3. Create a Write(data string) function that adds to the end of the free space in the filesystem.
//    It takes only strings that are **multiples of 8**. Handle reasonable errors:
//     1. empty write
//     2. write beyond the end
//     3. write a string that's not a multiple of 8 bytes
//

namespace SimpleFileSystem;

public static class Solution
{
    static void Main(string[] args)
    {
        var fileSystem = new Node();

        var currentNode = fileSystem;
        for (var i = 0; i < 5; i++)
        {
            currentNode.Next = new Node();

            currentNode = currentNode.Next;
        }

        // Answer to question 1 and 2
        Console.WriteLine(fileSystem.Read());

        // Answer to question 3
        fileSystem.Write("1234567812345678");
        Console.WriteLine(fileSystem.Read());

        // Answer to question 3.1
        try
        {
            fileSystem.Write("");
        }
        catch (Exception e)
        {
            Console.WriteLine($" --> PASS: Can´t write empty data to the File System: '{e.Message}'");
        }

        // Answer to question 3.2
        try
        {
            fileSystem.Write("12345678123456781234567812345678123456781234567812345678123456781234567812345678");
        }
        catch (Exception e)
        {
            Console.WriteLine($" --> PASS: Can´t write data write beyond the end of the File System: '{e.Message}'");
        }

        // Answer to question 3.3
        try
        {
            fileSystem.Write("12");
        }
        catch (Exception e)
        {
            Console.WriteLine($" --> PASS: Can´t write data that is not a multiple of 8: '{e.Message}'");
        }
    }
}