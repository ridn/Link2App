return function(url)
    local username = url:gmatch("twitter.com/([%w_]+)")() -- extract username
    local _, ext = url:gmatch("twitter.com/([%w_]+)(/.+)")() -- check for other parts e.g. /post/1348whatever2
    local statusid = url:gmatch("twitter.com/[%w_]+/statuses/(%d+)")()
    if username and not ext then
        return "twitter://user?screen_name=" .. username
    elseif statusid then
        return "twitter://status?id=" .. statusid
    end
end