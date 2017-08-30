<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="../common/common_head.jsp"/>
<header>
<jsp:include page="../common/navbar.jsp"/>
</header>
           
      <div class="container" style="width:60%">
         <div class="row main">
            <div class="panel-heading">
                  <div class="panel-title text-center">
                        <h1 class="title">Update User Profile</h1>
                        <hr />
                     </div>
               </div> 
            <div class="main-login main-center">
               <form class="form-horizontal" method="post" action="#">
                  
                  <div class="form-group">
                     <label for="name" class="cols-sm-2 control-label">Name</label>
                     <div class="cols-sm-10">
                        <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                           <input type="text" class="form-control" name="name" id="name"  placeholder="Steve Jobs"/>
                        </div>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="email" class="cols-sm-2 control-label">Email</label>
                     <div class="cols-sm-10">
                        <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                           <input type="text" class="form-control" name="email" id="email"  placeholder="user@example.com"/>
                        </div>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="username" class="cols-sm-2 control-label">Username</label>
                     <div class="cols-sm-10">
                        <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                           <input type="text" class="form-control" name="username" id="username"  placeholder="Enter your Username"/>
                        </div>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="password" class="cols-sm-2 control-label">Password</label>
                     <div class="cols-sm-10">
                        <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                           <input type="password" class="form-control" name="password" id="password" data-toggle="popover" placeholder="Enter your Password"/>
                        </div>
                        <span id="passwordInfo" class="hide">
                            <ul>
                                <li>At least 6 characters.</li>
                                <li>Use of special Characters like, [@, $].</li>
                                <li>Use of uppercase [A – Z] and lowercase [a – z] letters.</li>
                                <li>Use of numbers [0 – 9].</li>
                            </ul>
                        </span>
                        <span id="result"></span>
                     </div>
                  </div>

                  <div class="form-group">
                     <label for="confirm" class="cols-sm-2 control-label">Confirm Password</label>
                     <div class="cols-sm-10">
                        <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                           <input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirm your Password"/>
                        </div>
                        <span id="confirmPass"></span>
                     </div>
                  </div>

                  <div class="form-group ">
                     <button type="button" class="btn btn-primary btn-lg btn-block login-button">UPDATE</button>
                  </div>
               </form>
            </div>
         </div>
      </div>