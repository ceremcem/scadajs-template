require! 'components/components'
require! 'aea/defaults'

info = null
sleep 0ms, ~>
    info := PNotify.notice do
        text: "Loading non-critical dependencies..."
        hide: no

start = Date.now!
$.getScript "js/dep.js", ->
    info.close!
    elapsed = (Date.now! - start) / 1000
    PNotify.info do
        text: "Dependencies are loaded in #{Math.round(elapsed * 10) / 10} s"


try
    new Ractive do
        el: \body
        template: RACTIVE_PREPARSE('app.pug')
        #template: RACTIVE_PREPARSE('app.html') # if you have HTML template instead of Pug
        data:
            dataTableExample: require './showcase/data-table/settings' .settings
catch
    loadingError e.stack
    throw e
