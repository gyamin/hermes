class window.Hermes.common.logger
  trace: (log) ->
    @logging log
  debug: (log) ->
    if window.Hermes.common.config.debugLevel <= window.Hermes.common.config.debug
      @logging log
  info: (log) ->
    if window.Hermes.common.config.debugLevel <= window.Hermes.common.config.info
      @logging log

  logging: (log) ->
    stamp = new Date()
    console.log stamp + ": " + log