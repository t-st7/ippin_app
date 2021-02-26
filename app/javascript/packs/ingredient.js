if (location.pathname.match("/")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("search-form");
    inputElement.addEventListener("keyup", () =>{
      const keyword = document.getElementById("search-form").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`,true)
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
 
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((post) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", post.id);
            childElement.innerHTML = post.title;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(post.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("search-form").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};
