using Gee;

public class Coordinate : Object, Comparable<Coordinate>, Hashable<Coordinate> {
    public enum Row {
        R1, R2, R3, R4, R5, R6, R7, R8;

        public string to_string() {
            switch (this) {
                case R1: return "1";
                case R2: return "2";
                case R3: return "3";
                case R4: return "4";
                case R5: return "5";
                case R6: return "6";
                case R7: return "7";
                case R8: return "8";
                default: assert_not_reached();
            }
        }

        public static Row from_string(string row) {
            switch (row) {
                case "1": return R1;
                case "2": return R2;
                case "3": return R3;
                case "4": return R4;
                case "5": return R5;
                case "6": return R6;
                case "7": return R7;
                case "8": return R8;
                default: assert_not_reached();
            }
        }

        public bool is_before(Row row) {
            return this > row;
        }

        public bool is_after(Row row) {
            return this < row;
        }

        public bool is_first() {
            return this == R1;
        }

        public bool is_last() {
            return this == R8;
        }

        public Row next() {
            if(is_last()) return this;
            return this + 1;
        }

        public Row prev() {
            if(is_first()) return this;
            return this - 1;
        }

        public static Row[] all() {
            return { R1, R2, R3, R4, R5, R6, R7, R8 };
        }
    }

    public enum Column {
        CA, CB, CC, CD, CE, CF, CG, CH;

        public string to_string() {
            switch (this) {
                case CA: return "A";
                case CB: return "B";
                case CC: return "C";
                case CD: return "D";
                case CE: return "E";
                case CF: return "F";
                case CG: return "G";
                case CH: return "H";
                default: assert_not_reached();
            }
        }

        public static Column from_string(string col) {
            switch (col) {
                case "A": return CA;
                case "B": return CB;
                case "C": return CC;
                case "D": return CD;
                case "E": return CE;
                case "F": return CF;
                case "G": return CG;
                case "H": return CH;
                default: assert_not_reached();
            }
        }

        public bool is_before(Column col) {
            return this > col;
        }

        public bool is_after(Column col) {
            return this < col;
        }

        public bool is_first() {
            return this == CA;
        }

        public bool is_last() {
            return this == CH;
        }

        public Column next() {
            if(is_last()) return this;
            return this + 1;
        }

        public Column prev() {
            if(is_first()) return this;
            return this - 1;
        }

        public static Column[] all() {
            return { CA, CB, CC, CD, CE, CF, CG, CH };
        }
    }

    public Row row { get; set; }
    public Column column { get; set; }

    public Coordinate(Row row, Column column) {
        this.row = row;
        this.column = column;
    }

    // public Coordinate(string row, string column) {
    //     this.row = Coordinate.Row.from_string(row);
    //     this.column = Coordinate.Colum.from_string(column);
    // }

    // Checks
    public bool is_last_row {
        get { return this.row.is_last(); }
    }

    public bool is_first_row {
        get { return this.row.is_first(); }
    }

    public bool is_last_column {
        get { return this.column.is_last(); }
    }

    public bool is_first_column {
        get { return this.column.is_first(); }
    }

    // Operations
    public Coordinate top() {
        return new Coordinate(this.row.next(), this.column);
    }

    public Coordinate bottom() {
        return new Coordinate(this.row.prev(), this.column);
    }

    public Coordinate right() {
        return new Coordinate(this.row, this.column.next());
    }

    public Coordinate left() {
        return new Coordinate(this.row, this.column.prev());
    }

    public Coordinate top_right() {
        return new Coordinate(this.row.next(), this.column.next());
    }

    public Coordinate bottom_right() {
        return new Coordinate(this.row.prev(), this.column.next());
    }

    public Coordinate top_left() {
        return new Coordinate(this.row.next(), this.column.prev());
    }

    public Coordinate bottom_left() {
        return new Coordinate(this.row.prev(), this.column.prev());
    }

    // Misc
    public Coordinate clone() {
        return new Coordinate(this.row, this.column);
    }

    public bool equal_to (Coordinate c) {
        return this.row == c.row && this.column == c.column;
    }

    public int compare_to (Coordinate object) {
        return this.equal_to(object) ? 0 : -1;
    }

    public uint hash () {
        return (uint)(this.column + (this.row * 10)) & 0xffff;
    }

    public string to_string() {
        return this.row.to_string() + this.column.to_string();
    }
}
