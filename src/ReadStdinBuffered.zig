const std = @import("std");
const outw = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();

pub fn ReadStdInBuffered() !void {
    // Reads up to 10 characters from the terminal (including new line characters, so 8 user-input?)
    var input: [10]u8 = undefined;
    _ = try stdin.readUntilDelimiter(&input, '\n');

    // Print the input line back out
    try outw.print("Your input was: {s}\n", .{input});
}

test "ReadStdInBuffered" {
    try ReadStdInBuffered();
}
