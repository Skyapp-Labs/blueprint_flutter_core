/// Kind of row shown in dock / drawer chrome (not the main body).
enum FxPaneType {
  /// Navigable destination; icon + title; switches shell body when selected.
  content,

  /// Non-navigable section label / line; [FxPane.divider].
  divider,

  /// Non-navigable vertical gap; [FxPane.spacer].
  spacer,

  /// Pinned above drawer footer; does not scroll; [FxPane.stickyBottom].
  stickyBottom,
}

/// Where a [FxPane] row is declared to appear in the shell chrome.
enum FxSite {
  dock,
  drawer,
  endDrawer,
}