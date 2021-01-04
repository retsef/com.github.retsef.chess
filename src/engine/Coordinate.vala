public class Coordinate {
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

    public Row row;
    public Column column;

    public Coordinate(Row row, Column column) {
        this.row = row;
        this.column = column;
    }


    public bool equals(Object obj) {
        if(obj == null) return false;
        //if(this.getClass()!=obj.getClass()) return false;

        Coordinate c = (Coordinate) obj;
        return this.row == c.row && this.column == c.column;
    }



    public string to_string() {
        return this.row.to_string() + this.column.to_string();
    }

}
