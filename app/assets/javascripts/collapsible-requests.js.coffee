toggleCollapse = (element) ->
  if 'collapse' in element.classList
    element.classList.remove('collapse');
  else
    element.classList.add('collapse');

@hideGroup = (clientType) ->
  groupClass = ".clientgroup_item_" + clientType[0] + "_" + clientType[1];
  elementsInGroup = document.querySelectorAll(groupClass);
  for i in elementsInGroup
    toggleCollapse(i);

@hideAllGroups = () ->
  groupElements = document.querySelectorAll('[class^="clientgroup_item"]')
  for i in groupElements
    i.classList.add('collapse')
