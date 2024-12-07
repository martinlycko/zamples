const std = @import("std");
const testimport = @import("testmod");

pub fn main() !void {
    std.debug.print("Answer is {}\n", .{testimport.add(3, 7)});
    std.debug.print("Compiled\n", .{});
}
