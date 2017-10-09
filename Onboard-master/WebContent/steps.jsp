
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Accordion Wizard for Bootstrap 3</title>

    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="css/acc-wizard.min.css">
<style>
a {
     color: lightblue; 
    text-decoration: none;
}
</style>

</head>
  <body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="#">Page 1</a></li>
      <li><a href="#">Page 2</a></li>
      <li><a href="#">Page 3</a></li>
    </ul>
  </div>
</nav>
   
    <div class="row acc-wizard">
      <div class="col-sm-3" style="padding-left: 2em;">
      
       <ol class=" list acc-wizard-sidebar"><c><a>Home<a></c></ol>
        <ol class=" list acc-wizard-sidebar">App Emphasize Module
                    <ol class=" list acc-wizard-sidebar">Project Details
                    <ol class=" list acc-wizard-sidebar">
                        <li ><a href="editproject.jsp">Project Information</a></li>
                        <li><a href="application1.jsp">Application Details</a></li>
                     </ol>
                        </ol>
        <ol class=" list acc-wizard-sidebar"><a>Application Prioritization<a>
          <li class=" acc-wizard-todo"><a href="#prerequisites">Parameters</a></li>
          <li class="acc-wizard-todo"><a href="#addwizard">Archival Complexity Calculation</a></li>
          <li class=" acc-wizard-todo"><a href="#adjusthtml">Archival Cost Estimate</a></li>
          <li class="acc-wizard-todo"><a href="#viewpage">Release</a></li>
         
        </ol></ol>
         <ol class=" list acc-wizard-sidebar"><a>Intake Module<a>
          <li class=" acc-wizard-todo"><a href>Buisness</a></li>
          <li class="acc-wizard-todo"><a href>Technical</a></li>
          <li class=" acc-wizard-todo"><a href>Archival Requirements</a></li>
                 </ol>
     
      </div>
      <div class="col-sm-9" style="padding-right: 2em;">
        <div id="accordion-demo" class="panel-group">
          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a href="#prerequisites" data-parent="#accordion-demo" data-toggle="collapse">
                 Parameters
                </a>
              </h4>
            </div>
            <div id="prerequisites" class="panel-collapse collapse in">
              <div class="panel-body">
                <form id="form-prerequisites">
                  <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Project Name</label>
                                            <input type="text" class="form-control" id="formInput526"  name="prj_name">
                                        </div>
                                       
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">IA License cost per TB</label>
                                            <input type="text" class="form-control" id="formInput526"  name="IA_lic_cst">
                                        </div>
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput526">IA Maintenance Cost Per Year</label>
                                            <input type="text" class="form-control" id="formInput526"  name="IA_maint_cst">
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput316">Infra Structure Cost per TB</label>
                                              <input type="text" class="form-control"  name="Infrastrct_cst"> 
                                         </div>
                                        <div class="form-group">
                                       
                                            <label class="control-label" for="formInput526">Storage Estimate</label>
                                            <input type="text" class="form-control" id="formInput526"  name="strg_est">
                                      
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput526">Labor Cost Per Hour for IA Dev Team</label>
                                            <input type="text" class="form-control" id="formInput526"  name="lab_cst">
                                        </div>
                                                                     
                  
                    
                </form>
              </div> <!--/.panel-body -->
            </div> <!-- /#prerequisites -->
          </div> <!-- /.panel.panel-default -->

          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a href="#addwizard" data-parent="#accordion-demo" data-toggle="collapse">
                  Add Accordion Wizard
                </a>
              </h4>
            </div>

            
            
            <div id="addwizard" class="panel-collapse collapse in">
              <div class="panel-body">
                <form id="form-addwizard">
                
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput664">Project Name</label>
                                            <input type="text" class="form-control" id="proj_name"  name="proj_name">
                                        </div>                                         
                                         
                                      
                                              <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Data Size</label>                                             
                                            <select id="data_size" class="form-control" name="data_size" onChange="updatesum()" > 
                                            <option></option>
                                                <option><100 GB</option>                                                 
                                                <option>100 to 250 GB</option>
                                                <option>250 to 500 GB</option>
                                                <option>500 to 1 TB</option>
                                                <option>>1 TB</option>                                                 
                                            </select>
                                        </div>                    
                                       
                                        
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664"><b>Data Source</b></label> 
                                            </div>
                                            <div class="checkbox"> 
                                            <label class="Data Source"> 
                                                <input type="checkbox" name="data_source" value="regulardb" >Regular DB</label><br />
                                            <label class="Data Source">     <input type="checkbox" name="data_source" value="erp" >ERP</label><br />
                                                <label class="Data Source"> <input type="checkbox" name="data_source" value="product">Product based 
                                                </label>  <br />                          
                                        </div>
                                        
                                      
                                          <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Current users</label>                                             
                                            <select id="curnt_users" class="form-control" name="curnt_users" onChange="updatesum()"> 
                                            <option></option>
                                                <option><10</option>                                                 
                                                <option><25</option>
                                                <option><50</option>
                                                <option><100</option> 
                                                <option>100 to 500</option>                                                 
                                            </select>
                                        </div>                    
                                       
                                       <div class="form-group"> 
                                            <label class="control-label" for="formInput26">Complexity</label>                                             
                                            <select id="complexity" class="form-control" name="complexity" onChange="againupdate()">
                                                <option></option>
                                                <option>Low</option>                                                 
                                                <option>Low to Medium</option>
                                                <option>Medium</option>
                                                <option>Medium to High</option> 
                                                <option>High</option>                                                 
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="formInput664">Read Only Date</label>                                             
                                            <input type="text" class="form-control" id="est_archive"  name="read_date" onChange="againupdate()"> 
                                        </div>
                                        <div class="form-group">
                                            <label class="control-label" for="formInput664">SME Date</label>                                             
                                            <input type="text" class="form-control" id="est_archive"  name="sme_date" onChange="againupdate()"> 
                                        </div>          
                                        
                                    <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Archival Service Effort</label>                                             
                                            <input type="text" class="form-control" id="est_archive"  name="est_archive" onChange="againupdate()"> 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Screen</label>                                             
                                            <input type="text" class="form-control" id="est_scrn"  name="est_scrn" onChange="againupdate()" > 
                                        </div>
                                     <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Size of xDB</label>                                             
                                            <input type="text" class="form-control" id="est_db_size"  name="est_db_size" onChange="againupdate()" > 
                                        </div>
                                      <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Hours</label>                                             
                                            <input type="text" class="form-control" id="est_hrs"  name="est_hrs" onChange="againupdate()">  
                                        </div>
                                                                                <div class="form-group">
                                            <label class="control-label" for="formInput664">Estimated Total Service Cost</label>                                             
                                            <input type="text" class="form-control" id="est_cst"  name="est_cst" onChange="againupdate()"> 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total IA License Cost</label>                                             
                                            <input type="text" class="form-control" id="ttl_IA_cst"  name="ttl_IA_cst" onChange="againupdate()" > 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total Infrastructure Storage Cost</label>                                             
                                            <input type="text" class="form-control" id="ttl_infra_cst"  name="ttl_infra_cst" onChange="againupdate()"> 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total Info Archive Product Maintenance Cost for 5 years</label>                                             
                                            <input type="text" class="form-control" id="ttl_IA_prdct_cst"  name="ttl_IA_prdct_cst" onChange="againupdate()"> 
                                        </div>
                                         <div class="form-group">
                                            <label class="control-label" for="formInput664">Total</label>                                             
                                            <input type="text" class="form-control" id="ttl"  name="ttl" > 
                                        </div>                                                     
                                  </form>
              </div> <!--/.panel-body -->
            </div> <!-- /#addwizard -->
          </div> <!-- /.panel.panel-default -->

          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a href="#adjusthtml" data-parent="#accordion-demo" data-toggle="collapse">
                  Adjust Your HTML Markup
                </a>
              </h4>
            </div>
            <div id="adjusthtml" class="panel-collapse collapse in">
              <div class="panel-body">
                <form id="form-adjusthtml">
                  <p>
                    Now you can modify your HTML markup to activate the accordion
                    wizard. There are two parts to the markup&mdash;the collapsible
                    accordion itself and the task list. I prefer putting both in
                    the same <code>.row</code> with the task list taking up a
                    <code>.col-md-3</code> and the accordion panels in a <code>.col-md-9</code>,
                    but that's not a requirement.
                  </p>
                  <p>
                    The accordion panel can be exactly as documented in the
                    <a href="http://getbootstrap.com/javascript/#collapse-examples">Bootstrap example</a>,
                    but I think there's a problem with the Bootstrap implementation.
                    Specifically, the Bootstrap example only adds the class
                    <code>.in</code> to one of the accordion panels. That class
                    marks the panel as visible by default. The problem with only
                    having one panel visible by default is that users without
                    javascript will <strong>never</strong> be able to see the other
                    panels. Sure, that's a minority of users, but why make your
                    pages unworkable even for a small minority. Instead, I suggest
                    adding <code>.in</code> to all your <code>.collapse</code>
                    elements and have javascript code select only one to make
                    visible when it runs. The accordion wizard javascript will handle
                    that for you if you choose to use that approach.
                  </p>
                  <p>
                    The sidebar task list is nothing but a standard HTML ordered
                    list. The only required additions are adding the
                    <code>.acc-wizard-sidebar</code> class to the <code>&lt;ol&gt;</code>
                    element and <code>.acc-wizard-todo</code> to the individual list
                    items. If you want to indicate that some steps are already
                    complete, you can instead add the <code>.acc-wizard-completed</code>
                    class to the corresponding <code>&lt;li&gt;</code> elements.
                  </p>
                  <pre><!--
                  -->&lt;ol class="acc-wizard-sidebar"&gt;
