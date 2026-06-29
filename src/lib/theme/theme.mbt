/// 主题系统模块
/// 支持浅色/深色双主题

/// 主题模式
pub enum ThemeMode {
  Light
  Dark
}

/// 主题配置
pub struct Theme {
  mode : ThemeMode
  background : String
  text_color : String
  grid_color : String
  axis_color : String
}

/// 获取浅色主题
pub fn get_light_theme() -> Theme {
  Theme::{
    mode: Light,
    background: "#ffffff",
    text_color: "#333333",
    grid_color: "#e0e0e0",
    axis_color: "#666666"
  }
}

/// 获取深色主题
pub fn get_dark_theme() -> Theme {
  Theme::{
    mode: Dark,
    background: "#1e1e1e",
    text_color: "#e0e0e0",
    grid_color: "#444444",
    axis_color: "#999999"
  }
}
