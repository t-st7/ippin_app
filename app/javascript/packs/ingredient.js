if (location.pathname.match("/")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("search-form");
    inputElement.addEventListener("keyup", () =>{
      const keyword = document.getElementById("search-form").value;
      console.log(keyword);
    });
  });
};