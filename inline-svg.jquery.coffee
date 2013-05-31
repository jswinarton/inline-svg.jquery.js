$.fn.inlineSvg = ->

    $(@).each ->

        $img = jQuery(@)
        imgID = $img.attr("id")
        imgClass = $img.attr("class")
        imgURL = $img.attr("src")
        jQuery.get imgURL, (data) ->

            # Get the SVG tag, ignore the rest
            $svg = jQuery(data).find("svg")

            # Add replaced image's ID to the new SVG
            $svg = $svg.attr("id", imgID)  if typeof imgID isnt "undefined"

            # Add replaced image's classes to the new SVG
            $svg = $svg.attr("class", imgClass + " replaced-svg")  if typeof imgClass isnt "undefined"

            # Remove any invalid XML tags as per http://validator.w3.org
            $svg = $svg.removeAttr("xmlns:a")

            # Replace image with new SVG
            $img.replaceWith $svg
