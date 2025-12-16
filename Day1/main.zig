const std = @import("std");

pub fn main() !void
{
    const allocator = std.heap.page_allocator;

    const file_contents = try readFile("Day1/input.txt", allocator);
    defer allocator.free(file_contents);
    var dial_index: u32 = 50;
    var dialAtZero: u8 = 0;
    const example_inputs = [_][]const u8{
        "L68",
        "L30",
        "R48",
        "L5",
        "R60",
        "L55",
        "L1",
        "L99",
        "R14",
        "L82",
    };

    var input_count = example_inputs.len;

    for (example_inputs) |i| {
        var parsed = parseInput(i);
        var isZero = turnDial(dial_index, parsed.bool, parsed.move_amount);
        if (isZero) {
            dialAtZero += 1;
        }
    }
}

fn readFile(file_path: []const u8, allocator: std.mem.Allocator) ![]u8 {

    var file = try std.fs.cwd().openFile(file_path, .{});
    var reader = file.reader(&.{});
    return reader.interface.allocRemaining(allocator, .unlimited);
}

// input current index, direction as a bool and movement amount, export bool if lands on 0
fn turnDial(current_index: u32, direction: bool, move_amount: u32) bool {

}
// take in input, output move_amount and left or right as a bool
fn parseInput(input: u8) [u32, bool] {

}