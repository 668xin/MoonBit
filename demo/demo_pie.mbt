///|
/// 饼图 Demo — 使用 PieChart 组件
pub fn demo_pie_chart() -> String {
  let theme = @lib.Theme::new_light()
  let colors = theme.palette

  let data = [
    @pie.PieSlice::new("Electronics", 35.0, colors[0]),
    @pie.PieSlice::new("Clothing", 25.0, colors[1]),
    @pie.PieSlice::new("Food", 20.0, colors[2]),
    @pie.PieSlice::new("Books", 12.0, colors[3]),
    @pie.PieSlice::new("Other", 8.0, colors[4]),
  ]

  let chart = @pie.PieChart::new(450.0, 400.0, data, theme)
  let c2 = chart.with_title("Sales Distribution")
  c2.render()
}

///|
/// 简单饼图 Demo（不需要图例）
pub fn demo_simple_pie_chart() -> String {
  let theme = @lib.Theme::new_light()
  let colors = theme.palette

  let data = [
    @pie.PieSlice::new("A", 45.0, colors[0]),
    @pie.PieSlice::new("B", 30.0, colors[1]),
    @pie.PieSlice::new("C", 25.0, colors[2]),
  ]

  let chart = @pie.PieChart::new(350.0, 300.0, data, theme)
  let c2 = chart.with_title("Simple Pie")
  c2.render()
}
