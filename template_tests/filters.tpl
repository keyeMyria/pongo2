add
{{ 5|add:2 }}
{{ 5|add:simple.number }}
{{ 5|add:nothing }}
{{ 5|add:"test" }}
{{ "hello "|add:"john doe" }}
{{ "hello "|add:simple.name }}

addslashes
{{ "plain text"|addslashes|safe }}
{{ simple.escape_text|addslashes|safe }}

capfirst
{{ ""|capfirst }}
{{ 5|capfirst }}
{{ "h"|capfirst }}
{{ "hello there!"|capfirst }}

cut
{{ 15|cut:"5" }}
{{ "Hello world"|cut: " " }}

default
{{ simple.nothing|default:"n/a" }}
{{ nothing|default:simple.number }}
{{ simple.number|default:"n/a" }}
{{ 5|default:"n/a" }}

default_if_none
{{ simple.nothing|default_if_none:"n/a" }}
{{ ""|default_if_none:"n/a" }}
{{ nil|default_if_none:"n/a" }}

get_digit
{{ 1234567890|get_digit:0 }}
{{ 1234567890|get_digit }}
{{ 1234567890|get_digit:2 }}
{{ 1234567890|get_digit:"4" }}
{{ 1234567890|get_digit:10 }}
{{ 1234567890|get_digit:15 }}

safe
{{ "<script>" }}
{{ "<script>"|safe }}

escape
{{ "<script>"|safe|escape }}

title
{{ ""|title }}
{{ 5|title }}
{{ "h"|title }}
{{ "hello there!"|title }}
{{ "HELLO THERE!"|title }}
{{ "hELLO tHERE!"|title }}

truncatechars
{{ "Joel is a slug"|truncatechars:9 }}
{{ "Joel is a slug"|truncatechars:13 }}
{{ "Joel is a slug"|truncatechars:14 }}

divisibleby
{{ 21|divisibleby:3 }}
{{ 21|divisibleby:"3" }}
{{ 21|float|divisibleby:"3" }}
{{ 22|divisibleby:"3" }}
{{ 85|divisibleby:simple.number }}
{{ 84|divisibleby:simple.number }}

striptags
{{ "<strong><i>Hello!</i></strong>"|striptags|safe }}

removetags
{{ "<strong><i>Hello!</i></strong>"|removetags:"i"|safe }}

yesno
{{ simple.bool_true|yesno }}
{{ simple.bool_false|yesno }}
{{ simple.nil|yesno }}
{{ simple.nothing|yesno }}
{{ simple.bool_true|yesno:"ja,nein,vielleicht" }}
{{ simple.bool_false|yesno:"ja,nein,vielleicht" }}
{{ simple.nothing|yesno:"ja,nein" }}

pluralize
customer{{ 0|pluralize }}
customer{{ 1|pluralize }}
customer{{ 2|pluralize }}
cherr{{ 0|pluralize:"y,ies" }}
cherr{{ 1|pluralize:"y,ies" }}
cherr{{ 2|pluralize:"y,ies" }}
walrus{{ 0|pluralize:"es" }}
walrus{{ 1|pluralize:"es" }}
walrus{{ simple.number|pluralize:"es" }}

random
{{ 5|random }}
{{ ""|random }}
{{ "h"|random }}
{{ simple.one_item_list|random }}

first
{{ "Test"|first }}
{{ complex.comments|first }}
{{ 5|first }}
{{ true|first }}
{{ nothing|first }}

last
{{ "Test"|last }}
{{ complex.comments|last }}
{{ 5|last }}
{{ true|last }}
{{ nothing|last }}

urlencode
{{ "http://www.example.org/foo?a=b&c=d"|urlencode }}

linebreaksbr
{{ simple.newline_text|linebreaksbr }}
{{ ""|linebreaksbr }}
{{ "hallo"|linebreaksbr }}

length_is
{{ simple.name|length_is:8 }}
{{ simple.name|length_is:10 }}
{{ simple.name|length_is:"8" }}
{{ simple.name|length_is:"10" }}
{{ 5|length_is:1 }}

