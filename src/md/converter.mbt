///|
/// Markdown 转 HTML 工具模块
/// 解析 Markdown 全文（含 Markdown 标题/段落 + @chart 图表块），输出完整的 HTML 可视化页面
pub struct MdConverter {
  page_title : String
}

///|
/// 创建 MdConverter 实例
pub fn MdConverter::new() -> MdConverter {
  MdConverter::{ page_title: "Charts" }
}

///|
/// 设置页面标题
pub fn MdConverter::with_title(
  _self : MdConverter,
  title : String,
) -> MdConverter {
  { page_title: title }
}

///|
/// 转换 Markdown 文本为 HTML 可视化页面
/// 1. 解析全文为文档块（标题、段落、图表等）
/// 2. 图表块渲染为内嵌 SVG
/// 3. 所有块按原始顺序生成 HTML 页面
pub fn MdConverter::convert(self : MdConverter, markdown : String) -> String {
  let blocks = parse_markdown_blocks(markdown)
  render_html_page(self.page_title, blocks)
}
