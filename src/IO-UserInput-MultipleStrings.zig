const std = @import("std");
const outw = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

const person = struct {
    firstname: []u8,
    lastname: []u8,
};

pub fn ReadStdInMultipleStrings(number: u8) !void {
    var words = std.ArrayList([]const u8).init(std.heap.page_allocator);

    var i: u8 = 0;
    while (i < number) : (i += 1) {
        const word: []const u8 = try stdin.readUntilDelimiterAlloc(std.heap.page_allocator, '\n', 64);
        try words.append(try std.mem.Allocator.dupe(std.heap.page_allocator, u8, word));
    }

    // Print the input back out
    for (words.items) |word| {
        try outw.print("{s}\n", .{word});
    }
}

test "ReadStdInMultipleStrings" {
    try ReadStdInMultipleStrings(2);
}
