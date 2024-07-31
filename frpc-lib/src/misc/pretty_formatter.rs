use prost_reflect::{text_format::FormatOptions, DynamicMessage};

pub fn pretty_format(message: &DynamicMessage) -> String {
    let options = FormatOptions::new().pretty(true);
    message.to_text_format_with_options(&options)
}
