if not CreateAndInitFromMixin then
  local PrivateCreateFromMixins = CreateFromMixins;
  function CreateAndInitFromMixin(mixin, ...)
    local object = PrivateCreateFromMixins(mixin);
    object:Init(...);
    return object;
  end
end