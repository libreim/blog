// Todo esto es cutre, lo sé
var filename = function(title) {
  var time = new Date();
  var day = time.getDate();
  var month = time.getMonth() + 1;
  var year = time.getFullYear();
  
  return "_posts/" + year + "-" + month + "-" + day + "-" + title.toLowerCase().replace(/\s/g, "-") + ".md";
}


var yml = function(title, link, author, tag, license, content) {
  var template = `---
title: ${title}
authors: [${author}]
link: "${link}"
tags: [${tag}]
license: ${license}
---

${content}
`;
  

  return template;
  
}


var form = document.querySelector("#new_resource");
form.onsubmit = function(event) {
  form.querySelector("[name='filename']").value = filename(form.querySelector("[name='title']").value);
  form.querySelector("[name='message']").value = "Añade recurso: " + form.querySelector("[name='title']").value;
  form.querySelector("[name='value']").value = yml(
    form.querySelector("[name='title']").value,
    form.querySelector("[name='link']").value,
    form.querySelector("[name='author']").value,
    form.querySelector("[name='license']").value,
    form.querySelector("[name='tag']").value,
    form.querySelector("[name='content']").value
  );

  form.querySelector("[name='title']").disabled = true;
  form.querySelector("[name='link']").disabled = true;
  form.querySelector("[name='author']").disabled = true;
  form.querySelector("[name='license']").disabled = true;
  form.querySelector("[name='tag']").disabled = true;
  form.querySelector("[name='content']").disabled = true;
  
  return true;
};
