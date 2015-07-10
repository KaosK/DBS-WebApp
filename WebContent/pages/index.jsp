<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DBS App</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
    
    <!-- DataTables CSS -->
    <link href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<c:set var="thisPage" value="index.jsp"/>
<c:set var="queryType1" value="longestMovieName"/>
<c:set var="queryType2" value="longestActorName"/>
<c:set var="queryType3" value="longestDirectorName"/>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp"><i class="fa fa-tasks"></i> DBS App v1.0</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-gear fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="settings.jsp"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="about.html"><i class="fa fa-info fa-fw"></i> About</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
<!--                         <li class="sidebar-search"> -->
<!--                             <div class="input-group custom-search-form"> -->
<!--                                 <input type="text" class="form-control" placeholder="Search..."> -->
<!--                                 <span class="input-group-btn"> -->
<!--                                     <button class="btn btn-default" type="button"> -->
<!--                                         <i class="fa fa-search"></i> -->
<!--                                     </button> -->
<!--                                 </span> -->
<!--                             </div> -->
<!--                             /input-group -->
<!--                         </li> -->
                        <li>
                            <a href="index.jsp"><i class="fa fa-tasks fa-fw"></i> Database</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-search fa-fw"></i> Search for<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="searchmovies.jsp">Movie</a>
                                </li>
                                <li>
                                    <a href="searchactors.jsp">Actor</a>
                                </li>
                                <li>
                                    <a href="searchdirectors.jsp">Director</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Features<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="topmovies.jsp">Top Movies</a>
                                </li>
                                <li>
                                    <a href="actorsdebut.jsp">Actor's Debut</a>
                                </li>
                                <li>
                                    <a href="mostmovies.jsp">Most Movies a year</a>
                                </li>
                                <li>
                                    <a href="directorsfav.jsp">Director's Favorite</a>
                                </li>
                                <li>
                                    <a href="worstofyear.jsp">Worst Actors ever</a>
                                </li>
                                <li>
                                    <a href="bestofyear.jsp">Best of the year</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">

				<!-- ********* MAIN Content ********* -->

				<div class="row">
					<div class="col-lg-12">
						<h2 class="page-header">Welcome to the Movie Database!</h2>
					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->
				<div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Fun Facts
                        </div>
                        <!-- .panel-heading -->
							<div class="panel-body">
								<div class="panel-group" id="accordion">
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapseOne">Fun Fact #1</a>
											</h4>
										</div>
										<div id="collapseOne" class="panel-collapse collapse">
											<div class="panel-body">
												<jsp:include page="data.jsp">
													<jsp:param name="param1" value="egal" />
													<jsp:param name="queryType" value="${queryType1}" />
												</jsp:include>
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapseTwo">Fun Fact #2</a>
											</h4>
										</div>
										<div id="collapseTwo" class="panel-collapse collapse">
											<div class="panel-body">
												<jsp:include page="data.jsp">
													<jsp:param name="param1" value="egal" />
													<jsp:param name="queryType" value="${queryType2}" />
												</jsp:include>
											</div>
										</div>
									</div>
									<div class="panel panel-default">
										<div class="panel-heading">
											<h4 class="panel-title">
												<a data-toggle="collapse" data-parent="#accordion"
													href="#collapseThree">Fun Fact #3</a>
											</h4>
										</div>
										<div id="collapseThree" class="panel-collapse collapse">
											<div class="panel-body">
												<jsp:include page="data.jsp">
													<jsp:param name="param1" value="egal" />
													<jsp:param name="queryType" value="${queryType3}" />
												</jsp:include>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- .panel-body -->
						</div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
				<div class="row">
					<div class="col-lg-12">

					</div>
					<!-- /.col-lg-12 -->
				</div>
				<!-- /.row -->

				<!-- / ********* MAIN Content END *********  -->

			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->

	</div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>
    
    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>

</body>

</html>
