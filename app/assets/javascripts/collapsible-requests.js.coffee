toggleCollapse = (element) ->
  if 'collapse' in element.classList
    element.classList.remove('collapse');
  else
    element.classList.add('collapse');

@hideGroup = (clientType) ->
  groupClass = ".clientgroup_" + clientType[0] + "_" + clientType[1];
  elementsInGroup = document.querySelectorAll(groupClass);
  for i in elementsInGroup
    toggleCollapse(i);
