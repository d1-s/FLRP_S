$(function(){
  $(".search-reset-btn").on("click", function(){
    clearForm(this.form);
    $(".search-btn").click();
  });

  function clearForm (form){
    $(form)
      .find("input, select")
      .not(":button, :submit")
      .val("")
      .prop("selected", false)
    ;
  };
});