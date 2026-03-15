import "@typespec/http";
import "./cats.tsp";
import "./dogs.tsp";

@service(#{ title: "API Service" })
namespace ApiService;
