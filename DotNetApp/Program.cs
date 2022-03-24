var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
  app.UseSwagger();
  app.UseSwaggerUI();
}

// This demo doesn't need HTTPS
//app.UseHttpsRedirection();

// Accept requests from anywhere
app.UseCors(o => o.SetIsOriginAllowed(_ => true));

app.UseAuthorization();

app.MapControllers();

app.Run();
