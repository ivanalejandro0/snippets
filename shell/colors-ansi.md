# ANSI colors

## Understanding the Syntax Breakdowns
`\033` (or `\e`, `\x1b`): The Escape character that triggers the ANSI sequence.
`[:` The Control Sequence Introducer.
`0;`: Specifies the text style (0 for normal, 1 for bold, 4 for underline).
`31`: The specific foreground color value (e.g., Red).
`m`: Terminates the color modification sequence.
`\033[0m`: reset code.

Always place the reset code at the end of the string to prevent the color from bleeding into the rest of the terminal line.

## Advanced Color Palettes
If your terminal supports expanded color ranges, you can use 256-color lookups
or 24-bit True Color:

256-Color Palette: Use `\033[38;5;<CODE>m` where `<CODE>` ranges from 0 to 255.

    printf "\033[38;5;208mPeach/Orange Text\033[0m\n"

True Color (RGB): Use `\033[38;2;<R>;<G>;<B>m` where R, G, and B are 0 to 255.

    printf "\033[38;2;255;100;0mCustom RGB Text\033[0m\n"

