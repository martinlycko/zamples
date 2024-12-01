const std = @import("std");
const Allocator = std.mem.Allocator;

const mystruct = struct {
    name: []const u8,
    age: i8,
};

pub fn JSONRead() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();

    const jsondata = try std.fs.cwd().readFileAlloc(allocator, "outputs/output.json", 512);
    defer allocator.free(jsondata);

    const parsed_me = try std.json.parseFromSlice(mystruct, allocator, jsondata, .{ .allocate = .alloc_always });

    const me = parsed_me.value;

    std.debug.print("I am {s} and {} years old\n", .{ me.name, me.age });
}

test "JSONRead" {
    try JSONRead();
}
