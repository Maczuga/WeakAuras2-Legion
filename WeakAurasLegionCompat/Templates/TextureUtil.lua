if not GetFinalNameFromTextureKit then
  function GetFinalNameFromTextureKit(fmt, textureKits)
    if type(textureKits) == "table" then
      return fmt:format(unpack(textureKits));
    else
      return fmt:format(textureKits);
    end
  end
end