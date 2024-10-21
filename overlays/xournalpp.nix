{ ... }:
self: super: {
  xournalpp = super.xournalpp.overrideAttrs (old: {
    src = super.fetchFromGitHub {
      owner = "xournalpp";
      repo = "xournalpp";

      rev = "v1.2.4";
      sha256 = "16d5zdmzpfn9v32c7i5yp6n211a0hjn54iw4i85czlagypnvhrzg";
    };
  });
}
