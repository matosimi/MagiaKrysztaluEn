#!/usr/bin/env python3
"""
Binary file decoder for Atari custom text encoding with MADS assembler output.
Converts binary data with custom character mappings to MADS-format assembly code.

Usage:
    python decode_bytes.py <filename> [alignment] [--polish] [--underscores]

Parameters:
    filename:     Path to binary file to decode
    alignment:    Number of bytes per line (default: 32, e.g., 16, 17, 40, 64)
    --polish:     Use Polish character mappings (Ł, Ś, Ć, Ę, Ń)
    --underscores: Replace unknown characters with underscore "_"

Character Encoding Reference:
    0x00        = space
    0x01-0x08   = ! " # $ % ^ & *
    0x09-0x0A   = ( )
    0x0C        = ,
    0x0E        = .
    0x10-0x19   = 0-9
    0x1A        = :
    0x21-0x3A   = A-Z
    0x61-0x7A   = a-z

Examples:
    python decode_bytes.py 4699.dat 17 --polish
    python decode_bytes.py 3d33.dat 64 --polish --underscores
    python decode_bytes.py data.bin
    python decode_bytes.py data.bin 40 --underscores
"""

import sys
import os

class ByteDecoder:
    """Custom text decoder for Atari game files with MADS output."""

    def __init__(self, use_polish=False, use_underscores=False):
        """
        Initialize character mapping.

        Args:
            use_polish: Use Polish character mappings
            use_underscores: Replace unknown chars with underscore
        """
        self.use_polish = use_polish
        self.use_underscores = use_underscores

        # Direct byte-to-character mappings for symbols
        self.symbol_map = {
            0x00: ' ',      # space
            0x01: '!',      # exclamation mark
            0x02: '"',      # double quote
            0x03: '#',      # hash
            0x04: '$',      # dollar
            0x05: '%',      # percentage
            0x06: '^',      # caret
            0x07: '&',      # ampersand
            0x08: '*',      # asterisk
            0x09: '(',      # left parenthesis
            0x0A: ')',      # right parenthesis
            0x0C: ',',      # comma
            0x0D: '-',      # dash/hyphen
            0x0E: '.',      # period
            0x1A: ':',      # colon
        }

        # Polish character mappings (overrides symbol_map when use_polish=True)
        self.polish_char_map = {
            0x03: 'Ć',      # Polish C with acute
            0x04: 'Ę',      # Polish E with ogonek
            0x06: 'Ń',      # Polish N with acute
            0x0D: 'Ś',      # Polish S with acute
            0x3E: 'Ł',      # Polish L with stroke
        }

    def decode_byte(self, byte_val):
        """
        Decode a single byte to its character representation.

        Args:
            byte_val: Integer value (0-255)

        Returns:
            String: The decoded character, or None if unknown and using hex format
        """
        # Check Polish character map first (if enabled)
        if self.use_polish and byte_val in self.polish_char_map:
            return self.polish_char_map[byte_val]

        # Check symbol map
        if byte_val in self.symbol_map:
            return self.symbol_map[byte_val]

        # Numbers: 0x10-0x19 map to '0'-'9'
        if 0x10 <= byte_val <= 0x19:
            return str(byte_val - 0x10)

        # Uppercase letters: 0x21-0x3A map to 'A'-'Z'
        if 0x21 <= byte_val <= 0x3A:
            return chr(ord('A') + (byte_val - 0x21))

        # Lowercase letters: 0x61-0x7A map to 'a'-'z'
        if 0x61 <= byte_val <= 0x7A:
            return chr(ord('a') + (byte_val - 0x61))

        # Unknown byte
        if self.use_underscores:
            return '_'
        else:
            return None  # Return None to signal raw hex output needed

    def decode_file_to_mads(self, filename, alignment):
        """
        Decode a binary file and generate MADS assembler output.

        Args:
            filename: Path to the binary file
            alignment: Number of bytes per output line

        Returns:
            List of strings (output lines in MADS format)
        """
        if not os.path.exists(filename):
            raise FileNotFoundError(f"File not found: {filename}")

        with open(filename, 'rb') as f:
            data = f.read()

        output_lines = []
        byte_index = 0

        while byte_index < len(data):
            # Process one line (alignment bytes)
            line_end = min(byte_index + alignment, len(data))
            line_bytes = data[byte_index:line_end]

            # Build parts for this line
            parts = []  # List of (type, value) tuples: ('string', text) or ('hex', byte_val)
            current_string = ''

            for byte_val in line_bytes:
                char = self.decode_byte(byte_val)

                if char is not None:
                    # Known character - add to current string
                    current_string += char
                else:
                    # Unknown byte - flush current string and add hex
                    if current_string:
                        parts.append(('string', current_string))
                        current_string = ''
                    parts.append(('hex', byte_val))

            # Flush remaining string
            if current_string:
                parts.append(('string', current_string))

            # Build MADS output line
            if parts:
                mads_line = self._build_mads_line(parts)
                output_lines.append(mads_line)

            byte_index = line_end

        return output_lines

    def _build_mads_line(self, parts):
        """
        Build a MADS format line from parts.

        Args:
            parts: List of (type, value) tuples

        Returns:
            String in format: \tdta d'...'  or  \tdta d'...',$xx,...
        """
        line_parts = []

        for part_type, value in parts:
            if part_type == 'string':
                line_parts.append(f"d'{value}'")
            elif part_type == 'hex':
                line_parts.append(f"${value:02x}")

        # Join with comma
        mads_content = ','.join(line_parts)

        return f"\tdta {mads_content}"

