/**
 * member javaScript
 */
var app=(function(){//최상위 브라우저 종료 저장되는곳
   var init=function(ctx){
      session.init(ctx);
      member.init();
      onCreate();
   };
   var ctx = function(){
      return session.getPath('ctx');
   };
   var js = function(){
      return session.getPath('js');
   };
   var img = function(){
      return session.getPath('img');
   };
   var css = function(){
      return session.getPath('css');
   };
   var setContentView=function(){
      alert('aaa');
   };
   var onCreate=function(){
      setContentView();
      location.href=ctx()+"/home.do";
   };
   return {
      init : init,
      ctx : ctx,
      js : js,
      img : img,
      css : css,
      onCreate: onCreate
   }
})();
var session=(function(){ //세선종료까지 저장
   var init=function(ctx){ //생성자(초기화)
      sessionStorage.setItem('ctx',ctx);
      sessionStorage.setItem('js',ctx+'/resource/js');
      sessionStorage.setItem('img',ctx+'/resource/img');
      sessionStorage.setItem('css',ctx+'/resource/css');
   };
   var getPath=function(x){
      return sessionStorage.getItem(x);
   };
   return {
      init : init,
      getPath : getPath
   }
})();
var member=(function(){
   var init=function(){
      $('#loginBtn').on('click',function(){
         alert('로그인 fx 실행')
          if($('#input_id').val()===""){
             alert('ID 를 입력해 주세요');
             return false;
          }
          if($('#input_pass').val()===""){
             alert('PASS 를 입력해 주세요');
             return false;
          }          
          $('#login_box').attr('action',app.ctx()+"/common.do");          
          $('#login_box').attr('method','post');          
          return true;
         
      });
   };
   var mainLoad=function(){
	   
   };
   return{
      init : init
   };
})();