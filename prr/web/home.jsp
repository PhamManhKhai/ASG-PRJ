<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1, shrink-to-fit=no"
            />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Imperial Jade</title>
        
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
            rel="stylesheet"
            />
        
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <style>
        /* Add custom styles if needed */
    </style>
    
    <body>
        <%@include file="components/navBarComponent.jsp" %>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder" style="color: white">Imperial Jade</h1>
                    <p class="lead fw-normal text-white-50 mb-0">
                       0987554644 
                    </p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-3 mb-5">
                        <h3>List Categories</h3>
                        <ul class="list-group category_block">
                            <c:forEach items="${listCategories}" var="C">
                                <li class="list-group-item text-white ${tag == C.cid? "active":""}"><a href="category?categoryId=${C.cid}">${C.cname}</a></li>
                            </c:forEach>
                        </ul>
                        <!-- Price Search Form -->
                        <h3>Search by Price</h3>
                        <form action="searchbyprice" method="get">
                            <div class="form-group">
                                <select class="form-control mb-2">
                                    <option>Sắp xếp theo giá</option>
                                    
                                </select>
                                
                                    
                                    
                                
                                <div class="input-group mb-2">
                                    <input type="number" class="form-control" id="minPrice" name="minPrice" placeholder="Từ $">
                                    <span class="input-group-text">-</span>
                                    <input type="number" class="form-control" id="maxPrice" name="maxPrice" placeholder="Đến $">
                                </div>
                                <button type="submit" class="btn btn-primary w-100">Lọc</button>
                               
                            </div>
                             
                        </form>
                    </div>
                     
                    <div class="col-md-9">
                        <h3>List Products</h3>
                        <c:choose>
                            <c:when test="${listProducts==null || listProducts.size()==0}">
                                Not founds
                            </c:when>
                            <c:otherwise>
                                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                                    <ul class="pagination">
                                        <li class="page-item"><a class="page-link" href="home?page=${page-1}">Previous</a></li>
                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                            <li class="page-item {i == page?"active":""}"><a class="page-link" href="home?page=${i}">${i}a</a></li>
                                            </c:forEach>
                                        <li class="page-item"><a class="page-link" href="home?page=${page+1}">Next</a></li>
                                    </ul>
                                </nav>
                            </c:otherwise>
                        </c:choose>

                        <div
                            class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 justify-content-center"
                            >
                            <c:forEach items="${listProducts}" var="P">
                                <div class="col mb-5">
                                    ${P.id}
                                    <div class="card h-100">
                                        <!-- Sale badge-->
                                        <div
                                            class="badge bg-dark text-white position-absolute"
                                            style="top: 0.5rem; right: 0.5rem"
                                            >
                                            Sale
                                        </div>
                                        <!-- Product image-->
                                        <a href="detail?productId=${P.id}">
                                        <img
                                            class="card-img-top"
                                            src="${P.imageUrl}"
                                            alt="..."
                                            />
                                        </a>
                                        <!-- Product details-->
                                        <div class="card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.name}</h5>
                                                <!-- Product reviews-->
                                                <div
                                                    class="d-flex justify-content-center small text-warning mb-2"
                                                    >
                                                    <div class="bi-star-fill">${P.tiltle}</div>
                                                    
                                                </div>
                                                <!-- Product price-->
                                                <span class="text-muted text-decoration-line-through"
                                                      ></span
                                                >
                                                $${P.price}
                                            </div>
                                        </div>
                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center">
                                                <a class="btn btn-outline-dark mt-auto" href="add-to-cart?productId=${P.id}"
                                                   >Add to cart</a
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="components/footerComponent.jsp" %>
    </body>
</html>
