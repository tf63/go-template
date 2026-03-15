import "@typespec/http";

using Http;
namespace ApiService;

@error
model Error {
  code: int32;
  message: string;
}
