/// HTML 页面生成器
/// 将 MdBlock 序列渲染为完整 HTML 页面，图表 SVG 内嵌其中

///|
/// 将文档块序列渲染为完整 HTML 页面
pub fn render_html_page(title : String, blocks : Array[MdBlock]) -> String {
  let mut html = "<!DOCTYPE html>\n"
  html = html + "<html lang=\"zh-CN\">\n"
  html = html + "<head>\n"
  html = html + "  <meta charset=\"UTF-8\">\n"
  html = html +
    "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
  html = html + "  <title>" + escape_html(title) + "</title>\n"
  html = html + "  <style>\n"
  html = html + "    body { font-family: -apple-system, BlinkMacSystemFont, "
  html = html + "Segoe UI, sans-serif; max-width: 960px; margin: 0 auto; "
  html = html + "padding: 20px; background: #f5f5f5; color: #333; }\n"
  html = html +
    "    h1 { text-align: center; color: #222; font-size: 2em; margin-bottom: 30px; }\n"
  html = html + "    h2 { color: #444; font-size: 1.5em; margin-top: 30px; "
  html = html + "margin-bottom: 10px; border-bottom: 2px solid #e0e0e0; "
  html = html + "padding-bottom: 6px; }\n"
  html = html + "    h3 { color: #555; font-size: 1.2em; "
  html = html + "margin-top: 20px; margin-bottom: 8px; }\n"
  html = html + "    p { line-height: 1.7; margin: 8px 0; }\n"
  html = html + "    hr { border: none; border-top: 1px solid #ddd; "
  html = html + "margin: 20px 0; }\n"
  html = html + "    .chart-container { background: white; border-radius: 8px; "
  html = html + "box-shadow: 0 2px 8px rgba(0,0,0,0.1); padding: 20px; "
  html = html + "margin: 20px 0; overflow-x: auto; }\n"
  html = html + "    .chart-title { text-align: center; color: #555; "
  html = html + "font-size: 1.2em; margin-bottom: 15px; }\n"
  html = html + "    code { background: #f0f0f0; padding: 2px 6px; "
  html = html + "border-radius: 3px; font-size: 0.9em; }\n"
  html = html + "    a { color: #4E79A7; text-decoration: none; }\n"
  html = html + "    a:hover { text-decoration: underline; }\n"
  html = html + "  </style>\n"
  html = html + "</head>\n"
  html = html + "<body>\n"
  html = html + "  <h1>" + escape_html(title) + "</h1>\n"

  // 渲染每个块
  let mut i = 0
  while i < blocks.length() {
    html = html + render_block_html(blocks[i])
    i = i + 1
  }

  html = html + "</body>\n"
  html = html + "</html>\n"
  html
}

///|
/// 渲染单个文档块为 HTML 片段
fn render_block_html(block : MdBlock) -> String {
  match block {
    MdBlock::Heading(level, text) => {
      let tag_opening = "  <h" + level.to_string() + ">"
      let tag_closing = "</h" + level.to_string() + ">\n"
      tag_opening + render_inline(text) + tag_closing
    }
    MdBlock::Paragraph(text) => "  <p>" + render_inline(text) + "</p>\n"
    MdBlock::Chart(config) => {
      let svg = render_config_to_svg(config)
      let title = config.title
      if title == "" {
        "  " + svg + "\n"
      } else {
        wrap_chart_svg(title, svg) + "\n"
      }
    }
    MdBlock::HorizontalRule => "  <hr>\n"
    MdBlock::EmptyLine => "\n"
  }
}

///|
/// HTML 转义
fn escape_html(s : String) -> String {
  let len = s.length()
  let mut result = ""
  let mut i = 0
  while i < len {
    let c = s.code_unit_at(i).to_int()
    if c == 38 {
      result = result + "&amp;"
    } else if c == 60 {
      result = result + "&lt;"
    } else if c == 62 {
      result = result + "&gt;"
    } else if c == 34 {
      result = result + "&quot;"
    } else {
      result = result + "\{c.unsafe_to_char()}"
    }
    i = i + 1
  }
  result
}

///|
/// SVG 包裹到图表容器
pub fn wrap_chart_svg(title : String, svg : String) -> String {
  "  <div class=\"chart-container\">\n    <div class=\"chart-title\">" +
  escape_html(title) +
  "</div>\n    " +
  svg +
  "\n  </div>"
}
