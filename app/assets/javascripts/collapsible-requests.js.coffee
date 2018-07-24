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

groupExpanded = true;

@hideAllGroups = () ->
  groupElements = document.querySelectorAll('[class^="clientgroup_item"]')
  collapsing = groupExpanded;
  if collapsing
    groupExpanded = false
  else
    groupExpanded = true

  for i in groupElements
    if collapsing
      i.classList.add('collapse')
    else
      i.classList.remove('collapse')
