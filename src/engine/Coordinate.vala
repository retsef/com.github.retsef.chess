public class Coordinate {
    public enum Row {
        RA, RB, RC, RD, RE, RF, RG, RH;

        public string to_string() {
            switch (this) {
                case RA: return "A";
                case RB: return "B";
                case RC: return "C";
                case RD: return "D";
                case RE: return "E";
                case RF: return "F";
                case RG: return "G";
                case RH: return "H";
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
            return this == RA;
        }

        public bool is_last() {
            return this == RH;
        }

        public static Row[] all() {
            return { RA, RB, RC, RD, RE, RF, RG, RH };
        }
    }

    public enum Column {
        C1, C2, C3, C4, C5, C6, C7, C8;

        public string to_string() {
            switch (this) {
                case C1: return "1";
                case C2: return "2";
                case C3: return "3";
                case C4: return "4";
                case C5: return "5";
                case C6: return "6";
                case C7: return "7";
                case C8: return "8";
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
            return this == C1;
        }

        public bool is_last() {
            return this == C8;
        }

        public static Column[] all() {
            return { C1, C2, C3, C4, C5, C6, C7, C8 };
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



}
