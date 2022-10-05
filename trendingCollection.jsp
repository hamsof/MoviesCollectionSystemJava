<jsp:include page="userDashboard.jsp" /> 


<div class="text-center m-3">
<div class="btn btn-lg btn-primary">Trending Movies</div>
</div>


<table class="table" style="margin-top:50px ;">
    <thead>
      <tr>
        <th scope="col">#</th>
        <th scope="col">Movie Name</th>
      </tr>
    </thead>
    <tbody id="table">
    </tbody>
  </table>
  <script>
    let arr = []
    fetch('https://api.themoviedb.org/3/trending/all/week?api_key=08a5daac2572af0da29de06e195c356d&language=en-US')
    .then((response) => response.json())
    .then((data) => {
        let array = []
        for(let i=0;i<15;i++){
        let t = data['results'][i]?.title || data['results'][i]?.name || data['results'][i]?.original_name
        document.getElementById("table").innerHTML+="<tr><th>"+(i+1)+ "</th> <td >"+t+"</td> </tr>"
        array.push(`${t}`);
        }
        console.log(array);
    });
  </script>