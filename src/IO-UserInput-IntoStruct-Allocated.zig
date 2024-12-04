const std = @import("std");
const outw = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

const person = struct {
    firstname: []u8,
    lastname: []u8,
};

pub fn ReadStdInIntoStruct() !void {
    // Reads an unbuffered input string from the terminal into input up to 8192 (bytes?)
    const fname = try stdin.readUntilDelimiterAlloc(std.heap.page_allocator, '\n', 64);
    defer std.heap.page_allocator.free(fname);

    const lname = try stdin.readUntilDelimiterAlloc(std.heap.page_allocator, '\n', 64);
    defer std.heap.page_allocator.free(lname);

    const me = person{
        .firstname = fname,
        .lastname = lname,
    };

    // Print the input back out
    try outw.print("You are: {s} {s}\n", .{ me.firstname, me.lastname });
}

test "ReadStdInAlloc" {
    try ReadStdInIntoStruct();
}
