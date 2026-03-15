import "@typespec/http";
import "./errors.tsp";

using Http;
namespace ApiService;

model Cat {
  id: int32;
  name: string;
  age: int32;
}

model CatList {
  items: Cat[];
}

@route("/cats")
@tag("Cats")
interface Cats {
  /** List cats */
  @get list(): CatList | Error;

  /** Read cat */
  @get read(@path id: int32): Cat | Error;

  /** Create a cat */
  @post create(@body body: Cat): Cat | Error;

  /** Update a cat */
  @patch update(@path id: int32, @body body: MergePatchUpdate<Cat>): Cat | Error;

  /** Delete a cat */
  @delete delete(@path id: int32): void | Error;
}
