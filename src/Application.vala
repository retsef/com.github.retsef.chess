/*
* Copyright (c) 2011-2018 Your Organization (https://yourwebsite.com)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Roberto Scinocca <roberto.scinnocca@gmail.com>
*/

public class ChessApp : Gtk.Application {
    public BoardEngine engine;

    public ChessApp() {
        Object (
            application_id: "com.github.retsef.chess",
            flags: ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        try {
            // If the UI contains custom widgets, their types must've been instantiated once
            // Type type = typeof(Foo.BarEntry);
            // assert(type != 0);
            var builder = new Gtk.Builder();
            builder.add_from_resource("/com/github/retsef/chess/chess.ui");

            var window = builder.get_object("window") as Gtk.Window;
            window.destroy.connect(Gtk.main_quit);

            var screen = window.get_screen();
            var css_provider = new Gtk.CssProvider();
            css_provider.load_from_resource("/com/github/retsef/chess/chess.css");
            Gtk.StyleContext.add_provider_for_screen(
                screen, css_provider,
                Gtk.STYLE_PROVIDER_PRIORITY_USER);


            // Engine
            var board = builder.get_object("board") as Gtk.Grid;
            engine = new BoardEngine(board);

            // Actions
            builder.connect_signals(engine);

            engine.start();

            window.show_all();

            Gtk.main();
        } catch (Error e) {
            stderr.printf ("Could not load UI: %s\n", e.message);
            return;
        }
   }


    public static int main (string[] args) {
        Gtk.init(ref args);
        var app = new ChessApp();
        return app.run(args);
    }

}
