class ShortLinkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :long_link, :short_link
end
