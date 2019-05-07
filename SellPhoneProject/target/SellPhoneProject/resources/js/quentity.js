						$(function() {
							var sum = 0;
							var price = $("#price-id").text();
							var count = $("#count-id").val();
							sum = price * count;
							$("#sum-id").text(sum);
							$("#add-id").click(function() {
								var sum = 0;
								var price = $("#price-id").text();
								var count = $("#count-id").val();
								count++;
								$("#count-id").val(count);
								sum = price * count;
								$("#sum-id").text(sum);
							});
							$("#remove-id").click(function() {
								var sum = 0;
								var price = $("#price-id").text();
								var count = $("#count-id").val();
								if (count > 0) {
									count--;
								}
								$("#count-id").val(count);
								sum = price * count;
								$("#sum-id").text(sum);
							});
						});
