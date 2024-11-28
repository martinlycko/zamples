const std = @import("std");
const outw = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

pub fn ReadStdInAlloc() !void {
    // Reads an unbuffered input string from the terminal into input up to 8192 (bytes?)
    const input = try stdin.readUntilDelimiterAlloc(std.heap.page_allocator, '\n', 8192);
    defer std.heap.page_allocator.free(input);

    // Print the input back out
    try outw.print("Your input was: {s}\n", .{input});
}

test "ReadStdInAlloc" {
    try ReadStdInAlloc();
}
