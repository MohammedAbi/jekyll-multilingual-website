module Jekyll
  module I18nFilter
    def t(input)
      lang = @context.registers[:page]["lang"] || @context.registers[:site].config["default_lang"]
      translations = @context.registers[:site].data["i18n"][lang]
      input.split('.').reduce(translations) { |h, key| h[key] } rescue input
    end
  end
end

Liquid::Template.register_filter(Jekyll::I18nFilter)
