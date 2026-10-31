<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%!
/** Makes text safe to print inside HTML. */
static String esc(String s) {
    if (s == null) return "";
    StringBuilder b = new StringBuilder(s.length() + 16);
    for (int i = 0; i < s.length(); i++) {
        char c = s.charAt(i);
        switch (c) {
            case '<':  b.append("&lt;");   break;
            case '>':  b.append("&gt;");   break;
            case '&':  b.append("&amp;");  break;
            case '"':  b.append("&quot;"); break;
            case '\'': b.append("&#39;");  break;
            default:   b.append(c);
        }
    }
    return b.toString();
}

/** 12 Oct 2026, 12:37 PM */
static String fmtDate(java.sql.Timestamp t) {
    if (t == null) return "";
    return new java.text.SimpleDateFormat("dd MMM yyyy, hh:mm a").format(t);
}

/** Coloured label for a status value (display only). */
static String statusBadge(String s) {
    String n = s == null ? "" : s.trim();
    String cls = n.equalsIgnoreCase("complete") ? "success" : (n.equalsIgnoreCase("wip") ? "warning" : "secondary");
    if (n.isEmpty()) n = "open";
    return "<span class=\"badge rounded-pill bg-" + cls + "-subtle text-" + cls + "-emphasis border border-" + cls + "-subtle\">" + esc(n) + "</span>";
}

static String activeBadge(int active) {
    return active == 1
        ? "<span class=\"badge rounded-pill bg-success-subtle text-success-emphasis border border-success-subtle\">Active</span>"
        : "<span class=\"badge rounded-pill bg-secondary-subtle text-secondary-emphasis border border-secondary-subtle\">Inactive</span>";
}

static String roleName(int r) { return r == 0 ? "Admin" : (r == 1 ? "Manager" : "Employee"); }

/** A rating counts as "given" when it is not empty and not 0. */
static boolean isRated(String r) {
    return r != null && !r.trim().isEmpty() && !r.trim().equals("0");
}

static String act(String uri, String page) {
    return uri != null && uri.endsWith(page) ? " active" : "";
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Assign Task - Task Manager</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="icon" href="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 32 32'%3E%3Crect width='32' height='32' rx='8' fill='%234f46e5'/%3E%3Cpath d='M9 17l5 5 9-11' stroke='white' stroke-width='3' fill='none' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
<%
String navName = (String) session.getAttribute("UserName");
Object navRoleObj = session.getAttribute("Role");
int navRole = navRoleObj == null ? -1 : ((Integer) navRoleObj).intValue();
String navUri = request.getRequestURI();
%>
<nav class="navbar navbar-expand-md navbar-app navbar-dark">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center gap-2" href="home.jsp"><span class="brand-mark">&#10003;</span>Task Manager</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Menu">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
                <li class="nav-item"><a class="nav-link<%=act(navUri, "home.jsp")%>" href="home.jsp">Home</a></li>
<% if (navRole == 0) { %>
                <li class="nav-item"><a class="nav-link<%=act(navUri, "listManager1.jsp")%>" href="listManager1.jsp">List Manager</a></li>
                <li class="nav-item"><a class="nav-link<%=act(navUri, "addManager.jsp")%>" href="addManager.jsp">Add Manager</a></li>
<% } else if (navRole == 1) { %>
                <li class="nav-item"><a class="nav-link<%=act(navUri, "listEmp.jsp")%>" href="listEmp.jsp">List Employee</a></li>
                <li class="nav-item"><a class="nav-link<%=act(navUri, "addEmployee.jsp")%>" href="addEmployee.jsp">Add Employee</a></li>
<% } else if (navRole == 2) { %>
                <li class="nav-item"><a class="nav-link<%=act(navUri, "myTask.jsp")%>" href="myTask.jsp">My Tasks</a></li>
<% } %>
            </ul>
            <div class="d-flex align-items-center gap-3">
<% if (navRole >= 0) { %>
                <span class="navbar-text text-white-50"><span class="badge text-bg-light me-1"><%=roleName(navRole)%></span><%=esc(navName)%></span>
<% } %>
                <a class="btn btn-outline-light btn-sm" href="logout.jsp">Logout</a>
            </div>
        </div>
    </div>
</nav>
<main class="container py-4">
<div class="row justify-content-center">
    <div class="col-md-8 col-lg-6">
        <h1 class="h4 mb-3">Assign Task</h1>
        <div class="card shadow-sm">
            <div class="card-body p-4">
            <form action="assignTaskToDB.jsp" method="post">
                <input type="hidden" name="empId" value="<%=esc(request.getParameter("empId")) %>">
                <div class="mb-3">
                    <label for="project" class="form-label">Project</label>
                    <input type="text" class="form-control" id="project" name="project" required>
                </div>
                <div class="mb-3">
                    <label for="work" class="form-label">Work</label>
                    <textarea class="form-control" id="work" name="work" rows="5" required></textarea>
                </div>
                <div class="mb-4">
                    <label for="duration" class="form-label">Duration</label>
                    <input type="text" class="form-control" id="duration" name="duration" required placeholder="for example 2 hours or 3 days">
                </div>
                <div class="d-flex gap-2">
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-outline-secondary">Reset</button>
                    <a class="btn btn-outline-secondary ms-auto" href="listEmp.jsp">Back</a>
                </div>
            </form>
            </div>
        </div>
    </div>
</div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