integer
{{ "foobar"|integer }}
{{ nothing|integer }}
{{ "5.4"|float|integer }}
{{ "5.5"|float|integer }}
{{ "5.6"|float|integer }}
{{ 6|float|integer }}
{{ -100|integer }}

float
{{ "foobar"|float }}
{{ nil|float }}
{{ "5.5"|float }}
{{ 5|float }}
{{ "5.6"|integer|float }}
{{ -100|float }}
{% if 5.5 == 5.500000 %}5.5 is 5.500000{% endif %}
{% if 5.5 != 5.500001 %}5.5 is not 5.500001{% endif %}

floatformat
{{ 34.23234|floatformat }}
{{ 34.00000|floatformat }}
{{ 34.26000|floatformat }}
{{ "34.23234"|floatformat }}
{{ "34.00000"|floatformat }}
{{ "34.26000"|floatformat }}
{{ 34.23234|floatformat:3 }}
{{ 34.00000|floatformat:3 }}
{{ 34.26000|floatformat:3 }}
{{ 34.23234|floatformat:"0" }}
{{ 34.00000|floatformat:"0" }}
{{ 39.56000|floatformat:"0" }}
{{ 34.23234|floatformat:"-3" }}
{{ 34.00000|floatformat:"-3" }}
{{ 34.26000|floatformat:"-3" }}

join
{{ simple.misc_list|join:", " }}

stringformat
{{ simple.float|stringformat:"%.2f" }}
{{ simple.uint|stringformat:"Test: %d" }}

make_list
{{ simple.name|make_list|join:", " }}
{% for char in simple.name|make_list %}{{ char }}{% endfor %}

center
'{{ "test"|center:3 }}'
'{{ "test"|center:19 }}'
'{{ "test"|center:20 }}'
{{ "test"|center:20|length }}
'{{ "test2"|center:19 }}'
'{{ "test2"|center:20 }}'
{{ "test2"|center:20|length }}

ljust
'{{ "test"|ljust:"2" }}'
'{{ "test"|ljust:"20" }}'
{{ "test"|ljust:"20"|length }}

rjust
'{{ "test"|rjust:"2" }}'
'{{ "test"|rjust:"20" }}'
{{ "test"|rjust:"20"|length }}

wordcount
{{ ""|wordcount }}
{% filter wordcount %}{% lorem 25 w %}{% endfilter %}

wordwrap
{{ ""|wordwrap:2 }}
{% filter wordwrap:5 %}{% lorem 26 w %}{% endfilter %}

iriencode
{{ "?foo=123&bar=yes"|iriencode }}

linebreaks
{{ ""|linebreaks|safe }}
{{ simple.newline_text|linebreaks|safe }}
{{ simple.long_text|linebreaks|safe }}
{{ simple.name|linebreaks|safe }}

linenumbers
{% filter linenumbers %}{% lorem 10 %}{% endfilter %}

phone2numeric
{{ "999-PONGO2"|phone2numeric }}

truncatewords
{% filter truncatewords:9 %}{% lorem 25 w %}{% endfilter %}
{% filter wordcount %}{% filter truncatewords:9 %}{% lorem 25 w %}{% endfilter %}{% endfilter %}

urlize
{% filter urlize:true|safe %}
Please mail me at demo@example.com or visit mit on:
- lorem ipsum github.com/flosch/pongo2 lorem ipsum
- lorem ipsum http://www.florian-schlachter.de lorem ipsum
- lorem ipsum https://www.florian-schlachter.de lorem ipsum
- lorem ipsum https://www.florian-schlachter.de lorem ipsum
- lorem ipsum www.florian-schlachter.de lorem ipsum
- lorem ipsum www.florian-schlachter.de/test="test" lorem ipsum
{% endfilter %}
--
{% filter urlize:false|safe %}
Please mail me at demo@example.com or visit mit on:
- lorem ipsum github.com/flosch/pongo2 lorem ipsum
- lorem ipsum http://www.florian-schlachter.de lorem ipsum
- lorem ipsum https://www.florian-schlachter.de lorem ipsum
- lorem ipsum https://www.florian-schlachter.de lorem ipsum
- lorem ipsum www.florian-schlachter.de lorem ipsum
- lorem ipsum www.florian-schlachter.de/test="test" lorem ipsum
{% endfilter %}