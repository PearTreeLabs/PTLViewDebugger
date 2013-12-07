# PTLViewDebugger

## Description
Useful tools for debugging your view layouts.

When a view looks a bit out of place, but you can't be tell why, use PTLViewDebugger to figure it out.  Using [`recursiveDescription`](https://developer.apple.com/library/ios/technotes/tn2239/_index.html) helps a bit, but it can be hard to find the view you were looking for in the resulting wall of text.  Supplement it with `ptl_showDebugBorder` and `ptl_recursiveDescription` to visually map a view's border color to it's description.

## Usage
### In Code

        [view ptl_showDebugBorder:YES];
        NSLog(@"%@", [view ptl_recursiveDescription]);

### In Debugger

- Pause the execution
- Find the address of view you want to debug

        [0x12345678 ptl_showDebugBorder:YES]
        [view ptl_recursiveDescription]

- Resume execution so the view updates to display the style

### Output

In app:

![Colored Table Cells](Screenshots/app.png)

In Xcode debugger:

![Colored LLDB Output](Screenshots/xcode.png)

## Dependencies
- [XcodeColors](https://github.com/robbiehanson/XcodeColors) plugin

## License
[MIT](LICENSE.txt)

## Contact
[Brian Partridge](http://brianpartridge.name) - @brianpartridge on [Twitter](http://twitter.com/brianpartridge) and [App.Net](http://alpha.app.net/brianpartridge)