<!--              -->  &lt;li class="acc-wizard-todo"&gt;&lt;a href="#prerequisites">Install Bootstrap and jQuery&lt;/a&gt;&lt;/li&gt;
<!--              -->  &lt;li class="acc-wizard-todo"&gt;&lt;a href="#addwizard">Add Accordion Wizard&lt;/a&gt;&lt;/li&gt;
<!--              -->  &lt;li class="acc-wizard-todo"&gt;&lt;a href="#adjusthtml">Adjust Your HTML Markup&lt;/a&gt;&lt;/li&gt;
<!--              -->  &lt;li class="acc-wizard-todo"&gt;&lt;a href="#viewpage">Test Your Page&lt;/a&gt;&lt;/li&gt;
<!--              -->&lt;/ol><!--
                  --></pre>
                  <p>
                    Finally, you'll want to active the wizard in your javascript.
                    That's nothing more than simply calling the plugin on an
                    appropriate selection.
                  </p>
                  <pre><!--
                  -->&lt;script&gt;
<!--              -->    $(window).load(function() {
<!--              -->        $(".acc-wizard").accwizard();
<!--              -->    });
<!--              -->&lt;/script&gt;<!--
                 --></pre>
                  <p>
                    The default options are probably fine for most uses, but
                    there are many customizations you can use when you activate
                    the wizard. Check out the documentation on
                    <a href="https://github.com/sathomas/acc-wizard">github</a>
                    for the details.
                  </p>
                </form>
              </div> <!--/.panel-body -->
            </div> <!-- /#adjusthtml -->
          </div> <!-- /.panel.panel-default -->

          <div class="panel panel-default">
            <div class="panel-heading">
              <h4 class="panel-title">
                <a href="#viewpage" data-parent="#accordion-demo" data-toggle="collapse">
                  Test Your Page
                </a>
              </h4>
            </div>
            <div id="viewpage" class="panel-collapse collapse in">
              <div class="panel-body">
                <form id="form-viewpage">
                  <p>
                    Naturally, the last thing you'll want to do is test your
                    page with the accordion wizard. Once you've confirmed that
                    it's working as expected, release it on the world. Your
                    users will definitely appreciate the feedback and guidance
                    it gives to multi-step and complex tasks on your web site.
                  </p>
                </form>
              </div> <!--/.panel-body -->
            </div> <!-- /#adjusthtml -->
          </div> <!-- /.panel.panel-default -->
          
        </div>
      </div>
    </div>


    <!-- ===================================================================== -->
    <!-- Javascript placed at the end of the document so the pages load faster -->
    <!-- ===================================================================== -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

    <!-- Bootstrap -->
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

    <!-- Latest version of minified js for Accordion Wizard -->
    <script src="js/acc-wizard.min.js"></script>

    <!-- Or, for development, use latest version of Accordion Wizard -->
    <!-- <script src="js/acc-wizard.js"></script> -->

    <script>
      function onNext(parent, panel) {
        hash = "#" + panel.id;
        $(".acc-wizard-sidebar",$(parent))
            .children("li")
            .children("a[href='" + hash + "']")
            .parent("li")
            .removeClass("acc-wizard-todo")
            .addClass("acc-wizard-completed");
      }
      $(window).load(function() {
        $(".acc-wizard").accwizard({onNext: onNext});
      })
    </script>

  </body>
</html>
