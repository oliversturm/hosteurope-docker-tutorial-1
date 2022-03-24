using Microsoft.AspNetCore.Mvc;

namespace DotNetApp.Controllers;

[ApiController]
[Route("calculate")]
public class CalculationController : ControllerBase
{
  [HttpGet]
  public ActionResult<float> Calculate(string calcType, float x, float y)
  {
    if (calcType.ToUpperInvariant() == "ADD")
      return x + y;
    else if (calcType.ToUpperInvariant() == "SUBTRACT")
      return x - y;
    else if (calcType.ToUpperInvariant() == "MULT")
      return x * y;
    else if (calcType.ToUpperInvariant() == "DIV")
      return x / y;
    else return BadRequest("Invalid calculation type");
  }
}
