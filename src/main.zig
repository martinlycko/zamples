const std = @import("std");
const testimport = @import("testmod");

pub fn main() !void {
    var answer = testimport.add(3, 7);
    answer = testimport.double(answer);
    std.debug.print("Answer is {}\n", .{answer});
    std.debug.print("Compiled\n", .{});
}
