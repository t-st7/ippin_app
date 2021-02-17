if (location.pathname.match("/")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("search-form");
    inputElement.addEventListener("keyup", () =>{
      const keyword = document.getElementById("search-form").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/@q_search`,true)
      XHR.responseType = "json";
      XHR.send();
    });
  });
};