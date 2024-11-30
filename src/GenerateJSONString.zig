const std = @import("std");

const mystruct = struct {
    name: []const u8,
    age: i8,
};

pub fn JSONString() !void {
    const me = mystruct{
        .name = "Me",
        .age = 30,
    };
    var buf: [100]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buf);
    var string = std.ArrayList(u8).init(fba.allocator());
    try std.json.stringify(me, .{}, string.writer());
    std.debug.print("{s}", .{string.items});
}

test "ReadStdInBuffered" {
    try JSONString();
}
