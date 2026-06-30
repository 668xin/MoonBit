///|
/// 雷达图 Demo — 使用 RadarChart 组件
pub fn demo_radar_chart() -> String {
  let theme = @lib.Theme::new_light()
  let colors = theme.palette
  let categories = ["Speed", "Strength", "Agility", "Endurance", "Intelligence"]

  let s1 = @radar.RadarSeries::new(
    "Player A",
    [90.0, 70.0, 85.0, 60.0, 75.0],
    colors[0],
  )
  let s2 = @radar.RadarSeries::new(
    "Player B",
    [65.0, 95.0, 55.0, 80.0, 70.0],
    colors[1],
  )

  let chart = @radar.RadarChart::new(450.0, 420.0, categories, [s1, s2], theme)
  let c2 = chart.with_title("Player Stats")
  c2.render()
}

///|
/// 三组数据雷达图 Demo
pub fn demo_multi_radar_chart() -> String {
  let theme = @lib.Theme::new_light()
  let colors = theme.palette
  let categories = ["Attack", "Defense", "Speed", "HP", "MP", "Luck"]

  let s1 = @radar.RadarSeries::new(
    "Warrior",
    [90.0, 80.0, 40.0, 95.0, 20.0, 50.0],
    colors[0],
  )
  let s2 = @radar.RadarSeries::new(
    "Mage",
    [40.0, 30.0, 50.0, 50.0, 95.0, 60.0],
    colors[1],
  )
  let s3 = @radar.RadarSeries::new(
    "Rogue",
    [70.0, 40.0, 95.0, 55.0, 30.0, 80.0],
    colors[2],
  )

  let chart = @radar.RadarChart::new(
    480.0,
    450.0,
    categories,
    [s1, s2, s3],
    theme,
  )
  let c2 = chart.with_title("Character Attributes")
  c2.render()
}
