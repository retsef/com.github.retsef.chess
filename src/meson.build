# Create a new executable, list the files we want to compile, list the dependencies we need, and install
sources = files(
    'Application.vala',
    # Primitives
    'engine/Coordinate.vala',
    'engine/BoardEngine.vala',
    # Pieces
    'engine/pieces/Piece.vala',
    'engine/pieces/Pawn.vala',
    'engine/pieces/Rook.vala',
    'engine/pieces/Knight.vala',
    'engine/pieces/Bishop.vala',
    'engine/pieces/King.vala',
    'engine/pieces/Queen.vala',
    # Widgets
    'widgets/BoardWidget.vala',
    'widgets/BoardBoxWidget.vala'
)

deps = [
    gtk_dependency,
    granite_dependency,
    gee_dependency,
    gmodule_dependency,
    glib_dependency,
    gobject_dependency
]

executable(
    meson.project_name(),
    sources,
    chess_resources,
    dependencies: deps,
    install: true
)