def main():
    """Main entry point."""
    if len(sys.argv) < 2:
        print("Atari Binary File Decoder - MADS Output")
        print("=" * 55)
        print("\nUsage: python decode_bytes.py <filename> [alignment] [--polish] [--underscores]")
        print("\nParameters:")
        print("  filename:      Path to binary file to decode")
        print("  alignment:     Bytes per line (default: 32, e.g., 16, 17, 40, 64)")
        print("  --polish:      Use Polish character mappings (Ł, Ś, Ć, Ę, Ń)")
        print("  --underscores: Replace unknown chars with underscore '_'")
        print("\nOutput Format (MADS Assembly):")
        print("  \\tdta d'text'              - Known characters only")
        print("  \\tdta d'text',$fe,$ec      - Mixed text and hex bytes")
        print("\nExamples:")
        print("  python decode_bytes.py 4699.dat 17 --polish")
        print("  python decode_bytes.py 3d33.dat 64 --polish --underscores")
        print("  python decode_bytes.py data.bin --underscores")
        print("  python decode_bytes.py data.bin 40")
        sys.exit(1)

    filename = sys.argv[1]
    use_polish = '--polish' in sys.argv
    use_underscores = '--underscores' in sys.argv
    alignment = 32  # Default

    # Parse alignment parameter
    for arg in sys.argv[2:]:
        if not arg.startswith('--'):
            try:
                alignment = int(arg)
                if alignment <= 0:
                    raise ValueError()
                break
            except ValueError:
                print(f"Error: Invalid alignment value '{arg}'. Must be a positive integer.")
                sys.exit(1)

    try:
        decoder = ByteDecoder(use_polish=use_polish, use_underscores=use_underscores)
        lines = decoder.decode_file_to_mads(filename, alignment)

        # Print output
        for line in lines:
            print(line)

        # Print summary as comment
        total_bytes = os.path.getsize(filename)
        total_lines = len(lines)
        flags = []
        if use_polish:
            flags.append("polish")
        if use_underscores:
            flags.append("underscores")

        print(f"; Total: {total_bytes} bytes, {total_lines} lines, alignment: {alignment}" +
              (f", flags: {', '.join(flags)}" if flags else ""))

    except FileNotFoundError as e:
        print(f"Error: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == '__main__':
    main()
