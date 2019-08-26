This project compiles with `cargo build`, but not with crate2nix.

Including files from the same workspace but not the same crate is
probably a niche feature (if it even is feature! I don't know if this is
intentionally allowed by cargo, or was just forgotten to forbid).

I would understand a choice not to support this, but I brought it up anyway
in case you want to fix all differences from the build process of cargo.
