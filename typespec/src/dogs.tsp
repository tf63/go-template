import "@typespec/http";
import "./errors.tsp";

using Http;
namespace ApiService;

model Dog {
  id: int32;
  name: string;
  age: int32;
}

model DogList {
  items: Dog[];
}

@route("/dogs")
@tag("Dogs")
interface Dogs {
  /** List dogs */
  @get list(): DogList | Error;

  /** Read dog */
  @get read(@path id: int32): Dog | Error;

  /** Create a dog */
  @post create(@body body: Dog): Dog | Error;

  /** Update a dog */
  @patch update(@path id: int32, @body body: MergePatchUpdate<Dog>): Dog | Error;

  /** Delete a dog */
  @delete delete(@path id: int32): void | Error;
}
