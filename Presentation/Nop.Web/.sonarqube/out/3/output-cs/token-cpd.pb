�
sC:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\AreaNames.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
{ 
public 

static 
class 
	AreaNames !
{ 
public 
const 
string 
Admin !
=" #
$str$ +
;+ ,
}
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Components\NopViewComponent.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 

Components		 &
{

 
public 

abstract 
class 
NopViewComponent *
:+ ,

{ 
private 
void  
PublishModelPrepared )
<) *
TModel* 0
>0 1
(1 2
TModel2 8
model9 >
)> ?
{ 	
if 
( 
model 
is 
BaseNopModel %
)% &
{ 
var 
eventPublisher "
=# $

.2 3
Current3 :
.: ;
Resolve; B
<B C
IEventPublisherC R
>R S
(S T
)T U
;U V
eventPublisher 
. 

(, -
model- 2
as3 5
BaseNopModel6 B
)B C
;C D
} 
if   
(   
model   
is   
IEnumerable   $
<  $ %
BaseNopModel  % 1
>  1 2
modelCollection  3 B
)  B C
{!! 
var"" 
eventPublisher"" "
=""# $

.""2 3
Current""3 :
."": ;
Resolve""; B
<""B C
IEventPublisher""C R
>""R S
(""S T
)""T U
;""U V
eventPublisher&& 
.&& 

(&&, -
modelCollection&&- <
)&&< =
;&&= >
}'' 
}(( 	
public// 
new// #
ViewViewComponentResult// *
View//+ /
</// 0
TModel//0 6
>//6 7
(//7 8
string//8 >
viewName//? G
,//G H
TModel//I O
model//P U
)//U V
{00 	 
PublishModelPrepared11  
(11  !
model11! &
)11& '
;11' (
return44 
base44 
.44 
View44 
<44 
TModel44 #
>44# $
(44$ %
viewName44% -
,44- .
model44/ 4
)444 5
;445 6
}55 	
public<< 
new<< #
ViewViewComponentResult<< *
View<<+ /
<<</ 0
TModel<<0 6
><<6 7
(<<7 8
TModel<<8 >
model<<? D
)<<D E
{== 	 
PublishModelPrepared>>  
(>>  !
model>>! &
)>>& '
;>>' (
returnAA 
baseAA 
.AA 
ViewAA 
<AA 
TModelAA #
>AA# $
(AA$ %
modelAA% *
)AA* +
;AA+ ,
}BB 	
publicII 
newII #
ViewViewComponentResultII *
ViewII+ /
(II/ 0
stringII0 6
viewNameII7 ?
)II? @
{JJ 	
returnLL 
baseLL 
.LL 
ViewLL 
(LL 
viewNameLL %
)LL% &
;LL& '
}MM 	
}NN 
}OO �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Controllers\BasePaymentController.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Controllers '
{ 
public 

abstract 
class !
BasePaymentController /
:0 1 
BasePluginController2 F
{ 
}		 
}

 ��
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Controllers\BaseController.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Controllers '
{ 
[ 
PublishModelEvents 
] 
[ -
!SignOutFromExternalAuthentication &
]& '
[ 
ValidatePassword 
] 
[ 

] 
[ 
SaveLastActivity 
] 
[ 
SaveLastVisitedPage 
] 
public 

abstract 
class 
BaseController (
:) *

Controller+ 5
{   
	protected)) 
virtual)) 
string))  '
RenderViewComponentToString))! <
())< =
string))= C

,))Q R
object))S Y
	arguments))Z c
=))d e
null))f j
)))j k
{** 	
if// 
(// 
string// 
.// 

(//$ %

)//2 3
)//3 4
throw00 
new00 !
ArgumentNullException00 /
(00/ 0
nameof000 6
(006 7

)00D E
)00E F
;00F G
var22 !
actionContextAccessor22 %
=22& '
HttpContext22( 3
.223 4
RequestServices224 C
.22C D

GetService22D N
(22N O
typeof22O U
(22U V"
IActionContextAccessor22V l
)22l m
)22m n
as22o q#
IActionContextAccessor	22r �
;
22� �
if33 
(33 !
actionContextAccessor33 %
==33& (
null33) -
)33- .
throw44 
new44 
	Exception44 #
(44# $
$str44$ O
)44O P
;44P Q
var66 
context66 
=66 !
actionContextAccessor66 /
.66/ 0

;66= >
var88 
viewComponentResult88 #
=88$ %

(883 4

,88A B
	arguments88C L
)88L M
;88M N
var:: 
viewData:: 
=:: 
ViewData:: #
;::# $
if;; 
(;; 
viewData;; 
==;; 
null;;  
);;  !
{<< 
throw== 
new== #
NotImplementedException== 1
(==1 2
)==2 3
;==3 4
}?? 
varAA 
tempDataAA 
=AA 
TempDataAA #
;AA# $
ifBB 
(BB 
tempDataBB 
==BB 
nullBB  
)BB  !
{CC 
throwDD 
newDD #
NotImplementedExceptionDD 1
(DD1 2
)DD2 3
;DD3 4
}FF 
usingHH 
(HH 
varHH 
writerHH 
=HH 
newHH  #
StringWriterHH$ 0
(HH0 1
)HH1 2
)HH2 3
{II 
varJJ 
viewContextJJ 
=JJ  !
newJJ" %
ViewContextJJ& 1
(JJ1 2
contextKK 
,KK 
NullViewLL 
.LL 
InstanceLL %
,LL% &
viewDataMM 
,MM 
tempDataNN 
,NN 
writerOO 
,OO 
newPP 
HtmlHelperOptionsPP )
(PP) *
)PP* +
)PP+ ,
;PP, -
varSS 
viewComponentHelperSS '
=SS( )
contextSS* 1
.SS1 2
HttpContextSS2 =
.SS= >
RequestServicesSS> M
.SSM N
GetRequiredServiceSSN `
<SS` a 
IViewComponentHelperSSa u
>SSu v
(SSv w
)SSw x
;SSx y
(TT 
viewComponentHelperTT $
asTT% '
IViewContextAwareTT( 9
)TT9 :
?TT: ;
.TT; <

(TTI J
viewContextTTJ U
)TTU V
;TTV W
varVV 
resultVV 
=VV 
viewComponentResultVV 0
.VV0 1
ViewComponentTypeVV1 B
==VVC E
nullVVF J
?VVK L
viewComponentHelperWW '
.WW' (
InvokeAsyncWW( 3
(WW3 4
viewComponentResultWW4 G
.WWG H
ViewComponentNameWWH Y
,WWY Z
viewComponentResultWW[ n
.WWn o
	ArgumentsWWo x
)WWx y
:WWy z
viewComponentHelperXX '
.XX' (
InvokeAsyncXX( 3
(XX3 4
viewComponentResultXX4 G
.XXG H
ViewComponentTypeXXH Y
,XXY Z
viewComponentResultXX[ n
.XXn o
	ArgumentsXXo x
)XXx y
;XXy z
resultZZ 
.ZZ 
ResultZZ 
.ZZ 
WriteToZZ %
(ZZ% &
writerZZ& ,
,ZZ, -
HtmlEncoderZZ. 9
.ZZ9 :
DefaultZZ: A
)ZZA B
;ZZB C
return[[ 
writer[[ 
.[[ 
ToString[[ &
([[& '
)[[' (
;[[( )
}\\ 
}]] 	
	protectedcc 
virtualcc 
stringcc  %
RenderPartialViewToStringcc! :
(cc: ;
)cc; <
{dd 	
returnee %
RenderPartialViewToStringee ,
(ee, -
nullee- 1
,ee1 2
nullee3 7
)ee7 8
;ee8 9
}ff 	
	protectedmm 
virtualmm 
stringmm  %
RenderPartialViewToStringmm! :
(mm: ;
stringmm; A
viewNamemmB J
)mmJ K
{nn 	
returnoo %
RenderPartialViewToStringoo ,
(oo, -
viewNameoo- 5
,oo5 6
nulloo7 ;
)oo; <
;oo< =
}pp 	
	protectedww 
virtualww 
stringww  %
RenderPartialViewToStringww! :
(ww: ;
objectww; A
modelwwB G
)wwG H
{xx 	
returnyy %
RenderPartialViewToStringyy ,
(yy, -
nullyy- 1
,yy1 2
modelyy3 8
)yy8 9
;yy9 :
}zz 	
	protected
�� 
virtual
�� 
string
��  '
RenderPartialViewToString
��! :
(
��: ;
string
��; A
viewName
��B J
,
��J K
object
��L R
model
��S X
)
��X Y
{
�� 	
var
�� 
razorViewEngine
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IRazorViewEngine
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
var
�� 

�� 
=
�� 
new
��  #

��$ 1
(
��1 2
HttpContext
��2 =
,
��= >
	RouteData
��? H
,
��H I
ControllerContext
��J [
.
��[ \
ActionDescriptor
��\ l
,
��l m

ModelState
��n x
)
��x y
;
��y z
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
viewName
��% -
)
��- .
)
��. /
viewName
�� 
=
�� 
ControllerContext
�� ,
.
��, -
ActionDescriptor
��- =
.
��= >

ActionName
��> H
;
��H I
ViewData
�� 
.
�� 
Model
�� 
=
�� 
model
�� "
;
��" #
var
�� 

viewResult
�� 
=
�� 
razorViewEngine
�� ,
.
��, -
FindView
��- 5
(
��5 6

��6 C
,
��C D
viewName
��E M
,
��M N
false
��O T
)
��T U
;
��U V
if
�� 
(
�� 

viewResult
�� 
.
�� 
View
�� 
==
��  "
null
��# '
)
��' (
{
�� 

viewResult
�� 
=
�� 
razorViewEngine
�� ,
.
��, -
GetView
��- 4
(
��4 5
null
��5 9
,
��9 :
viewName
��; C
,
��C D
false
��E J
)
��J K
;
��K L
if
�� 
(
�� 

viewResult
�� 
.
�� 
View
�� #
==
��$ &
null
��' +
)
��+ ,
throw
�� 
new
�� #
ArgumentNullException
�� 3
(
��3 4
$"
��4 6
{
��6 7
viewName
��7 ?
}
��? @
$str
��@ S
"
��S T
)
��T U
;
��U V
}
�� 
using
�� 
(
�� 
var
�� 
stringWriter
�� #
=
��$ %
new
��& )
StringWriter
��* 6
(
��6 7
)
��7 8
)
��8 9
{
�� 
var
�� 
viewContext
�� 
=
��  !
new
��" %
ViewContext
��& 1
(
��1 2

��2 ?
,
��? @

viewResult
��A K
.
��K L
View
��L P
,
��P Q
ViewData
��R Z
,
��Z [
TempData
��\ d
,
��d e
stringWriter
��f r
,
��r s
new
��t w 
HtmlHelperOptions��x �
(��� �
)��� �
)��� �
;��� �
var
�� 
t
�� 
=
�� 

viewResult
�� "
.
��" #
View
��# '
.
��' (
RenderAsync
��( 3
(
��3 4
viewContext
��4 ?
)
��? @
;
��@ A
t
�� 
.
�� 
Wait
�� 
(
�� 
)
�� 
;
�� 
return
�� 
stringWriter
�� #
.
��# $
GetStringBuilder
��$ 4
(
��4 5
)
��5 6
.
��6 7
ToString
��7 ?
(
��? @
)
��@ A
;
��A B
}
�� 
}
�� 	
	protected
�� 

JsonResult
�� 
	ErrorJson
�� &
(
��& '
string
��' -
error
��. 3
)
��3 4
{
�� 	
return
�� 
Json
�� 
(
�� 
new
�� 
{
�� 
error
�� 
=
�� 
error
�� 
}
�� 
)
��
;
�� 
}
�� 	
	protected
�� 

JsonResult
�� 
	ErrorJson
�� &
(
��& '
object
��' -
errors
��. 4
)
��4 5
{
�� 	
return
�� 
Json
�� 
(
�� 
new
�� 
{
�� 
error
�� 
=
�� 
errors
�� 
}
�� 
)
��
;
�� 
}
�� 	
	protected
�� 
virtual
�� 
void
�� 
DisplayEditLink
�� .
(
��. /
string
��/ 5
editPageUrl
��6 A
)
��A B
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� 
AddEditPageUrl
�� *
(
��* +
editPageUrl
��+ 6
)
��6 7
;
��7 8
}
�� 	
	protected
�� 
virtual
�� 
void
�� 

AddLocales
�� )
<
��) *"
TLocalizedModelLocal
��* >
>
��> ?
(
��? @
ILanguageService
��@ P
languageService
��Q `
,
��` a
IList
�� 
<
�� "
TLocalizedModelLocal
�� &
>
��& '
locales
��( /
)
��/ 0
where
��1 6"
TLocalizedModelLocal
��7 K
:
��L M#
ILocalizedLocaleModel
��N c
{
�� 	

AddLocales
�� 
(
�� 
languageService
�� &
,
��& '
locales
��( /
,
��/ 0
null
��1 5
)
��5 6
;
��6 7
}
�� 	
	protected
�� 
virtual
�� 
void
�� 

AddLocales
�� )
<
��) *"
TLocalizedModelLocal
��* >
>
��> ?
(
��? @
ILanguageService
��@ P
languageService
��Q `
,
��` a
IList
�� 
<
�� "
TLocalizedModelLocal
�� &
>
��& '
locales
��( /
,
��/ 0
Action
��1 7
<
��7 8"
TLocalizedModelLocal
��8 L
,
��L M
int
��N Q
>
��Q R
	configure
��S \
)
��\ ]
where
��^ c"
TLocalizedModelLocal
��d x
:
��y z$
ILocalizedLocaleModel��{ �
{
�� 	
foreach
�� 
(
�� 
var
�� 
language
�� !
in
��" $
languageService
��% 4
.
��4 5
GetAllLanguages
��5 D
(
��D E
true
��E I
)
��I J
)
��J K
{
�� 
var
�� 
locale
�� 
=
�� 
	Activator
�� &
.
��& '
CreateInstance
��' 5
<
��5 6"
TLocalizedModelLocal
��6 J
>
��J K
(
��K L
)
��L M
;
��M N
locale
�� 
.
�� 

LanguageId
�� !
=
��" #
language
��$ ,
.
��, -
Id
��- /
;
��/ 0
if
�� 
(
�� 
	configure
�� 
!=
��  
null
��! %
)
��% &
	configure
�� 
.
�� 
Invoke
�� $
(
��$ %
locale
��% +
,
��+ ,
locale
��- 3
.
��3 4

LanguageId
��4 >
)
��> ?
;
��? @
locales
�� 
.
�� 
Add
�� 
(
�� 
locale
�� "
)
��" #
;
��# $
}
�� 
}
�� 	
	protected
�� 
virtual
�� 

�� '
AccessDeniedView
��( 8
(
��8 9
)
��9 :
{
�� 	
var
�� 
	webHelper
�� 
=
�� 

�� )
.
��) *
Current
��* 1
.
��1 2
Resolve
��2 9
<
��9 :

IWebHelper
��: D
>
��D E
(
��E F
)
��F G
;
��G H
return
�� 
RedirectToAction
�� #
(
��# $
$str
��$ 2
,
��2 3
$str
��4 >
,
��> ?
new
��@ C
{
��D E
pageUrl
��F M
=
��N O
	webHelper
��P Y
.
��Y Z
	GetRawUrl
��Z c
(
��c d
Request
��d k
)
��k l
}
��m n
)
��n o
;
��o p
}
�� 	
	protected
�� 

JsonResult
�� (
AccessDeniedDataTablesJson
�� 7
(
��7 8
)
��8 9
{
�� 	
var
�� !
localizationService
�� #
=
��$ %

��& 3
.
��3 4
Current
��4 ;
.
��; <
Resolve
��< C
<
��C D"
ILocalizationService
��D X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
return
�� 
	ErrorJson
�� 
(
�� !
localizationService
�� 0
.
��0 1
GetResource
��1 <
(
��< =
$str
��= ]
)
��] ^
)
��^ _
;
��_ `
}
�� 	
public
�� 
virtual
�� 
void
�� #
SaveSelectedPanelName
�� 1
(
��1 2
string
��2 8
tabName
��9 @
,
��@ A
bool
��B F&
persistForTheNextRequest
��G _
=
��` a
true
��b f
)
��f g
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
tabName
��% ,
)
��, -
)
��- .
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
tabName
��7 >
)
��> ?
)
��? @
;
��@ A
const
�� 
string
�� 
dataKey
��  
=
��! "
$str
��# <
;
��< =
if
�� 
(
�� &
persistForTheNextRequest
�� (
)
��( )
{
�� 
TempData
�� 
[
�� 
dataKey
��  
]
��  !
=
��" #
tabName
��$ +
;
��+ ,
}
�� 
else
�� 
{
�� 
ViewData
�� 
[
�� 
dataKey
��  
]
��  !
=
��" #
tabName
��$ +
;
��+ ,
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� !
SaveSelectedTabName
�� /
(
��/ 0
string
��0 6
tabName
��7 >
=
��? @
$str
��A C
,
��C D
bool
��E I&
persistForTheNextRequest
��J b
=
��c d
true
��e i
)
��i j
{
�� 	!
SaveSelectedTabName
�� 
(
��  
tabName
��  '
,
��' (
$str
��) <
,
��< =
null
��> B
,
��B C&
persistForTheNextRequest
��D \
)
��\ ]
;
��] ^
if
�� 
(
�� 
!
�� 
Request
�� 
.
�� 
Method
�� 
.
��  
Equals
��  &
(
��& '
WebRequestMethods
��' 8
.
��8 9
Http
��9 =
.
��= >
Post
��> B
,
��B C
StringComparison
��D T
.
��T U(
InvariantCultureIgnoreCase
��U o
)
��o p
)
��p q
return
�� 
;
�� 
foreach
�� 
(
�� 
var
�� 
key
�� 
in
�� 
Request
��  '
.
��' (
Form
��( ,
.
��, -
Keys
��- 1
)
��1 2
if
�� 
(
�� 
key
�� 
.
�� 

StartsWith
�� "
(
��" #
$str
��# 7
,
��7 8
StringComparison
��9 I
.
��I J(
InvariantCultureIgnoreCase
��J d
)
��d e
)
��e f!
SaveSelectedTabName
�� '
(
��' (
null
��( ,
,
��, -
key
��. 1
,
��1 2
key
��3 6
.
��6 7
	Substring
��7 @
(
��@ A
$str
��A U
.
��U V
Length
��V \
)
��\ ]
,
��] ^&
persistForTheNextRequest
��_ w
)
��w x
;
��x y
}
�� 	
	protected
�� 
virtual
�� 
void
�� !
SaveSelectedTabName
�� 2
(
��2 3
string
��3 9
tabName
��: A
,
��A B
string
��C I
formKey
��J Q
,
��Q R
string
��S Y

��Z g
,
��g h
bool
��i m'
persistForTheNextRequest��n �
)��� �
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
tabName
��% ,
)
��, -
)
��- .
{
�� 
tabName
�� 
=
�� 
Request
�� !
.
��! "
Form
��" &
[
��& '
formKey
��' .
]
��. /
;
��/ 0
}
�� 
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
tabName
��% ,
)
��, -
)
��- .
return
�� 
;
�� 
var
�� 
dataKey
�� 
=
�� 
$str
�� 1
;
��1 2
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 

�� %
(
��% &

��& 3
)
��3 4
)
��4 5
dataKey
�� 
+=
�� 
$"
�� 
$str
�� 
{
�� 

�� ,
}
��, -
"
��- .
;
��. /
if
�� 
(
�� &
persistForTheNextRequest
�� (
)
��( )
{
�� 
TempData
�� 
[
�� 
dataKey
��  
]
��  !
=
��" #
tabName
��$ +
;
��+ ,
}
�� 
else
�� 
{
�� 
ViewData
�� 
[
�� 
dataKey
��  
]
��  !
=
��" #
tabName
��$ +
;
��+ ,
}
�� 
}
�� 	
public
�� 

JsonResult
�� 
Json
�� 
<
�� 
T
��  
>
��  !
(
��! " 
BasePagedListModel
��" 4
<
��4 5
T
��5 6
>
��6 7
model
��8 =
)
��= >
where
��? D
T
��E F
:
��G H
BaseNopModel
��I U
{
�� 	
return
�� 
Json
�� 
(
�� 
new
�� 
{
�� 
draw
�� 
=
�� 
model
�� 
.
�� 
Draw
�� !
,
��! "
recordsTotal
�� 
=
�� 
model
�� $
.
��$ %
RecordsTotal
��% 1
,
��1 2
recordsFiltered
�� 
=
��  !
model
��" '
.
��' (
RecordsFiltered
��( 7
,
��7 8
data
�� 
=
�� 
model
�� 
.
�� 
Data
�� !
,
��! "
Total
�� 
=
�� 
model
�� 
.
�� 
Total
�� #
,
��# $
Data
�� 
=
�� 
model
�� 
.
�� 
Data
�� !
}
�� 
)
��
;
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Controllers\BasePluginController.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Controllers '
{ 
public 

abstract 
class  
BasePluginController .
:/ 0
BaseController1 ?
{ 
}		 
}

 �7
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Controllers\FormValueRequiredAttribute.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 
Controllers		 '
{

 
public 

class &
FormValueRequiredAttribute +
:, -)
ActionMethodSelectorAttribute. K
{ 
private 
readonly 
string 
[  
]  !
_submitButtonNames" 4
;4 5
private 
readonly  
FormValueRequirement -
_requirement. :
;: ;
private 
readonly 
bool 
_validateNameOnly /
;/ 0
public &
FormValueRequiredAttribute )
() *
params* 0
string1 7
[7 8
]8 9
submitButtonNames: K
)K L
:L M
this 
(  
FormValueRequirement %
.% &
Equal& +
,+ ,
submitButtonNames- >
)> ?
{ 	
} 	
public!! &
FormValueRequiredAttribute!! )
(!!) * 
FormValueRequirement!!* >
requirement!!? J
,!!J K
params!!L R
string!!S Y
[!!Y Z
]!!Z [
submitButtonNames!!\ m
)!!m n
:!!n o
this"" 
("" 
requirement"" 
,"" 
true"" "
,""" #
submitButtonNames""$ 5
)""5 6
{## 	
}$$ 	
public++ &
FormValueRequiredAttribute++ )
(++) * 
FormValueRequirement++* >
requirement++? J
,++J K
bool++L P
validateNameOnly++Q a
,++a b
params++c i
string++j p
[++p q
]++q r
submitButtonNames	++s �
)
++� �
{,, 	
_submitButtonNames.. 
=..  
submitButtonNames..! 2
;..2 3
_validateNameOnly// 
=// 
validateNameOnly//  0
;//0 1
_requirement00 
=00 
requirement00 &
;00& '
}11 	
public:: 
override:: 
bool:: 
IsValidForRequest:: .
(::. /
RouteContext::/ ;
routeContext::< H
,::H I
ActionDescriptor::J Z
action::[ a
)::a b
{;; 	
if<< 
(<< 
routeContext<< 
.<< 
HttpContext<< (
.<<( )
Request<<) 0
.<<0 1
Method<<1 7
!=<<8 :
WebRequestMethods<<; L
.<<L M
Http<<M Q
.<<Q R
Post<<R V
)<<V W
return== 
false== 
;== 
foreach?? 
(?? 
var?? 

buttonName?? #
in??$ &
_submitButtonNames??' 9
)??9 :
{@@ 
tryAA 
{BB 
switchCC 
(CC 
_requirementCC (
)CC( )
{DD 
caseEE  
FormValueRequirementEE 1
.EE1 2
EqualEE2 7
:EE7 8
{FF 
ifGG  "
(GG# $
_validateNameOnlyGG$ 5
)GG5 6
{HH  !
ifJJ$ &
(JJ' (
routeContextJJ( 4
.JJ4 5
HttpContextJJ5 @
.JJ@ A
RequestJJA H
.JJH I
FormJJI M
.JJM N
KeysJJN R
.JJR S
AnyJJS V
(JJV W
xJJW X
=>JJY [
xJJ\ ]
.JJ] ^
EqualsJJ^ d
(JJd e

buttonNameJJe o
,JJo p
StringComparison	JJq �
.
JJ� �(
InvariantCultureIgnoreCase
JJ� �
)
JJ� �
)
JJ� �
)
JJ� �
returnKK( .
trueKK/ 3
;KK3 4
}LL  !
elseMM  $
{NN  !
stringQQ$ *
valueQQ+ 0
=QQ1 2
routeContextQQ3 ?
.QQ? @
HttpContextQQ@ K
.QQK L
RequestQQL S
.QQS T
FormQQT X
[QQX Y

buttonNameQQY c
]QQc d
;QQd e
ifRR$ &
(RR' (
!RR( )
stringRR) /
.RR/ 0

(RR= >
valueRR> C
)RRC D
)RRD E
returnSS( .
trueSS/ 3
;SS3 4
}TT  !
}UU 
breakVV !
;VV! "
caseWW  
FormValueRequirementWW 1
.WW1 2

StartsWithWW2 <
:WW< =
{XX 
ifYY  "
(YY# $
_validateNameOnlyYY$ 5
)YY5 6
{ZZ  !
if\\$ &
(\\' (
routeContext\\( 4
.\\4 5
HttpContext\\5 @
.\\@ A
Request\\A H
.\\H I
Form\\I M
.\\M N
Keys\\N R
.\\R S
Any\\S V
(\\V W
x\\W X
=>\\Y [
x\\\ ]
.\\] ^

StartsWith\\^ h
(\\h i

buttonName\\i s
,\\s t
StringComparison	\\u �
.
\\� �(
InvariantCultureIgnoreCase
\\� �
)
\\� �
)
\\� �
)
\\� �
return]]( .
true]]/ 3
;]]3 4
}^^  !
else__  $
{``  !
foreachbb$ +
(bb, -
varbb- 0
	formValuebb1 :
inbb; =
routeContextbb> J
.bbJ K
HttpContextbbK V
.bbV W
RequestbbW ^
.bb^ _
Formbb_ c
.bbc d
Keysbbd h
)bbh i
ifcc( *
(cc+ ,
	formValuecc, 5
.cc5 6

StartsWithcc6 @
(cc@ A

buttonNameccA K
,ccK L
StringComparisonccM ]
.cc] ^&
InvariantCultureIgnoreCasecc^ x
)ccx y
)ccy z
{dd( )
varee, /
valueee0 5
=ee6 7
routeContextee8 D
.eeD E
HttpContexteeE P
.eeP Q
RequesteeQ X
.eeX Y
FormeeY ]
[ee] ^
	formValueee^ g
]eeg h
;eeh i
ifff, .
(ff/ 0
!ff0 1
stringff1 7
.ff7 8

(ffE F
valueffF K
)ffK L
)ffL M
returngg0 6
truegg7 ;
;gg; <
}hh( )
}ii  !
}jj 
breakkk !
;kk! "
}ll 
}mm 
catchnn 
(nn 
	Exceptionnn  
excnn! $
)nn$ %
{oo 
Debugqq 
.qq 
	WriteLineqq #
(qq# $
excqq$ '
.qq' (
Messageqq( /
)qq/ 0
;qq0 1
}rr 
}ss 
returntt 
falsett 
;tt 
}uu 	
}vv 
public{{ 

enum{{  
FormValueRequirement{{ $
{|| 
Equal
�� 
,
��

StartsWith
�� 
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Controllers\NopAttributePrefixDefaults.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Controllers '
{ 
public 

static 
partial 
class &
NopAttributePrefixDefaults  :
{ 
public

 
static

 
string

 
Customer

 %
=>

& (
$str

) >
;

> ?
public 
static 
string 
Product $
=>% '
$str( <
;< =
public 
static 
string 
Vendor #
=>$ &
$str' :
;: ;
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Events\AdminTabStripCreated.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Events "
{ 
public

 

class

  
AdminTabStripCreated

 %
{ 
public  
AdminTabStripCreated #
(# $
IHtmlHelper$ /
helper0 6
,6 7
string8 >
tabStripName? K
)K L
{ 	
Helper 
= 
helper 
; 
TabStripName 
= 
tabStripName '
;' (
BlocksToRender 
= 
new  
List! %
<% &
IHtmlContent& 2
>2 3
(3 4
)4 5
;5 6
} 	
public 
IHtmlHelper 
Helper !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public 
string 
TabStripName "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public## 
IList## 
<## 
IHtmlContent## !
>##! "
BlocksToRender### 1
{##2 3
get##4 7
;##7 8
set##9 <
;##< =
}##> ?
}$$ 
}%% �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Events\EventPublisherExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Events "
{ 
public		 

static		 
class		 $
EventPublisherExtensions		 0
{

 
public 
static 
void 

<( )
T) *
>* +
(+ ,
this, 0
IEventPublisher1 @
eventPublisherA O
,O P
TQ R
modelS X
)X Y
{ 	
eventPublisher 
. 
Publish "
(" #
new# &
ModelPreparedEvent' 9
<9 :
T: ;
>; <
(< =
model= B
)B C
)C D
;D E
} 	
public 
static 
void 

<( )
T) *
>* +
(+ ,
this, 0
IEventPublisher1 @
eventPublisherA O
,O P
TQ R
modelS X
,X Y 
ModelStateDictionaryZ n

modelStateo y
)y z
{ 	
eventPublisher 
. 
Publish "
(" #
new# &
ModelReceivedEvent' 9
<9 :
T: ;
>; <
(< =
model= B
,B C

modelStateD N
)N O
)O P
;P Q
}   	
}!! 
}"" �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Events\ModelPreparedEvent.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Events "
{ 
public 

class 
ModelPreparedEvent #
<# $
T$ %
>% &
{		 
public 
ModelPreparedEvent !
(! "
T" #
model$ )
)) *
{ 	
Model 
= 
model 
; 
} 	
public 
T 
Model 
{ 
get 
; 
private %
set& )
;) *
}+ ,
} 
}   �	
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Events\ModelReceivedEvent.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Events "
{ 
public		 

class		 
ModelReceivedEvent		 #
<		# $
T		$ %
>		% &
{

 
public 
ModelReceivedEvent !
(! "
T" #
model$ )
,) * 
ModelStateDictionary+ ?

modelState@ J
)J K
{ 	
Model 
= 
model 
; 

ModelState 
= 

modelState #
;# $
} 	
public 
T 
Model 
{ 
get 
; 
private %
set& )
;) *
}+ ,
public$$  
ModelStateDictionary$$ #

ModelState$$$ .
{$$/ 0
get$$1 4
;$$4 5
private$$6 =
set$$> A
;$$A B
}$$C D
}'' 
}(( �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Events\PageRenderingEvent.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Events "
{ 
public 

class 
PageRenderingEvent #
{ 
public 
PageRenderingEvent !
(! "
IHtmlHelper" -
helper. 4
,4 5
string6 <
overriddenRouteName= P
=Q R
nullS W
)W X
{ 	
Helper 
= 
helper 
; 
OverriddenRouteName 
=  !
overriddenRouteName" 5
;5 6
} 	
public 
IHtmlHelper 
Helper !
{" #
get$ '
;' (
private) 0
set1 4
;4 5
}6 7
public   
string   
OverriddenRouteName   )
{  * +
get  , /
;  / 0
private  1 8
set  9 <
;  < =
}  > ?
public"" 
IEnumerable"" 
<"" 
string"" !
>""! "

(""0 1
)""1 2
{## 	
if&& 
(&& 
!&& 
string&& 
.&& 

(&&% &
OverriddenRouteName&&& 9
)&&9 :
)&&: ;
{'' 
return(( 
new(( 
List(( 
<((  
string((  &
>((& '
(((' (
)((( )
{((* +
OverriddenRouteName((, ?
}((@ A
;((A B
})) 
var++ 

=++ 
Helper++  &
.++& '
ViewContext++' 2
.++2 3
	RouteData++3 <
.++< =
Routers++= D
.++D E
OfType++E K
<++K L
INamedRouter++L X
>++X Y
(++Y Z
)++Z [
;++[ \
return,, 

.,,  !
Select,,! '
(,,' (
r,,( )
=>,,* ,
r,,- .
.,,. /
Name,,/ 3
),,3 4
;,,4 5
}-- 	
}.. 
}// �

�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Events\ProductSearchEvent.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Events "
{ 
public 

class 
ProductSearchEvent #
{		 
public
string

SearchTerm
{
get
;
set
;
}
public 
bool  
SearchInDescriptions (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
IList 
< 
int 
> 
CategoryIds %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
int 
ManufacturerId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
int 
WorkingLanguageId $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public!! 
int!! 
VendorId!! 
{!! 
get!! !
;!!! "
set!!# &
;!!& '
}!!( )
}"" 
}## �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Extensions\CommonExtensions.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 

Extensions		 &
{

 
public 

static 
class 
CommonExtensions (
{ 
public 
static 
bool "
SelectionIsNotPossible 1
(1 2
this2 6
IList7 <
<< =
SelectListItem= K
>K L
itemsM R
,R S
boolT X
ignoreZeroValueY h
=i j
truek o
)o p
{ 	
if 
( 
items 
== 
null 
) 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
items7 <
)< =
)= >
;> ?
return 
items 
. 
Count 
( 
x  
=>! #
!$ %
ignoreZeroValue% 4
||5 7
!8 9
x9 :
.: ;
Value; @
.@ A
ToStringA I
(I J
)J K
.K L
EqualsL R
(R S
$strS V
)V W
)W X
<Y Z
$num[ \
;\ ]
} 	
public%% 
static%% 
string%% 
RelativeFormat%% +
(%%+ ,
this%%, 0
DateTime%%1 9
source%%: @
,%%@ A
string%%B H
languageCode%%I U
=%%V W
$str%%X _
)%%_ `
{&& 	
var'' 
ts'' 
='' 
new'' 
TimeSpan'' !
(''! "
DateTime''" *
.''* +
UtcNow''+ 1
.''1 2
Ticks''2 7
-''8 9
source'': @
.''@ A
Ticks''A F
)''F G
;''G H
var(( 
delta(( 
=(( 
ts(( 
.(( 
TotalSeconds(( '
;((' (
CultureInfo** 
culture** 
=**  !
null**" &
;**& '
try++ 
{,, 
culture-- 
=-- 
new-- 
CultureInfo-- )
(--) *
languageCode--* 6
)--6 7
;--7 8
}.. 
catch// 
(// $
CultureNotFoundException// +
)//+ ,
{00 
culture11 
=11 
new11 
CultureInfo11 )
(11) *
$str11* 1
)111 2
;112 3
}22 
return33 
TimeSpan33 
.33 
FromSeconds33 '
(33' (
delta33( -
)33- .
.33. /
Humanize33/ 7
(337 8
	precision338 A
:33A B
$num33C D
,33D E
culture33F M
:33M N
culture33O V
,33V W
maxUnit33X _
:33_ `
TimeUnit33a i
.33i j
Year33j n
)33n o
;33o p
}44 	
}55 
}66 ��
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Extensions\HtmlExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

Extensions &
{ 
public 

static 
class 
HtmlExtensions &
{ 
public%% 
static%% 
IHtmlContent%% "
LocalizedEditor%%# 2
<%%2 3
T%%3 4
,%%4 5 
TLocalizedModelLocal%%6 J
>%%J K
(%%K L
this%%L P
IHtmlHelper%%Q \
<%%\ ]
T%%] ^
>%%^ _
helper%%` f
,%%f g
string&& 
name&& 
,&& 
Func'' 
<'' 
int'' 
,'' 
HelperResult'' "
>''" #
localizedTemplate''$ 5
,''5 6
Func(( 
<(( 
T(( 
,(( 
HelperResult((  
>((  !
standardTemplate((" 2
,((2 3
bool)) !
ignoreIfSeveralStores)) &
=))' (
false))) .
,)). /
string))0 6
cssClass))7 ?
=))@ A
$str))B D
)))D E
where** 
T** 
:** 
ILocalizedModel** %
<**% & 
TLocalizedModelLocal**& :
>**: ;
where++  
TLocalizedModelLocal++ &
:++' (!
ILocalizedLocaleModel++) >
{,, 	
var-- !
localizationSupported-- %
=--& '
helper--( .
.--. /
ViewData--/ 7
.--7 8
Model--8 =
.--= >
Locales--> E
.--E F
Count--F K
>--L M
$num--N O
;--O P
if.. 
(.. !
ignoreIfSeveralStores.. %
)..% &
{// 
var00 
storeService00  
=00! "

.000 1
Current001 8
.008 9
Resolve009 @
<00@ A

>00N O
(00O P
)00P Q
;00Q R
if11 
(11 
storeService11  
.11  !
GetAllStores11! -
(11- .
)11. /
.11/ 0
Count110 5
>=116 8
$num119 :
)11: ;
{22 !
localizationSupported33 )
=33* +
false33, 1
;331 2
}44 
}55 
if66 
(66 !
localizationSupported66 %
)66% &
{77 
var88 
tabStrip88 
=88 
new88 "

(880 1
)881 2
;882 3
var99 
cssClassWithSpace99 %
=99& '
!99( )
String99) /
.99/ 0

(99= >
cssClass99> F
)99F G
?99H I
$str99J M
+99N O
cssClass99P X
:99Y Z
null99[ _
;99_ `
tabStrip:: 
.:: 

AppendLine:: #
(::# $
$"::$ &
$str::& 0
{::0 1
name::1 5
}::5 6
$str::6 j
{::j k
cssClassWithSpace::k |
}::| }
$str	::} �
"
::� �
)
::� �
;
::� �
var== 
tabNameToSelect== #
===$ %
GetSelectedTabName==& 8
(==8 9
helper==9 ?
,==? @
name==A E
)==E F
;==F G
var>> 
selectedTabInput>> $
=>>% &
new>>' *

TagBuilder>>+ 5
(>>5 6
$str>>6 =
)>>= >
;>>> ?
selectedTabInput??  
.??  !

Attributes??! +
.??+ ,
Add??, /
(??/ 0
$str??0 6
,??6 7
$str??8 @
)??@ A
;??A B
selectedTabInput@@  
.@@  !

Attributes@@! +
.@@+ ,
Add@@, /
(@@/ 0
$str@@0 4
,@@4 5
$"@@6 8
$str@@8 J
{@@J K
name@@K O
}@@O P
"@@P Q
)@@Q R
;@@R S
selectedTabInputAA  
.AA  !

AttributesAA! +
.AA+ ,
AddAA, /
(AA/ 0
$strAA0 6
,AA6 7
$"AA8 :
$strAA: L
{AAL M
nameAAM Q
}AAQ R
"AAR S
)AAS T
;AAT U
selectedTabInputBB  
.BB  !

AttributesBB! +
.BB+ ,
AddBB, /
(BB/ 0
$strBB0 7
,BB7 8
tabNameToSelectBB9 H
)BBH I
;BBI J
tabStripCC 
.CC 

AppendLineCC #
(CC# $
selectedTabInputCC$ 4
.CC4 5
RenderHtmlContentCC5 F
(CCF G
)CCG H
)CCH I
;CCI J
tabStripEE 
.EE 

AppendLineEE #
(EE# $
$strEE$ A
)EEA B
;EEB C
varHH 
standardTabNameHH #
=HH$ %
$"HH& (
{HH( )
nameHH) -
}HH- .
$strHH. ;
"HH; <
;HH< =
varII 
standardTabSelectedII '
=II( )
stringII* 0
.II0 1

(II> ?
tabNameToSelectII? N
)IIN O
||IIP R
standardTabNameIIS b
==IIc e
tabNameToSelectIIf u
;IIu v
tabStripJJ 
.JJ 

AppendLineJJ #
(JJ# $
stringJJ$ *
.JJ* +
FormatJJ+ 1
(JJ1 2
$strJJ2 ;
,JJ; <
standardTabSelectedJJ= P
?JJQ R
$strJJS f
:JJg h
nullJJi m
)JJm n
)JJn o
;JJo p
tabStripKK 
.KK 

AppendLineKK #
(KK# $
$"KK$ &
$strKK& 9
{KK9 :
standardTabNameKK: I
}KKI J
$strKKJ U
{KKU V
standardTabNameKKV e
}KKe f
$strKKf }
{KK} ~

.
KK� �
Current
KK� �
.
KK� �
Resolve
KK� �
<
KK� �"
ILocalizationService
KK� �
>
KK� �
(
KK� �
)
KK� �
.
KK� �
GetResource
KK� �
(
KK� �
$str
KK� �
)
KK� �
}
KK� �
$str
KK� �
"
KK� �
)
KK� �
;
KK� �
tabStripLL 
.LL 

AppendLineLL #
(LL# $
$strLL$ +
)LL+ ,
;LL, -
varNN 
languageServiceNN #
=NN$ %

.NN3 4
CurrentNN4 ;
.NN; <
ResolveNN< C
<NNC D
ILanguageServiceNND T
>NNT U
(NNU V
)NNV W
;NNW X
varOO 
	urlHelperOO 
=OO 

.OO- .
CurrentOO. 5
.OO5 6
ResolveOO6 =
<OO= >
IUrlHelperFactoryOO> O
>OOO P
(OOP Q
)OOQ R
.OOR S
GetUrlHelperOOS _
(OO_ `
helperOO` f
.OOf g
ViewContextOOg r
)OOr s
;OOs t
foreachQQ 
(QQ 
varQQ 
localeQQ #
inQQ$ &
helperQQ' -
.QQ- .
ViewDataQQ. 6
.QQ6 7
ModelQQ7 <
.QQ< =
LocalesQQ= D
)QQD E
{RR 
varTT 
languageTT  
=TT! "
languageServiceTT# 2
.TT2 3
GetLanguageByIdTT3 B
(TTB C
localeTTC I
.TTI J

LanguageIdTTJ T
)TTT U
;TTU V
ifUU 
(UU 
languageUU  
==UU! #
nullUU$ (
)UU( )
throwVV 
newVV !
	ExceptionVV" +
(VV+ ,
$strVV, G
)VVG H
;VVH I
varXX 
localizedTabNameXX (
=XX) *
$"XX+ -
{XX- .
nameXX. 2
}XX2 3
$strXX3 4
{XX4 5
languageXX5 =
.XX= >
IdXX> @
}XX@ A
$strXXA E
"XXE F
;XXF G
tabStripYY 
.YY 

AppendLineYY '
(YY' (
stringYY( .
.YY. /
FormatYY/ 5
(YY5 6
$strYY6 ?
,YY? @
localizedTabNameYYA Q
==YYR T
tabNameToSelectYYU d
?YYe f
$strYYg z
:YY{ |
null	YY} �
)
YY� �
)
YY� �
;
YY� �
varZZ 
iconUrlZZ 
=ZZ  !
	urlHelperZZ" +
.ZZ+ ,
ContentZZ, 3
(ZZ3 4
$strZZ4 E
+ZZF G
languageZZH P
.ZZP Q
FlagImageFileNameZZQ b
)ZZb c
;ZZc d
tabStrip[[ 
.[[ 

AppendLine[[ '
([[' (
$"[[( *
$str[[* =
{[[= >
localizedTabName[[> N
}[[N O
$str[[O Z
{[[Z [
localizedTabName[[[ k
}[[k l
$str	[[l �
{
[[� �
iconUrl
[[� �
}
[[� �
$str
[[� �
{
[[� �

WebUtility
[[� �
.
[[� �

HtmlEncode
[[� �
(
[[� �
language
[[� �
.
[[� �
Name
[[� �
)
[[� �
}
[[� �
$str
[[� �
"
[[� �
)
[[� �
;
[[� �
tabStrip]] 
.]] 

AppendLine]] '
(]]' (
$str]]( /
)]]/ 0
;]]0 1
}^^ 
tabStrip__ 
.__ 

AppendLine__ #
(__# $
$str__$ +
)__+ ,
;__, -
tabStripbb 
.bb 

AppendLinebb #
(bb# $
$strbb$ A
)bbA B
;bbB C
tabStripcc 
.cc 

AppendLinecc #
(cc# $
stringcc$ *
.cc* +
Formatcc+ 1
(cc1 2
$strcc2 Z
,ccZ [
standardTabSelectedcc\ o
?ccp q
$strccr {
:cc| }
null	cc~ �
,
cc� �
standardTabName
cc� �
)
cc� �
)
cc� �
;
cc� �
tabStripdd 
.dd 

AppendLinedd #
(dd# $
standardTemplatedd$ 4
(dd4 5
helperdd5 ;
.dd; <
ViewDatadd< D
.ddD E
ModelddE J
)ddJ K
.ddK L
ToHtmlStringddL X
(ddX Y
)ddY Z
)ddZ [
;dd[ \
tabStripee 
.ee 

AppendLineee #
(ee# $
$stree$ ,
)ee, -
;ee- .
forgg 
(gg 
vargg 
igg 
=gg 
$numgg 
;gg 
igg  !
<gg" #
helpergg$ *
.gg* +
ViewDatagg+ 3
.gg3 4
Modelgg4 9
.gg9 :
Localesgg: A
.ggA B
CountggB G
;ggG H
iggI J
++ggJ L
)ggL M
{hh 
varjj 
languagejj  
=jj! "
languageServicejj# 2
.jj2 3
GetLanguageByIdjj3 B
(jjB C
helperjjC I
.jjI J
ViewDatajjJ R
.jjR S
ModeljjS X
.jjX Y
LocalesjjY `
[jj` a
ijja b
]jjb c
.jjc d

LanguageIdjjd n
)jjn o
;jjo p
ifkk 
(kk 
languagekk  
==kk! #
nullkk$ (
)kk( )
throwll 
newll !
	Exceptionll" +
(ll+ ,
$strll, G
)llG H
;llH I
varnn 
localizedTabNamenn (
=nn) *
$"nn+ -
{nn- .
namenn. 2
}nn2 3
$strnn3 4
{nn4 5
languagenn5 =
.nn= >
Idnn> @
}nn@ A
$strnnA E
"nnE F
;nnF G
tabStripoo 
.oo 

AppendLineoo '
(oo' (
stringoo( .
.oo. /
Formatoo/ 5
(oo5 6
$stroo6 ^
,oo^ _
localizedTabNameoo` p
==ooq s
tabNameToSelect	oot �
?
oo� �
$str
oo� �
:
oo� �
null
oo� �
,
oo� �
localizedTabName
oo� �
)
oo� �
)
oo� �
;
oo� �
tabStrippp 
.pp 

AppendLinepp '
(pp' (
localizedTemplatepp( 9
(pp9 :
ipp: ;
)pp; <
.pp< =
ToHtmlStringpp= I
(ppI J
)ppJ K
)ppK L
;ppL M
tabStripqq 
.qq 

AppendLineqq '
(qq' (
$strqq( 0
)qq0 1
;qq1 2
}rr 
tabStripss 
.ss 

AppendLiness #
(ss# $
$strss$ ,
)ss, -
;ss- .
tabStriptt 
.tt 

AppendLinett #
(tt# $
$strtt$ ,
)tt, -
;tt- .
varww 
scriptww 
=ww 
newww  

TagBuilderww! +
(ww+ ,
$strww, 4
)ww4 5
;ww5 6
scriptxx 
.xx 
	InnerHtmlxx  
.xx  !

AppendHtmlxx! +
(xx+ ,
$strxx, j
+xxk l
namexxm q
+xxr s
$str	xxt �
+
xx� �
name
xx� �
+
xx� �
$str
xx� �
)
xx� �
;
xx� �
tabStripyy 
.yy 

AppendLineyy #
(yy# $
scriptyy$ *
.yy* +
RenderHtmlContentyy+ <
(yy< =
)yy= >
)yy> ?
;yy? @
return{{ 
new{{ 

HtmlString{{ %
({{% &
tabStrip{{& .
.{{. /
ToString{{/ 7
({{7 8
){{8 9
){{9 :
;{{: ;
}|| 
else}} 
{~~ 
return 
new 

HtmlString %
(% &
standardTemplate& 6
(6 7
helper7 =
.= >
ViewData> F
.F G
ModelG L
)L M
.M N
RenderHtmlContentN _
(_ `
)` a
)a b
;b c
}
�� 
}
�� 	
public
�� 
static
�� 
string
�� "
GetSelectedPanelName
�� 1
(
��1 2
this
��2 6
IHtmlHelper
��7 B
helper
��C I
)
��I J
{
�� 	
var
�� 
tabName
�� 
=
�� 
string
��  
.
��  !
Empty
��! &
;
��& '
const
�� 
string
�� 
dataKey
��  
=
��! "
$str
��# <
;
��< =
if
�� 
(
�� 
helper
�� 
.
�� 
ViewData
�� 
.
��  
ContainsKey
��  +
(
��+ ,
dataKey
��, 3
)
��3 4
)
��4 5
tabName
�� 
=
�� 
helper
��  
.
��  !
ViewData
��! )
[
��) *
dataKey
��* 1
]
��1 2
.
��2 3
ToString
��3 ;
(
��; <
)
��< =
;
��= >
if
�� 
(
�� 
helper
�� 
.
�� 
ViewContext
�� "
.
��" #
TempData
��# +
.
��+ ,
ContainsKey
��, 7
(
��7 8
dataKey
��8 ?
)
��? @
)
��@ A
tabName
�� 
=
�� 
helper
��  
.
��  !
ViewContext
��! ,
.
��, -
TempData
��- 5
[
��5 6
dataKey
��6 =
]
��= >
.
��> ?
ToString
��? G
(
��G H
)
��H I
;
��I J
return
�� 
tabName
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
string
��  
GetSelectedTabName
�� /
(
��/ 0
this
��0 4
IHtmlHelper
��5 @
helper
��A G
,
��G H
string
��I O

��P ]
=
��^ _
null
��` d
)
��d e
{
�� 	
var
�� 
tabName
�� 
=
�� 
string
��  
.
��  !
Empty
��! &
;
��& '
var
�� 
dataKey
�� 
=
�� 
$str
�� 1
;
��1 2
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 

�� %
(
��% &

��& 3
)
��3 4
)
��4 5
dataKey
�� 
+=
�� 
$"
�� 
$str
�� 
{
�� 

�� ,
}
��, -
"
��- .
;
��. /
if
�� 
(
�� 
helper
�� 
.
�� 
ViewData
�� 
.
��  
ContainsKey
��  +
(
��+ ,
dataKey
��, 3
)
��3 4
)
��4 5
tabName
�� 
=
�� 
helper
��  
.
��  !
ViewData
��! )
[
��) *
dataKey
��* 1
]
��1 2
.
��2 3
ToString
��3 ;
(
��; <
)
��< =
;
��= >
if
�� 
(
�� 
helper
�� 
.
�� 
ViewContext
�� "
.
��" #
TempData
��# +
.
��+ ,
ContainsKey
��, 7
(
��7 8
dataKey
��8 ?
)
��? @
)
��@ A
tabName
�� 
=
�� 
helper
��  
.
��  !
ViewContext
��! ,
.
��, -
TempData
��- 5
[
��5 6
dataKey
��6 =
]
��= >
.
��> ?
ToString
��? G
(
��G H
)
��H I
;
��I J
return
�� 
tabName
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
IHtmlContent
�� "
TabContentByURL
��# 2
(
��2 3
this
��3 7"
AdminTabStripCreated
��8 L
eventMessage
��M Y
,
��Y Z
string
��[ a
tabId
��b g
,
��g h
string
��i o
tabName
��p w
,
��w x
string
��y 
url��� �
)��� �
{
�� 	
return
�� 
new
�� 

HtmlString
�� !
(
��! "
$@"
��" %
$str
��% 1
{
��1 2
tabId
��2 7
}
��7 8
$str
��8 S
{
��S T
tabId
��T Y
}
��Y Z
$str
��Z \
{
��\ ]
tabName
��] d
}
��d e
$str
��e |
{
��| }
eventMessage��} �
.��� �
TabStripName��� �
}��� �
$str��� 
{
��  
url
��  #
}
��# $
$str
��$ 9
{
��9 :
tabId
��: ?
}
��? @
$str
��@ d
{
��d e
eventMessage
��e q
.
��q r
TabStripName
��r ~
}
��~ 
$str
�� 
"
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
IHtmlContent
�� "
TabContentByModel
��# 4
(
��4 5
this
��5 9"
AdminTabStripCreated
��: N
eventMessage
��O [
,
��[ \
string
��] c
tabId
��d i
,
��i j
string
��k q
tabName
��r y
,
��y z
string��{ �
contentModel��� �
)��� �
{
�� 	
return
�� 
new
�� 

HtmlString
�� !
(
��! "
$@"
��" %
$str
��% 1
{
��1 2
tabId
��2 7
}
��7 8
$str
��8 S
{
��S T
tabId
��T Y
}
��Y Z
$str
��Z \
{
��\ ]
tabName
��] d
}
��d e
$str
��e |
{
��| }
eventMessage��} �
.��� �
TabStripName��� �
}��� �
$str��� 5
{
��5 6
tabId
��6 ;
}
��; <
$str
��< >
{
��> ?
contentModel
��? K
}
��K L
$str
��L `
{
��` a
eventMessage
��a m
.
��m n
TabStripName
��n z
}
��z {
$str
��{ 
"
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
IHtmlContent
�� "
Hint
��# '
(
��' (
this
��( ,
IHtmlHelper
��- 8
helper
��9 ?
,
��? @
string
��A G
value
��H M
)
��M N
{
�� 	
var
�� 
builder
�� 
=
�� 
new
�� 

TagBuilder
�� (
(
��( )
$str
��) .
)
��. /
;
��/ 0
builder
�� 
.
�� 
MergeAttribute
�� "
(
��" #
$str
��# *
,
��* +
value
��, 1
)
��1 2
;
��2 3
builder
�� 
.
�� 
MergeAttribute
�� "
(
��" #
$str
��# *
,
��* +
$str
��, 6
)
��6 7
;
��7 8
builder
�� 
.
�� 
MergeAttribute
�� "
(
��" #
$str
��# 0
,
��0 1
$str
��2 ;
)
��; <
;
��< =
var
�� 
icon
�� 
=
�� 
new
�� 

�� (
(
��( )
)
��) *
;
��* +
icon
�� 
.
�� 
Append
�� 
(
�� 
$str
�� ?
)
��? @
;
��@ A
builder
�� 
.
�� 
	InnerHtml
�� 
.
�� 

AppendHtml
�� (
(
��( )
icon
��) -
.
��- .
ToString
��. 6
(
��6 7
)
��7 8
)
��8 9
;
��9 :
return
�� 
new
�� 

HtmlString
�� !
(
��! "
builder
��" )
.
��) *
ToHtmlString
��* 6
(
��6 7
)
��7 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
static
�� 
string
�� 
RenderHtmlContent
�� .
(
��. /
this
��/ 3
IHtmlContent
��4 @
htmlContent
��A L
)
��L M
{
�� 	
using
�� 
(
�� 
var
�� 
writer
�� 
=
�� 
new
��  #
StringWriter
��$ 0
(
��0 1
)
��1 2
)
��2 3
{
�� 
htmlContent
�� 
.
�� 
WriteTo
�� #
(
��# $
writer
��$ *
,
��* +
HtmlEncoder
��, 7
.
��7 8
Default
��8 ?
)
��? @
;
��@ A
var
�� 

htmlOutput
�� 
=
��  
writer
��! '
.
��' (
ToString
��( 0
(
��0 1
)
��1 2
;
��2 3
return
�� 

htmlOutput
�� !
;
��! "
}
�� 
}
�� 	
public
�� 
static
�� 
string
�� 
ToHtmlString
�� )
(
��) *
this
��* .
IHtmlContent
��/ ;
tag
��< ?
)
��? @
{
�� 	
using
�� 
(
�� 
var
�� 
writer
�� 
=
�� 
new
��  #
StringWriter
��$ 0
(
��0 1
)
��1 2
)
��2 3
{
�� 
tag
�� 
.
�� 
WriteTo
�� 
(
�� 
writer
�� "
,
��" #
HtmlEncoder
��$ /
.
��/ 0
Default
��0 7
)
��7 8
;
��8 9
return
�� 
writer
�� 
.
�� 
ToString
�� &
(
��& '
)
��' (
;
��( )
}
�� 
}
�� 	
}
�� 
}�� �!
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Factories\AclSupportedModelFactory.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 
	Factories

 %
{ 
public 

partial 
class $
AclSupportedModelFactory 1
:2 3%
IAclSupportedModelFactory4 M
{ 
private 
readonly 
IAclService $
_aclService% 0
;0 1
private 
readonly 
ICustomerService )
_customerService* :
;: ;
public $
AclSupportedModelFactory '
(' (
IAclService( 3

aclService4 >
,> ?
ICustomerService 
customerService ,
), -
{ 	
_aclService 
= 

aclService $
;$ %
_customerService 
= 
customerService .
;. /
} 	
public** 
virtual** 
void** %
PrepareModelCustomerRoles** 5
<**5 6
TModel**6 <
>**< =
(**= >
TModel**> D
model**E J
)**J K
where**L Q
TModel**R X
:**Y Z
IAclSupportedModel**[ m
{++ 	
if,, 
(,, 
model,, 
==,, 
null,, 
),, 
throw-- 
new-- !
ArgumentNullException-- /
(--/ 0
nameof--0 6
(--6 7
model--7 <
)--< =
)--= >
;--> ?
var00 
availableRoles00 
=00  
_customerService00! 1
.001 2
GetAllCustomerRoles002 E
(00E F

showHidden00F P
:00P Q
true00R V
)00V W
;00W X
model11 
.11 "
AvailableCustomerRoles11 (
=11) *
availableRoles11+ 9
.119 :
Select11: @
(11@ A
role11A E
=>11F H
new11I L
SelectListItem11M [
{22 
Text33 
=33 
role33 
.33 
Name33  
,33  !
Value44 
=44 
role44 
.44 
Id44 
.44  
ToString44  (
(44( )
)44) *
,44* +
Selected55 
=55 
model55  
.55  !#
SelectedCustomerRoleIds55! 8
.558 9
Contains559 A
(55A B
role55B F
.55F G
Id55G I
)55I J
}66 
)66
.66 
ToList66 
(66 
)66 
;66 
}77 	
publicAA 
virtualAA 
voidAA %
PrepareModelCustomerRolesAA 5
<AA5 6
TModelAA6 <
,AA< =
TEntityAA> E
>AAE F
(AAF G
TModelAAG M
modelAAN S
,AAS T
TEntityAAU \
entityAA] c
,AAc d
boolAAe i
ignoreAclMappingsAAj {
)AA{ |
whereBB 
TModelBB 
:BB 
IAclSupportedModelBB -
whereBB. 3
TEntityBB4 ;
:BB< =

BaseEntityBB> H
,BBH I

{CC 	
ifDD 
(DD 
modelDD 
==DD 
nullDD 
)DD 
throwEE 
newEE !
ArgumentNullExceptionEE /
(EE/ 0
nameofEE0 6
(EE6 7
modelEE7 <
)EE< =
)EE= >
;EE> ?
ifHH 
(HH 
!HH 
ignoreAclMappingsHH "
&&HH# %
entityHH& ,
!=HH- /
nullHH0 4
)HH4 5
modelII 
.II #
SelectedCustomerRoleIdsII -
=II. /
_aclServiceII0 ;
.II; <(
GetCustomerRoleIdsWithAccessII< X
(IIX Y
entityIIY _
)II_ `
.II` a
ToListIIa g
(IIg h
)IIh i
;IIi j%
PrepareModelCustomerRolesKK %
(KK% &
modelKK& +
)KK+ ,
;KK, -
}LL 	
}OO 
}PP �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Factories\DiscountSupportedModelFactory.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 
	Factories		 %
{

 
public 

partial 
class )
DiscountSupportedModelFactory 6
:7 8*
IDiscountSupportedModelFactory9 W
{ 
public 
virtual 
void !
PrepareModelDiscounts 1
<1 2
TModel2 8
>8 9
(9 :
TModel: @
modelA F
,F G
IListH M
<M N
DiscountN V
>V W
availableDiscountsX j
)j k
wherel q
TModelr x
:y z$
IDiscountSupportedModel	{ �
{ 	
if 
( 
model 
== 
null 
) 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
model7 <
)< =
)= >
;> ?
model 
. 
AvailableDiscounts $
=% &
availableDiscounts' 9
.9 :
Select: @
(@ A
discountA I
=>J L
newM P
SelectListItemQ _
{ 
Text   
=   
discount   
.    
Name    $
,  $ %
Value!! 
=!! 
discount!!  
.!!  !
Id!!! #
.!!# $
ToString!!$ ,
(!!, -
)!!- .
,!!. /
Selected"" 
="" 
model""  
.""  !
SelectedDiscountIds""! 4
.""4 5
Contains""5 =
(""= >
discount""> F
.""F G
Id""G I
)""I J
}## 
)##
.## 
ToList## 
(## 
)## 
;## 
}$$ 	
public// 
virtual// 
void// !
PrepareModelDiscounts// 1
<//1 2
TModel//2 8
,//8 9
TEntity//: A
>//A B
(//B C
TModel//C I
model//J O
,//O P
TEntity//Q X
entity//Y _
,//_ `
IList00 
<00 
Discount00 
>00 
availableDiscounts00 .
,00. /
bool000 4"
ignoreAppliedDiscounts005 K
)00K L
where11 
TModel11 
:11 #
IDiscountSupportedModel11 2
where113 8
TEntity119 @
:11A B

BaseEntity11C M
,11M N
IDiscountSupported11O a
{22 	
if33 
(33 
model33 
==33 
null33 
)33 
throw44 
new44 !
ArgumentNullException44 /
(44/ 0
nameof440 6
(446 7
model447 <
)44< =
)44= >
;44> ?
if77 
(77 
!77 "
ignoreAppliedDiscounts77 '
&&77( *
entity77+ 1
!=772 4
null775 9
)779 :
model88 
.88 
SelectedDiscountIds88 )
=88* +
entity88, 2
.882 3
AppliedDiscounts883 C
.88C D
Select88D J
(88J K
discount88K S
=>88T V
discount88W _
.88_ `
Id88` b
)88b c
.88c d
ToList88d j
(88j k
)88k l
;88l m!
PrepareModelDiscounts:: !
(::! "
model::" '
,::' (
availableDiscounts::) ;
)::; <
;::< =
};; 	
}>> 
}?? �

�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Factories\IAclSupportedModelFactory.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
	Factories %
{ 
public

 

partial

 
	interface

 %
IAclSupportedModelFactory

 6
{ 
void %
PrepareModelCustomerRoles
<& '
TModel' -
>- .
(. /
TModel/ 5
model6 ;
); <
where= B
TModelC I
:J K
IAclSupportedModelL ^
;^ _
void %
PrepareModelCustomerRoles
<& '
TModel' -
,- .
TEntity/ 6
>6 7
(7 8
TModel8 >
model? D
,D E
TEntityF M
entityN T
,T U
boolV Z
ignoreAclMappings[ l
)l m
where 
TModel 
: 
IAclSupportedModel -
where. 3
TEntity4 ;
:< =

BaseEntity> H
,H I

;W X
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Factories\IDiscountSupportedModelFactory.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
	Factories %
{ 
public 

partial 
	interface *
IDiscountSupportedModelFactory ;
{ 
void !
PrepareModelDiscounts
<" #
TModel# )
>) *
(* +
TModel+ 1
model2 7
,7 8
IList9 >
<> ?
Discount? G
>G H
availableDiscountsI [
)[ \
where] b
TModelc i
:j k$
IDiscountSupportedModel	l �
;
� �
void !
PrepareModelDiscounts
<" #
TModel# )
,) *
TEntity+ 2
>2 3
(3 4
TModel4 :
model; @
,@ A
TEntityB I
entityJ P
,P Q
IList 
< 
Discount 
> 
availableDiscounts .
,. /
bool0 4"
ignoreAppliedDiscounts5 K
)K L
where   
TModel   
:   #
IDiscountSupportedModel   2
where  3 8
TEntity  9 @
:  A B

BaseEntity  C M
,  M N
IDiscountSupported  O a
;  a b
}!! 
}"" �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Factories\ILocalizedModelFactory.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
	Factories %
{ 
public

 

partial

 
	interface

 "
ILocalizedModelFactory

 3
{ 
IList 
<
T 
> "
PrepareLocalizedModels '
<' (
T( )
>) *
(* +
Action+ 1
<1 2
T2 3
,3 4
int5 8
>8 9
	configure: C
=D E
nullF J
)J K
whereL Q
TR S
:T U!
ILocalizedLocaleModelV k
;k l
} 
} �

�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Factories\IStoreMappingSupportedModelFactory.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
	Factories %
{ 
public

 

partial

 
	interface

 .
"IStoreMappingSupportedModelFactory

 ?
{ 
void 
PrepareModelStores
<  
TModel  &
>& '
(' (
TModel( .
model/ 4
)4 5
where6 ;
TModel< B
:C D'
IStoreMappingSupportedModelE `
;` a
void 
PrepareModelStores
<  
TModel  &
,& '
TEntity( /
>/ 0
(0 1
TModel1 7
model8 =
,= >
TEntity? F
entityG M
,M N
boolO S
ignoreStoreMappingsT g
)g h
where 
TModel 
: '
IStoreMappingSupportedModel 6
where7 <
TEntity= D
:E F

BaseEntityG Q
,Q R"
IStoreMappingSupportedS i
;i j
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Factories\LocalizedModelFactory.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
	Factories %
{ 
public 

partial 
class !
LocalizedModelFactory .
:/ 0"
ILocalizedModelFactory1 G
{
private 
readonly 
ILanguageService )
_languageService* :
;: ;
public !
LocalizedModelFactory $
($ %
ILanguageService% 5
languageService6 E
)E F
{ 	
_languageService 
= 
languageService .
;. /
} 	
public%% 
virtual%% 
IList%% 
<%% 
T%% 
>%% "
PrepareLocalizedModels%%  6
<%%6 7
T%%7 8
>%%8 9
(%%9 :
Action%%: @
<%%@ A
T%%A B
,%%B C
int%%D G
>%%G H
	configure%%I R
=%%S T
null%%U Y
)%%Y Z
where%%[ `
T%%a b
:%%c d!
ILocalizedLocaleModel%%e z
{&& 	
var(( 
availableLanguages(( "
=((# $
_languageService((% 5
.((5 6
GetAllLanguages((6 E
(((E F

showHidden((F P
:((P Q
true((R V
)((V W
;((W X
var++ 
localizedModels++ 
=++  !
availableLanguages++" 4
.++4 5
Select++5 ;
(++; <
language++< D
=>++E G
{,, 
var.. 
localizedModel.. "
=..# $
	Activator..% .
.... /
CreateInstance../ =
<..= >
T..> ?
>..? @
(..@ A
)..A B
;..B C
localizedModel11 
.11 

LanguageId11 )
=11* +
language11, 4
.114 5
Id115 7
;117 8
if44 
(44 
	configure44 
!=44  
null44! %
)44% &
	configure55 
.55 
Invoke55 $
(55$ %
localizedModel55% 3
,553 4
localizedModel555 C
.55C D

LanguageId55D N
)55N O
;55O P
return77 
localizedModel77 %
;77% &
}88 
)88
.88 
ToList88 
(88 
)88 
;88 
return:: 
localizedModels:: "
;::" #
};; 	
}>> 
}?? �!
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Factories\StoreMappingSupportedModelFactory.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 
	Factories		 %
{

 
public 

partial 
class -
!StoreMappingSupportedModelFactory :
:; <.
"IStoreMappingSupportedModelFactory= _
{ 
private 
readonly  
IStoreMappingService - 
_storeMappingService. B
;B C
private 
readonly 


;4 5
public -
!StoreMappingSupportedModelFactory 0
(0 1 
IStoreMappingService1 E
storeMappingServiceF Y
,Y Z

storeService &
)& '
{ 	 
_storeMappingService  
=! "
storeMappingService# 6
;6 7

= 
storeService (
;( )
} 	
public)) 
virtual)) 
void)) 
PrepareModelStores)) .
<)). /
TModel))/ 5
>))5 6
())6 7
TModel))7 =
model))> C
)))C D
where))E J
TModel))K Q
:))R S'
IStoreMappingSupportedModel))T o
{** 	
if++ 
(++ 
model++ 
==++ 
null++ 
)++ 
throw,, 
new,, !
ArgumentNullException,, /
(,,/ 0
nameof,,0 6
(,,6 7
model,,7 <
),,< =
),,= >
;,,> ?
var// 
availableStores// 
=//  !

./// 0
GetAllStores//0 <
(//< =
)//= >
;//> ?
model00 
.00 
AvailableStores00 !
=00" #
availableStores00$ 3
.003 4
Select004 :
(00: ;
store00; @
=>00A C
new00D G
SelectListItem00H V
{11 
Text22 
=22 
store22 
.22 
Name22 !
,22! "
Value33 
=33 
store33 
.33 
Id33  
.33  !
ToString33! )
(33) *
)33* +
,33+ ,
Selected44 
=44 
model44  
.44  !
SelectedStoreIds44! 1
.441 2
Contains442 :
(44: ;
store44; @
.44@ A
Id44A C
)44C D
}55 
)55
.55 
ToList55 
(55 
)55 
;55 
}66 	
public@@ 
virtual@@ 
void@@ 
PrepareModelStores@@ .
<@@. /
TModel@@/ 5
,@@5 6
TEntity@@7 >
>@@> ?
(@@? @
TModel@@@ F
model@@G L
,@@L M
TEntity@@N U
entity@@V \
,@@\ ]
bool@@^ b
ignoreStoreMappings@@c v
)@@v w
whereAA 
TModelAA 
:AA '
IStoreMappingSupportedModelAA 6
whereAA7 <
TEntityAA= D
:AAE F

BaseEntityAAG Q
,AAQ R"
IStoreMappingSupportedAAS i
{BB 	
ifCC 
(CC 
modelCC 
==CC 
nullCC 
)CC 
throwDD 
newDD !
ArgumentNullExceptionDD /
(DD/ 0
nameofDD0 6
(DD6 7
modelDD7 <
)DD< =
)DD= >
;DD> ?
ifGG 
(GG 
!GG 
ignoreStoreMappingsGG $
&&GG% '
entityGG( .
!=GG/ 1
nullGG2 6
)GG6 7
modelHH 
.HH 
SelectedStoreIdsHH &
=HH' ( 
_storeMappingServiceHH) =
.HH= >"
GetStoresIdsWithAccessHH> T
(HHT U
entityHHU [
)HH[ \
.HH\ ]
ToListHH] c
(HHc d
)HHd e
;HHe f
PrepareModelStoresJJ 
(JJ 
modelJJ $
)JJ$ %
;JJ% &
}KK 	
}NN 
}OO �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Globalization\CultureMiddleware.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

{		 
public

class
CultureMiddleware
{ 
private 
readonly 
RequestDelegate (
_next) .
;. /
public 
CultureMiddleware  
(  !
RequestDelegate! 0
next1 5
)5 6
{ 	
_next 
= 
next 
; 
} 	
	protected)) 
void)) 
SetWorkingCulture)) (
())( )

IWebHelper))) 3
	webHelper))4 =
,))= >
IWorkContext))? K
workContext))L W
)))W X
{** 	
if++ 
(++ 
!++ 
DataSettingsManager++ $
.++$ %
DatabaseIsInstalled++% 8
)++8 9
return,, 
;,, 
if.. 
(.. 
	webHelper.. 
... 
IsStaticResource.. *
(..* +
)..+ ,
).., -
return// 
;// 
var11 
adminAreaUrl11 
=11 
$"11 !
{11! "
	webHelper11" +
.11+ ,
GetStoreLocation11, <
(11< =
)11= >
}11> ?
$str11? D
"11D E
;11E F
if22 
(22 
	webHelper22 
.22 
GetThisPageUrl22 (
(22( )
false22) .
)22. /
.22/ 0

StartsWith220 :
(22: ;
adminAreaUrl22; G
,22G H
StringComparison22I Y
.22Y Z&
InvariantCultureIgnoreCase22Z t
)22t u
)22u v
{33 
CommonHelper66 
.66 
SetTelerikCulture66 .
(66. /
)66/ 0
;660 1
workContext99 
.99 
IsAdmin99 #
=99$ %
true99& *
;99* +
}:: 
else;; 
{<< 
var>> 
culture>> 
=>> 
new>> !
CultureInfo>>" -
(>>- .
workContext>>. 9
.>>9 :
WorkingLanguage>>: I
.>>I J
LanguageCulture>>J Y
)>>Y Z
;>>Z [
CultureInfo?? 
.?? 
CurrentCulture?? *
=??+ ,
culture??- 4
;??4 5
CultureInfo@@ 
.@@ 
CurrentUICulture@@ ,
=@@- .
culture@@/ 6
;@@6 7
}AA 
}BB 	
publicOO 
TaskOO 
InvokeOO 
(OO 
	MicrosoftOO $
.OO$ %

AspNetCoreOO% /
.OO/ 0
HttpOO0 4
.OO4 5
HttpContextOO5 @
contextOOA H
,OOH I

IWebHelperOOJ T
	webHelperOOU ^
,OO^ _
IWorkContextOO` l
workContextOOm x
)OOx y
{PP 	
SetWorkingCultureRR 
(RR 
	webHelperRR '
,RR' (
workContextRR) 4
)RR4 5
;RR5 6
returnUU 
_nextUU 
(UU 
contextUU  
)UU  !
;UU! "
}VV 	
}YY 
}ZZ ��
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\AdminWidgetZones.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
{ 
public 

static 
partial 
class 
AdminWidgetZones  0
{ 
public 
static 
string "
ActivityLogListButtons 3
=>4 6
$str7 X
;X Y
public 
static 
string $
ActivityTypesListButtons 5
=>6 8
$str9 \
;\ ]
public 
static 
string (
AddressAttributeDetailsBlock 9
=>: <
$str= d
;d e
public 
static 
string *
AddressAttributeDetailsButtons ;
=>< >
$str? h
;h i
public		 
static		 
string		 .
"AddressAttributeValueDetailsBottom		 ?
=>		@ B
$str		C q
;		q r
public

 
static

 
string

 /
#AddressAttributeValueDetailsButtons

 @
=>

A C
$str

D s
;

s t
public 
static 
string +
AddressAttributeValueDetailsTop <
=>= ?
$str@ k
;k l
public 
static 
string !
AffiliateDetailsBlock 2
=>3 5
$str6 U
;U V
public
static
string
AffiliateDetailsButtons
=>
$str
;
public 
static 
string  
AffiliateListButtons 1
=>2 4
$str5 S
;S T
public 
static 
string !
AllSettingListButtons 2
=>3 5
$str6 V
;V W
public 
static 
string 
AllSettingsBottom .
=>/ 1
$str2 M
;M N
public 
static 
string 
AllSettingsTop +
=>, .
$str/ G
;G H
public 
static 
string "
BlogCommentListButtons 3
=>4 6
$str7 X
;X Y
public 
static 
string 
BlogDetailsBlock -
=>. 0
$str1 K
;K L
public 
static 
string 
BlogDetailsButtons /
=>0 2
$str3 O
;O P
public 
static 
string 
BlogListButtons ,
=>- /
$str0 I
;I J
public 
static 
string  
BlogPostDetailsBlock 1
=>2 4
$str5 T
;T U
public 
static 
string 
BlogSettingsButtons 0
=>1 3
$str4 Q
;Q R
public 
static 
string !
CampaignDetailsBottom 2
=>3 5
$str6 U
;U V
public 
static 
string "
CampaignDetailsButtons 3
=>4 6
$str7 W
;W X
public 
static 
string 
CampaignDetailsTop /
=>0 2
$str3 O
;O P
public 
static 
string 
CampaignListButtons 0
=>1 3
$str4 Q
;Q R
public 
static 
string '
CatalogSettingsDetailsBlock 8
=>9 ;
$str< b
;b c
public 
static 
string "
CatalogSettingsButtons 3
=>4 6
$str7 W
;W X
public 
static 
string  
CategoryDetailsBlock 1
=>2 4
$str5 S
;S T
public 
static 
string "
CategoryDetailsButtons 3
=>4 6
$str7 W
;W X
public   
static   
string   
CategoryListButtons   0
=>  1 3
$str  4 Q
;  Q R
public!! 
static!! 
string!! '
CategoryTemplateListButtons!! 8
=>!!9 ;
$str!!< b
;!!b c
public"" 
static"" 
string"" )
CheckoutAttributeDetailsBlock"" :
=>""; =
$str""> f
;""f g
public## 
static## 
string## +
CheckoutAttributeDetailsButtons## <
=>##= ?
$str##@ j
;##j k
public$$ 
static$$ 
string$$ (
CheckoutAttributeListButtons$$ 9
=>$$: <
$str$$= d
;$$d e
public%% 
static%% 
string%% /
#CheckoutAttributeValueDetailsBottom%% @
=>%%A C
$str%%D s
;%%s t
public&& 
static&& 
string&& 0
$CheckoutAttributeValueDetailsButtons&& A
=>&&B D
$str&&E u
;&&u v
public'' 
static'' 
string'' ,
 CheckoutAttributeValueDetailsTop'' =
=>''> @
$str''A m
;''m n
public(( 
static(( 
string(( 
CountryDetailsBlock(( 0
=>((1 3
$str((4 Q
;((Q R
public)) 
static)) 
string)) !
CountryDetailsButtons)) 2
=>))3 5
$str))6 U
;))U V
public** 
static** 
string** 
CountryListButtons** /
=>**0 2
$str**3 O
;**O P
public++ 
static++ 
string++ %
CountryStateDetailsBottom++ 6
=>++7 9
$str++: ^
;++^ _
public,, 
static,, 
string,, &
CountryStateDetailsButtons,, 7
=>,,8 :
$str,,; `
;,,` a
public-- 
static-- 
string-- "
CountryStateDetailsTop-- 3
=>--4 6
$str--7 X
;--X Y
public.. 
static.. 
string.. !
CurrencyDetailsBottom.. 2
=>..3 5
$str..6 U
;..U V
public// 
static// 
string// "
CurrencyDetailsButtons// 3
=>//4 6
$str//7 W
;//W X
public00 
static00 
string00 
CurrencyDetailsTop00 /
=>000 2
$str003 O
;00O P
public11 
static11 
string11 
CurrencyListButtons11 0
=>111 3
$str114 Q
;11Q R
public22 
static22 
string22 *
CurrentShoppingCartListButtons22 ;
=>22< >
$str22? i
;22i j
public33 
static33 
string33 (
CustomerAddressDetailsBottom33 9
=>33: <
$str33= d
;33d e
public44 
static44 
string44 )
CustomerAddressDetailsButtons44 :
=>44; =
$str44> f
;44f g
public55 
static55 
string55 %
CustomerAddressDetailsTop55 6
=>557 9
$str55: ^
;55^ _
public66 
static66 
string66 +
CustomerAttributeDetailsButtons66 <
=>66= ?
$str66@ j
;66j k
public77 
static77 
string77 )
CustomerAttributeDetailsBlock77 :
=>77; =
$str77> f
;77f g
public88 
static88 
string88 /
#CustomerAttributeValueDetailsBottom88 @
=>88A C
$str88D s
;88s t
public99 
static99 
string99 0
$CustomerAttributeValueDetailsButtons99 A
=>99B D
$str99E u
;99u v
public:: 
static:: 
string:: ,
 CustomerAttributeValueDetailsTop:: =
=>::> @
$str::A m
;::m n
public;; 
static;; 
string;;  
CustomerDetailsBlock;; 1
=>;;2 4
$str;;5 S
;;;S T
public<< 
static<< 
string<< "
CustomerDetailsButtons<< 3
=><<4 6
$str<<7 W
;<<W X
public== 
static== 
string== 
CustomerListButtons== 0
=>==1 3
$str==4 Q
;==Q R
public>> 
static>> 
string>> %
CustomerRoleDetailsBottom>> 6
=>>>7 9
$str>>: ^
;>>^ _
public?? 
static?? 
string?? &
CustomerRoleDetailsButtons?? 7
=>??8 :
$str??; `
;??` a
public@@ 
static@@ 
string@@ "
CustomerRoleDetailsTop@@ 3
=>@@4 6
$str@@7 X
;@@X Y
publicAA 
staticAA 
stringAA #
CustomerRoleListButtonsAA 4
=>AA5 7
$strAA8 Z
;AAZ [
publicBB 
staticBB 
stringBB $
CustomerUserDetailsBlockBB 5
=>BB6 8
$strBB9 \
;BB\ ]
publicCC 
staticCC 
stringCC '
CustomerUserSettingsButtonsCC 8
=>CC9 ;
$strCC< b
;CCb c
publicDD 
staticDD 
stringDD 
DashboardBottomDD ,
=>DD- /
$strDD0 H
;DDH I
publicEE 
staticEE 
stringEE *
DashboardCommonstatisticsAfterEE ;
=>EE< >
$strEE? g
;EEg h
publicFF 
staticFF 
stringFF -
!DashboardCustomerorderchartsAfterFF >
=>FF? A
$strFFB m
;FFm n
publicGG 
staticGG 
stringGG 1
%DashboardLatestordersSearchtermsAfterGG B
=>GGC E
$strGGF v
;GGv w
publicHH 
staticHH 
stringHH 
DashboardNewsAfterHH /
=>HH0 2
$strHH3 O
;HHO P
publicII 
staticII 
stringII &
DashboardOrderreportsAfterII 7
=>II8 :
$strII; _
;II_ `
publicJJ 
staticJJ 
stringJJ 
DashboardTopJJ )
=>JJ* ,
$strJJ- B
;JJB C
publicKK 
staticKK 
stringKK !
DatesAndRangesButtonsKK 2
=>KK3 5
$strKK6 V
;KKV W
publicLL 
staticLL 
stringLL &
DatesAndRangesDetailsBlockLL 7
=>LL8 :
$strLL; a
;LLa b
publicMM 
staticMM 
stringMM &
DeliveryDateDetailsBottompMM 7
=>MM8 :
$strMM; `
;MM` a
publicNN 
staticNN 
stringNN &
DeliveryDateDetailsButtonsNN 7
=>NN8 :
$strNN; `
;NN` a
publicOO 
staticOO 
stringOO "
DeliveryDateDetailsTopOO 3
=>OO4 6
$strOO7 X
;OOX Y
publicPP 
staticPP 
stringPP  
DiscountDetailsBlockPP 1
=>PP2 4
$strPP5 S
;PPS T
publicQQ 
staticQQ 
stringQQ "
DiscountDetailsButtonsQQ 3
=>QQ4 6
$strQQ7 W
;QQW X
publicRR 
staticRR 
stringRR 
DiscountListButtonsRR 0
=>RR1 3
$strRR4 Q
;RRQ R
publicSS 
staticSS 
stringSS %
EmailAccountDetailsBottomSS 6
=>SS7 9
$strSS: ^
;SS^ _
publicTT 
staticTT 
stringTT &
EmailAccountDetailsButtonsTT 7
=>TT8 :
$strTT; `
;TT` a
publicUU 
staticUU 
stringUU "
EmailAccountDetailsTopUU 3
=>UU4 6
$strUU7 X
;UUX Y
publicVV 
staticVV 
stringVV #
EmailAccountListButtonsVV 4
=>VV5 7
$strVV8 Z
;VVZ [
publicWW 
staticWW 
stringWW -
!ExternalAuthenticationListButtonsWW >
=>WW? A
$strWWB n
;WWn o
publicXX 
staticXX 
stringXX 
ForumDetailsBottomXX /
=>XX0 2
$strXX3 O
;XXO P
publicYY 
staticYY 
stringYY 
ForumDetailsButtonsYY 0
=>YY1 3
$strYY4 Q
;YYQ R
publicZZ 
staticZZ 
stringZZ 
ForumDetailsTopZZ ,
=>ZZ- /
$strZZ0 I
;ZZI J
public[[ 
static[[ 
string[[ #
ForumGroupDetailsBottom[[ 4
=>[[5 7
$str[[8 Z
;[[Z [
public\\ 
static\\ 
string\\ $
ForumGroupDetailsButtons\\ 5
=>\\6 8
$str\\9 \
;\\\ ]
public]] 
static]] 
string]]  
ForumGroupDetailsTop]] 1
=>]]2 4
$str]]5 T
;]]T U
public^^ 
static^^ 
string^^ 
ForumListButtons^^ -
=>^^. 0
$str^^1 K
;^^K L
public__ 
static__ 
string__  
ForumSettingsButtons__ 1
=>__2 4
$str__5 S
;__S T
public`` 
static`` 
string`` %
ForumSettingsDetailsBlock`` 6
=>``7 9
$str``: ^
;``^ _
publicaa 
staticaa 
stringaa 
GdprSettingsButtonsaa 0
=>aa1 3
$straa4 Q
;aaQ R
publicbb 
staticbb 
stringbb $
GdprSettingsDetailsBlockbb 5
=>bb6 8
$strbb9 c
;bbc d
publiccc 
staticcc 
stringcc $
GdprConsentDetailsBottomcc 5
=>cc6 8
$strcc9 \
;cc\ ]
publicdd 
staticdd 
stringdd %
GdprConsentDetailsButtonsdd 6
=>dd7 9
$strdd: ^
;dd^ _
publicee 
staticee 
stringee !
GdprConsentDetailsTopee 2
=>ee3 5
$stree6 V
;eeV W
publicff 
staticff 
stringff %
GeneralCommonDetailsBlockff 6
=>ff7 9
$strff: ^
;ff^ _
publicgg 
staticgg 
stringgg (
GeneralCommonSettingsButtonsgg 9
=>gg: <
$strgg= d
;ggd e
publichh 
statichh 
stringhh  
GiftCardDetailsBlockhh 1
=>hh2 4
$strhh5 T
;hhT U
publicii 
staticii 
stringii "
GiftCardDetailsButtonsii 3
=>ii4 6
$strii7 X
;iiX Y
publicjj 
staticjj 
stringjj 
GiftCardListButtonsjj 0
=>jj1 3
$strjj4 R
;jjR S
publickk 
statickk 
stringkk 
HeaderAfterkk (
=>kk) +
$strkk, @
;kk@ A
publicll 
staticll 
stringll 
HeaderBeforell )
=>ll* ,
$strll- B
;llB C
publicmm 
staticmm 
stringmm 
HeaderMiddlemm )
=>mm* ,
$strmm- B
;mmB C
publicnn 
staticnn 
stringnn 
HeaderNavbarAfternn .
=>nn/ 1
$strnn2 M
;nnM N
publicoo 
staticoo 
stringoo 
HeaderNavbarBeforeoo /
=>oo0 2
$stroo3 O
;ooO P
publicpp 
staticpp 
stringpp 
HeaderToggleAfterpp .
=>pp/ 1
$strpp2 M
;ppM N
publicqq 
staticqq 
stringqq  
LanguageDetailsBlockqq 1
=>qq2 4
$strqq5 S
;qqS T
publicrr 
staticrr 
stringrr "
LanguageDetailsButtonsrr 3
=>rr4 6
$strrr7 W
;rrW X
publicss 
staticss 
stringss 
LanguageListButtonsss 0
=>ss1 3
$strss4 Q
;ssQ R
publictt 
statictt 
stringtt 
LogDetailsButtonstt .
=>tt/ 1
$strtt2 M
;ttM N
publicuu 
staticuu 
stringuu 
LogListButtonsuu +
=>uu, .
$struu/ G
;uuG H
publicvv 
staticvv 
stringvv 
MaintenanceButtonsvv /
=>vv0 2
$strvv3 N
;vvN O
publicww 
staticww 
stringww #
MaintenanceDetailsBlockww 4
=>ww5 7
$strww8 Y
;wwY Z
publicxx 
staticxx 
stringxx 
MaintenanceTopxx +
=>xx, .
$strxx/ F
;xxF G
publicyy 
staticyy 
stringyy $
ManufacturerDetailsBlockyy 5
=>yy6 8
$stryy9 [
;yy[ \
publiczz 
staticzz 
stringzz &
ManufacturerDetailsButtonszz 7
=>zz8 :
$strzz; _
;zz_ `
public{{ 
static{{ 
string{{ #
ManufacturerListButtons{{ 4
=>{{5 7
$str{{8 Y
;{{Y Z
public|| 
static|| 
string|| +
ManufacturerTemplateListButtons|| <
=>||= ?
$str||@ j
;||j k
public}} 
static}} 
string}} 
MeasureListBlock}} -
=>}}. 0
$str}}1 K
;}}K L
public~~ 
static~~ 
string~~ 
MeasureListButtons~~ /
=>~~0 2
$str~~3 O
;~~O P
public 
static 
string  
MediaSettingsButtons 1
=>2 4
$str5 S
;S T
public
�� 
static
�� 
string
�� '
MediaSettingsDetailsBlock
�� 6
=>
��7 9
$str
��: ^
;
��^ _
public
�� 
static
�� 
string
�� 

MenuBefore
�� '
=>
��( *
$str
��+ >
;
��> ?
public
�� 
static
�� 
string
�� *
MessageTemplateDetailsBottom
�� 9
=>
��: <
$str
��= d
;
��d e
public
�� 
static
�� 
string
�� +
MessageTemplateDetailsButtons
�� :
=>
��; =
$str
��> f
;
��f g
public
�� 
static
�� 
string
�� '
MessageTemplateDetailsTop
�� 6
=>
��7 9
$str
��: ^
;
��^ _
public
�� 
static
�� 
string
�� (
MessageTemplateListButtons
�� 7
=>
��8 :
$str
��; `
;
��` a
public
�� 
static
�� 
string
�� (
MessageTemplateTestButtons
�� 7
=>
��8 :
$str
��; `
;
��` a
public
�� 
static
�� 
string
�� $
NewsCommentListButtons
�� 3
=>
��4 6
$str
��7 X
;
��X Y
public
�� 
static
�� 
string
�� 
NewsDetailsBlock
�� -
=>
��. 0
$str
��1 K
;
��K L
public
�� 
static
�� 
string
��  
NewsDetailsButtons
�� /
=>
��0 2
$str
��3 O
;
��O P
public
�� 
static
�� 
string
�� #
NewsItemsDetailsBlock
�� 2
=>
��3 5
$str
��6 V
;
��V W
public
�� 
static
�� 
string
�� /
!NewsLetterSubscriptionListButtons
�� >
=>
��? A
$str
��B n
;
��n o
public
�� 
static
�� 
string
�� 
NewsListButtons
�� ,
=>
��- /
$str
��0 I
;
��I J
public
�� 
static
�� 
string
�� !
NewsSettingsButtons
�� 0
=>
��1 3
$str
��4 Q
;
��Q R
public
�� 
static
�� 
string
�� '
OnlineCustomerListButtons
�� 6
=>
��7 9
$str
��: ^
;
��^ _
public
�� 
static
�� 
string
�� '
OrderAddressDetailsBottom
�� 6
=>
��7 9
$str
��: ^
;
��^ _
public
�� 
static
�� 
string
�� (
OrderAddressDetailsButtons
�� 7
=>
��8 :
$str
��; `
;
��` a
public
�� 
static
�� 
string
�� $
OrderAddressDetailsTop
�� 3
=>
��4 6
$str
��7 X
;
��X Y
public
�� 
static
�� 
string
�� 
OrderDetailsBlock
�� .
=>
��/ 1
$str
��2 M
;
��M N
public
�� 
static
�� 
string
�� !
OrderDetailsButtons
�� 0
=>
��1 3
$str
��4 Q
;
��Q R
public
�� 
static
�� 
string
�� 
OrderListButtons
�� -
=>
��. 0
$str
��1 K
;
��K L
public
�� 
static
�� 
string
�� )
OrderPartiallyRefundButtons
�� 8
=>
��9 ;
$str
��< b
;
��b c
public
�� 
static
�� 
string
�� "
OrderSettingsButtons
�� 1
=>
��2 4
$str
��5 S
;
��S T
public
�� 
static
�� 
string
�� '
OrderSettingsDetailsBlock
�� 6
=>
��7 9
$str
��: ^
;
��^ _
public
�� 
static
�� 
string
�� 6
(OrderSettingsReturnRequestSettingsBottom
�� E
=>
��F H
$str
��I ~
;
��~ 
public
�� 
static
�� 
string
�� %
OrderShipmentAddButtons
�� 4
=>
��5 7
$str
��8 Z
;
��Z [
public
�� 
static
�� 
string
�� )
OrderShipmentDetailsButtons
�� 8
=>
��9 ;
$str
��< b
;
��b c
public
�� 
static
�� 
string
�� &
OrderShipmentListButtons
�� 5
=>
��6 8
$str
��9 \
;
��\ ]
public
�� 
static
�� 
string
�� '
OrderUploadLicenseButtons
�� 6
=>
��7 9
$str
��: ^
;
��^ _
public
�� 
static
�� 
string
�� !
PaymentsListButtons
�� 0
=>
��1 3
$str
��4 Q
;
��Q R
public
�� 
static
�� 
string
�� "
PaymentMethodListTop
�� 1
=>
��2 4
$str
��5 T
;
��T U
public
�� 
static
�� 
string
�� %
PaymentMethodListBottom
�� 4
=>
��5 7
$str
��8 Z
;
��Z [
public
�� 
static
�� 
string
�� *
PaymentMethodRestrictionsTop
�� 9
=>
��: <
$str
��= d
;
��d e
public
�� 
static
�� 
string
�� -
PaymentMethodRestrictionsBottom
�� <
=>
��= ?
$str
��@ j
;
��j k
public
�� 
static
�� 
string
�� #
PermissionListButtons
�� 2
=>
��3 5
$str
��6 U
;
��U V
public
�� 
static
�� 
string
�� ,
PickupPointProviderListButtons
�� ;
=>
��< >
$str
��? i
;
��i j
public
�� 
static
�� 
string
��  
PluginDetailsBlock
�� /
=>
��0 2
$str
��3 O
;
��O P
public
�� 
static
�� 
string
�� !
PluginDetailsBottom
�� 0
=>
��1 3
$str
��4 Q
;
��Q R
public
�� 
static
�� 
string
�� "
PluginDetailsButtons
�� 1
=>
��2 4
$str
��5 S
;
��S T
public
�� 
static
�� 
string
�� 
PluginDetailsTop
�� -
=>
��. 0
$str
��1 K
;
��K L
public
�� 
static
�� 
string
�� 
PluginListButtons
�� .
=>
��/ 1
$str
��2 M
;
��M N
public
�� 
static
�� 
string
�� 
PollDetailsBlock
�� -
=>
��. 0
$str
��1 K
;
��K L
public
�� 
static
�� 
string
��  
PollDetailsButtons
�� /
=>
��0 2
$str
��3 O
;
��O P
public
�� 
static
�� 
string
�� 
PollListButtons
�� ,
=>
��- /
$str
��0 I
;
��I J
public
�� 
static
�� 
string
�� 6
(ProductAttributeCombinationDetailsBottom
�� E
=>
��F H
$str
��I }
;
��} ~
public
�� 
static
�� 
string
�� 7
)ProductAttributeCombinationDetailsButtons
�� F
=>
��G I
$str
��J 
;�� �
public
�� 
static
�� 
string
�� 3
%ProductAttributeCombinationDetailsTop
�� B
=>
��C E
$str
��F w
;
��w x
public
�� 
static
�� 
string
�� *
ProductAttributeDetailsBlock
�� 9
=>
��: <
$str
��= d
;
��d e
public
�� 
static
�� 
string
�� ,
ProductAttributeDetailsButtons
�� ;
=>
��< >
$str
��? h
;
��h i
public
�� 
static
�� 
string
�� )
ProductAttributeListButtons
�� 8
=>
��9 ;
$str
��< b
;
��b c
public
�� 
static
�� 
string
�� 1
#ProductAttributeMappingDetailsBlock
�� @
=>
��A C
$str
��D s
;
��s t
public
�� 
static
�� 
string
�� 3
%ProductAttributeMappingDetailsButtons
�� B
=>
��C E
$str
��F w
;
��w x
public
�� 
static
�� 
string
�� ;
-ProductAttributePredefinedValueDetailsButtons
�� J
=>
��K M
$str��N �
;��� �
public
�� 
static
�� 
string
�� ;
-ProductAttributePredefinedValuesDetailsBottom
�� J
=>
��K M
$str��N �
;��� �
public
�� 
static
�� 
string
�� 8
*ProductAttributePredefinedValuesDetailsTop
�� G
=>
��H J
$str��K �
;��� �
public
�� 
static
�� 
string
�� 0
"ProductAttributeValueDetailsBottom
�� ?
=>
��@ B
$str
��C q
;
��q r
public
�� 
static
�� 
string
�� 1
#ProductAttributeValueDetailsButtons
�� @
=>
��A C
$str
��D s
;
��s t
public
�� 
static
�� 
string
�� -
ProductAttributeValueDetailsTop
�� <
=>
��= ?
$str
��@ k
;
��k l
public
�� 
static
�� 
string
�� 3
%ProductAvailabilityRangeDetailsBottom
�� B
=>
��C E
$str
��F w
;
��w x
public
�� 
static
�� 
string
�� 4
&ProductAvailabilityRangeDetailsButtons
�� C
=>
��D F
$str
��G y
;
��y z
public
�� 
static
�� 
string
�� 0
"ProductAvailabilityRangeDetailsTop
�� ?
=>
��@ B
$str
��C q
;
��q r
public
�� 
static
�� 
string
�� !
ProductDetailsBlock
�� 0
=>
��1 3
$str
��4 Q
;
��Q R
public
�� 
static
�� 
string
�� #
ProductDetailsButtons
�� 2
=>
��3 5
$str
��6 U
;
��U V
public
�� 
static
�� 
string
�� ?
1ProductDetailsProductAttributesCombinationsBottom
�� N
=>
��O Q
$str��R �
;��� �
public
�� 
static
�� 
string
�� <
.ProductDetailsProductAttributesCombinationsTop
�� K
=>
��L N
$str��O �
;��� �
public
�� 
static
�� 
string
�� 7
)ProductDetailsProductAttributesInfoBottom
�� F
=>
��G I
$str��J �
;��� �
public
�� 
static
�� 
string
�� 4
&ProductDetailsProductAttributesInfoTop
�� C
=>
��D F
$str
��G z
;
��z {
public
�� 
static
�� 
string
�� ?
1ProductDetailsSpecificationAttributeDetailsBottom
�� N
=>
��O Q
$str��R �
;��� �
public
�� 
static
�� 
string
�� <
.ProductDetailsSpecificationAttributeDetailsTop
�� K
=>
��L N
$str��O �
;��� �
public
�� 
static
�� 
string
�� 6
(ProductDetailsStockQuantityHistoryBottom
�� E
=>
��F H
$str
��I ~
;
��~ 
public
�� 
static
�� 
string
�� 3
%ProductDetailsStockQuantityHistoryTop
�� B
=>
��C E
$str
��F x
;
��x y
public
�� 
static
�� 
string
��  
ProductListButtons
�� /
=>
��0 2
$str
��3 O
;
��O P
public
�� 
static
�� 
string
�� (
ProductReviewDetailsBottom
�� 7
=>
��8 :
$str
��; `
;
��` a
public
�� 
static
�� 
string
�� )
ProductReviewDetailsButtons
�� 8
=>
��9 ;
$str
��< b
;
��b c
public
�� 
static
�� 
string
�� %
ProductReviewDetailsTop
�� 4
=>
��5 7
$str
��8 Z
;
��Z [
public
�� 
static
�� 
string
�� &
ProductReviewListButtons
�� 5
=>
��6 8
$str
��9 \
;
��\ ]
public
�� 
static
�� 
string
�� "
ProductReviewTypeTop
�� 1
=>
��2 4
$str
��5 T
;
��T U
public
�� 
static
�� 
string
�� %
ProductReviewTypeBottom
�� 4
=>
��5 7
$str
��8 Z
;
��Z [
public
�� 
static
�� 
string
�� &
ProductReviewTypeButtons
�� 5
=>
��6 8
$str
��9 \
;
��\ ]
public
�� 
static
�� 
string
�� %
ProductTagDetailsBottom
�� 4
=>
��5 7
$str
��8 Z
;
��Z [
public
�� 
static
�� 
string
�� &
ProductTagDetailsButtons
�� 5
=>
��6 8
$str
��9 \
;
��\ ]
public
�� 
static
�� 
string
�� "
ProductTagDetailsTop
�� 1
=>
��2 4
$str
��5 T
;
��T U
public
�� 
static
�� 
string
�� #
ProductTagListButtons
�� 2
=>
��3 5
$str
��6 V
;
��V W
public
�� 
static
�� 
string
�� (
ProductTemplateListButtons
�� 7
=>
��8 :
$str
��; `
;
��` a
public
�� 
static
�� 
string
�� +
ProductTierPriceDetailsBottom
�� :
=>
��; =
$str
��> g
;
��g h
public
�� 
static
�� 
string
�� ,
ProductTierPriceDetailsButtons
�� ;
=>
��< >
$str
��? i
;
��i j
public
�� 
static
�� 
string
�� (
ProductTierPriceDetailsTop
�� 7
=>
��8 :
$str
��; a
;
��a b
public
�� 
static
�� 
string
�� &
QueuedEmailDetailsBottom
�� 5
=>
��6 8
$str
��9 \
;
��\ ]
public
�� 
static
�� 
string
�� '
QueuedEmailDetailsButtons
�� 6
=>
��7 9
$str
��: ^
;
��^ _
public
�� 
static
�� 
string
�� #
QueuedEmailDetailsTop
�� 2
=>
��3 5
$str
��6 V
;
��V W
public
�� 
static
�� 
string
�� $
QueuedEmailListButtons
�� 3
=>
��4 6
$str
��7 X
;
��X Y
public
�� 
static
�� 
string
�� )
ReccuringPaymentDetailBlock
�� 8
=>
��9 ;
$str
��< c
;
��c d
public
�� 
static
�� 
string
�� ,
ReccuringPaymentDetailsButtons
�� ;
=>
��< >
$str
��? h
;
��h i
public
�� 
static
�� 
string
�� )
ReccuringPaymentListButtons
�� 8
=>
��9 ;
$str
��< b
;
��b c
public
�� 
static
�� 
string
�� /
!ReturnRequestActionDetailsButtons
�� >
=>
��? A
$str
��B o
;
��o p
public
�� 
static
�� 
string
�� /
!ReturnRequestActionSettingsBottom
�� >
=>
��? A
$str
��B o
;
��o p
public
�� 
static
�� 
string
�� ,
ReturnRequestActionSettingsTop
�� ;
=>
��< >
$str
��? i
;
��i j
public
�� 
static
�� 
string
�� (
ReturnRequestDetailsBottom
�� 7
=>
��8 :
$str
��; `
;
��` a
public
�� 
static
�� 
string
�� )
ReturnRequestDetailsButtons
�� 8
=>
��9 ;
$str
��< b
;
��b c
public
�� 
static
�� 
string
�� %
ReturnRequestDetailsTop
�� 4
=>
��5 7
$str
��8 Z
;
��Z [
public
�� 
static
�� 
string
�� &
ReturnRequestListButtons
�� 5
=>
��6 8
$str
��9 \
;
��\ ]
public
�� 
static
�� 
string
�� /
!ReturnRequestReasonDetailsButtons
�� >
=>
��? A
$str
��B o
;
��o p
public
�� 
static
�� 
string
�� /
!ReturnRequestReasonSettingsBottom
�� >
=>
��? A
$str
��B o
;
��o p
public
�� 
static
�� 
string
�� ,
ReturnRequestReasonSettingsTop
�� ;
=>
��< >
$str
��? i
;
��i j
public
�� 
static
�� 
string
�� .
 RewardPointsSettingsDetailsBlock
�� =
=>
��> @
$str
��A m
;
��m n
public
�� 
static
�� 
string
�� )
RewardPointsSettingsButtons
�� 8
=>
��9 ;
$str
��< b
;
��b c
public
�� 
static
�� 
string
�� %
ScheduleTaskListButtons
�� 4
=>
��5 7
$str
��8 Z
;
��Z [
public
�� 
static
�� 
string
�� 
SearchBoxBefore
�� ,
=>
��- /
$str
��0 H
;
��H I
public
�� 
static
�� 
string
�� 

�� *
=>
��+ -
$str
��. D
;
��D E
public
�� 
static
�� 
string
�� 
SenamesButtons
�� +
=>
��, .
$str
��/ F
;
��F G
public
�� 
static
�� 
string
�� 

SenamesTop
�� '
=>
��( *
$str
��+ >
;
��> ?
public
�� 
static
�� 
string
�� )
ShippingMethodDetailsBottom
�� 8
=>
��9 ;
$str
��< b
;
��b c
public
�� 
static
�� 
string
�� *
ShippingMethodDetailsButtons
�� 9
=>
��: <
$str
��= d
;
��d e
public
�� 
static
�� 
string
�� &
ShippingMethodDetailsTop
�� 5
=>
��6 8
$str
��9 \
;
��\ ]
public
�� 
static
�� 
string
�� '
ShippingMethodListButtons
�� 6
=>
��7 9
$str
��: ^
;
��^ _
public
�� 
static
�� 
string
�� )
ShippingProviderListButtons
�� 8
=>
��9 ;
$str
��< b
;
��b c
public
�� 
static
�� 
string
�� ,
ShippingRestrictionListButtons
�� ;
=>
��< >
$str
��? h
;
��h i
public
�� 
static
�� 
string
�� "
ShippingDetailsBlock
�� 1
=>
��2 4
$str
��5 S
;
��S T
public
�� 
static
�� 
string
�� %
ShippingSettingsButtons
�� 4
=>
��5 7
$str
��8 Y
;
��Y Z
public
�� 
static
�� 
string
�� .
 ShoppingCartSettingsDetailsBlock
�� =
=>
��> @
$str
��A m
;
��m n
public
�� 
static
�� 
string
�� )
ShoppingCartSettingsButtons
�� 8
=>
��9 ;
$str
��< b
;
��b c
public
�� 
static
�� 
string
�� 0
"SpecificationAttributeDetailsBlock
�� ?
=>
��@ B
$str
��C p
;
��p q
public
�� 
static
�� 
string
�� 2
$SpecificationAttributeDetailsButtons
�� A
=>
��B D
$str
��E t
;
��t u
public
�� 
static
�� 
string
�� /
!SpecificationAttributeListButtons
�� >
=>
��? A
$str
��B n
;
��n o
public
�� 
static
�� 
string
�� 7
)SpecificationAttributeOptionDetailsBottom
�� F
=>
��G I
$str
��J 
;�� �
public
�� 
static
�� 
string
�� 8
*SpecificationAttributeOptionDetailsButtons
�� G
=>
��H J
$str��K �
;��� �
public
�� 
static
�� 
string
�� 4
&SpecificationAttributeOptionDetailsTop
�� C
=>
��D F
$str
��G y
;
��y z
public
�� 
static
�� 
string
��  
StoreDetailsBottom
�� /
=>
��0 2
$str
��3 O
;
��O P
public
�� 
static
�� 
string
�� !
StoreDetailsButtons
�� 0
=>
��1 3
$str
��4 Q
;
��Q R
public
�� 
static
�� 
string
�� 
StoreDetailsTop
�� ,
=>
��- /
$str
��0 I
;
��I J
public
�� 
static
�� 
string
�� 
StoreListButtons
�� -
=>
��. 0
$str
��1 K
;
��K L
public
�� 
static
�� 
string
�� 
SystemInfoBottom
�� -
=>
��. 0
$str
��1 K
;
��K L
public
�� 
static
�� 
string
�� 
SystemInfoButtons
�� .
=>
��/ 1
$str
��2 M
;
��M N
public
�� 
static
�� 
string
�� 

�� *
=>
��+ -
$str
��. E
;
��E F
public
�� 
static
�� 
string
�� $
TaxCategoryListButtons
�� 3
=>
��4 6
$str
��7 X
;
��X Y
public
�� 
static
�� 
string
�� $
TaxProviderListButtons
�� 3
=>
��4 6
$str
��7 X
;
��X Y
public
�� 
static
�� 
string
�� %
TaxSettingsDetailsBlock
�� 4
=>
��5 7
$str
��8 Z
;
��Z [
public
�� 
static
�� 
string
��  
TaxSettingsButtons
�� /
=>
��0 2
$str
��3 O
;
��O P
public
�� 
static
�� 
string
�� #
TemplatesDetailsBlock
�� 2
=>
��3 5
$str
��6 U
;
��U V
public
�� 
static
�� 
string
�� 
TopicDetailsBlock
�� .
=>
��/ 1
$str
��2 M
;
��M N
public
�� 
static
�� 
string
�� !
TopicDetailsButtons
�� 0
=>
��1 3
$str
��4 Q
;
��Q R
public
�� 
static
�� 
string
�� 
TopicListButtons
�� -
=>
��. 0
$str
��1 K
;
��K L
public
�� 
static
�� 
string
�� &
TopicTemplateListButtons
�� 5
=>
��6 8
$str
��9 \
;
��\ ]
public
�� 
static
�� 
string
�� .
 AdminVendorAttributeDetailsBlock
�� =
=>
��> @
$str
��A g
;
��g h
public
�� 
static
�� 
string
�� 0
"AdminVendorAttributeDetailsButtons
�� ?
=>
��@ B
$str
��C k
;
��k l
public
�� 
static
�� 
string
�� 4
&AdminVendorAttributeValueDetailsBottom
�� C
=>
��D F
$str
��G t
;
��t u
public
�� 
static
�� 
string
�� 5
'AdminVendorAttributeValueDetailsButtons
�� D
=>
��E G
$str
��H v
;
��v w
public
�� 
static
�� 
string
�� 1
#AdminVendorAttributeValueDetailsTop
�� @
=>
��A C
$str
��D n
;
��n o
public
�� 
static
�� 
string
��  
VendorDetailsBlock
�� /
=>
��0 2
$str
��3 O
;
��O P
public
�� 
static
�� 
string
�� "
VendorDetailsButtons
�� 1
=>
��2 4
$str
��5 S
;
��S T
public
�� 
static
�� 
string
�� 
VendorListButtons
�� .
=>
��/ 1
$str
��2 M
;
��M N
public
�� 
static
�� 
string
�� #
VendorSettingsButtons
�� 2
=>
��3 5
$str
��6 U
;
��U V
public
�� 
static
�� 
string
�� (
VendorSettingsDetailsBlock
�� 7
=>
��8 :
$str
��; `
;
��` a
public
�� 
static
�� 
string
�� $
WarehouseDetailsBottom
�� 3
=>
��4 6
$str
��7 W
;
��W X
public
�� 
static
�� 
string
�� %
WarehouseDetailsButtons
�� 4
=>
��5 7
$str
��8 Y
;
��Y Z
public
�� 
static
�� 
string
�� !
WarehouseDetailsTop
�� 0
=>
��1 3
$str
��4 Q
;
��Q R
public
�� 
static
�� 
string
�� "
WarehouseListButtons
�� 1
=>
��2 4
$str
��5 S
;
��S T
public
�� 
static
�� 
string
�� 
WarningsBottom
�� +
=>
��, .
$str
��/ F
;
��F G
public
�� 
static
�� 
string
�� 
WarningsButtons
�� ,
=>
��- /
$str
��0 H
;
��H I
public
�� 
static
�� 
string
�� 
WarningsTop
�� (
=>
��) +
$str
��, @
;
��@ A
public
�� 
static
�� 
string
�� 
WidgetListButtons
�� .
=>
��/ 1
$str
��2 M
;
��M N
}
�� 
}�� �

�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\AuthenticationStartup.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
{ 
public 

class !
AuthenticationStartup &
:' (
INopStartup) 4
{
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
,A B
IConfigurationC Q

)_ `
{ 	
services 
.  
AddNopDataProtection )
() *
)* +
;+ ,
services 
.  
AddNopAuthentication )
() *
)* +
;+ ,
} 	
public   
void   
	Configure   
(   
IApplicationBuilder   1
application  2 =
)  = >
{!! 	
application## 
.##  
UseNopAuthentication## ,
(##, -
)##- .
;##. /
}$$ 	
public)) 
int)) 
Order)) 
=>)) 
$num)) 
;))  
}** 
}++ ��
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\DependencyRegistrar.cs
	namespace?? 	
Nop??
 
.??
Web?? 
.?? 
	Framework?? 
.?? 
Infrastructure?? *
{@@ 
publicDD 

classDD 
DependencyRegistrarDD $
:DD% & 
IDependencyRegistrarDD' ;
{EE 
publicLL 
virtualLL 
voidLL 
RegisterLL $
(LL$ %
ContainerBuilderLL% 5
builderLL6 =
,LL= >
ITypeFinderLL? J

typeFinderLLK U
,LLU V
	NopConfigLLW `
configLLa g
)LLg h
{MM 	
builderOO 
.OO 
RegisterTypeOO  
<OO  !
NopFileProviderOO! 0
>OO0 1
(OO1 2
)OO2 3
.OO3 4
AsOO4 6
<OO6 7
INopFileProviderOO7 G
>OOG H
(OOH I
)OOI J
.OOJ K$
InstancePerLifetimeScopeOOK c
(OOc d
)OOd e
;OOe f
builderRR 
.RR 
RegisterTypeRR  
<RR  !
	WebHelperRR! *
>RR* +
(RR+ ,
)RR, -
.RR- .
AsRR. 0
<RR0 1

IWebHelperRR1 ;
>RR; <
(RR< =
)RR= >
.RR> ?$
InstancePerLifetimeScopeRR? W
(RRW X
)RRX Y
;RRY Z
builderUU 
.UU 
RegisterTypeUU  
<UU  !
UserAgentHelperUU! 0
>UU0 1
(UU1 2
)UU2 3
.UU3 4
AsUU4 6
<UU6 7
IUserAgentHelperUU7 G
>UUG H
(UUH I
)UUI J
.UUJ K$
InstancePerLifetimeScopeUUK c
(UUc d
)UUd e
;UUe f
builderXX 
.XX 
RegisterTypeXX  
<XX  !!
EfDataProviderManagerXX! 6
>XX6 7
(XX7 8
)XX8 9
.XX9 :
AsXX: <
<XX< = 
IDataProviderManagerXX= Q
>XXQ R
(XXR S
)XXS T
.XXT U!
InstancePerDependencyXXU j
(XXj k
)XXk l
;XXl m
builderYY 
.YY 
RegisterYY 
(YY 
contextYY $
=>YY% '
contextYY( /
.YY/ 0
ResolveYY0 7
<YY7 8 
IDataProviderManagerYY8 L
>YYL M
(YYM N
)YYN O
.YYO P
DataProviderYYP \
)YY\ ]
.YY] ^
AsYY^ `
<YY` a

>YYn o
(YYo p
)YYp q
.YYq r"
InstancePerDependency	YYr �
(
YY� �
)
YY� �
;
YY� �
builderZZ 
.ZZ 
RegisterZZ 
(ZZ 
contextZZ $
=>ZZ% '
newZZ( +
NopObjectContextZZ, <
(ZZ< =
contextZZ= D
.ZZD E
ResolveZZE L
<ZZL M
DbContextOptionsZZM ]
<ZZ] ^
NopObjectContextZZ^ n
>ZZn o
>ZZo p
(ZZp q
)ZZq r
)ZZr s
)ZZs t
.[[ 
As[[ 
<[[ 

IDbContext[[ 
>[[ 
([[  
)[[  !
.[[! "$
InstancePerLifetimeScope[[" :
([[: ;
)[[; <
;[[< =
builder^^ 
.^^ 
RegisterGeneric^^ #
(^^# $
typeof^^$ *
(^^* +
EfRepository^^+ 7
<^^7 8
>^^8 9
)^^9 :
)^^: ;
.^^; <
As^^< >
(^^> ?
typeof^^? E
(^^E F
IRepository^^F Q
<^^Q R
>^^R S
)^^S T
)^^T U
.^^U V$
InstancePerLifetimeScope^^V n
(^^n o
)^^o p
;^^p q
builderaa 
.aa 
RegisterTypeaa  
<aa  !

>aa. /
(aa/ 0
)aa0 1
.aa1 2
Asaa2 4
<aa4 5
IPluginServiceaa5 C
>aaC D
(aaD E
)aaE F
.aaF G$
InstancePerLifetimeScopeaaG _
(aa_ `
)aa` a
;aaa b
builderbb 
.bb 
RegisterTypebb  
<bb  !
OfficialFeedManagerbb! 4
>bb4 5
(bb5 6
)bb6 7
.bb7 8
AsSelfbb8 >
(bb> ?
)bb? @
.bb@ A$
InstancePerLifetimeScopebbA Y
(bbY Z
)bbZ [
;bb[ \
builderee 
.ee 
RegisterTypeee  
<ee  !"
PerRequestCacheManageree! 7
>ee7 8
(ee8 9
)ee9 :
.ee: ;
Asee; =
<ee= >

>eeK L
(eeL M
)eeM N
.eeN O$
InstancePerLifetimeScopeeeO g
(eeg h
)eeh i
;eei j
ifhh 
(hh 
confighh 
.hh 
RedisEnabledhh #
)hh# $
{ii 
builderjj 
.jj 
RegisterTypejj $
<jj$ %"
RedisConnectionWrapperjj% ;
>jj; <
(jj< =
)jj= >
.kk 
Askk 
<kk 
ILockerkk 
>kk  
(kk  !
)kk! "
.ll 
Asll 
<ll #
IRedisConnectionWrapperll /
>ll/ 0
(ll0 1
)ll1 2
.mm 
SingleInstancemm #
(mm# $
)mm$ %
;mm% &
}nn 
ifqq 
(qq 
configqq 
.qq 
RedisEnabledqq #
&&qq$ &
configqq' -
.qq- .
UseRedisForCachingqq. @
)qq@ A
{rr 
builderss 
.ss 
RegisterTypess $
<ss$ %
RedisCacheManagerss% 6
>ss6 7
(ss7 8
)ss8 9
.ss9 :
Asss: <
<ss< =
IStaticCacheManagerss= P
>ssP Q
(ssQ R
)ssR S
.ssS T$
InstancePerLifetimeScopessT l
(ssl m
)ssm n
;ssn o
}tt 
elseuu 
{vv 
builderww 
.ww 
RegisterTypeww $
<ww$ %
MemoryCacheManagerww% 7
>ww7 8
(ww8 9
)ww9 :
.xx 
Asxx 
<xx 
ILockerxx 
>xx  
(xx  !
)xx! "
.yy 
Asyy 
<yy 
IStaticCacheManageryy +
>yy+ ,
(yy, -
)yy- .
.zz 
SingleInstancezz #
(zz# $
)zz$ %
;zz% &
}{{ 
builder~~ 
.~~ 
RegisterType~~  
<~~  !
WebWorkContext~~! /
>~~/ 0
(~~0 1
)~~1 2
.~~2 3
As~~3 5
<~~5 6
IWorkContext~~6 B
>~~B C
(~~C D
)~~D E
.~~E F$
InstancePerLifetimeScope~~F ^
(~~^ _
)~~_ `
;~~` a
builder
�� 
.
�� 
RegisterType
��  
<
��  !
WebStoreContext
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7

��7 D
>
��D E
(
��E F
)
��F G
.
��G H&
InstancePerLifetimeScope
��H `
(
��` a
)
��a b
;
��b c
builder
�� 
.
�� 
RegisterType
��  
<
��  !,
BackInStockSubscriptionService
��! ?
>
��? @
(
��@ A
)
��A B
.
��B C
As
��C E
<
��E F-
IBackInStockSubscriptionService
��F e
>
��e f
(
��f g
)
��g h
.
��h i'
InstancePerLifetimeScope��i �
(��� �
)��� �
;��� �
builder
�� 
.
�� 
RegisterType
��  
<
��  !
CategoryService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
ICategoryService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !$
CompareProductsService
��! 7
>
��7 8
(
��8 9
)
��9 :
.
��: ;
As
��; =
<
��= >%
ICompareProductsService
��> U
>
��U V
(
��V W
)
��W X
.
��X Y&
InstancePerLifetimeScope
��Y q
(
��q r
)
��r s
;
��s t
builder
�� 
.
�� 
RegisterType
��  
<
��  !+
RecentlyViewedProductsService
��! >
>
��> ?
(
��? @
)
��@ A
.
��A B
As
��B D
<
��D E,
IRecentlyViewedProductsService
��E c
>
��c d
(
��d e
)
��e f
.
��f g&
InstancePerLifetimeScope
��g 
(�� �
)��� �
;��� �
builder
�� 
.
�� 
RegisterType
��  
<
��  !!
ManufacturerService
��! 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
As
��8 :
<
��: ;"
IManufacturerService
��; O
>
��O P
(
��P Q
)
��Q R
.
��R S&
InstancePerLifetimeScope
��S k
(
��k l
)
��l m
;
��m n
builder
�� 
.
�� 
RegisterType
��  
<
��  !
PriceFormatter
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
IPriceFormatter
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !'
ProductAttributeFormatter
��! :
>
��: ;
(
��; <
)
��< =
.
��= >
As
��> @
<
��@ A(
IProductAttributeFormatter
��A [
>
��[ \
(
��\ ]
)
��] ^
.
��^ _&
InstancePerLifetimeScope
��_ w
(
��w x
)
��x y
;
��y z
builder
�� 
.
�� 
RegisterType
��  
<
��  !$
ProductAttributeParser
��! 7
>
��7 8
(
��8 9
)
��9 :
.
��: ;
As
��; =
<
��= >%
IProductAttributeParser
��> U
>
��U V
(
��V W
)
��W X
.
��X Y&
InstancePerLifetimeScope
��Y q
(
��q r
)
��r s
;
��s t
builder
�� 
.
�� 
RegisterType
��  
<
��  !%
ProductAttributeService
��! 8
>
��8 9
(
��9 :
)
��: ;
.
��; <
As
��< >
<
��> ?&
IProductAttributeService
��? W
>
��W X
(
��X Y
)
��Y Z
.
��Z [&
InstancePerLifetimeScope
��[ s
(
��s t
)
��t u
;
��u v
builder
�� 
.
�� 
RegisterType
��  
<
��  !
ProductService
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
IProductService
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !
PriceLevelService
��! 2
>
��2 3
(
��3 4
)
��4 5
.
��5 6
As
��6 8
<
��8 9 
IPriceLevelService
��9 K
>
��K L
(
��L M
)
��M N
.
��N O&
InstancePerLifetimeScope
��O g
(
��g h
)
��h i
;
��i j
builder
�� 
.
�� 
RegisterType
��  
<
��  ! 
ItemPricingService
��! 3
>
��3 4
(
��4 5
)
��5 6
.
��6 7
As
��7 9
<
��9 :!
IItemPricingService
��: M
>
��M N
(
��N O
)
��O P
.
��P Q&
InstancePerLifetimeScope
��Q i
(
��i j
)
��j k
;
��k l
builder
�� 
.
�� 
RegisterType
��  
<
��  ! 
CopyProductService
��! 3
>
��3 4
(
��4 5
)
��5 6
.
��6 7
As
��7 9
<
��9 :!
ICopyProductService
��: M
>
��M N
(
��N O
)
��O P
.
��P Q&
InstancePerLifetimeScope
��Q i
(
��i j
)
��j k
;
��k l
builder
�� 
.
�� 
RegisterType
��  
<
��  !+
SpecificationAttributeService
��! >
>
��> ?
(
��? @
)
��@ A
.
��A B
As
��B D
<
��D E,
ISpecificationAttributeService
��E c
>
��c d
(
��d e
)
��e f
.
��f g&
InstancePerLifetimeScope
��g 
(�� �
)��� �
;��� �
builder
�� 
.
�� 
RegisterType
��  
<
��  !$
ProductTemplateService
��! 7
>
��7 8
(
��8 9
)
��9 :
.
��: ;
As
��; =
<
��= >%
IProductTemplateService
��> U
>
��U V
(
��V W
)
��W X
.
��X Y&
InstancePerLifetimeScope
��Y q
(
��q r
)
��r s
;
��s t
builder
�� 
.
�� 
RegisterType
��  
<
��  !%
CategoryTemplateService
��! 8
>
��8 9
(
��9 :
)
��: ;
.
��; <
As
��< >
<
��> ?&
ICategoryTemplateService
��? W
>
��W X
(
��X Y
)
��Y Z
.
��Z [&
InstancePerLifetimeScope
��[ s
(
��s t
)
��t u
;
��u v
builder
�� 
.
�� 
RegisterType
��  
<
��  !)
ManufacturerTemplateService
��! <
>
��< =
(
��= >
)
��> ?
.
��? @
As
��@ B
<
��B C*
IManufacturerTemplateService
��C _
>
��_ `
(
��` a
)
��a b
.
��b c&
InstancePerLifetimeScope
��c {
(
��{ |
)
��| }
;
��} ~
builder
�� 
.
�� 
RegisterType
��  
<
��  !"
TopicTemplateService
��! 5
>
��5 6
(
��6 7
)
��7 8
.
��8 9
As
��9 ;
<
��; <#
ITopicTemplateService
��< Q
>
��Q R
(
��R S
)
��S T
.
��T U&
InstancePerLifetimeScope
��U m
(
��m n
)
��n o
;
��o p
builder
�� 
.
�� 
RegisterType
��  
<
��  !
ProductTagService
��! 2
>
��2 3
(
��3 4
)
��4 5
.
��5 6
As
��6 8
<
��8 9 
IProductTagService
��9 K
>
��K L
(
��L M
)
��M N
.
��N O&
InstancePerLifetimeScope
��O g
(
��g h
)
��h i
;
��i j
builder
�� 
.
�� 
RegisterType
��  
<
��  !'
AddressAttributeFormatter
��! :
>
��: ;
(
��; <
)
��< =
.
��= >
As
��> @
<
��@ A(
IAddressAttributeFormatter
��A [
>
��[ \
(
��\ ]
)
��] ^
.
��^ _&
InstancePerLifetimeScope
��_ w
(
��w x
)
��x y
;
��y z
builder
�� 
.
�� 
RegisterType
��  
<
��  !$
AddressAttributeParser
��! 7
>
��7 8
(
��8 9
)
��9 :
.
��: ;
As
��; =
<
��= >%
IAddressAttributeParser
��> U
>
��U V
(
��V W
)
��W X
.
��X Y&
InstancePerLifetimeScope
��Y q
(
��q r
)
��r s
;
��s t
builder
�� 
.
�� 
RegisterType
��  
<
��  !%
AddressAttributeService
��! 8
>
��8 9
(
��9 :
)
��: ;
.
��; <
As
��< >
<
��> ?&
IAddressAttributeService
��? W
>
��W X
(
��X Y
)
��Y Z
.
��Z [&
InstancePerLifetimeScope
��[ s
(
��s t
)
��t u
;
��u v
builder
�� 
.
�� 
RegisterType
��  
<
��  !
AddressService
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
IAddressService
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !
AffiliateService
��! 1
>
��1 2
(
��2 3
)
��3 4
.
��4 5
As
��5 7
<
��7 8
IAffiliateService
��8 I
>
��I J
(
��J K
)
��K L
.
��L M&
InstancePerLifetimeScope
��M e
(
��e f
)
��f g
;
��g h
builder
�� 
.
�� 
RegisterType
��  
<
��  !

��! .
>
��. /
(
��/ 0
)
��0 1
.
��1 2
As
��2 4
<
��4 5
IVendorService
��5 C
>
��C D
(
��D E
)
��E F
.
��F G&
InstancePerLifetimeScope
��G _
(
��_ `
)
��` a
;
��a b
builder
�� 
.
�� 
RegisterType
��  
<
��  !&
VendorAttributeFormatter
��! 9
>
��9 :
(
��: ;
)
��; <
.
��< =
As
��= ?
<
��? @'
IVendorAttributeFormatter
��@ Y
>
��Y Z
(
��Z [
)
��[ \
.
��\ ]&
InstancePerLifetimeScope
��] u
(
��u v
)
��v w
;
��w x
builder
�� 
.
�� 
RegisterType
��  
<
��  !#
VendorAttributeParser
��! 6
>
��6 7
(
��7 8
)
��8 9
.
��9 :
As
��: <
<
��< =$
IVendorAttributeParser
��= S
>
��S T
(
��T U
)
��U V
.
��V W&
InstancePerLifetimeScope
��W o
(
��o p
)
��p q
;
��q r
builder
�� 
.
�� 
RegisterType
��  
<
��  !$
VendorAttributeService
��! 7
>
��7 8
(
��8 9
)
��9 :
.
��: ;
As
��; =
<
��= >%
IVendorAttributeService
��> U
>
��U V
(
��V W
)
��W X
.
��X Y&
InstancePerLifetimeScope
��Y q
(
��q r
)
��r s
;
��s t
builder
�� 
.
�� 
RegisterType
��  
<
��  !
SearchTermService
��! 2
>
��2 3
(
��3 4
)
��4 5
.
��5 6
As
��6 8
<
��8 9 
ISearchTermService
��9 K
>
��K L
(
��L M
)
��M N
.
��N O&
InstancePerLifetimeScope
��O g
(
��g h
)
��h i
;
��i j
builder
�� 
.
�� 
RegisterType
��  
<
��  !%
GenericAttributeService
��! 8
>
��8 9
(
��9 :
)
��: ;
.
��; <
As
��< >
<
��> ?&
IGenericAttributeService
��? W
>
��W X
(
��X Y
)
��Y Z
.
��Z [&
InstancePerLifetimeScope
��[ s
(
��s t
)
��t u
;
��u v
builder
�� 
.
�� 
RegisterType
��  
<
��  !
FulltextService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
IFulltextService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  ! 
MaintenanceService
��! 3
>
��3 4
(
��4 5
)
��5 6
.
��6 7
As
��7 9
<
��9 :!
IMaintenanceService
��: M
>
��M N
(
��N O
)
��O P
.
��P Q&
InstancePerLifetimeScope
��Q i
(
��i j
)
��j k
;
��k l
builder
�� 
.
�� 
RegisterType
��  
<
��  !(
CustomerAttributeFormatter
��! ;
>
��; <
(
��< =
)
��= >
.
��> ?
As
��? A
<
��A B)
ICustomerAttributeFormatter
��B ]
>
��] ^
(
��^ _
)
��_ `
.
��` a&
InstancePerLifetimeScope
��a y
(
��y z
)
��z {
;
��{ |
builder
�� 
.
�� 
RegisterType
��  
<
��  !%
CustomerAttributeParser
��! 8
>
��8 9
(
��9 :
)
��: ;
.
��; <
As
��< >
<
��> ?&
ICustomerAttributeParser
��? W
>
��W X
(
��X Y
)
��Y Z
.
��Z [&
InstancePerLifetimeScope
��[ s
(
��s t
)
��t u
;
��u v
builder
�� 
.
�� 
RegisterType
��  
<
��  !&
CustomerAttributeService
��! 9
>
��9 :
(
��: ;
)
��; <
.
��< =
As
��= ?
<
��? @'
ICustomerAttributeService
��@ Y
>
��Y Z
(
��Z [
)
��[ \
.
��\ ]&
InstancePerLifetimeScope
��] u
(
��u v
)
��v w
;
��w x
builder
�� 
.
�� 
RegisterType
��  
<
��  !
CustomerService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
ICustomerService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !
CompanyService
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
ICompanyService
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !
ZidCodeService
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
IZipCodeService
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !)
CustomerAuthorizeNetService
��! <
>
��< =
(
��= >
)
��> ?
.
��? @
As
��@ B
<
��B C*
ICustomerAuthorizeNetService
��C _
>
��_ `
(
��` a
)
��a b
.
��b c&
InstancePerLifetimeScope
��c {
(
��{ |
)
��| }
;
��} ~
builder
�� 
.
�� 
RegisterType
��  
<
��  !
OAuthBaseHelper
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
IOAuthBaseHelper
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !
ConnectionService
��! 2
>
��2 3
(
��3 4
)
��4 5
.
��5 6
As
��6 8
<
��8 9 
IConnectionService
��9 K
>
��K L
(
��L M
)
��M N
.
��N O&
InstancePerLifetimeScope
��O g
(
��g h
)
��h i
;
��i j
builder
�� 
.
�� 
RegisterType
��  
<
��  !
ConnectionService
��! 2
>
��2 3
(
��3 4
)
��4 5
.
��5 6
As
��6 8
<
��8 9 
IConnectionService
��9 K
>
��K L
(
��L M
)
��M N
.
��N O&
InstancePerLifetimeScope
��O g
(
��g h
)
��h i
;
��i j
builder
�� 
.
�� 
RegisterType
��  
<
��  !)
CustomerRegistrationService
��! <
>
��< =
(
��= >
)
��> ?
.
��? @
As
��@ B
<
��B C*
ICustomerRegistrationService
��C _
>
��_ `
(
��` a
)
��a b
.
��b c&
InstancePerLifetimeScope
��c {
(
��{ |
)
��| }
;
��} ~
builder
�� 
.
�� 
RegisterType
��  
<
��  !#
CustomerReportService
��! 6
>
��6 7
(
��7 8
)
��8 9
.
��9 :
As
��: <
<
��< =$
ICustomerReportService
��= S
>
��S T
(
��T U
)
��U V
.
��V W&
InstancePerLifetimeScope
��W o
(
��o p
)
��p q
;
��q r
builder
�� 
.
�� 
RegisterType
��  
<
��  !
PermissionService
��! 2
>
��2 3
(
��3 4
)
��4 5
.
��5 6
As
��6 8
<
��8 9 
IPermissionService
��9 K
>
��K L
(
��L M
)
��M N
.
��N O&
InstancePerLifetimeScope
��O g
(
��g h
)
��h i
;
��i j
builder
�� 
.
�� 
RegisterType
��  
<
��  !

AclService
��! +
>
��+ ,
(
��, -
)
��- .
.
��. /
As
��/ 1
<
��1 2
IAclService
��2 =
>
��= >
(
��> ?
)
��? @
.
��@ A&
InstancePerLifetimeScope
��A Y
(
��Y Z
)
��Z [
;
��[ \
builder
�� 
.
�� 
RegisterType
��  
<
��  !%
PriceCalculationService
��! 8
>
��8 9
(
��9 :
)
��: ;
.
��; <
As
��< >
<
��> ?&
IPriceCalculationService
��? W
>
��W X
(
��X Y
)
��Y Z
.
��Z [&
InstancePerLifetimeScope
��[ s
(
��s t
)
��t u
;
��u v
builder
�� 
.
�� 
RegisterType
��  
<
��  !
GeoLookupService
��! 1
>
��1 2
(
��2 3
)
��3 4
.
��4 5
As
��5 7
<
��7 8
IGeoLookupService
��8 I
>
��I J
(
��J K
)
��K L
.
��L M&
InstancePerLifetimeScope
��M e
(
��e f
)
��f g
;
��g h
builder
�� 
.
�� 
RegisterType
��  
<
��  !
CountryService
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
ICountryService
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !
CurrencyService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
ICurrencyService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !
MeasureService
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
IMeasureService
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !"
StateProvinceService
��! 5
>
��5 6
(
��6 7
)
��7 8
.
��8 9
As
��9 ;
<
��; <#
IStateProvinceService
��< Q
>
��Q R
(
��R S
)
��S T
.
��T U&
InstancePerLifetimeScope
��U m
(
��m n
)
��n o
;
��o p
builder
�� 
.
�� 
RegisterType
��  
<
��  !
StoreService
��! -
>
��- .
(
��. /
)
��/ 0
.
��0 1
As
��1 3
<
��3 4

��4 A
>
��A B
(
��B C
)
��C D
.
��D E&
InstancePerLifetimeScope
��E ]
(
��] ^
)
��^ _
;
��_ `
builder
�� 
.
�� 
RegisterType
��  
<
��  !!
StoreMappingService
��! 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
As
��8 :
<
��: ;"
IStoreMappingService
��; O
>
��O P
(
��P Q
)
��Q R
.
��R S&
InstancePerLifetimeScope
��S k
(
��k l
)
��l m
;
��m n
builder
�� 
.
�� 
RegisterType
��  
<
��  !
DiscountService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
IDiscountService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !!
LocalizationService
��! 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
As
��8 :
<
��: ;"
ILocalizationService
��; O
>
��O P
(
��P Q
)
��Q R
.
��R S&
InstancePerLifetimeScope
��S k
(
��k l
)
��l m
;
��m n
builder
�� 
.
�� 
RegisterType
��  
<
��  !$
LocalizedEntityService
��! 7
>
��7 8
(
��8 9
)
��9 :
.
��: ;
As
��; =
<
��= >%
ILocalizedEntityService
��> U
>
��U V
(
��V W
)
��W X
.
��X Y&
InstancePerLifetimeScope
��Y q
(
��q r
)
��r s
;
��s t
builder
�� 
.
�� 
RegisterType
��  
<
��  !
LanguageService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
ILanguageService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !
DownloadService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
IDownloadService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !$
MessageTemplateService
��! 7
>
��7 8
(
��8 9
)
��9 :
.
��: ;
As
��; =
<
��= >%
IMessageTemplateService
��> U
>
��U V
(
��V W
)
��W X
.
��X Y&
InstancePerLifetimeScope
��Y q
(
��q r
)
��r s
;
��s t
builder
�� 
.
�� 
RegisterType
��  
<
��  ! 
QueuedEmailService
��! 3
>
��3 4
(
��4 5
)
��5 6
.
��6 7
As
��7 9
<
��9 :!
IQueuedEmailService
��: M
>
��M N
(
��N O
)
��O P
.
��P Q&
InstancePerLifetimeScope
��Q i
(
��i j
)
��j k
;
��k l
builder
�� 
.
�� 
RegisterType
��  
<
��  !+
NewsLetterSubscriptionService
��! >
>
��> ?
(
��? @
)
��@ A
.
��A B
As
��B D
<
��D E,
INewsLetterSubscriptionService
��E c
>
��c d
(
��d e
)
��e f
.
��f g&
InstancePerLifetimeScope
��g 
(�� �
)��� �
;��� �
builder
�� 
.
�� 
RegisterType
��  
<
��  !!
NotificationService
��! 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
As
��8 :
<
��: ;"
INotificationService
��; O
>
��O P
(
��P Q
)
��Q R
.
��R S&
InstancePerLifetimeScope
��S k
(
��k l
)
��l m
;
��m n
builder
�� 
.
�� 
RegisterType
��  
<
��  !
CampaignService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
ICampaignService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !!
EmailAccountService
��! 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
As
��8 :
<
��: ;"
IEmailAccountService
��; O
>
��O P
(
��P Q
)
��Q R
.
��R S&
InstancePerLifetimeScope
��S k
(
��k l
)
��l m
;
��m n
builder
�� 
.
�� 
RegisterType
��  
<
��  !$
WorkflowMessageService
��! 7
>
��7 8
(
��8 9
)
��9 :
.
��: ;
As
��; =
<
��= >%
IWorkflowMessageService
��> U
>
��U V
(
��V W
)
��W X
.
��X Y&
InstancePerLifetimeScope
��Y q
(
��q r
)
��r s
;
��s t
builder
�� 
.
�� 
RegisterType
��  
<
��  !"
MessageTokenProvider
��! 5
>
��5 6
(
��6 7
)
��7 8
.
��8 9
As
��9 ;
<
��; <#
IMessageTokenProvider
��< Q
>
��Q R
(
��R S
)
��S T
.
��T U&
InstancePerLifetimeScope
��U m
(
��m n
)
��n o
;
��o p
builder
�� 
.
�� 
RegisterType
��  
<
��  !
	Tokenizer
��! *
>
��* +
(
��+ ,
)
��, -
.
��- .
As
��. 0
<
��0 1

ITokenizer
��1 ;
>
��; <
(
��< =
)
��= >
.
��> ?&
InstancePerLifetimeScope
��? W
(
��W X
)
��X Y
;
��Y Z
builder
�� 
.
�� 
RegisterType
��  
<
��  !
EmailSender
��! ,
>
��, -
(
��- .
)
��. /
.
��/ 0
As
��0 2
<
��2 3
IEmailSender
��3 ?
>
��? @
(
��@ A
)
��A B
.
��B C&
InstancePerLifetimeScope
��C [
(
��[ \
)
��\ ]
;
��] ^
builder
�� 
.
�� 
RegisterType
��  
<
��  !(
CheckoutAttributeFormatter
��! ;
>
��; <
(
��< =
)
��= >
.
��> ?
As
��? A
<
��A B)
ICheckoutAttributeFormatter
��B ]
>
��] ^
(
��^ _
)
��_ `
.
��` a&
InstancePerLifetimeScope
��a y
(
��y z
)
��z {
;
��{ |
builder
�� 
.
�� 
RegisterType
��  
<
��  !%
CheckoutAttributeParser
��! 8
>
��8 9
(
��9 :
)
��: ;
.
��; <
As
��< >
<
��> ?&
ICheckoutAttributeParser
��? W
>
��W X
(
��X Y
)
��Y Z
.
��Z [&
InstancePerLifetimeScope
��[ s
(
��s t
)
��t u
;
��u v
builder
�� 
.
�� 
RegisterType
��  
<
��  !&
CheckoutAttributeService
��! 9
>
��9 :
(
��: ;
)
��; <
.
��< =
As
��= ?
<
��? @'
ICheckoutAttributeService
��@ Y
>
��Y Z
(
��Z [
)
��[ \
.
��\ ]&
InstancePerLifetimeScope
��] u
(
��u v
)
��v w
;
��w x
builder
�� 
.
�� 
RegisterType
��  
<
��  !
GiftCardService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
IGiftCardService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !
OrderService
��! -
>
��- .
(
��. /
)
��/ 0
.
��0 1
As
��1 3
<
��3 4

��4 A
>
��A B
(
��B C
)
��C D
.
��D E&
InstancePerLifetimeScope
��E ]
(
��] ^
)
��^ _
;
��_ `
builder
�� 
.
�� 
RegisterType
��  
<
��  ! 
OrderReportService
��! 3
>
��3 4
(
��4 5
)
��5 6
.
��6 7
As
��7 9
<
��9 :!
IOrderReportService
��: M
>
��M N
(
��N O
)
��O P
.
��P Q&
InstancePerLifetimeScope
��Q i
(
��i j
)
��j k
;
��k l
builder
�� 
.
�� 
RegisterType
��  
<
��  !$
OrderProcessingService
��! 7
>
��7 8
(
��8 9
)
��9 :
.
��: ;
As
��; =
<
��= >%
IOrderProcessingService
��> U
>
��U V
(
��V W
)
��W X
.
��X Y&
InstancePerLifetimeScope
��Y q
(
��q r
)
��r s
;
��s t
builder
�� 
.
�� 
RegisterType
��  
<
��  !*
OrderTotalCalculationService
��! =
>
��= >
(
��> ?
)
��? @
.
��@ A
As
��A C
<
��C D+
IOrderTotalCalculationService
��D a
>
��a b
(
��b c
)
��c d
.
��d e&
InstancePerLifetimeScope
��e }
(
��} ~
)
��~ 
;�� �
builder
�� 
.
�� 
RegisterType
��  
<
��  !"
ReturnRequestService
��! 5
>
��5 6
(
��6 7
)
��7 8
.
��8 9
As
��9 ;
<
��; <#
IReturnRequestService
��< Q
>
��Q R
(
��R S
)
��S T
.
��T U&
InstancePerLifetimeScope
��U m
(
��m n
)
��n o
;
��o p
builder
�� 
.
�� 
RegisterType
��  
<
��  ! 
RewardPointService
��! 3
>
��3 4
(
��4 5
)
��5 6
.
��6 7
As
��7 9
<
��9 :!
IRewardPointService
��: M
>
��M N
(
��N O
)
��O P
.
��P Q&
InstancePerLifetimeScope
��Q i
(
��i j
)
��j k
;
��k l
builder
�� 
.
�� 
RegisterType
��  
<
��  !!
ShoppingCartService
��! 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
As
��8 :
<
��: ;"
IShoppingCartService
��; O
>
��O P
(
��P Q
)
��Q R
.
��R S&
InstancePerLifetimeScope
��S k
(
��k l
)
��l m
;
��m n
builder
�� 
.
�� 
RegisterType
��  
<
��  !#
CustomNumberFormatter
��! 6
>
��6 7
(
��7 8
)
��8 9
.
��9 :
As
��: <
<
��< =$
ICustomNumberFormatter
��= S
>
��S T
(
��T U
)
��U V
.
��V W&
InstancePerLifetimeScope
��W o
(
��o p
)
��p q
;
��q r
builder
�� 
.
�� 
RegisterType
��  
<
��  !
PaymentService
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
IPaymentService
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !
EncryptionService
��! 2
>
��2 3
(
��3 4
)
��4 5
.
��5 6
As
��6 8
<
��8 9 
IEncryptionService
��9 K
>
��K L
(
��L M
)
��M N
.
��N O&
InstancePerLifetimeScope
��O g
(
��g h
)
��h i
;
��i j
builder
�� 
.
�� 
RegisterType
��  
<
��  !)
CookieAuthenticationService
��! <
>
��< =
(
��= >
)
��> ?
.
��? @
As
��@ B
<
��B C$
IAuthenticationService
��C Y
>
��Y Z
(
��Z [
)
��[ \
.
��\ ]&
InstancePerLifetimeScope
��] u
(
��u v
)
��v w
;
��w x
builder
�� 
.
�� 
RegisterType
��  
<
��  !
UrlRecordService
��! 1
>
��1 2
(
��2 3
)
��3 4
.
��4 5
As
��5 7
<
��7 8
IUrlRecordService
��8 I
>
��I J
(
��J K
)
��K L
.
��L M&
InstancePerLifetimeScope
��M e
(
��e f
)
��f g
;
��g h
builder
�� 
.
�� 
RegisterType
��  
<
��  !
ShipmentService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
IShipmentService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !
ShippingService
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
IShippingService
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !
DateRangeService
��! 1
>
��1 2
(
��2 3
)
��3 4
.
��4 5
As
��5 7
<
��7 8
IDateRangeService
��8 I
>
��I J
(
��J K
)
��K L
.
��L M&
InstancePerLifetimeScope
��M e
(
��e f
)
��f g
;
��g h
builder
�� 
.
�� 
RegisterType
��  
<
��  ! 
TaxCategoryService
��! 3
>
��3 4
(
��4 5
)
��5 6
.
��6 7
As
��7 9
<
��9 :!
ITaxCategoryService
��: M
>
��M N
(
��N O
)
��O P
.
��P Q&
InstancePerLifetimeScope
��Q i
(
��i j
)
��j k
;
��k l
builder
�� 
.
�� 
RegisterType
��  
<
��  !

TaxService
��! +
>
��+ ,
(
��, -
)
��- .
.
��. /
As
��/ 1
<
��1 2
ITaxService
��2 =
>
��= >
(
��> ?
)
��? @
.
��@ A&
InstancePerLifetimeScope
��A Y
(
��Y Z
)
��Z [
;
��[ \
builder
�� 
.
�� 
RegisterType
��  
<
��  !

��! .
>
��. /
(
��/ 0
)
��0 1
.
��1 2
As
��2 4
<
��4 5
ILogger
��5 <
>
��< =
(
��= >
)
��> ?
.
��? @&
InstancePerLifetimeScope
��@ X
(
��X Y
)
��Y Z
;
��Z [
builder
�� 
.
�� 
RegisterType
��  
<
��  !%
CustomerActivityService
��! 8
>
��8 9
(
��9 :
)
��: ;
.
��; <
As
��< >
<
��> ?&
ICustomerActivityService
��? W
>
��W X
(
��X Y
)
��Y Z
.
��Z [&
InstancePerLifetimeScope
��[ s
(
��s t
)
��t u
;
��u v
builder
�� 
.
�� 
RegisterType
��  
<
��  !
ForumService
��! -
>
��- .
(
��. /
)
��/ 0
.
��0 1
As
��1 3
<
��3 4

��4 A
>
��A B
(
��B C
)
��C D
.
��D E&
InstancePerLifetimeScope
��E ]
(
��] ^
)
��^ _
;
��_ `
builder
�� 
.
�� 
RegisterType
��  
<
��  !
GdprService
��! ,
>
��, -
(
��- .
)
��. /
.
��/ 0
As
��0 2
<
��2 3
IGdprService
��3 ?
>
��? @
(
��@ A
)
��A B
.
��B C&
InstancePerLifetimeScope
��C [
(
��[ \
)
��\ ]
;
��] ^
builder
�� 
.
�� 
RegisterType
��  
<
��  !
PollService
��! ,
>
��, -
(
��- .
)
��. /
.
��/ 0
As
��0 2
<
��2 3
IPollService
��3 ?
>
��? @
(
��@ A
)
��A B
.
��B C&
InstancePerLifetimeScope
��C [
(
��[ \
)
��\ ]
;
��] ^
builder
�� 
.
�� 
RegisterType
��  
<
��  !
BlogService
��! ,
>
��, -
(
��- .
)
��. /
.
��/ 0
As
��0 2
<
��2 3
IBlogService
��3 ?
>
��? @
(
��@ A
)
��A B
.
��B C&
InstancePerLifetimeScope
��C [
(
��[ \
)
��\ ]
;
��] ^
builder
�� 
.
�� 
RegisterType
��  
<
��  !
TopicService
��! -
>
��- .
(
��. /
)
��/ 0
.
��0 1
As
��1 3
<
��3 4

��4 A
>
��A B
(
��B C
)
��C D
.
��D E&
InstancePerLifetimeScope
��E ]
(
��] ^
)
��^ _
;
��_ `
builder
�� 
.
�� 
RegisterType
��  
<
��  !
NewsService
��! ,
>
��, -
(
��- .
)
��. /
.
��/ 0
As
��0 2
<
��2 3
INewsService
��3 ?
>
��? @
(
��@ A
)
��A B
.
��B C&
InstancePerLifetimeScope
��C [
(
��[ \
)
��\ ]
;
��] ^
builder
�� 
.
�� 
RegisterType
��  
<
��  !
DateTimeHelper
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
IDateTimeHelper
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !
SitemapGenerator
��! 1
>
��1 2
(
��2 3
)
��3 4
.
��4 5
As
��5 7
<
��7 8
ISitemapGenerator
��8 I
>
��I J
(
��J K
)
��K L
.
��L M&
InstancePerLifetimeScope
��M e
(
��e f
)
��f g
;
��g h
builder
�� 
.
�� 
RegisterType
��  
<
��  !
PageHeadBuilder
��! 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
As
��4 6
<
��6 7
IPageHeadBuilder
��7 G
>
��G H
(
��H I
)
��I J
.
��J K&
InstancePerLifetimeScope
��K c
(
��c d
)
��d e
;
��e f
builder
�� 
.
�� 
RegisterType
��  
<
��  !!
ScheduleTaskService
��! 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
As
��8 :
<
��: ;"
IScheduleTaskService
��; O
>
��O P
(
��P Q
)
��Q R
.
��R S&
InstancePerLifetimeScope
��S k
(
��k l
)
��l m
;
��m n
builder
�� 
.
�� 
RegisterType
��  
<
��  !

��! .
>
��. /
(
��/ 0
)
��0 1
.
��1 2
As
��2 4
<
��4 5
IExportManager
��5 C
>
��C D
(
��D E
)
��E F
.
��F G&
InstancePerLifetimeScope
��G _
(
��_ `
)
��` a
;
��a b
builder
�� 
.
�� 
RegisterType
��  
<
��  !

��! .
>
��. /
(
��/ 0
)
��0 1
.
��1 2
As
��2 4
<
��4 5
IImportManager
��5 C
>
��C D
(
��D E
)
��E F
.
��F G&
InstancePerLifetimeScope
��G _
(
��_ `
)
��` a
;
��a b
builder
�� 
.
�� 
RegisterType
��  
<
��  !

PdfService
��! +
>
��+ ,
(
��, -
)
��- .
.
��. /
As
��/ 1
<
��1 2
IPdfService
��2 =
>
��= >
(
��> ?
)
��? @
.
��@ A&
InstancePerLifetimeScope
��A Y
(
��Y Z
)
��Z [
;
��[ \
builder
�� 
.
�� 
RegisterType
��  
<
��  !

��! .
>
��. /
(
��/ 0
)
��0 1
.
��1 2
As
��2 4
<
��4 5
IUploadService
��5 C
>
��C D
(
��D E
)
��E F
.
��F G&
InstancePerLifetimeScope
��G _
(
��_ `
)
��` a
;
��a b
builder
�� 
.
�� 
RegisterType
��  
<
��  !

��! .
>
��. /
(
��/ 0
)
��0 1
.
��1 2
As
��2 4
<
��4 5
IThemeProvider
��5 C
>
��C D
(
��D E
)
��E F
.
��F G&
InstancePerLifetimeScope
��G _
(
��_ `
)
��` a
;
��a b
builder
�� 
.
�� 
RegisterType
��  
<
��  !
ThemeContext
��! -
>
��- .
(
��. /
)
��/ 0
.
��0 1
As
��1 3
<
��3 4

��4 A
>
��A B
(
��B C
)
��C D
.
��D E&
InstancePerLifetimeScope
��E ]
(
��] ^
)
��^ _
;
��_ `
builder
�� 
.
�� 
RegisterType
��  
<
��  !+
ExternalAuthenticationService
��! >
>
��> ?
(
��? @
)
��@ A
.
��A B
As
��B D
<
��D E,
IExternalAuthenticationService
��E c
>
��c d
(
��d e
)
��e f
.
��f g&
InstancePerLifetimeScope
��g 
(�� �
)��� �
;��� �
builder
�� 
.
�� 
RegisterType
��  
<
��  !
RoutePublisher
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
IRoutePublisher
��6 E
>
��E F
(
��F G
)
��G H
.
��H I
SingleInstance
��I W
(
��W X
)
��X Y
;
��Y Z
builder
�� 
.
�� 
RegisterType
��  
<
��  !
ReviewTypeService
��! 2
>
��2 3
(
��3 4
)
��4 5
.
��5 6
As
��6 8
<
��8 9 
IReviewTypeService
��9 K
>
��K L
(
��L M
)
��M N
.
��N O
SingleInstance
��O ]
(
��] ^
)
��^ _
;
��_ `
builder
�� 
.
�� 
RegisterType
��  
<
��  !
EventPublisher
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
IEventPublisher
��6 E
>
��E F
(
��F G
)
��G H
.
��H I
SingleInstance
��I W
(
��W X
)
��X Y
;
��Y Z
builder
�� 
.
�� 
RegisterType
��  
<
��  !
SettingService
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
ISettingService
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !
InvoiceService
��! /
>
��/ 0
(
��0 1
)
��1 2
.
��2 3
As
��3 5
<
��5 6
IInvoiceService
��6 E
>
��E F
(
��F G
)
��G H
.
��H I&
InstancePerLifetimeScope
��I a
(
��a b
)
��b c
;
��c d
builder
�� 
.
�� 
RegisterType
��  
<
��  !#
AnywhereSliderService
��! 6
>
��6 7
(
��7 8
)
��8 9
.
��9 :
As
��: <
<
��< =$
IAnywhereSliderService
��= S
>
��S T
(
��T U
)
��U V
.
��V W&
InstancePerLifetimeScope
��W o
(
��o p
)
��p q
;
��q r
builder
�� 
.
�� 
RegisterGeneric
�� #
(
��# $
typeof
��$ *
(
��* +

��+ 8
<
��8 9
>
��9 :
)
��: ;
)
��; <
.
��< =
As
��= ?
(
��? @
typeof
��@ F
(
��F G
IPluginManager
��G U
<
��U V
>
��V W
)
��W X
)
��X Y
.
��Y Z&
InstancePerLifetimeScope
��Z r
(
��r s
)
��s t
;
��t u
builder
�� 
.
�� 
RegisterType
��  
<
��  !)
AuthenticationPluginManager
��! <
>
��< =
(
��= >
)
��> ?
.
��? @
As
��@ B
<
��B C*
IAuthenticationPluginManager
��C _
>
��_ `
(
��` a
)
��a b
.
��b c&
InstancePerLifetimeScope
��c {
(
��{ |
)
��| }
;
��} ~
builder
�� 
.
�� 
RegisterType
��  
<
��  !!
WidgetPluginManager
��! 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
As
��8 :
<
��: ;"
IWidgetPluginManager
��; O
>
��O P
(
��P Q
)
��Q R
.
��R S&
InstancePerLifetimeScope
��S k
(
��k l
)
��l m
;
��m n
builder
�� 
.
�� 
RegisterType
��  
<
��  !'
ExchangeRatePluginManager
��! :
>
��: ;
(
��; <
)
��< =
.
��= >
As
��> @
<
��@ A(
IExchangeRatePluginManager
��A [
>
��[ \
(
��\ ]
)
��] ^
.
��^ _&
InstancePerLifetimeScope
��_ w
(
��w x
)
��x y
;
��y z
builder
�� 
.
�� 
RegisterType
��  
<
��  !#
DiscountPluginManager
��! 6
>
��6 7
(
��7 8
)
��8 9
.
��9 :
As
��: <
<
��< =$
IDiscountPluginManager
��= S
>
��S T
(
��T U
)
��U V
.
��V W&
InstancePerLifetimeScope
��W o
(
��o p
)
��p q
;
��q r
builder
�� 
.
�� 
RegisterType
��  
<
��  !"
PaymentPluginManager
��! 5
>
��5 6
(
��6 7
)
��7 8
.
��8 9
As
��9 ;
<
��; <#
IPaymentPluginManager
��< Q
>
��Q R
(
��R S
)
��S T
.
��T U&
InstancePerLifetimeScope
��U m
(
��m n
)
��n o
;
��o p
builder
�� 
.
�� 
RegisterType
��  
<
��  !!
PickupPluginManager
��! 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
As
��8 :
<
��: ;"
IPickupPluginManager
��; O
>
��O P
(
��P Q
)
��Q R
.
��R S&
InstancePerLifetimeScope
��S k
(
��k l
)
��l m
;
��m n
builder
�� 
.
�� 
RegisterType
��  
<
��  !#
ShippingPluginManager
��! 6
>
��6 7
(
��7 8
)
��8 9
.
��9 :
As
��: <
<
��< =$
IShippingPluginManager
��= S
>
��S T
(
��T U
)
��U V
.
��V W&
InstancePerLifetimeScope
��W o
(
��o p
)
��p q
;
��q r
builder
�� 
.
�� 
RegisterType
��  
<
��  !
TaxPluginManager
��! 1
>
��1 2
(
��2 3
)
��3 4
.
��4 5
As
��5 7
<
��7 8
ITaxPluginManager
��8 I
>
��I J
(
��J K
)
��K L
.
��L M&
InstancePerLifetimeScope
��M e
(
��e f
)
��f g
;
��g h
builder
�� 
.
�� 
RegisterType
��  
<
��  !$
BoxesGeneratorServices
��! 7
>
��7 8
(
��8 9
)
��9 :
.
��: ;
As
��; =
<
��= >%
IBoxesGeneratorServices
��> U
>
��U V
(
��V W
)
��W X
.
��X Y&
InstancePerLifetimeScope
��Y q
(
��q r
)
��r s
;
��s t
builder
�� 
.
�� 
RegisterType
��  
<
��  !#
ActionContextAccessor
��! 6
>
��6 7
(
��7 8
)
��8 9
.
��9 :
As
��: <
<
��< =$
IActionContextAccessor
��= S
>
��S T
(
��T U
)
��U V
.
��V W&
InstancePerLifetimeScope
��W o
(
��o p
)
��p q
;
��q r
builder
�� 
.
�� 
RegisterSource
�� "
(
��" #
new
��# &
SettingsSource
��' 5
(
��5 6
)
��6 7
)
��7 8
;
��8 9
if
�� 
(
�� 
config
�� 
.
�� %
AzureBlobStorageEnabled
�� .
)
��. /
builder
�� 
.
�� 
RegisterType
�� $
<
��$ %!
AzurePictureService
��% 8
>
��8 9
(
��9 :
)
��: ;
.
��; <
As
��< >
<
��> ?
IPictureService
��? N
>
��N O
(
��O P
)
��P Q
.
��Q R&
InstancePerLifetimeScope
��R j
(
��j k
)
��k l
;
��l m
else
�� 
builder
�� 
.
�� 
RegisterType
�� $
<
��$ %
PictureService
��% 3
>
��3 4
(
��4 5
)
��5 6
.
��6 7
As
��7 9
<
��9 :
IPictureService
��: I
>
��I J
(
��J K
)
��K L
.
��L M&
InstancePerLifetimeScope
��M e
(
��e f
)
��f g
;
��g h
builder
�� 
.
�� 
Register
�� 
(
�� 
context
�� $
=>
��% '
{
�� 
var
�� 
pictureService
�� "
=
��# $
context
��% ,
.
��, -
Resolve
��- 4
<
��4 5
IPictureService
��5 D
>
��D E
(
��E F
)
��F G
;
��G H
return
�� 

�� $
.
��$ %
Current
��% ,
.
��, -!
ResolveUnregistered
��- @
(
��@ A
pictureService
��A O
.
��O P
	StoreInDb
��P Y
?
�� 
typeof
�� 
(
�� (
DatabaseRoxyFilemanService
�� 7
)
��7 8
:
�� 
typeof
�� 
(
�� $
FileRoxyFilemanService
�� 3
)
��3 4
)
��4 5
;
��5 6
}
�� 
)
��
.
�� 
As
�� 
<
�� !
IRoxyFilemanService
�� %
>
��% &
(
��& '
)
��' (
.
��( )&
InstancePerLifetimeScope
��) A
(
��A B
)
��B C
;
��C D
if
�� 
(
�� 
!
�� !
DataSettingsManager
�� $
.
��$ %!
DatabaseIsInstalled
��% 8
)
��8 9
{
�� 
if
�� 
(
�� 
config
�� 
.
�� (
UseFastInstallationService
�� 5
)
��5 6
builder
�� 
.
�� 
RegisterType
�� (
<
��( )(
SqlFileInstallationService
��) C
>
��C D
(
��D E
)
��E F
.
��F G
As
��G I
<
��I J"
IInstallationService
��J ^
>
��^ _
(
��_ `
)
��` a
.
��a b&
InstancePerLifetimeScope
��b z
(
��z {
)
��{ |
;
��| }
else
�� 
builder
�� 
.
�� 
RegisterType
�� (
<
��( )*
CodeFirstInstallationService
��) E
>
��E F
(
��F G
)
��G H
.
��H I
As
��I K
<
��K L"
IInstallationService
��L `
>
��` a
(
��a b
)
��b c
.
��c d&
InstancePerLifetimeScope
��d |
(
��| }
)
��} ~
;
��~ 
}
�� 
var
�� 
	consumers
�� 
=
�� 

typeFinder
�� &
.
��& '
FindClassesOfType
��' 8
(
��8 9
typeof
��9 ?
(
��? @
	IConsumer
��@ I
<
��I J
>
��J K
)
��K L
)
��L M
.
��M N
ToList
��N T
(
��T U
)
��U V
;
��V W
foreach
�� 
(
�� 
var
�� 
consumer
�� !
in
��" $
	consumers
��% .
)
��. /
{
�� 
builder
�� 
.
�� 
RegisterType
�� $
(
��$ %
consumer
��% -
)
��- .
.
�� 
As
�� 
(
�� 
consumer
��  
.
��  !
FindInterfaces
��! /
(
��/ 0
(
��0 1
type
��1 5
,
��5 6
criteria
��7 ?
)
��? @
=>
��A C
{
�� 
var
�� 
isMatch
�� #
=
��$ %
type
��& *
.
��* +

��+ 8
&&
��9 ;
(
��< =
(
��= >
Type
��> B
)
��B C
criteria
��C K
)
��K L
.
��L M
IsAssignableFrom
��M ]
(
��] ^
type
��^ b
.
��b c&
GetGenericTypeDefinition
��c {
(
��{ |
)
��| }
)
��} ~
;
��~ 
return
�� 
isMatch
�� &
;
��& '
}
�� 
,
�� 
typeof
�� 
(
�� 
	IConsumer
�� '
<
��' (
>
��( )
)
��) *
)
��* +
)
��+ ,
.
�� &
InstancePerLifetimeScope
�� -
(
��- .
)
��. /
;
��/ 0
}
�� 
}
�� 	
public
�� 
int
�� 
Order
�� 
=>
�� 
$num
�� 
;
�� 
}
�� 
public
�� 

class
�� 
SettingsSource
�� 
:
��  !!
IRegistrationSource
��" 5
{
�� 
private
�� 
static
�� 
readonly
�� 

MethodInfo
��  *
_buildMethod
��+ 7
=
��8 9
typeof
�� 
(
�� 
SettingsSource
�� !
)
��! "
.
��" #
	GetMethod
��# ,
(
��, -
$str
��- @
,
��@ A
BindingFlags
��B N
.
��N O
Static
��O U
|
��V W
BindingFlags
��X d
.
��d e
	NonPublic
��e n
)
��n o
;
��o p
public
�� 
IEnumerable
�� 
<
�� $
IComponentRegistration
�� 1
>
��1 2
RegistrationsFor
��3 C
(
��C D
Service
��D K
service
��L S
,
��S T
Func
�� 
<
�� 
Service
�� 
,
�� 
IEnumerable
�� %
<
��% &$
IComponentRegistration
��& <
>
��< =
>
��= >

��? L
)
��L M
{
�� 	
var
�� 
ts
�� 
=
�� 
service
�� 
as
�� 
TypedService
��  ,
;
��, -
if
�� 
(
�� 
ts
�� 
!=
�� 
null
�� 
&&
�� 
typeof
�� $
(
��$ %
	ISettings
��% .
)
��. /
.
��/ 0
IsAssignableFrom
��0 @
(
��@ A
ts
��A C
.
��C D
ServiceType
��D O
)
��O P
)
��P Q
{
�� 
var
�� 
buildMethod
�� 
=
��  !
_buildMethod
��" .
.
��. /
MakeGenericMethod
��/ @
(
��@ A
ts
��A C
.
��C D
ServiceType
��D O
)
��O P
;
��P Q
yield
�� 
return
�� 
(
�� $
IComponentRegistration
�� 4
)
��4 5
buildMethod
��5 @
.
��@ A
Invoke
��A G
(
��G H
null
��H L
,
��L M
null
��N R
)
��R S
;
��S T
}
�� 
}
�� 	
private
�� 
static
�� $
IComponentRegistration
�� -
BuildRegistration
��. ?
<
��? @
	TSettings
��@ I
>
��I J
(
��J K
)
��K L
where
��M R
	TSettings
��S \
:
��] ^
	ISettings
��_ h
,
��h i
new
��j m
(
��m n
)
��n o
{
�� 	
return
�� !
RegistrationBuilder
�� &
.
�� 
ForDelegate
�� 
(
�� 
(
�� 
c
�� 
,
��  
p
��! "
)
��" #
=>
��$ &
{
�� 
var
�� 
currentStoreId
�� &
=
��' (
c
��) *
.
��* +
Resolve
��+ 2
<
��2 3

��3 @
>
��@ A
(
��A B
)
��B C
.
��C D
CurrentStore
��D P
.
��P Q
Id
��Q S
;
��S T
return
�� 
c
�� 
.
�� 
Resolve
�� $
<
��$ %
ISettingService
��% 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
LoadSetting
��8 C
<
��C D
	TSettings
��D M
>
��M N
(
��N O
currentStoreId
��O ]
)
��] ^
;
��^ _
}
�� 
)
�� 
.
�� &
InstancePerLifetimeScope
�� )
(
��) *
)
��* +
.
��  
CreateRegistration
�� #
(
��# $
)
��$ %
;
��% &
}
�� 	
public
�� 
bool
�� .
 IsAdapterForIndividualComponents
�� 4
=>
��5 7
false
��8 =
;
��= >
}
�� 
}�� �

�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\ErrorHandlerStartup.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
{ 
public 

class 
ErrorHandlerStartup $
:% &
INopStartup' 2
{
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
,A B
IConfigurationC Q

)_ `
{ 	
} 	
public 
void 
	Configure 
( 
IApplicationBuilder 1
application2 =
)= >
{ 	
application 
. "
UseNopExceptionHandler .
(. /
)/ 0
;0 1
application!! 
.!! 
UseBadRequestResult!! +
(!!+ ,
)!!, -
;!!- .
application$$ 
.$$ 
UsePageNotFound$$ '
($$' (
)$$( )
;$$) *
}%% 	
public** 
int** 
Order** 
=>** 
$num** 
;** 
}++ 
},, ��
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\Extensions\ApplicationBuilderExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
.* +

Extensions+ 5
{ 
public"" 

static"" 
class"" (
ApplicationBuilderExtensions"" 4
{## 
public(( 
static(( 
void(( $
ConfigureRequestPipeline(( 3
(((3 4
this((4 8
IApplicationBuilder((9 L
application((M X
)((X Y
{)) 	

.** 
Current** !
.**! "$
ConfigureRequestPipeline**" :
(**: ;
application**; F
)**F G
;**G H
}++ 	
public11 
static11 
void11 "
UseNopExceptionHandler11 1
(111 2
this112 6
IApplicationBuilder117 J
application11K V
)11V W
{22 	
var33 
	nopConfig33 
=33 

.33) *
Current33* 1
.331 2
Resolve332 9
<339 :
	NopConfig33: C
>33C D
(33D E
)33E F
;33F G
var44 
hostingEnvironment44 "
=44# $

.442 3
Current443 :
.44: ;
Resolve44; B
<44B C
IHostingEnvironment44C V
>44V W
(44W X
)44X Y
;44Y Z
var55 $
useDetailedExceptionPage55 (
=55) *
	nopConfig55+ 4
.554 5!
DisplayFullErrorStack555 J
||55K M
hostingEnvironment55N `
.55` a

(55n o
)55o p
;55p q
if66 
(66 $
useDetailedExceptionPage66 (
)66( )
{77 
application99 
.99 %
UseDeveloperExceptionPage99 5
(995 6
)996 7
;997 8
}:: 
else;; 
{<< 
application>> 
.>> 
UseExceptionHandler>> /
(>>/ 0
$str>>0 >
)>>> ?
;>>? @
}?? 
applicationBB 
.BB 
UseExceptionHandlerBB +
(BB+ ,
handlerBB, 3
=>BB4 6
{CC 
handlerDD 
.DD 
RunDD 
(DD 
contextDD #
=>DD$ &
{EE 
varFF 
	exceptionFF !
=FF" #
contextFF$ +
.FF+ ,
FeaturesFF, 4
.FF4 5
GetFF5 8
<FF8 9$
IExceptionHandlerFeatureFF9 Q
>FFQ R
(FFR S
)FFS T
?FFT U
.FFU V
ErrorFFV [
;FF[ \
ifGG 
(GG 
	exceptionGG !
==GG" $
nullGG% )
)GG) *
returnHH 
TaskHH #
.HH# $

;HH1 2
tryJJ 
{KK 
ifMM 
(MM 
DataSettingsManagerMM /
.MM/ 0
DatabaseIsInstalledMM0 C
)MMC D
{NN 
varPP 
currentCustomerPP  /
=PP0 1

.PP? @
CurrentPP@ G
.PPG H
ResolvePPH O
<PPO P
IWorkContextPPP \
>PP\ ]
(PP] ^
)PP^ _
.PP_ `
CurrentCustomerPP` o
;PPo p

.SS) *
CurrentSS* 1
.SS1 2
ResolveSS2 9
<SS9 :
ILoggerSS: A
>SSA B
(SSB C
)SSC D
.SSD E
ErrorSSE J
(SSJ K
	exceptionSSK T
.SST U
MessageSSU \
,SS\ ]
	exceptionSS^ g
,SSg h
currentCustomerSSi x
)SSx y
;SSy z
}TT 
}UU 
finallyVV 
{WW !
ExceptionDispatchInfoYY -
.YY- .
ThrowYY. 3
(YY3 4
	exceptionYY4 =
)YY= >
;YY> ?
}ZZ 
return\\ 
Task\\ 
.\\  

;\\- .
}]] 
)]] 
;]] 
}^^ 
)^^
;^^ 
}__ 	
publicee 
staticee 
voidee 
UsePageNotFoundee *
(ee* +
thisee+ /
IApplicationBuilderee0 C
applicationeeD O
)eeO P
{ff 	
applicationgg 
.gg 
UseStatusCodePagesgg *
(gg* +
asyncgg+ 0
contextgg1 8
=>gg9 ;
{hh 
ifjj 
(jj 
contextjj 
.jj 
HttpContextjj '
.jj' (
Responsejj( 0
.jj0 1

StatusCodejj1 ;
==jj< >
StatusCodesjj? J
.jjJ K
Status404NotFoundjjK \
)jj\ ]
{kk 
varll 
	webHelperll !
=ll" #

.ll1 2
Currentll2 9
.ll9 :
Resolvell: A
<llA B

IWebHelperllB L
>llL M
(llM N
)llN O
;llO P
ifmm 
(mm 
!mm 
	webHelpermm "
.mm" #
IsStaticResourcemm# 3
(mm3 4
)mm4 5
)mm5 6
{nn 
varpp 
originalPathpp (
=pp) *
contextpp+ 2
.pp2 3
HttpContextpp3 >
.pp> ?
Requestpp? F
.ppF G
PathppG K
;ppK L
varqq 
originalQueryStringqq /
=qq0 1
contextqq2 9
.qq9 :
HttpContextqq: E
.qqE F
RequestqqF M
.qqM N
QueryStringqqN Y
;qqY Z
contexttt 
.tt  
HttpContexttt  +
.tt+ ,
Featurestt, 4
.tt4 5
Settt5 8
<tt8 9'
IStatusCodeReExecuteFeaturett9 T
>ttT U
(ttU V
newttV Y&
StatusCodeReExecuteFeaturettZ t
{uu 
OriginalPathBasevv ,
=vv- .
contextvv/ 6
.vv6 7
HttpContextvv7 B
.vvB C
RequestvvC J
.vvJ K
PathBasevvK S
.vvS T
ValuevvT Y
,vvY Z
OriginalPathww (
=ww) *
originalPathww+ 7
.ww7 8
Valueww8 =
,ww= >
OriginalQueryStringxx /
=xx0 1
originalQueryStringxx2 E
.xxE F
HasValuexxF N
?xxO P
originalQueryStringxxQ d
.xxd e
Valuexxe j
:xxk l
nullxxm q
}yy 
)yy 
;yy 
context|| 
.||  
HttpContext||  +
.||+ ,
Request||, 3
.||3 4
Path||4 8
=||9 :
$str||; L
;||L M
context}} 
.}}  
HttpContext}}  +
.}}+ ,
Request}}, 3
.}}3 4
QueryString}}4 ?
=}}@ A
QueryString}}B M
.}}M N
Empty}}N S
;}}S T
try 
{
�� 
await
�� !
context
��" )
.
��) *
Next
��* .
(
��. /
context
��/ 6
.
��6 7
HttpContext
��7 B
)
��B C
;
��C D
}
�� 
finally
�� 
{
�� 
context
�� #
.
��# $
HttpContext
��$ /
.
��/ 0
Request
��0 7
.
��7 8
QueryString
��8 C
=
��D E!
originalQueryString
��F Y
;
��Y Z
context
�� #
.
��# $
HttpContext
��$ /
.
��/ 0
Request
��0 7
.
��7 8
Path
��8 <
=
��= >
originalPath
��? K
;
��K L
context
�� #
.
��# $
HttpContext
��$ /
.
��/ 0
Features
��0 8
.
��8 9
Set
��9 <
<
��< =)
IStatusCodeReExecuteFeature
��= X
>
��X Y
(
��Y Z
null
��Z ^
)
��^ _
;
��_ `
}
�� 
}
�� 
}
�� 
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� !
UseBadRequestResult
�� .
(
��. /
this
��/ 3!
IApplicationBuilder
��4 G
application
��H S
)
��S T
{
�� 	
application
�� 
.
��  
UseStatusCodePages
�� *
(
��* +
context
��+ 2
=>
��3 5
{
�� 
if
�� 
(
�� 
context
�� 
.
�� 
HttpContext
�� '
.
��' (
Response
��( 0
.
��0 1

StatusCode
��1 ;
==
��< >
StatusCodes
��? J
.
��J K!
Status400BadRequest
��K ^
)
��^ _
{
�� 
var
�� 
logger
�� 
=
��  

��! .
.
��. /
Current
��/ 6
.
��6 7
Resolve
��7 >
<
��> ?
ILogger
��? F
>
��F G
(
��G H
)
��H I
;
��I J
var
�� 
workContext
�� #
=
��$ %

��& 3
.
��3 4
Current
��4 ;
.
��; <
Resolve
��< C
<
��C D
IWorkContext
��D P
>
��P Q
(
��Q R
)
��R S
;
��S T
logger
�� 
.
�� 
Error
��  
(
��  !
$str
��! 9
,
��9 :
null
��; ?
,
��? @
customer
��A I
:
��I J
workContext
��K V
.
��V W
CurrentCustomer
��W f
)
��f g
;
��g h
}
�� 
return
�� 
Task
�� 
.
�� 

�� )
;
��) *
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� '
UseNopResponseCompression
�� 4
(
��4 5
this
��5 9!
IApplicationBuilder
��: M
application
��N Y
)
��Y Z
{
�� 	
if
�� 
(
�� !
DataSettingsManager
�� #
.
��# $!
DatabaseIsInstalled
��$ 7
&&
��8 :

��; H
.
��H I
Current
��I P
.
��P Q
Resolve
��Q X
<
��X Y
CommonSettings
��Y g
>
��g h
(
��h i
)
��i j
.
��j k%
UseResponseCompression��k �
)��� �
application
�� 
.
�� $
UseResponseCompression
�� 2
(
��2 3
)
��3 4
;
��4 5
}
�� 	
public
�� 
static
�� 
void
�� 
UseNopStaticFiles
�� ,
(
��, -
this
��- 1!
IApplicationBuilder
��2 E
application
��F Q
)
��Q R
{
�� 	
void
��  
staticFileResponse
�� #
(
��# $'
StaticFileResponseContext
��$ =
context
��> E
)
��E F
{
�� 
if
�� 
(
�� 
!
�� !
DataSettingsManager
�� (
.
��( )!
DatabaseIsInstalled
��) <
)
��< =
return
�� 
;
�� 
var
�� 
commonSettings
�� "
=
��# $

��% 2
.
��2 3
Current
��3 :
.
��: ;
Resolve
��; B
<
��B C
CommonSettings
��C Q
>
��Q R
(
��R S
)
��S T
;
��T U
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 

�� )
(
��) *
commonSettings
��* 8
.
��8 9%
StaticFilesCacheControl
��9 P
)
��P Q
)
��Q R
context
�� 
.
�� 
Context
�� #
.
��# $
Response
��$ ,
.
��, -
Headers
��- 4
.
��4 5
Append
��5 ;
(
��; <
HeaderNames
��< G
.
��G H
CacheControl
��H T
,
��T U
commonSettings
��V d
.
��d e%
StaticFilesCacheControl
��e |
)
��| }
;
��} ~
}
�� 
var
�� 
fileProvider
�� 
=
�� 

�� ,
.
��, -
Current
��- 4
.
��4 5
Resolve
��5 <
<
��< =
INopFileProvider
��= M
>
��M N
(
��N O
)
��O P
;
��P Q
application
�� 
.
�� 
UseStaticFiles
�� &
(
��& '
new
��' *
StaticFileOptions
��+ <
{
��= >
OnPrepareResponse
��? P
=
��Q R 
staticFileResponse
��S e
}
��f g
)
��g h
;
��h i
application
�� 
.
�� 
UseStaticFiles
�� &
(
��& '
new
��' *
StaticFileOptions
��+ <
{
�� 
FileProvider
�� 
=
�� 
new
�� ""
PhysicalFileProvider
��# 7
(
��7 8
fileProvider
��8 D
.
��D E
MapPath
��E L
(
��L M
$str
��M V
)
��V W
)
��W X
,
��X Y
RequestPath
�� 
=
�� 
new
�� !

PathString
��" ,
(
��, -
$str
��- 6
)
��6 7
,
��7 8
OnPrepareResponse
�� !
=
��" # 
staticFileResponse
��$ 6
}
�� 
)
��
;
�� 
var
�� 
staticFileOptions
�� !
=
��" #
new
��$ '
StaticFileOptions
��( 9
{
�� 
FileProvider
�� 
=
�� 
new
�� ""
PhysicalFileProvider
��# 7
(
��7 8
fileProvider
��8 D
.
��D E
MapPath
��E L
(
��L M
$str
��M W
)
��W X
)
��X Y
,
��Y Z
RequestPath
�� 
=
�� 
new
�� !

PathString
��" ,
(
��, -
$str
��- 7
)
��7 8
,
��8 9
OnPrepareResponse
�� !
=
��" # 
staticFileResponse
��$ 6
}
�� 
;
��
if
�� 
(
�� !
DataSettingsManager
�� #
.
��# $!
DatabaseIsInstalled
��$ 7
)
��7 8
{
�� 
var
�� 
securitySettings
�� $
=
��% &

��' 4
.
��4 5
Current
��5 <
.
��< =
Resolve
��= D
<
��D E
SecuritySettings
��E U
>
��U V
(
��V W
)
��W X
;
��X Y
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 

�� )
(
��) *
securitySettings
��* :
.
��: ;1
#PluginStaticFileExtensionsBlacklist
��; ^
)
��^ _
)
��_ `
{
�� 
var
�� .
 fileExtensionContentTypeProvider
�� 8
=
��9 :
new
��; >.
 FileExtensionContentTypeProvider
��? _
(
��_ `
)
��` a
;
��a b
foreach
�� 
(
�� 
var
��  
ext
��! $
in
��% '
securitySettings
��( 8
.
��8 91
#PluginStaticFileExtensionsBlacklist
��9 \
.
�� 
Split
�� 
(
�� 
$char
�� "
,
��" #
$char
��$ '
)
��' (
.
�� 
Select
�� 
(
��  
e
��  !
=>
��" $
e
��% &
.
��& '
Trim
��' +
(
��+ ,
)
��, -
.
��- .
ToLower
��. 5
(
��5 6
)
��6 7
)
��7 8
.
�� 
Select
�� 
(
��  
e
��  !
=>
��" $
$"
��% '
{
��' (
(
��( )
e
��) *
.
��* +

StartsWith
��+ 5
(
��5 6
$str
��6 9
)
��9 :
?
��; <
string
��= C
.
��C D
Empty
��D I
:
��J K
$str
��L O
)
��O P
}
��P Q
{
��Q R
e
��R S
}
��S T
"
��T U
)
��U V
.
�� 
Where
�� 
(
�� .
 fileExtensionContentTypeProvider
�� ?
.
��? @
Mappings
��@ H
.
��H I
ContainsKey
��I T
)
��T U
)
��U V
{
�� .
 fileExtensionContentTypeProvider
�� 8
.
��8 9
Mappings
��9 A
.
��A B
Remove
��B H
(
��H I
ext
��I L
)
��L M
;
��M N
}
�� 
staticFileOptions
�� %
.
��% &!
ContentTypeProvider
��& 9
=
��: ;.
 fileExtensionContentTypeProvider
��< \
;
��\ ]
}
�� 
}
�� 
application
�� 
.
�� 
UseStaticFiles
�� &
(
��& '
staticFileOptions
��' 8
)
��8 9
;
��9 :
var
�� 
provider
�� 
=
�� 
new
�� .
 FileExtensionContentTypeProvider
�� ?
{
�� 
Mappings
�� 
=
�� 
{
�� 
[
�� 
$str
�� $
]
��$ %
=
��& '
	MimeTypes
��( 1
.
��1 2$
ApplicationOctetStream
��2 H
}
��I J
}
�� 
;
��
application
�� 
.
�� 
UseStaticFiles
�� &
(
��& '
new
��' *
StaticFileOptions
��+ <
{
�� 
FileProvider
�� 
=
�� 
new
�� ""
PhysicalFileProvider
��# 7
(
��7 8
fileProvider
��8 D
.
��D E
GetAbsolutePath
��E T
(
��T U
$str
��U a
)
��a b
)
��b c
,
��c d
RequestPath
�� 
=
�� 
new
�� !

PathString
��" ,
(
��, -
$str
��- :
)
��: ;
,
��; <!
ContentTypeProvider
�� #
=
��$ %
provider
��& .
}
�� 
)
��
;
�� 
provider
�� 
.
�� 
Mappings
�� 
[
�� 
$str
�� ,
]
��, -
=
��. /
	MimeTypes
��0 9
.
��9 :%
ApplicationManifestJson
��: Q
;
��Q R
application
�� 
.
�� 
UseStaticFiles
�� &
(
��& '
new
��' *
StaticFileOptions
��+ <
{
�� 
FileProvider
�� 
=
�� 
new
�� ""
PhysicalFileProvider
��# 7
(
��7 8
fileProvider
��8 D
.
��D E
GetAbsolutePath
��E T
(
��T U
$str
��U \
)
��\ ]
)
��] ^
,
��^ _
RequestPath
�� 
=
�� 
$str
�� &
,
��& '!
ContentTypeProvider
�� #
=
��$ %
provider
��& .
}
�� 
)
��
;
�� 
if
�� 
(
�� !
DataSettingsManager
�� #
.
��# $!
DatabaseIsInstalled
��$ 7
)
��7 8
{
�� 
application
�� 
.
�� 
UseStaticFiles
�� *
(
��* +
new
��+ .
StaticFileOptions
��/ @
{
�� 
FileProvider
��  
=
��! "
new
��# &!
RoxyFilemanProvider
��' :
(
��: ;
fileProvider
��; G
.
��G H
GetAbsolutePath
��H W
(
��W X$
NopRoxyFilemanDefaults
��X n
.
��n o#
DefaultRootDirectory��o �
.��� �
	TrimStart��� �
(��� �
$char��� �
)��� �
.��� �
Split��� �
(��� �
$char��� �
)��� �
)��� �
)��� �
,��� �
RequestPath
�� 
=
��  !
new
��" %

PathString
��& 0
(
��0 1$
NopRoxyFilemanDefaults
��1 G
.
��G H"
DefaultRootDirectory
��H \
)
��\ ]
,
��] ^
OnPrepareResponse
�� %
=
��& ' 
staticFileResponse
��( :
}
�� 
)
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
static
�� 
void
�� 
UseKeepAlive
�� '
(
��' (
this
��( ,!
IApplicationBuilder
��- @
application
��A L
)
��L M
{
�� 	
application
�� 
.
�� 

�� %
<
��% &!
KeepAliveMiddleware
��& 9
>
��9 :
(
��: ;
)
��; <
;
��< =
}
�� 	
public
�� 
static
�� 
void
�� 

�� (
(
��( )
this
��) -!
IApplicationBuilder
��. A
application
��B M
)
��M N
{
�� 	
application
�� 
.
�� 

�� %
<
��% &"
InstallUrlMiddleware
��& :
>
��: ;
(
��; <
)
��< =
;
��= >
}
�� 	
public
�� 
static
�� 
void
�� "
UseNopAuthentication
�� /
(
��/ 0
this
��0 4!
IApplicationBuilder
��5 H
application
��I T
)
��T U
{
�� 	
if
�� 
(
�� 
!
�� !
DataSettingsManager
�� $
.
��$ %!
DatabaseIsInstalled
��% 8
)
��8 9
return
�� 
;
�� 
application
�� 
.
�� 

�� %
<
��% &&
AuthenticationMiddleware
��& >
>
��> ?
(
��? @
)
��@ A
;
��A B
}
�� 	
public
�� 
static
�� 
void
�� '
UseNopRequestLocalization
�� 4
(
��4 5
this
��5 9!
IApplicationBuilder
��: M
application
��N Y
)
��Y Z
{
�� 	
application
�� 
.
�� $
UseRequestLocalization
�� .
(
��. /
options
��/ 6
=>
��7 9
{
�� 
if
�� 
(
�� 
!
�� !
DataSettingsManager
�� (
.
��( )!
DatabaseIsInstalled
��) <
)
��< =
return
�� 
;
�� 
var
�� 
cultures
�� 
=
�� 

�� ,
.
��, -
Current
��- 4
.
��4 5
Resolve
��5 <
<
��< =
ILanguageService
��= M
>
��M N
(
��N O
)
��O P
.
��P Q
GetAllLanguages
��Q `
(
��` a
)
��a b
.
�� 
OrderBy
�� 
(
�� 
language
�� %
=>
��& (
language
��) 1
.
��1 2
DisplayOrder
��2 >
)
��> ?
.
�� 
Select
�� 
(
�� 
language
�� $
=>
��% '
new
��( +
CultureInfo
��, 7
(
��7 8
language
��8 @
.
��@ A
LanguageCulture
��A P
)
��P Q
)
��Q R
.
��R S
ToList
��S Y
(
��Y Z
)
��Z [
;
��[ \
options
�� 
.
�� 
SupportedCultures
�� )
=
��* +
cultures
��, 4
;
��4 5
options
�� 
.
�� #
DefaultRequestCulture
�� -
=
��. /
new
��0 3
RequestCulture
��4 B
(
��B C
cultures
��C K
.
��K L
FirstOrDefault
��L Z
(
��Z [
)
��[ \
)
��\ ]
;
��] ^
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� 

UseCulture
�� %
(
��% &
this
��& *!
IApplicationBuilder
��+ >
application
��? J
)
��J K
{
�� 	
if
�� 
(
�� 
!
�� !
DataSettingsManager
�� $
.
��$ %!
DatabaseIsInstalled
��% 8
)
��8 9
return
�� 
;
�� 
application
�� 
.
�� 

�� %
<
��% &
CultureMiddleware
��& 7
>
��7 8
(
��8 9
)
��9 :
;
��: ;
}
�� 	
public
�� 
static
�� 
void
�� 
	UseNopMvc
�� $
(
��$ %
this
��% )!
IApplicationBuilder
��* =
application
��> I
)
��I J
{
�� 	
application
�� 
.
�� 
UseMvc
�� 
(
�� 
routeBuilder
�� +
=>
��, .
{
�� 

�� 
.
�� 
Current
�� %
.
��% &
Resolve
��& -
<
��- .
IRoutePublisher
��. =
>
��= >
(
��> ?
)
��? @
.
��@ A
RegisterRoutes
��A O
(
��O P
routeBuilder
��P \
)
��\ ]
;
��] ^
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
void
��  
UseNopWebMarkupMin
�� -
(
��- .
this
��. 2!
IApplicationBuilder
��3 F
application
��G R
)
��R S
{
�� 	
if
�� 
(
�� 
!
�� !
DataSettingsManager
�� $
.
��$ %!
DatabaseIsInstalled
��% 8
)
��8 9
return
�� 
;
�� 
application
�� 
.
�� 
UseWebMarkupMin
�� '
(
��' (
)
��( )
;
��) *
}
�� 	
}
�� 
}�� ��
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\Extensions\ApplicationPartManagerExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
.* +

Extensions+ 5
{ 
public 

static 
partial 
class ,
 ApplicationPartManagerExtensions  @
{ 
private 
static 
readonly 
INopFileProvider  0

;> ?
private 
static 
readonly 
List  $
<$ %
string% +
>+ ,
_baseAppLibraries- >
;> ?
private 
static 
readonly 

Dictionary  *
<* +
string+ 1
,1 2$
PluginLoadedAssemblyInfo3 K
>K L
_loadedAssembliesM ^
=_ `
newa d

Dictionarye o
<o p
stringp v
,v w%
PluginLoadedAssemblyInfo	x �
>
� �
(
� �
)
� �
;
� �
private 
static 
readonly  
ReaderWriterLockSlim  4
_locker5 <
== >
new? B 
ReaderWriterLockSlimC W
(W X
)X Y
;Y Z
static"" ,
 ApplicationPartManagerExtensions"" /
(""/ 0
)""0 1
{## 	

=%% 
CommonHelper%% (
.%%( )
DefaultFileProvider%%) <
;%%< =
_baseAppLibraries'' 
='' 
new''  #
List''$ (
<''( )
string'') /
>''/ 0
(''0 1
)''1 2
;''2 3
_baseAppLibraries** 
.** 
AddRange** &
(**& '

.**4 5
GetFiles**5 =
(**= >
	AppDomain**> G
.**G H

.**U V

,**c d
$str**e l
)**l m
.++ 
Select++ 
(++ 
fileName++  
=>++! #

.++1 2
GetFileName++2 =
(++= >
fileName++> F
)++F G
)++G H
)++H I
;++I J
if.. 
(.. 
!.. 
	AppDomain.. 
... 

...( )

...6 7
Equals..7 =
(..= >
Environment..> I
...I J
CurrentDirectory..J Z
,..Z [
StringComparison..\ l
...l m'
InvariantCultureIgnoreCase	..m �
)
..� �
)
..� �
{// 
_baseAppLibraries00 !
.00! "
AddRange00" *
(00* +

.008 9
GetFiles009 A
(00A B
Environment00B M
.00M N
CurrentDirectory00N ^
,00^ _
$str00` g
)00g h
.11 
Select11 
(11 
fileName11 $
=>11% '

.115 6
GetFileName116 A
(11A B
fileName11B J
)11J K
)11K L
)11L M
;11M N
}22 
var55 
refsPathName55 
=55 

.55, -
Combine55- 4
(554 5
Environment555 @
.55@ A
CurrentDirectory55A Q
,55Q R
NopPluginDefaults55S d
.55d e
RefsPathName55e q
)55q r
;55r s
if66 
(66 

.66 
DirectoryExists66 -
(66- .
refsPathName66. :
)66: ;
)66; <
{77 
_baseAppLibraries88 !
.88! "
AddRange88" *
(88* +

.888 9
GetFiles889 A
(88A B
refsPathName88B N
,88N O
$str88P W
)88W X
.99 
Select99 
(99 
fileName99 $
=>99% '

.995 6
GetFileName996 A
(99A B
fileName99B J
)99J K
)99K L
)99L M
;99M N
}:: 
};; 	
privateDD 
staticDD 
IPluginsInfoDD #
PluginsInfoDD$ /
{EE 	
getFF 
=>FF 
	SingletonFF 
<FF 
IPluginsInfoFF )
>FF) *
.FF* +
InstanceFF+ 3
;FF3 4
setGG 
=>GG 
	SingletonGG 
<GG 
IPluginsInfoGG )
>GG) *
.GG* +
InstanceGG+ 3
=GG4 5
valueGG6 ;
;GG; <
}HH 	
privateUU 
staticUU 
stringUU 
ShadowCopyFileUU ,
(UU, -
INopFileProviderUU- =
fileProviderUU> J
,UUJ K
stringUUL R
assemblyFileUUS _
,UU_ `
stringUUa g
shadowCopyDirectoryUUh {
)UU{ |
{VV 	
varXX 
shadowCopiedFileXX  
=XX! "
fileProviderXX# /
.XX/ 0
CombineXX0 7
(XX7 8
shadowCopyDirectoryXX8 K
,XXK L
fileProviderXXM Y
.XXY Z
GetFileNameXXZ e
(XXe f
assemblyFileXXf r
)XXr s
)XXs t
;XXt u
if[[ 
([[ 
fileProvider[[ 
.[[ 

FileExists[[ '
([[' (
shadowCopiedFile[[( 8
)[[8 9
)[[9 :
{\\ 
var^^ 
areFilesIdentical^^ %
=^^& '
fileProvider^^( 4
.^^4 5
GetCreationTime^^5 D
(^^D E
shadowCopiedFile^^E U
)^^U V
.^^V W
ToUniversalTime^^W f
(^^f g
)^^g h
.^^h i
Ticks^^i n
>=^^o q
fileProvider__  
.__  !
GetCreationTime__! 0
(__0 1
assemblyFile__1 =
)__= >
.__> ?
ToUniversalTime__? N
(__N O
)__O P
.__P Q
Ticks__Q V
;__V W
if`` 
(`` 
areFilesIdentical`` %
)``% &
{aa 
returncc 
shadowCopiedFilecc +
;cc+ ,
}dd 
fileProviderhh 
.hh 

DeleteFilehh '
(hh' (
shadowCopiedFilehh( 8
)hh8 9
;hh9 :
}ii 
tryll 
{mm 
fileProvidernn 
.nn 
FileCopynn %
(nn% &
assemblyFilenn& 2
,nn2 3
shadowCopiedFilenn4 D
,nnD E
truennF J
)nnJ K
;nnK L
}oo 
catchpp 
(pp 
IOExceptionpp 
)pp 
{qq 
tryuu 
{vv 
varww 
oldFileww 
=ww  !
$"ww" $
{ww$ %
shadowCopiedFileww% 5
}ww5 6
{ww6 7
Guidww7 ;
.ww; <
NewGuidww< C
(wwC D
)wwD E
:wwE F
$strwwF G
}wwG H
$strwwH L
"wwL M
;wwM N
fileProviderxx  
.xx  !
FileMovexx! )
(xx) *
shadowCopiedFilexx* :
,xx: ;
oldFilexx< C
)xxC D
;xxD E
}yy 
catchzz 
(zz 
IOExceptionzz "
	exceptionzz# ,
)zz, -
{{{ 
throw|| 
new|| 
IOException|| )
(||) *
$"||* ,
{||, -
shadowCopiedFile||- =
}||= >
$str||> f
"||f g
,||g h
	exception||i r
)||r s
;||s t
}}} 
fileProvider
�� 
.
�� 
FileCopy
�� %
(
��% &
assemblyFile
��& 2
,
��2 3
shadowCopiedFile
��4 D
,
��D E
true
��F J
)
��J K
;
��K L
}
�� 
return
�� 
shadowCopiedFile
�� #
;
��# $
}
�� 	
private
�� 
static
�� 
Assembly
�� !
AddApplicationParts
��  3
(
��3 4$
ApplicationPartManager
��4 J$
applicationPartManager
��K a
,
��a b
string
��c i
assemblyFile
��j v
,
��v w
bool
��x |$
useUnsafeLoadAssembly��} �
)��� �
{
�� 	
Assembly
�� 
assembly
�� 
;
�� 
try
�� 
{
�� 
assembly
�� 
=
�� 
Assembly
�� #
.
��# $
LoadFrom
��$ ,
(
��, -
assemblyFile
��- 9
)
��9 :
;
��: ;
}
�� 
catch
�� 
(
�� 
FileLoadException
�� $
)
��$ %
{
�� 
if
�� 
(
�� #
useUnsafeLoadAssembly
�� )
)
��) *
{
�� 
assembly
�� 
=
�� 
Assembly
�� '
.
��' (
UnsafeLoadFrom
��( 6
(
��6 7
assemblyFile
��7 C
)
��C D
;
��D E
}
�� 
else
�� 
throw
�� 
;
�� 
}
�� 
applicationPartManager
�� "
.
��" #
ApplicationParts
��# 3
.
��3 4
Add
��4 7
(
��7 8
new
��8 ;
AssemblyPart
��< H
(
��H I
assembly
��I Q
)
��Q R
)
��R S
;
��S T
return
�� 
assembly
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
Assembly
�� 
PerformFileDeploy
��  1
(
��1 2
this
��2 6$
ApplicationPartManager
��7 M$
applicationPartManager
��N d
,
��d e
string
�� 
assemblyFile
�� 
,
��  
string
��! '!
shadowCopyDirectory
��( ;
,
��; <
	NopConfig
��= F
config
��G M
,
��M N
INopFileProvider
��O _
fileProvider
��` l
)
��l m
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
assemblyFile
��% 1
)
��1 2
||
��3 5
string
��6 <
.
��< =

��= J
(
��J K
fileProvider
��K W
.
��W X 
GetParentDirectory
��X j
(
��j k
assemblyFile
��k w
)
��w x
)
��x y
)
��y z
{
�� 
throw
�� 
new
�� '
InvalidOperationException
�� 3
(
��3 4
$"
��4 6
$str
��6 S
{
��S T
fileProvider
��T `
.
��` a
GetFileName
��a l
(
��l m
assemblyFile
��m y
)
��y z
}
��z {
$str��{ �
"��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
!
�� 
config
�� 
.
�� "
UsePluginsShadowCopy
�� ,
)
��, -
{
�� 
var
�� 
assembly
�� 
=
�� !
AddApplicationParts
�� 2
(
��2 3$
applicationPartManager
��3 I
,
��I J
assemblyFile
��K W
,
��W X
config
��Y _
.
��_ `#
UseUnsafeLoadAssembly
��` u
)
��u v
;
��v w
if
�� 
(
�� 
assemblyFile
��  
.
��  !
EndsWith
��! )
(
��) *
$str
��* 0
)
��0 1
)
��1 2
{
�� 

�� !
.
��! "

DeleteFile
��" ,
(
��, -
assemblyFile
��- 9
.
��9 :
	Substring
��: C
(
��C D
$num
��D E
,
��E F
assemblyFile
��G S
.
��S T
Length
��T Z
-
��[ \
$num
��] ^
)
��^ _
+
��` a
$str
��b n
)
��n o
;
��o p
}
�� 
return
�� 
assembly
�� 
;
��  
}
�� 
fileProvider
�� 
.
�� 
CreateDirectory
�� (
(
��( )!
shadowCopyDirectory
��) <
)
��< =
;
��= >
var
�� 
shadowCopiedFile
��  
=
��! "
ShadowCopyFile
��# 1
(
��1 2
fileProvider
��2 >
,
��> ?
assemblyFile
��@ L
,
��L M!
shadowCopyDirectory
��N a
)
��a b
;
��b c
Assembly
�� "
shadowCopiedAssembly
�� )
=
��* +
null
��, 0
;
��0 1
try
�� 
{
�� 
shadowCopiedAssembly
�� $
=
��% &!
AddApplicationParts
��' :
(
��: ;$
applicationPartManager
��; Q
,
��Q R
shadowCopiedFile
��S c
,
��c d
config
��e k
.
��k l$
UseUnsafeLoadAssembly��l �
)��� �
;��� �
}
�� 
catch
�� 
(
�� )
UnauthorizedAccessException
�� .
)
��. /
{
�� 
if
�� 
(
�� 
!
�� 
config
�� 
.
�� A
3CopyLockedPluginAssembilesToSubdirectoriesOnStartup
�� O
||
��P R
!
�� !
shadowCopyDirectory
�� (
.
��( )
Equals
��) /
(
��/ 0
fileProvider
��0 <
.
��< =
MapPath
��= D
(
��D E
NopPluginDefaults
��E V
.
��V W
ShadowCopyPath
��W e
)
��e f
)
��f g
)
��g h
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
catch
�� 
(
�� 
FileLoadException
�� $
)
��$ %
{
�� 
if
�� 
(
�� 
!
�� 
config
�� 
.
�� A
3CopyLockedPluginAssembilesToSubdirectoriesOnStartup
�� O
||
��P R
!
�� !
shadowCopyDirectory
�� (
.
��( )
Equals
��) /
(
��/ 0
fileProvider
��0 <
.
��< =
MapPath
��= D
(
��D E
NopPluginDefaults
��E V
.
��V W
ShadowCopyPath
��W e
)
��e f
)
��f g
)
��g h
{
�� 
throw
�� 
;
�� 
}
�� 
}
�� 
if
�� 
(
�� "
shadowCopiedAssembly
�� $
!=
��% '
null
��( ,
)
��, -
return
�� "
shadowCopiedAssembly
�� +
;
��+ ,
var
�� 
reserveDirectory
��  
=
��! "
fileProvider
��# /
.
��/ 0
Combine
��0 7
(
��7 8
fileProvider
��8 D
.
��D E
MapPath
��E L
(
��L M
NopPluginDefaults
��M ^
.
��^ _
ShadowCopyPath
��_ m
)
��m n
,
��n o
$"
�� 
{
�� 
NopPluginDefaults
�� $
.
��$ %'
ReserveShadowCopyPathName
��% >
}
��> ?
{
��? @
DateTime
��@ H
.
��H I
Now
��I L
.
��L M

��M Z
(
��Z [
)
��[ \
}
��\ ]
"
��] ^
)
��^ _
;
��_ `
return
�� 
PerformFileDeploy
�� $
(
��$ %$
applicationPartManager
��% ;
,
��; <
assemblyFile
��= I
,
��I J
reserveDirectory
��K [
,
��[ \
config
��] c
,
��c d
fileProvider
��e q
)
��q r
;
��r s
}
�� 	
private
�� 
static
�� 
IList
�� 
<
�� 
(
�� 
string
�� $
DescriptionFile
��% 4
,
��4 5
PluginDescriptor
��6 F
PluginDescriptor
��G W
)
��W X
>
��X Y/
!GetDescriptionFilesAndDescriptors
��Z {
(
��{ |
string��| �

)��� �
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %

��% 2
)
��2 3
)
��3 4
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7

��7 D
)
��D E
)
��E F
;
��F G
var
�� 
result
�� 
=
�� 
new
�� 
List
�� !
<
��! "
(
��" #
string
��# )
DescriptionFile
��* 9
,
��9 :
PluginDescriptor
��; K
PluginDescriptor
��L \
)
��\ ]
>
��] ^
(
��^ _
)
��_ `
;
��` a
var
�� 
files
�� 
=
�� 

�� %
.
��% &
GetFiles
��& .
(
��. /

��/ <
,
��< =
NopPluginDefaults
��> O
.
��O P!
DescriptionFileName
��P c
,
��c d
false
��e j
)
��j k
;
��k l
foreach
�� 
(
�� 
var
�� 
descriptionFile
�� (
in
��) +
files
��, 1
)
��1 2
{
�� 
if
�� 
(
�� 
!
�� 
IsPluginDirectory
�� &
(
��& '

��' 4
.
��4 5
GetDirectoryName
��5 E
(
��E F
descriptionFile
��F U
)
��U V
)
��V W
)
��W X
continue
�� 
;
�� 
var
�� 
text
�� 
=
�� 

�� (
.
��( )
ReadAllText
��) 4
(
��4 5
descriptionFile
��5 D
,
��D E
Encoding
��F N
.
��N O
UTF8
��O S
)
��S T
;
��T U
var
�� 
pluginDescriptor
�� $
=
��% &
PluginDescriptor
��' 7
.
��7 8)
GetPluginDescriptorFromText
��8 S
(
��S T
text
��T X
)
��X Y
;
��Y Z
result
�� 
.
�� 
Add
�� 
(
�� 
(
�� 
descriptionFile
�� +
,
��+ ,
pluginDescriptor
��- =
)
��= >
)
��> ?
;
��? @
}
�� 
result
�� 
=
�� 
result
�� 
.
�� 
OrderBy
�� #
(
��# $
item
��$ (
=>
��) +
item
��, 0
.
��0 1
PluginDescriptor
��1 A
.
��A B
DisplayOrder
��B N
)
��N O
.
��O P
ToList
��P V
(
��V W
)
��W X
;
��X Y
return
�� 
result
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
bool
�� 
IsAlreadyLoaded
�� +
(
��+ ,
string
��, 2
filePath
��3 ;
,
��; <
string
��= C

pluginName
��D N
)
��N O
{
�� 	
var
�� 
fileName
�� 
=
�� 

�� (
.
��( )
GetFileName
��) 4
(
��4 5
filePath
��5 =
)
��= >
;
��> ?
if
�� 
(
�� 
_baseAppLibraries
�� !
.
��! "
Any
��" %
(
��% &
library
��& -
=>
��. 0
library
��1 8
.
��8 9
Equals
��9 ?
(
��? @
fileName
��@ H
,
��H I
StringComparison
��J Z
.
��Z [(
InvariantCultureIgnoreCase
��[ u
)
��u v
)
��v w
)
��w x
return
�� 
true
�� 
;
�� 
try
�� 
{
�� 
var
�� &
fileNameWithoutExtension
�� ,
=
��- .

��/ <
.
��< =)
GetFileNameWithoutExtension
��= X
(
��X Y
filePath
��Y a
)
��a b
;
��b c
if
�� 
(
�� 
string
�� 
.
�� 

�� (
(
��( )&
fileNameWithoutExtension
��) A
)
��A B
)
��B C
throw
�� 
new
�� 
	Exception
�� '
(
��' (
$"
��( *
$str
��* H
{
��H I
fileName
��I Q
}
��Q R
"
��R S
)
��S T
;
��T U
foreach
�� 
(
�� 
var
�� 
assembly
�� %
in
��& (
	AppDomain
��) 2
.
��2 3

��3 @
.
��@ A

��A N
(
��N O
)
��O P
)
��P Q
{
�� 
var
�� 
assemblyName
�� $
=
��% &
assembly
��' /
.
��/ 0
FullName
��0 8
.
��8 9
Split
��9 >
(
��> ?
$char
��? B
)
��B C
.
��C D
FirstOrDefault
��D R
(
��R S
)
��S T
;
��T U
if
�� 
(
�� 
!
�� &
fileNameWithoutExtension
�� 1
.
��1 2
Equals
��2 8
(
��8 9
assemblyName
��9 E
,
��E F
StringComparison
��G W
.
��W X(
InvariantCultureIgnoreCase
��X r
)
��r s
)
��s t
continue
��  
;
��  !
if
�� 
(
�� 
!
�� 
_loadedAssemblies
�� *
.
��* +
ContainsKey
��+ 6
(
��6 7
assemblyName
��7 C
)
��C D
)
��D E
{
�� 
_loadedAssemblies
�� )
.
��) *
Add
��* -
(
��- .
assemblyName
��. :
,
��: ;
new
��< ?&
PluginLoadedAssemblyInfo
��@ X
(
��X Y
assemblyName
��Y e
,
��e f
assembly
��g o
.
��o p
FullName
��p x
)
��x y
)
��y z
;
��z {
}
�� 
_loadedAssemblies
�� %
[
��% &
assemblyName
��& 2
]
��2 3
.
��3 4

References
��4 >
.
��> ?
Add
��? B
(
��B C
(
��C D

pluginName
��D N
,
��N O
AssemblyName
��P \
.
��\ ]
GetAssemblyName
��] l
(
��l m
filePath
��m u
)
��u v
.
��v w
FullName
��w 
)�� �
)��� �
;��� �
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
catch
�� 
{
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
bool
�� 
IsPluginDirectory
�� -
(
��- .
string
��. 4

��5 B
)
��B C
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %

��% 2
)
��2 3
)
��3 4
return
�� 
false
�� 
;
�� 
var
�� 
parent
�� 
=
�� 

�� &
.
��& ' 
GetParentDirectory
��' 9
(
��9 :

��: G
)
��G H
;
��H I
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
parent
��% +
)
��+ ,
)
��, -
return
�� 
false
�� 
;
�� 
if
�� 
(
�� 
!
�� 

�� 
.
�� "
GetDirectoryNameOnly
�� 3
(
��3 4
parent
��4 :
)
��: ;
.
��; <
Equals
��< B
(
��B C
NopPluginDefaults
��C T
.
��T U
PathName
��U ]
,
��] ^
StringComparison
��_ o
.
��o p)
InvariantCultureIgnoreCase��p �
)��� �
)��� �
return
�� 
false
�� 
;
�� 
return
�� 
true
�� 
;
�� 
}
�� 	
private
�� 
static
�� 
void
�� 
LoadPluginsInfo
�� +
(
��+ ,
	NopConfig
��, 5
config
��6 <
)
��< =
{
�� 	
var
�� (
useRedisToStorePluginsInfo
�� *
=
��+ ,
config
��- 3
.
��3 4
RedisEnabled
��4 @
&&
��A C
config
��D J
.
��J K(
UseRedisToStorePluginsInfo
��K e
;
��e f
PluginsInfo
�� 
=
�� (
useRedisToStorePluginsInfo
�� 4
?
�� 
new
�� 
RedisPluginsInfo
�� &
(
��& '

��' 4
,
��4 5
new
��6 9$
RedisConnectionWrapper
��: P
(
��P Q
config
��Q W
)
��W X
,
��X Y
config
��Z `
)
��` a
:
�� 
new
�� 
PluginsInfo
�� !
(
��! "

��" /
)
��/ 0
;
��0 1
if
�� 
(
�� 
PluginsInfo
�� 
.
�� 
LoadPluginInfo
�� *
(
��* +
)
��+ ,
||
��- /(
useRedisToStorePluginsInfo
��0 J
||
��K M
!
��N O
config
��O U
.
��U V
RedisEnabled
��V b
)
��b c
return
�� 
;
�� 
var
�� 
redisPluginsInfo
��  
=
��! "
new
��# &
RedisPluginsInfo
��' 7
(
��7 8

��8 E
,
��E F
new
��G J$
RedisConnectionWrapper
��K a
(
��a b
config
��b h
)
��h i
,
��i j
config
��k q
)
��q r
;
��r s
if
�� 
(
�� 
!
�� 
redisPluginsInfo
�� !
.
��! "
LoadPluginInfo
��" 0
(
��0 1
)
��1 2
)
��2 3
return
�� 
;
�� 
PluginsInfo
�� 
.
�� 
CopyFrom
��  
(
��  !
redisPluginsInfo
��! 1
)
��1 2
;
��2 3
PluginsInfo
�� 
.
�� 
Save
�� 
(
�� 
)
�� 
;
�� 
redisPluginsInfo
�� 
=
�� 
new
�� "
RedisPluginsInfo
��# 3
(
��3 4

��4 A
,
��A B
new
��C F$
RedisConnectionWrapper
��G ]
(
��] ^
config
��^ d
)
��d e
,
��e f
config
��g m
)
��m n
;
��n o
redisPluginsInfo
�� 
.
�� 
Save
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
static
�� 
void
�� 
InitializePlugins
�� ,
(
��, -
this
��- 1$
ApplicationPartManager
��2 H$
applicationPartManager
��I _
,
��_ `
	NopConfig
��a j
config
��k q
)
��q r
{
�� 	
if
�� 
(
�� $
applicationPartManager
�� &
==
��' )
null
��* .
)
��. /
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7$
applicationPartManager
��7 M
)
��M N
)
��N O
;
��O P
if
�� 
(
�� 
config
�� 
==
�� 
null
�� 
)
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
config
��7 =
)
��= >
)
��> ?
;
��? @
LoadPluginsInfo
�� 
(
�� 
config
�� "
)
��" #
;
��# $
using
�� 
(
�� 
new
�� '
ReaderWriteLockDisposable
�� 0
(
��0 1
_locker
��1 8
)
��8 9
)
��9 :
{
�� 
var
�� 
pluginDescriptors
�� %
=
��& '
new
��( +
List
��, 0
<
��0 1
PluginDescriptor
��1 A
>
��A B
(
��B C
)
��C D
;
��D E
var
�� !
incompatiblePlugins
�� '
=
��( )
new
��* -
List
��. 2
<
��2 3
string
��3 9
>
��9 :
(
��: ;
)
��; <
;
��< =
try
�� 
{
�� 
var
�� 
pluginsDirectory
�� (
=
��) *

��+ 8
.
��8 9
MapPath
��9 @
(
��@ A
NopPluginDefaults
��A R
.
��R S
Path
��S W
)
��W X
;
��X Y

�� !
.
��! "
CreateDirectory
��" 1
(
��1 2
pluginsDirectory
��2 B
)
��B C
;
��C D
var
�� !
shadowCopyDirectory
�� +
=
��, -

��. ;
.
��; <
MapPath
��< C
(
��C D
NopPluginDefaults
��D U
.
��U V
ShadowCopyPath
��V d
)
��d e
;
��e f

�� !
.
��! "
CreateDirectory
��" 1
(
��1 2!
shadowCopyDirectory
��2 E
)
��E F
;
��F G
var
�� 
binFiles
��  
=
��! "

��# 0
.
��0 1
GetFiles
��1 9
(
��9 :!
shadowCopyDirectory
��: M
,
��M N
$str
��O R
,
��R S
false
��T Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
config
�� 
.
�� 1
#ClearPluginShadowDirectoryOnStartup
�� B
)
��B C
{
�� 
var
�� "
placeholderFileNames
�� 0
=
��1 2
new
��3 6
List
��7 ;
<
��; <
string
��< B
>
��B C
{
��D E
$str
��F W
,
��W X
$str
��Y d
}
��e f
;
��f g
binFiles
��  
=
��! "
binFiles
��# +
.
��+ ,
Where
��, 1
(
��1 2
file
��2 6
=>
��7 9
{
�� 
var
�� 
fileName
��  (
=
��) *

��+ 8
.
��8 9
GetFileName
��9 D
(
��D E
file
��E I
)
��I J
;
��J K
return
�� "
!
��# $"
placeholderFileNames
��$ 8
.
��8 9
Any
��9 <
(
��< =!
placeholderFileName
��= P
=>
��Q S!
placeholderFileName
��T g
.
��  !
Equals
��! '
(
��' (
fileName
��( 0
,
��0 1
StringComparison
��2 B
.
��B C(
InvariantCultureIgnoreCase
��C ]
)
��] ^
)
��^ _
;
��_ `
}
�� 
)
�� 
.
�� 
ToArray
�� "
(
��" #
)
��# $
;
��$ %
foreach
�� 
(
��  !
var
��! $
file
��% )
in
��* ,
binFiles
��- 5
)
��5 6
{
�� 
try
�� 
{
�� 

��  -
.
��- .

DeleteFile
��. 8
(
��8 9
file
��9 =
)
��= >
;
��> ?
}
�� 
catch
�� !
{
�� 
}
�� 
}
�� 
var
��  
reserveDirectories
�� .
=
��/ 0

��1 >
.
�� 
GetDirectories
�� +
(
��+ ,!
shadowCopyDirectory
��, ?
,
��? @
NopPluginDefaults
��A R
.
��R S.
 ReserveShadowCopyPathNamePattern
��S s
)
��s t
;
��t u
foreach
�� 
(
��  !
var
��! $
	directory
��% .
in
��/ 1 
reserveDirectories
��2 D
)
��D E
{
�� 
try
�� 
{
�� 

��  -
.
��- .
DeleteDirectory
��. =
(
��= >
	directory
��> G
)
��G H
;
��H I
}
�� 
catch
�� !
{
�� 
}
�� 
}
�� 
}
�� 
foreach
�� 
(
�� 
var
��  
item
��! %
in
��& (/
!GetDescriptionFilesAndDescriptors
��) J
(
��J K
pluginsDirectory
��K [
)
��[ \
)
��\ ]
{
�� 
var
�� 
descriptionFile
�� +
=
��, -
item
��. 2
.
��2 3
DescriptionFile
��3 B
;
��B C
var
�� 
pluginDescriptor
�� ,
=
��- .
item
��/ 3
.
��3 4
PluginDescriptor
��4 D
;
��D E
if
�� 
(
�� 
!
�� 
pluginDescriptor
�� -
.
��- .
SupportedVersions
��. ?
.
��? @
Contains
��@ H
(
��H I

NopVersion
��I S
.
��S T
CurrentVersion
��T b
,
��b c
StringComparer
��d r
.
��r s)
InvariantCultureIgnoreCase��s �
)��� �
)��� �
{
�� !
incompatiblePlugins
�� /
.
��/ 0
Add
��0 3
(
��3 4
pluginDescriptor
��4 D
.
��D E

SystemName
��E O
)
��O P
;
��P Q
continue
�� $
;
��$ %
}
�� 
if
�� 
(
�� 
string
�� "
.
��" #

��# 0
(
��0 1
pluginDescriptor
��1 A
.
��A B

SystemName
��B L
?
��L M
.
��M N
Trim
��N R
(
��R S
)
��S T
)
��T U
)
��U V
{
�� 
throw
�� !
new
��" %
	Exception
��& /
(
��/ 0
$"
��0 2
$str
��2 <
{
��< =
descriptionFile
��= L
}
��L M
$str��M �
"��� �
)��� �
;��� �
}
�� 
if
�� 
(
�� 
pluginDescriptors
�� -
.
��- .
Contains
��. 6
(
��6 7
pluginDescriptor
��7 G
)
��G H
)
��H I
throw
�� !
new
��" %
	Exception
��& /
(
��/ 0
$"
��0 2
$str
��2 A
{
��A B
pluginDescriptor
��B R
.
��R S

SystemName
��S ]
}
��] ^
$str
��^ ~
"
��~ 
)�� �
;��� �
pluginDescriptor
�� (
.
��( )
	Installed
��) 2
=
��3 4
PluginsInfo
��5 @
.
��@ A"
InstalledPluginNames
��A U
.
�� 
Any
��  
(
��  !

pluginName
��! +
=>
��, .

pluginName
��/ 9
.
��9 :
Equals
��: @
(
��@ A
pluginDescriptor
��A Q
.
��Q R

SystemName
��R \
,
��\ ]
StringComparison
��^ n
.
��n o)
InvariantCultureIgnoreCase��o �
)��� �
)��� �
;��� �
try
�� 
{
�� 
var
�� 
pluginDirectory
��  /
=
��0 1

��2 ?
.
��? @
GetDirectoryName
��@ P
(
��P Q
descriptionFile
��Q `
)
��` a
;
��a b
if
�� 
(
��  
string
��  &
.
��& '

��' 4
(
��4 5
pluginDirectory
��5 D
)
��D E
)
��E F
{
�� 
throw
��  %
new
��& )
	Exception
��* 3
(
��3 4
$"
��4 6
$str
��6 X
{
��X Y

��Y f
.
��f g
GetFileName
��g r
(
��r s
descriptionFile��s �
)��� �
}��� �
$str��� �
"��� �
)��� �
;��� �
}
�� 
var
�� 
pluginFiles
��  +
=
��, -

��. ;
.
��; <
GetFiles
��< D
(
��D E
pluginDirectory
��E T
,
��T U
$str
��V ]
,
��] ^
false
��_ d
)
��d e
.
��  !
Where
��! &
(
��& '
file
��' +
=>
��, .
!
��/ 0
binFiles
��0 8
.
��8 9
Contains
��9 A
(
��A B
file
��B F
)
��F G
&&
��H J
IsPluginDirectory
��K \
(
��\ ]

��] j
.
��j k
GetDirectoryName
��k {
(
��{ |
file��| �
)��� �
)��� �
)��� �
.
��  !
ToList
��! '
(
��' (
)
��( )
;
��) *
var
�� 
mainPluginFile
��  .
=
��/ 0
pluginFiles
��1 <
.
��< =
FirstOrDefault
��= K
(
��K L
file
��L P
=>
��Q S
{
�� 
var
��  #
fileName
��$ ,
=
��- .

��/ <
.
��< =
GetFileName
��= H
(
��H I
file
��I M
)
��M N
;
��N O
return
��  &
fileName
��' /
.
��/ 0
Equals
��0 6
(
��6 7
pluginDescriptor
��7 G
.
��G H
AssemblyFileName
��H X
,
��X Y
StringComparison
��Z j
.
��j k)
InvariantCultureIgnoreCase��k �
)��� �
;��� �
}
�� 
)
�� 
;
�� 
if
�� 
(
��  
mainPluginFile
��  .
==
��/ 1
null
��2 6
)
��6 7
{
�� !
incompatiblePlugins
��  3
.
��3 4
Add
��4 7
(
��7 8
pluginDescriptor
��8 H
.
��H I

SystemName
��I S
)
��S T
;
��T U
continue
��  (
;
��( )
}
�� 
var
�� 

pluginName
��  *
=
��+ ,
pluginDescriptor
��- =
.
��= >

SystemName
��> H
;
��H I
pluginDescriptor
�� ,
.
��, -"
OriginalAssemblyFile
��- A
=
��B C
mainPluginFile
��D R
;
��R S
var
�� 
needToDeploy
��  ,
=
��- .
PluginsInfo
��/ :
.
��: ;"
InstalledPluginNames
��; O
.
��O P
Contains
��P X
(
��X Y

pluginName
��Y c
)
��c d
;
��d e
needToDeploy
�� (
=
��) *
needToDeploy
��+ 7
||
��8 :
PluginsInfo
��; F
.
��F G"
PluginNamesToInstall
��G [
.
��[ \
Any
��\ _
(
��_ `

pluginInfo
��` j
=>
��k m

pluginInfo
��n x
.
��x y

SystemName��y �
.��� �
Equals��� �
(��� �

pluginName��� �
)��� �
)��� �
;��� �
needToDeploy
�� (
=
��) *
needToDeploy
��+ 7
&&
��8 :
!
��; <
PluginsInfo
��< G
.
��G H!
PluginNamesToDelete
��H [
.
��[ \
Contains
��\ d
(
��d e

pluginName
��e o
)
��o p
;
��p q
if
�� 
(
��  
needToDeploy
��  ,
)
��, -
{
�� 
pluginDescriptor
��  0
.
��0 1 
ReferencedAssembly
��1 C
=
��D E$
applicationPartManager
��F \
.
��\ ]
PerformFileDeploy
��] n
(
��n o
mainPluginFile
��o }
,
��} ~"
shadowCopyDirectory�� �
,��� �
config��� �
,��� �

)��� �
;��� �
var
��  #

��$ 1
=
��2 3
pluginFiles
��4 ?
.
��? @
Where
��@ E
(
��E F
file
��F J
=>
��K M
!
��$ %

��% 2
.
��2 3
GetFileName
��3 >
(
��> ?
file
��? C
)
��C D
.
��D E
Equals
��E K
(
��K L

��L Y
.
��Y Z
GetFileName
��Z e
(
��e f
mainPluginFile
��f t
)
��t u
)
��u v
&&
��w y
!
��$ %
IsAlreadyLoaded
��% 4
(
��4 5
file
��5 9
,
��9 :

pluginName
��; E
)
��E F
)
��F G
.
��G H
ToList
��H N
(
��N O
)
��O P
;
��P Q
foreach
��  '
(
��( )
var
��) ,
file
��- 1
in
��2 4

��5 B
)
��B C
{
��  !$
applicationPartManager
��$ :
.
��: ;
PerformFileDeploy
��; L
(
��L M
file
��M Q
,
��Q R!
shadowCopyDirectory
��S f
,
��f g
config
��h n
,
��n o

��p }
)
��} ~
;
��~ 
}
��  !
var
��  #

pluginType
��$ .
=
��/ 0
pluginDescriptor
��1 A
.
��A B 
ReferencedAssembly
��B T
.
��T U
GetTypes
��U ]
(
��] ^
)
��^ _
.
��_ `
FirstOrDefault
��` n
(
��n o
type
��o s
=>
��t v
typeof
��$ *
(
��* +
IPlugin
��+ 2
)
��2 3
.
��3 4
IsAssignableFrom
��4 D
(
��D E
type
��E I
)
��I J
&&
��K M
!
��N O
type
��O S
.
��S T
IsInterface
��T _
&&
��` b
type
��c g
.
��g h
IsClass
��h o
&&
��p r
!
��s t
type
��t x
.
��x y

IsAbstract��y �
)��� �
;��� �
if
��  "
(
��# $

pluginType
��$ .
!=
��/ 1
default
��2 9
(
��9 :
Type
��: >
)
��> ?
)
��? @
pluginDescriptor
��$ 4
.
��4 5

PluginType
��5 ?
=
��@ A

pluginType
��B L
;
��L M
}
�� 
if
�� 
(
��  
PluginsInfo
��  +
.
��+ ,!
PluginNamesToDelete
��, ?
.
��? @
Contains
��@ H
(
��H I

pluginName
��I S
)
��S T
)
��T U
continue
��  (
;
��( )
pluginDescriptors
�� -
.
��- .
Add
��. 1
(
��1 2
pluginDescriptor
��2 B
)
��B C
;
��C D
}
�� 
catch
�� 
(
�� )
ReflectionTypeLoadException
�� :
	exception
��; D
)
��D E
{
�� 
var
�� 
error
��  %
=
��& '
	exception
��( 1
.
��1 2
LoaderExceptions
��2 B
.
��B C
	Aggregate
��C L
(
��L M
$"
��M O
$str
��O W
{
��W X
pluginDescriptor
��X h
.
��h i
FriendlyName
��i u
}
��u v
$str
��v y
"
��y z
,
��z {
(
��  !
message
��! (
,
��( )
nextMessage
��* 5
)
��5 6
=>
��7 9
$"
��: <
{
��< =
message
��= D
}
��D E
{
��E F
nextMessage
��F Q
.
��Q R
Message
��R Y
}
��Y Z
{
��Z [
Environment
��[ f
.
��f g
NewLine
��g n
}
��n o
"
��o p
)
��p q
;
��q r
throw
�� !
new
��" %
	Exception
��& /
(
��/ 0
error
��0 5
,
��5 6
	exception
��7 @
)
��@ A
;
��A B
}
�� 
catch
�� 
(
�� 
	Exception
�� (
	exception
��) 2
)
��2 3
{
�� 
throw
�� !
new
��" %
	Exception
��& /
(
��/ 0
$"
��0 2
$str
��2 :
{
��: ;
pluginDescriptor
��; K
.
��K L
FriendlyName
��L X
}
��X Y
$str
��Y \
{
��\ ]
	exception
��] f
.
��f g
Message
��g n
}
��n o
"
��o p
,
��p q
	exception
��r {
)
��{ |
;
��| }
}
�� 
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
��  
	exception
��! *
)
��* +
{
�� 
var
�� 
message
�� 
=
��  !
string
��" (
.
��( )
Empty
��) .
;
��. /
for
�� 
(
�� 
var
�� 
inner
�� "
=
��# $
	exception
��% .
;
��. /
inner
��0 5
!=
��6 8
null
��9 =
;
��= >
inner
��? D
=
��E F
inner
��G L
.
��L M
InnerException
��M [
)
��[ \
message
�� 
=
��  !
$"
��" $
{
��$ %
message
��% ,
}
��, -
{
��- .
inner
��. 3
.
��3 4
Message
��4 ;
}
��; <
{
��< =
Environment
��= H
.
��H I
NewLine
��I P
}
��P Q
"
��Q R
;
��R S
throw
�� 
new
�� 
	Exception
�� '
(
��' (
message
��( /
,
��/ 0
	exception
��1 :
)
��: ;
;
��; <
}
�� 
PluginsInfo
�� 
.
�� 
PluginDescriptors
�� -
=
��. /
pluginDescriptors
��0 A
;
��A B
PluginsInfo
�� 
.
�� !
IncompatiblePlugins
�� /
=
��0 1!
incompatiblePlugins
��2 E
;
��E F
PluginsInfo
�� 
.
�� %
AssemblyLoadedCollision
�� 3
=
��4 5
_loadedAssemblies
��6 G
.
��G H
Select
��H N
(
��N O
item
��O S
=>
��T V
item
��W [
.
��[ \
Value
��\ a
)
��a b
.
�� 
Where
�� 
(
��  
loadedAssemblyInfo
�� -
=>
��. 0 
loadedAssemblyInfo
��1 C
.
��C D

Collisions
��D N
.
��N O
Any
��O R
(
��R S
)
��S T
)
��T U
.
��U V
ToList
��V \
(
��\ ]
)
��] ^
;
��^ _
}
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\Extensions\ContainerBuilderExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
.* +

Extensions+ 5
{ 
public 

static 
class &
ContainerBuilderExtensions 2
{ 
public 
static 
void %
RegisterPluginDataContext 4
<4 5
TContext5 =
>= >
(> ?
this? C
ContainerBuilderD T
builderU \
,\ ]
string^ d
contextNamee p
)p q
wherer w
TContext	x �
:
� �
	DbContext
� �
,
� �

IDbContext
� �
{ 	
builder 
. 
Register 
( 
context $
=>% '
(( )

IDbContext) 3
)3 4
	Activator4 =
.= >
CreateInstance> L
(L M
typeofM S
(S T
TContextT \
)\ ]
,] ^
new_ b
[b c
]c d
{e f
contextg n
.n o
Resolveo v
<v w
DbContextOptions	w �
<
� �
TContext
� �
>
� �
>
� �
(
� �
)
� �
}
� �
)
� �
)
� �
. 
Named 
< 

IDbContext !
>! "
(" #
contextName# .
). /
./ 0$
InstancePerLifetimeScope0 H
(H I
)I J
;J K
} 	
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\Extensions\DbContextOptionsBuilderExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
.* +

Extensions+ 5
{ 
public 

static 
class -
!DbContextOptionsBuilderExtensions 9
{ 
public 
static 
void '
UseSqlServerWithLazyLoading 6
(6 7
this7 ;#
DbContextOptionsBuilder< S
optionsBuilderT b
,b c
IServiceCollectiond v
servicesw 
)	 �
{ 	
var 
	nopConfig 
= 
services $
.$ % 
BuildServiceProvider% 9
(9 :
): ;
.; <
GetRequiredService< N
<N O
	NopConfigO X
>X Y
(Y Z
)Z [
;[ \
var 
dataSettings 
= 
DataSettingsManager 2
.2 3
LoadSettings3 ?
(? @
)@ A
;A B
if 
( 
! 
dataSettings 
? 
. 
IsValid &
??' )
true* .
). /
return 
; 
var #
dbContextOptionsBuilder '
=( )
optionsBuilder* 8
.8 9!
UseLazyLoadingProxies9 N
(N O
)O P
;P Q
if 
( 
	nopConfig 
. !
UseRowNumberForPaging /
)/ 0#
dbContextOptionsBuilder '
.' (
UseSqlServer( 4
(4 5
dataSettings5 A
.A B 
DataConnectionStringB V
,V W
optionX ^
=>_ a
optionb h
.h i!
UseRowNumberForPagingi ~
(~ 
)	 �
)
� �
;
� �
else #
dbContextOptionsBuilder '
.' (
UseSqlServer( 4
(4 5
dataSettings5 A
.A B 
DataConnectionStringB V
)V W
;W X
}   	
}!! 
}"" �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\Extensions\HttpClientBuilderExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
.* +

Extensions+ 5
{ 
public 

static 
class '
HttpClientBuilderExtensions 3
{
public 
static 
void 
	WithProxy $
($ %
this% )
IHttpClientBuilder* <
httpClientBuilder= N
)N O
{ 	
httpClientBuilder 
. .
"ConfigurePrimaryHttpMessageHandler @
(@ A
(A B
)B C
=>D F
{ 
var 
handler 
= 
new !
HttpClientHandler" 3
(3 4
)4 5
;5 6
var 

=" #

.1 2
Current2 9
.9 :
Resolve: A
<A B

>O P
(P Q
)Q R
;R S
if 
( 
! 

." #
Enabled# *
)* +
return 
handler "
;" #
var 
webProxy 
= 
new "
WebProxy# +
(+ ,
$", .
{. /

.< =
Address= D
}D E
$strE F
{F G

.T U
PortU Y
}Y Z
"Z [
,[ \

.j k

)x y
;y z
if 
( 
! 
string 
. 

() *

.7 8
Username8 @
)@ A
&&B D
!E F
stringF L
.L M

(Z [

.h i
Passwordi q
)q r
)r s
{   
webProxy!! 
.!! !
UseDefaultCredentials!! 2
=!!3 4
false!!5 :
;!!: ;
webProxy"" 
."" 
Credentials"" (
="") *
new""+ .
NetworkCredential""/ @
{## 
UserName$$  
=$$! "

.$$0 1
Username$$1 9
,$$9 :
Password%%  
=%%! "

.%%0 1
Password%%1 9
}&& 
;&& 
}'' 
else(( 
{)) 
webProxy** 
.** !
UseDefaultCredentials** 2
=**3 4
true**5 9
;**9 :
webProxy++ 
.++ 
Credentials++ (
=++) *
CredentialCache+++ :
.++: ;
DefaultCredentials++; M
;++M N
},, 
handler// 
.// !
UseDefaultCredentials// -
=//. /
webProxy//0 8
.//8 9!
UseDefaultCredentials//9 N
;//N O
handler00 
.00 
Proxy00 
=00 
webProxy00  (
;00( )
handler11 
.11 
PreAuthenticate11 '
=11( )

.117 8
PreAuthenticate118 G
;11G H
return33 
handler33 
;33 
}44 
)44
;44 
}55 	
}66 
}77 ��
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\Extensions\ServiceCollectionExtensions.cs
	namespace-- 	
Nop--
 
.--
Web-- 
.-- 
	Framework-- 
.-- 
Infrastructure-- *
.--* +

Extensions--+ 5
{.. 
public22 

static22 
class22 '
ServiceCollectionExtensions22 3
{33 
public;; 
static;; 
IServiceProvider;; &(
ConfigureApplicationServices;;' C
(;;C D
this;;D H
IServiceCollection;;I [
services;;\ d
,;;d e
IConfiguration<< 

,<<( )
IHostingEnvironment<<* =
hostingEnvironment<<> P
)<<P Q
{== 	
ServicePointManager?? 
.??  
SecurityProtocol??  0
=??1 2 
SecurityProtocolType??3 G
.??G H
Tls12??H M
;??M N
varBB 
	nopConfigBB 
=BB 
servicesBB $
.BB$ %"
ConfigureStartupConfigBB% ;
<BB; <
	NopConfigBB< E
>BBE F
(BBF G

.BBT U

GetSectionBBU _
(BB_ `
$strBB` e
)BBe f
)BBf g
;BBg h
servicesEE 
.EE "
ConfigureStartupConfigEE +
<EE+ ,

>EE9 :
(EE: ;

.EEH I

GetSectionEEI S
(EES T
$strEET ]
)EE] ^
)EE^ _
;EE_ `
servicesHH 
.HH "
AddHttpContextAccessorHH +
(HH+ ,
)HH, -
;HH- .
CommonHelperKK 
.KK 
DefaultFileProviderKK ,
=KK- .
newKK/ 2
NopFileProviderKK3 B
(KKB C
hostingEnvironmentKKC U
)KKU V
;KKV W
varNN 
mvcCoreBuilderNN 
=NN  
servicesNN! )
.NN) *

AddMvcCoreNN* 4
(NN4 5
)NN5 6
;NN6 7
mvcCoreBuilderOO 
.OO 
PartManagerOO &
.OO& '
InitializePluginsOO' 8
(OO8 9
	nopConfigOO9 B
)OOB C
;OOC D
varRR 
engineRR 
=RR 

.RR& '
CreateRR' -
(RR- .
)RR. /
;RR/ 0
varSS 
serviceProviderSS 
=SS  !
engineSS" (
.SS( )
ConfigureServicesSS) :
(SS: ;
servicesSS; C
,SSC D

,SSR S
	nopConfigSST ]
)SS] ^
;SS^ _
ifVV 
(VV 
!VV 
DataSettingsManagerVV $
.VV$ %
DatabaseIsInstalledVV% 8
)VV8 9
returnWW 
serviceProviderWW &
;WW& '
TaskManagerZZ 
.ZZ 
InstanceZZ  
.ZZ  !

InitializeZZ! +
(ZZ+ ,
)ZZ, -
;ZZ- .
TaskManager[[ 
.[[ 
Instance[[  
.[[  !
Start[[! &
([[& '
)[[' (
;[[( )
engine^^ 
.^^ 
Resolve^^ 
<^^ 
ILogger^^ "
>^^" #
(^^# $
)^^$ %
.^^% &
Information^^& 1
(^^1 2
$str^^2 G
)^^G H
;^^H I
engineaa 
.aa 
Resolveaa 
<aa 
IPluginServiceaa )
>aa) *
(aa* +
)aa+ ,
.aa, -
InstallPluginsaa- ;
(aa; <
)aa< =
;aa= >
returncc 
serviceProvidercc "
;cc" #
}dd 	
publicmm 
staticmm 
TConfigmm "
ConfigureStartupConfigmm 4
<mm4 5
TConfigmm5 <
>mm< =
(mm= >
thismm> B
IServiceCollectionmmC U
servicesmmV ^
,mm^ _
IConfigurationmm` n

)mm| }
where	mm~ �
TConfig
mm� �
:
mm� �
class
mm� �
,
mm� �
new
mm� �
(
mm� �
)
mm� �
{nn 	
ifoo 
(oo 
servicesoo 
==oo 
nulloo  
)oo  !
throwpp 
newpp !
ArgumentNullExceptionpp /
(pp/ 0
nameofpp0 6
(pp6 7
servicespp7 ?
)pp? @
)pp@ A
;ppA B
ifrr 
(rr 

==rr  
nullrr! %
)rr% &
throwss 
newss !
ArgumentNullExceptionss /
(ss/ 0
nameofss0 6
(ss6 7

)ssD E
)ssE F
;ssF G
varvv 
configvv 
=vv 
newvv 
TConfigvv $
(vv$ %
)vv% &
;vv& '

.yy 
Bindyy 
(yy 
configyy %
)yy% &
;yy& '
services|| 
.|| 
AddSingleton|| !
(||! "
config||" (
)||( )
;||) *
return~~ 
config~~ 
;~~ 
} 	
public
�� 
static
�� 
void
�� $
AddHttpContextAccessor
�� 1
(
��1 2
this
��2 6 
IServiceCollection
��7 I
services
��J R
)
��R S
{
�� 	
services
�� 
.
�� 
AddSingleton
�� !
<
��! ""
IHttpContextAccessor
��" 6
,
��6 7!
HttpContextAccessor
��8 K
>
��K L
(
��L M
)
��M N
;
��N O
}
�� 	
public
�� 
static
�� 
void
�� 
AddAntiForgery
�� )
(
��) *
this
��* . 
IServiceCollection
��/ A
services
��B J
)
��J K
{
�� 	
services
�� 
.
�� 
AddAntiforgery
�� #
(
��# $
options
��$ +
=>
��, .
{
�� 
options
�� 
.
�� 
Cookie
�� 
.
�� 
Name
�� #
=
��$ %
$"
��& (
{
��( )
NopCookieDefaults
��) :
.
��: ;
Prefix
��; A
}
��A B
{
��B C
NopCookieDefaults
��C T
.
��T U
AntiforgeryCookie
��U f
}
��f g
"
��g h
;
��h i
options
�� 
.
�� 
Cookie
�� 
.
�� 
SecurePolicy
�� +
=
��, -!
DataSettingsManager
��. A
.
��A B!
DatabaseIsInstalled
��B U
&&
��V X

��Y f
.
��f g
Current
��g n
.
��n o
Resolve
��o v
<
��v w
SecuritySettings��w �
>��� �
(��� �
)��� �
.��� �#
ForceSslForAllPages��� �
?
��  
CookieSecurePolicy
�� (
.
��( )

��) 6
:
��7 8 
CookieSecurePolicy
��9 K
.
��K L
None
��L P
;
��P Q
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� 
AddHttpSession
�� )
(
��) *
this
��* . 
IServiceCollection
��/ A
services
��B J
)
��J K
{
�� 	
services
�� 
.
�� 

AddSession
�� 
(
��  
options
��  '
=>
��( *
{
�� 
options
�� 
.
�� 
Cookie
�� 
.
�� 
Name
�� #
=
��$ %
$"
��& (
{
��( )
NopCookieDefaults
��) :
.
��: ;
Prefix
��; A
}
��A B
{
��B C
NopCookieDefaults
��C T
.
��T U

��U b
}
��b c
"
��c d
;
��d e
options
�� 
.
�� 
Cookie
�� 
.
�� 
HttpOnly
�� '
=
��( )
true
��* .
;
��. /
options
�� 
.
�� 
Cookie
�� 
.
�� 
SecurePolicy
�� +
=
��, -!
DataSettingsManager
��. A
.
��A B!
DatabaseIsInstalled
��B U
&&
��V X

��Y f
.
��f g
Current
��g n
.
��n o
Resolve
��o v
<
��v w
SecuritySettings��w �
>��� �
(��� �
)��� �
.��� �#
ForceSslForAllPages��� �
?
��  
CookieSecurePolicy
�� (
.
��( )

��) 6
:
��7 8 
CookieSecurePolicy
��9 K
.
��K L
None
��L P
;
��P Q
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� 
	AddThemes
�� $
(
��$ %
this
��% ) 
IServiceCollection
��* <
services
��= E
)
��E F
{
�� 	
if
�� 
(
�� 
!
�� !
DataSettingsManager
�� $
.
��$ %!
DatabaseIsInstalled
��% 8
)
��8 9
return
�� 
;
�� 
services
�� 
.
�� 
	Configure
�� 
<
�� $
RazorViewEngineOptions
�� 5
>
��5 6
(
��6 7
options
��7 >
=>
��? A
{
�� 
options
�� 
.
�� #
ViewLocationExpanders
�� -
.
��- .
Add
��. 1
(
��1 2
new
��2 5+
ThemeableViewLocationExpander
��6 S
(
��S T
)
��T U
)
��U V
;
��V W
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� "
AddNopDataProtection
�� /
(
��/ 0
this
��0 4 
IServiceCollection
��5 G
services
��H P
)
��P Q
{
�� 	
var
�� 
	nopConfig
�� 
=
�� 
services
�� $
.
��$ %"
BuildServiceProvider
��% 9
(
��9 :
)
��: ;
.
��; < 
GetRequiredService
��< N
<
��N O
	NopConfig
��O X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
if
�� 
(
�� 
	nopConfig
�� 
.
�� 
RedisEnabled
�� &
&&
��' )
	nopConfig
��* 3
.
��3 4/
!UseRedisToStoreDataProtectionKeys
��4 U
)
��U V
{
�� 
services
�� 
.
�� 
AddDataProtection
�� *
(
��* +
)
��+ ,
.
��, - 
PersistKeysToRedis
��- ?
(
��? @
(
��@ A
)
��A B
=>
��C E
{
�� 
var
�� $
redisConnectionWrapper
�� .
=
��/ 0

��1 >
.
��> ?
Current
��? F
.
��F G
Resolve
��G N
<
��N O%
IRedisConnectionWrapper
��O f
>
��f g
(
��g h
)
��h i
;
��i j
return
�� $
redisConnectionWrapper
�� 1
.
��1 2
GetDatabase
��2 =
(
��= >
	nopConfig
��> G
.
��G H
RedisDatabaseId
��H W
??
��X Z
(
��[ \
int
��\ _
)
��_ `!
RedisDatabaseNumber
��` s
.
��s t!
DataProtectionKeys��t �
)��� �
;��� �
}
�� 
,
��  
NopCachingDefaults
�� %
.
��% &$
RedisDataProtectionKey
��& <
)
��< =
;
��= >
}
�� 
else
�� 
{
�� 
var
�� $
dataProtectionKeysPath
�� *
=
��+ ,
CommonHelper
��- 9
.
��9 :!
DefaultFileProvider
��: M
.
��M N
MapPath
��N U
(
��U V
$str
��V u
)
��u v
;
��v w
var
�� &
dataProtectionKeysFolder
�� ,
=
��- .
new
��/ 2
System
��3 9
.
��9 :
IO
��: <
.
��< =

��= J
(
��J K$
dataProtectionKeysPath
��K a
)
��a b
;
��b c
services
�� 
.
�� 
AddDataProtection
�� *
(
��* +
)
��+ ,
.
��, -%
PersistKeysToFileSystem
��- D
(
��D E&
dataProtectionKeysFolder
��E ]
)
��] ^
;
��^ _
}
�� 
}
�� 	
public
�� 
static
�� 
void
�� "
AddNopAuthentication
�� /
(
��/ 0
this
��0 4 
IServiceCollection
��5 G
services
��H P
)
��P Q
{
�� 	
var
�� #
authenticationBuilder
�� %
=
��& '
services
��( 0
.
��0 1
AddAuthentication
��1 B
(
��B C
options
��C J
=>
��K M
{
�� 
options
�� 
.
�� $
DefaultChallengeScheme
�� .
=
��/ 0'
NopAuthenticationDefaults
��1 J
.
��J K"
AuthenticationScheme
��K _
;
��_ `
options
�� 
.
�� 

�� %
=
��& ''
NopAuthenticationDefaults
��( A
.
��A B"
AuthenticationScheme
��B V
;
��V W
options
�� 
.
�� !
DefaultSignInScheme
�� +
=
��, -'
NopAuthenticationDefaults
��. G
.
��G H*
ExternalAuthenticationScheme
��H d
;
��d e
}
�� 
)
��
;
�� #
authenticationBuilder
�� !
.
��! "
	AddCookie
��" +
(
��+ ,'
NopAuthenticationDefaults
��, E
.
��E F"
AuthenticationScheme
��F Z
,
��Z [
options
��\ c
=>
��d f
{
�� 
options
�� 
.
�� 
Cookie
�� 
.
�� 
Name
�� #
=
��$ %
$"
��& (
{
��( )
NopCookieDefaults
��) :
.
��: ;
Prefix
��; A
}
��A B
{
��B C
NopCookieDefaults
��C T
.
��T U"
AuthenticationCookie
��U i
}
��i j
"
��j k
;
��k l
options
�� 
.
�� 
Cookie
�� 
.
�� 
HttpOnly
�� '
=
��( )
true
��* .
;
��. /
options
�� 
.
�� 
	LoginPath
�� !
=
��" #'
NopAuthenticationDefaults
��$ =
.
��= >
	LoginPath
��> G
;
��G H
options
�� 
.
�� 
AccessDeniedPath
�� (
=
��) *'
NopAuthenticationDefaults
��+ D
.
��D E
AccessDeniedPath
��E U
;
��U V
options
�� 
.
�� 
Cookie
�� 
.
�� 
SecurePolicy
�� +
=
��, -!
DataSettingsManager
��. A
.
��A B!
DatabaseIsInstalled
��B U
&&
��V X

��Y f
.
��f g
Current
��g n
.
��n o
Resolve
��o v
<
��v w
SecuritySettings��w �
>��� �
(��� �
)��� �
.��� �#
ForceSslForAllPages��� �
?
��  
CookieSecurePolicy
�� (
.
��( )

��) 6
:
��7 8 
CookieSecurePolicy
��9 K
.
��K L
None
��L P
;
��P Q
}
�� 
)
��
;
�� #
authenticationBuilder
�� !
.
��! "
	AddCookie
��" +
(
��+ ,'
NopAuthenticationDefaults
��, E
.
��E F*
ExternalAuthenticationScheme
��F b
,
��b c
options
��d k
=>
��l n
{
�� 
options
�� 
.
�� 
Cookie
�� 
.
�� 
Name
�� #
=
��$ %
$"
��& (
{
��( )
NopCookieDefaults
��) :
.
��: ;
Prefix
��; A
}
��A B
{
��B C
NopCookieDefaults
��C T
.
��T U*
ExternalAuthenticationCookie
��U q
}
��q r
"
��r s
;
��s t
options
�� 
.
�� 
Cookie
�� 
.
�� 
HttpOnly
�� '
=
��( )
true
��* .
;
��. /
options
�� 
.
�� 
	LoginPath
�� !
=
��" #'
NopAuthenticationDefaults
��$ =
.
��= >
	LoginPath
��> G
;
��G H
options
�� 
.
�� 
AccessDeniedPath
�� (
=
��) *'
NopAuthenticationDefaults
��+ D
.
��D E
AccessDeniedPath
��E U
;
��U V
options
�� 
.
�� 
Cookie
�� 
.
�� 
SecurePolicy
�� +
=
��, -!
DataSettingsManager
��. A
.
��A B!
DatabaseIsInstalled
��B U
&&
��V X

��Y f
.
��f g
Current
��g n
.
��n o
Resolve
��o v
<
��v w
SecuritySettings��w �
>��� �
(��� �
)��� �
.��� �#
ForceSslForAllPages��� �
?
��  
CookieSecurePolicy
�� (
.
��( )

��) 6
:
��7 8 
CookieSecurePolicy
��9 K
.
��K L
None
��L P
;
��P Q
}
�� 
)
��
;
�� 
var
�� 

typeFinder
�� 
=
�� 
new
��  
WebAppTypeFinder
��! 1
(
��1 2
)
��2 3
;
��3 4
var
�� (
externalAuthConfigurations
�� *
=
��+ ,

typeFinder
��- 7
.
��7 8
FindClassesOfType
��8 I
<
��I J.
 IExternalAuthenticationRegistrar
��J j
>
��j k
(
��k l
)
��l m
;
��m n
var
�� #
externalAuthInstances
�� %
=
��& '(
externalAuthConfigurations
��( B
.
�� 
Select
�� 
(
�� 
x
�� 
=>
�� 
(
�� .
 IExternalAuthenticationRegistrar
�� >
)
��> ?
	Activator
��? H
.
��H I
CreateInstance
��I W
(
��W X
x
��X Y
)
��Y Z
)
��Z [
;
��[ \
foreach
�� 
(
�� 
var
�� 
instance
�� !
in
��" $#
externalAuthInstances
��% :
)
��: ;
instance
�� 
.
�� 
	Configure
�� "
(
��" ##
authenticationBuilder
��# 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
static
�� 
IMvcBuilder
�� !
	AddNopMvc
��" +
(
��+ ,
this
��, 0 
IServiceCollection
��1 C
services
��D L
)
��L M
{
�� 	
var
�� 

mvcBuilder
�� 
=
�� 
services
�� %
.
��% &
AddMvc
��& ,
(
��, -
)
��- .
;
��. /

mvcBuilder
�� 
.
�� 

�� $
(
��$ %
options
��% ,
=>
��- /
options
��0 7
.
��7 8#
EnableEndpointRouting
��8 M
=
��N O
false
��P U
)
��U V
;
��V W

mvcBuilder
�� 
.
�� %
SetCompatibilityVersion
�� .
(
��. /"
CompatibilityVersion
��/ C
.
��C D
Version_2_2
��D O
)
��O P
;
��P Q
var
�� 
	nopConfig
�� 
=
�� 
services
�� $
.
��$ %"
BuildServiceProvider
��% 9
(
��9 :
)
��: ;
.
��; < 
GetRequiredService
��< N
<
��N O
	NopConfig
��O X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
if
�� 
(
�� 
	nopConfig
�� 
.
�� -
UseSessionStateTempDataProvider
�� 9
)
��9 :
{
�� 

mvcBuilder
�� 
.
�� -
AddSessionStateTempDataProvider
�� :
(
��: ;
)
��; <
;
��< =
}
�� 
else
�� 
{
�� 

mvcBuilder
�� 
.
�� '
AddCookieTempDataProvider
�� 4
(
��4 5
options
��5 <
=>
��= ?
{
�� 
options
�� 
.
�� 
Cookie
�� "
.
��" #
Name
��# '
=
��( )
$"
��* ,
{
��, -
NopCookieDefaults
��- >
.
��> ?
Prefix
��? E
}
��E F
{
��F G
NopCookieDefaults
��G X
.
��X Y
TempDataCookie
��Y g
}
��g h
"
��h i
;
��i j
options
�� 
.
�� 
Cookie
�� "
.
��" #
SecurePolicy
��# /
=
��0 1!
DataSettingsManager
��2 E
.
��E F!
DatabaseIsInstalled
��F Y
&&
��Z \

��] j
.
��j k
Current
��k r
.
��r s
Resolve
��s z
<
��z {
SecuritySettings��{ �
>��� �
(��� �
)��� �
.��� �#
ForceSslForAllPages��� �
?
��  
CookieSecurePolicy
�� ,
.
��, -

��- :
:
��; < 
CookieSecurePolicy
��= O
.
��O P
None
��P T
;
��T U
}
�� 
)
�� 
;
�� 
}
�� 

mvcBuilder
�� 
.
�� 
AddJsonOptions
�� %
(
��% &
options
��& -
=>
��. 0
options
��1 8
.
��8 9 
SerializerSettings
��9 K
.
��K L
ContractResolver
��L \
=
��] ^
new
��_ b%
DefaultContractResolver
��c z
(
��z {
)
��{ |
)
��| }
;
��} ~

mvcBuilder
�� 
.
�� 

�� $
(
��$ %
options
��% ,
=>
��- /
options
��0 7
.
��7 8+
ModelMetadataDetailsProviders
��8 U
.
��U V
Add
��V Y
(
��Y Z
new
��Z ]!
NopMetadataProvider
��^ q
(
��q r
)
��r s
)
��s t
)
��t u
;
��u v

mvcBuilder
�� 
.
�� 

�� $
(
��$ %
options
��% ,
=>
��- /
options
��0 7
.
��7 8"
ModelBinderProviders
��8 L
.
��L M
Insert
��M S
(
��S T
$num
��T U
,
��U V
new
��W Z$
NopModelBinderProvider
��[ q
(
��q r
)
��r s
)
��s t
)
��t u
;
��u v

mvcBuilder
�� 
.
�� !
AddFluentValidation
�� *
(
��* +

��+ 8
=>
��9 ;
{
�� 
var
�� 

assemblies
�� 
=
��  

mvcBuilder
��! +
.
��+ ,
PartManager
��, 7
.
��7 8
ApplicationParts
��8 H
.
�� 
OfType
�� 
<
�� 
AssemblyPart
�� (
>
��( )
(
��) *
)
��* +
.
�� 
Where
�� 
(
�� 
part
�� 
=>
��  "
part
��# '
.
��' (
Name
��( ,
.
��, -

StartsWith
��- 7
(
��7 8
$str
��8 =
,
��= >
StringComparison
��? O
.
��O P(
InvariantCultureIgnoreCase
��P j
)
��j k
)
��k l
.
�� 
Select
�� 
(
�� 
part
��  
=>
��! #
part
��$ (
.
��( )
Assembly
��) 1
)
��1 2
;
��2 3

�� 
.
�� .
 RegisterValidatorsFromAssemblies
�� >
(
��> ?

assemblies
��? I
)
��I J
;
��J K

�� 
.
�� /
!ImplicitlyValidateChildProperties
�� ?
=
��@ A
true
��B F
;
��F G
}
�� 
)
��
;
�� 

mvcBuilder
�� 
.
�� &
AddControllersAsServices
�� /
(
��/ 0
)
��0 1
;
��1 2
return
�� 

mvcBuilder
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� *
AddNopRedirectResultExecutor
�� 7
(
��7 8
this
��8 < 
IServiceCollection
��= O
services
��P X
)
��X Y
{
�� 	
services
�� 
.
�� 
AddSingleton
�� !
<
��! "#
IActionResultExecutor
��" 7
<
��7 8
RedirectResult
��8 F
>
��F G
,
��G H'
NopRedirectResultExecutor
��I b
>
��b c
(
��c d
)
��d e
;
��e f
}
�� 	
public
�� 
static
�� 
void
�� !
AddNopObjectContext
�� .
(
��. /
this
��/ 3 
IServiceCollection
��4 F
services
��G O
)
��O P
{
�� 	
services
�� 
.
�� 
AddDbContextPool
�� %
<
��% &
NopObjectContext
��& 6
>
��6 7
(
��7 8
optionsBuilder
��8 F
=>
��G I
{
�� 
optionsBuilder
�� 
.
�� )
UseSqlServerWithLazyLoading
�� :
(
��: ;
services
��; C
)
��C D
;
��D E
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
void
��  
AddNopMiniProfiler
�� -
(
��- .
this
��. 2 
IServiceCollection
��3 E
services
��F N
)
��N O
{
�� 	
if
�� 
(
�� 
!
�� !
DataSettingsManager
�� $
.
��$ %!
DatabaseIsInstalled
��% 8
)
��8 9
return
�� 
;
�� 
services
�� 
.
�� 
AddMiniProfiler
�� $
(
��$ %!
miniProfilerOptions
��% 8
=>
��9 ;
{
�� 
(
�� 
(
��  
MemoryCacheStorage
�� $
)
��$ %!
miniProfilerOptions
��% 8
.
��8 9
Storage
��9 @
)
��@ A
.
��A B

��B O
=
��P Q
TimeSpan
��R Z
.
��Z [
FromMinutes
��[ f
(
��f g
$num
��g i
)
��i j
;
��j k!
miniProfilerOptions
�� #
.
��# $

��$ 1
=
��2 3
request
��4 ;
=>
��< >

�� !
.
��! "
Current
��" )
.
��) *
Resolve
��* 1
<
��1 2&
StoreInformationSettings
��2 J
>
��J K
(
��K L
)
��L M
.
��M N.
 DisplayMiniProfilerInPublicStore
��N n
;
��n o!
miniProfilerOptions
�� #
.
��# $
ResultsAuthorize
��$ 4
=
��5 6
request
��7 >
=>
��? A
!
�� 

�� "
.
��" #
Current
��# *
.
��* +
Resolve
��+ 2
<
��2 3&
StoreInformationSettings
��3 K
>
��K L
(
��L M
)
��M N
.
��N O-
DisplayMiniProfilerForAdminOnly
��O n
||
��o q

�� !
.
��! "
Current
��" )
.
��) *
Resolve
��* 1
<
��1 2 
IPermissionService
��2 D
>
��D E
(
��E F
)
��F G
.
��G H
	Authorize
��H Q
(
��Q R(
StandardPermissionProvider
��R l
.
��l m
AccessAdminPanel
��m }
)
��} ~
;
��~ 
}
�� 
)
��
.
��  
AddEntityFramework
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
public
�� 
static
�� 
void
��  
AddNopWebMarkupMin
�� -
(
��- .
this
��. 2 
IServiceCollection
��3 E
services
��F N
)
��N O
{
�� 	
if
�� 
(
�� 
!
�� !
DataSettingsManager
�� $
.
��$ %!
DatabaseIsInstalled
��% 8
)
��8 9
return
�� 
;
�� 
services
�� 
.
�� 
AddWebMarkupMin
��  
(
��  !
options
��! (
=>
��) +
{
�� 
options
�� 
.
�� 7
)AllowMinificationInDevelopmentEnvironment
�� E
=
��F G
true
��H L
;
��L M
options
�� 
.
�� 6
(AllowCompressionInDevelopmentEnvironment
�� D
=
��E F
true
��G K
;
��K L
options
�� 
.
�� !
DisableMinification
�� /
=
��0 1
!
��2 3

��3 @
.
��@ A
Current
��A H
.
��H I
Resolve
��I P
<
��P Q
CommonSettings
��Q _
>
��_ `
(
��` a
)
��a b
.
��b c$
EnableHtmlMinification
��c y
;
��y z
options
�� 
.
��  
DisableCompression
�� .
=
��/ 0
true
��1 5
;
��5 6
options
�� 
.
�� )
DisablePoweredByHttpHeaders
�� 7
=
��8 9
true
��: >
;
��> ?
}
�� 
)
�� 
.
�� !
AddHtmlMinification
�� $
(
��$ %
options
��% ,
=>
��- /
{
�� 
var
�� 
settings
��  
=
��! "
options
��# *
.
��* +"
MinificationSettings
��+ ?
;
��? @
options
�� 
.
��  
CssMinifierFactory
�� .
=
��/ 0
new
��1 4'
NUglifyCssMinifierFactory
��5 N
(
��N O
)
��O P
;
��P Q
options
�� 
.
�� 
JsMinifierFactory
�� -
=
��. /
new
��0 3&
NUglifyJsMinifierFactory
��4 L
(
��L M
)
��M N
;
��N O
}
�� 
)
�� 
.
��  
AddXmlMinification
�� #
(
��# $
options
��$ +
=>
��, .
{
�� 
var
�� 
settings
��  
=
��! "
options
��# *
.
��* +"
MinificationSettings
��+ ?
;
��? @
settings
�� 
.
�� &
RenderEmptyTagsWithSpace
�� 5
=
��6 7
true
��8 <
;
��< =
settings
�� 
.
�� (
CollapseTagsWithoutContent
�� 7
=
��8 9
true
��: >
;
��> ?
}
�� 
)
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� 
AddEasyCaching
�� )
(
��) *
this
��* . 
IServiceCollection
��/ A
services
��B J
)
��J K
{
�� 	
services
�� 
.
�� 
AddEasyCaching
�� #
(
��# $
option
��$ *
=>
��+ -
{
�� 
option
�� 
.
�� 
UseInMemory
�� "
(
��" #
$str
��# =
)
��= >
;
��> ?
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
static
�� 
void
�� 
AddNopHttpClients
�� ,
(
��, -
this
��- 1 
IServiceCollection
��2 D
services
��E M
)
��M N
{
�� 	
services
�� 
.
�� 

�� "
(
��" #
NopHttpDefaults
��# 2
.
��2 3
DefaultHttpClient
��3 D
)
��D E
.
��E F
	WithProxy
��F O
(
��O P
)
��P Q
;
��Q R
services
�� 
.
�� 

�� "
<
��" #
StoreHttpClient
��# 2
>
��2 3
(
��3 4
)
��4 5
;
��5 6
services
�� 
.
�� 

�� "
<
��" #

��# 0
>
��0 1
(
��1 2
)
��2 3
.
��3 4
	WithProxy
��4 =
(
��= >
)
��> ?
;
��? @
services
�� 
.
�� 

�� "
<
��" #
CaptchaHttpClient
��# 4
>
��4 5
(
��5 6
)
��6 7
.
��7 8
	WithProxy
��8 A
(
��A B
)
��B C
;
��C D
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\NopCommonStartup.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
{		 
public

class
NopCommonStartup
:
INopStartup
{ 
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
,A B
IConfigurationC Q

)_ `
{ 	
services 
. "
AddResponseCompression +
(+ ,
), -
;- .
services 
. 

AddOptions 
(  
)  !
;! "
services 
. 
AddEasyCaching #
(# $
)$ %
;% &
services   
.   %
AddDistributedMemoryCache   .
(  . /
)  / 0
;  0 1
services## 
.## 
AddHttpSession## #
(### $
)##$ %
;##% &
services&& 
.&& 
AddNopHttpClients&& &
(&&& '
)&&' (
;&&( )
services)) 
.)) 
AddAntiForgery)) #
())# $
)))$ %
;))% &
services,, 
.,, 
AddLocalization,, $
(,,$ %
),,% &
;,,& '
services// 
.// 
	AddThemes// 
(// 
)//  
;//  !
}00 	
public66 
void66 
	Configure66 
(66 
IApplicationBuilder66 1
application662 =
)66= >
{77 	
application99 
.99 %
UseNopResponseCompression99 1
(991 2
)992 3
;993 4
application<< 
.<< 
UseNopStaticFiles<< )
(<<) *
)<<* +
;<<+ ,
application?? 
.?? 
UseKeepAlive?? $
(??$ %
)??% &
;??& '
applicationBB 
.BB 

(BB% &
)BB& '
;BB' (
applicationEE 
.EE 

UseSessionEE "
(EE" #
)EE# $
;EE$ %
applicationHH 
.HH %
UseNopRequestLocalizationHH 1
(HH1 2
)HH2 3
;HH3 4
applicationKK 
.KK 

UseCultureKK "
(KK" #
)KK# $
;KK$ %
applicationNN 
.NN 
UseEasyCachingNN &
(NN& '
)NN' (
;NN( )
}OO 	
publicTT 
intTT 
OrderTT 
=>TT 
$numTT 
;TT  
}UU 
}VV �

�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\NopDbStartup.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
{ 
public 

class 
NopDbStartup 
: 
INopStartup  +
{
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
,A B
IConfigurationC Q

)_ `
{ 	
services 
. 
AddNopObjectContext (
(( )
)) *
;* +
services 
. '
AddEntityFrameworkSqlServer 0
(0 1
)1 2
;2 3
services 
. %
AddEntityFrameworkProxies .
(. /
)/ 0
;0 1
} 	
public!! 
void!! 
	Configure!! 
(!! 
IApplicationBuilder!! 1
application!!2 =
)!!= >
{"" 	
}## 	
public(( 
int(( 
Order(( 
=>(( 
$num(( 
;(( 
})) 
}** �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\NopMvcStartup.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
{ 
public 

class 

:  
INopStartup! ,
{
public 
void 
ConfigureServices %
(% &
IServiceCollection& 8
services9 A
,A B
IConfigurationC Q

)_ `
{ 	
services 
. 
AddNopMiniProfiler '
(' (
)( )
;) *
services 
. 
AddNopWebMarkupMin '
(' (
)( )
;) *
services 
. 
	AddNopMvc 
( 
)  
;  !
services 
. (
AddNopRedirectResultExecutor 1
(1 2
)2 3
;3 4
}   	
public&& 
void&& 
	Configure&& 
(&& 
IApplicationBuilder&& 1
application&&2 =
)&&= >
{'' 	
application)) 
.)) 
UseMiniProfiler)) '
())' (
)))( )
;))) *
application,, 
.,, 
UseNopWebMarkupMin,, *
(,,* +
),,+ ,
;,,, -
application// 
.// 
	UseNopMvc// !
(//! "
)//" #
;//# $
}00 	
public55 
int55 
Order55 
=>55 
$num55  
;55  !
}66 
}77 ��
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Infrastructure\PublicWidgetZones.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Infrastructure *
{ 
public 

static 
partial 
class 
PublicWidgetZones  1
{ 
public 
static 
string "
AccountNavigationAfter 3
=>4 6
$str7 Q
;Q R
public 
static 
string #
AccountNavigationBefore 4
=>5 7
$str8 S
;S T
public 
static 
string 
ApplyVendorBottom .
=>/ 1
$str2 F
;F G
public 
static 
string 
ApplyVendorTop +
=>, .
$str/ @
;@ A
public		 
static		 
string		 !
BlogListPageAfterPost		 2
=>		3 5
$str		6 P
;		P Q
public

 
static

 
string

 %
BlogListPageAfterPostBody

 6
=>

7 9
$str

: Y
;

Y Z
public 
static 
string "
BlogListPageAfterPosts 3
=>4 6
$str7 R
;R S
public 
static 
string "
BlogListPageBeforePost 3
=>4 6
$str7 R
;R S
public
static
string
BlogListPageBeforePostBody
=>
$str
;
public 
static 
string #
BlogListPageBeforePosts 4
=>5 7
$str8 T
;T U
public 
static 
string "
BlogListPageInsidePost 3
=>4 6
$str7 R
;R S
public 
static 
string %
BlogPostPageAfterComments 6
=>7 9
$str: X
;X Y
public 
static 
string "
BlogPostPageBeforeBody 3
=>4 6
$str7 R
;R S
public 
static 
string &
BlogPostPageBeforeComments 7
=>8 :
$str; Z
;Z [
public 
static 
string 
BlogPostPageBottom /
=>0 2
$str3 I
;I J
public 
static 
string %
BlogPostPageInsideComment 6
=>7 9
$str: X
;X Y
public 
static 
string 
BlogPostPageTop ,
=>- /
$str0 C
;C D
public 
static 
string .
"BoardsActivediscussionsAfterHeader ?
=>@ B
$strC j
;j k
public 
static 
string .
"BoardsActivediscussionsAfterTopics ?
=>@ B
$strC j
;j k
public 
static 
string "
BoardsForumAfterHeader 3
=>4 6
$str7 R
;R S
public 
static 
string 
BoardsForumBottom .
=>/ 1
$str2 G
;G H
public 
static 
string '
BoardsForumGroupAfterHeader 8
=>9 ;
$str< \
;\ ]
public 
static 
string "
BoardsForumGroupBottom 3
=>4 6
$str7 Q
;Q R
public 
static 
string 
BoardsForumTop +
=>, .
$str/ A
;A B
public 
static 
string ,
 BoardsMainAfterActivediscussions =
=>> @
$strA f
;f g
public 
static 
string !
BoardsMainAfterHeader 2
=>3 5
$str6 P
;P Q
public 
static 
string -
!BoardsMainBeforeActivediscussions >
=>? A
$strB h
;h i
public   
static   
string   !
BoardsPostCreateAfter   2
=>  3 5
$str  6 O
;  O P
public!! 
static!! 
string!! "
BoardsPostCreateBefore!! 3
=>!!4 6
$str!!7 Q
;!!Q R
public"" 
static"" 
string"" 
BoardsPostEditAfter"" 0
=>""1 3
$str""4 K
;""K L
public## 
static## 
string##  
BoardsPostEditBefore## 1
=>##2 4
$str##5 M
;##M N
public$$ 
static$$ 
string$$ $
BoardsSearchAfterResults$$ 5
=>$$6 8
$str$$9 V
;$$V W
public%% 
static%% 
string%% '
BoardsSearchAfterSearchform%% 8
=>%%9 ;
$str%%< \
;%%\ ]
public&& 
static&& 
string&& %
BoardsSearchBeforeResults&& 6
=>&&7 9
$str&&: X
;&&X Y
public'' 
static'' 
string'' (
BoardsSearchBeforeSearchform'' 9
=>'': <
$str''= ^
;''^ _
public(( 
static(( 
string(( "
BoardsTopicAfterHeader(( 3
=>((4 6
$str((7 R
;((R S
public)) 
static)) 
string)) 
BoardsTopicBottom)) .
=>))/ 1
$str))2 G
;))G H
public** 
static** 
string** "
BoardsTopicCreateAfter** 3
=>**4 6
$str**7 Q
;**Q R
public++ 
static++ 
string++ #
BoardsTopicCreateBefore++ 4
=>++5 7
$str++8 S
;++S T
public,, 
static,, 
string,,  
BoardsTopicEditAfter,, 1
=>,,2 4
$str,,5 M
;,,M N
public-- 
static-- 
string-- !
BoardsTopicEditBefore-- 2
=>--3 5
$str--6 O
;--O P
public.. 
static.. 
string.. 
BoardsTopicTop.. +
=>.., .
$str../ A
;..A B
public// 
static// 
string//  
BodyEndHtmlTagBefore// 1
=>//2 4
$str//5 O
;//O P
public00 
static00 
string00 !
BodyStartHtmlTagAfter00 2
=>003 5
$str006 Q
;00Q R
public11 
static11 
string11 *
CategoryDetailsAfterBreadcrumb11 ;
=>11< >
$str11? a
;11a b
public22 
static22 
string22 0
$CategoryDetailsAfterFeaturedProducts22 A
=>22B D
$str22E n
;22n o
public33 
static33 
string33 1
%CategoryDetailsBeforeFeaturedProducts33 B
=>33C E
$str33F p
;33p q
public44 
static44 
string44 (
CategoryDetailsBeforeFilters44 9
=>44: <
$str44= ]
;44] ^
public55 
static55 
string55 ,
 CategoryDetailsBeforeProductList55 =
=>55> @
$str55A f
;55f g
public66 
static66 
string66 .
"CategoryDetailsBeforeSubcategories66 ?
=>66@ B
$str66C i
;66i j
public77 
static77 
string77 !
CategoryDetailsBottom77 2
=>773 5
$str776 N
;77N O
public88 
static88 
string88 
CategoryDetailsTop88 /
=>880 2
$str883 H
;88H I
public99 
static99 
string99 (
CheckoutBillingAddressBottom99 9
=>99: <
$str99= ^
;99^ _
public:: 
static:: 
string:: (
CheckoutBillingAddressMiddle:: 9
=>::: <
$str::= ^
;::^ _
public;; 
static;; 
string;; %
CheckoutBillingAddressTop;; 6
=>;;7 9
$str;;: X
;;;X Y
public<< 
static<< 
string<< #
CheckoutCompletedBottom<< 4
=><<5 7
$str<<8 S
;<<S T
public== 
static== 
string==  
CheckoutCompletedTop== 1
=>==2 4
$str==5 M
;==M N
public>> 
static>> 
string>> !
CheckoutConfirmBottom>> 2
=>>>3 5
$str>>6 O
;>>O P
public?? 
static?? 
string?? 
CheckoutConfirmTop?? /
=>??0 2
$str??3 I
;??I J
public@@ 
static@@ 
string@@ %
CheckoutPaymentInfoBottom@@ 6
=>@@7 9
$str@@: X
;@@X Y
publicAA 
staticAA 
stringAA "
CheckoutPaymentInfoTopAA 3
=>AA4 6
$strAA7 R
;AAR S
publicBB 
staticBB 
stringBB '
CheckoutPaymentMethodBottomBB 8
=>BB9 ;
$strBB< \
;BB\ ]
publicCC 
staticCC 
stringCC $
CheckoutPaymentMethodTopCC 5
=>CC6 8
$strCC9 V
;CCV W
publicDD 
staticDD 
stringDD !
CheckoutProgressAfterDD 2
=>DD3 5
$strDD6 O
;DDO P
publicEE 
staticEE 
stringEE "
CheckoutProgressBeforeEE 3
=>EE4 6
$strEE7 Q
;EEQ R
publicFF 
staticFF 
stringFF )
CheckoutShippingAddressBottomFF :
=>FF; =
$strFF> `
;FF` a
publicGG 
staticGG 
stringGG )
CheckoutShippingAddressMiddleGG :
=>GG; =
$strGG> `
;GG` a
publicHH 
staticHH 
stringHH &
CheckoutShippingAddressTopHH 7
=>HH8 :
$strHH; Z
;HHZ [
publicII 
staticII 
stringII (
CheckoutShippingMethodBottomII 9
=>II: <
$strII= ^
;II^ _
publicJJ 
staticJJ 
stringJJ %
CheckoutShippingMethodTopJJ 6
=>JJ7 9
$strJJ: X
;JJX Y
publicKK 
staticKK 
stringKK 
ContactUsBottomKK ,
=>KK- /
$strKK0 B
;KKB C
publicLL 
staticLL 
stringLL 
ContactUsTopLL )
=>LL* ,
$strLL- <
;LL< =
publicMM 
staticMM 
stringMM 
ContactVendorBottomMM 0
=>MM1 3
$strMM4 J
;MMJ K
publicNN 
staticNN 
stringNN 
ContactVendorTopNN -
=>NN. 0
$strNN1 D
;NND E
publicOO 
staticOO 
stringOO 
ContentAfterOO )
=>OO* ,
$strOO- <
;OO< =
publicPP 
staticPP 
stringPP 

=>PP+ -
$strPP. >
;PP> ?
publicQQ 
staticQQ 
stringQQ 
FooterQQ #
=>QQ$ &
$strQQ' /
;QQ/ 0
publicRR 
staticRR 
stringRR 
HeaderAfterRR (
=>RR) +
$strRR, :
;RR: ;
publicSS 
staticSS 
stringSS 
HeaderBeforeSS )
=>SS* ,
$strSS- <
;SS< =
publicTT 
staticTT 
stringTT 
HeaderLinksAfterTT -
=>TT. 0
$strTT1 E
;TTE F
publicUU 
staticUU 
stringUU 
HeaderLinksBeforeUU .
=>UU/ 1
$strUU2 G
;UUG H
publicVV 
staticVV 
stringVV 
HeaderMenuAfterVV ,
=>VV- /
$strVV0 C
;VVC D
publicWW 
staticWW 
stringWW 
HeaderMenuBeforeWW -
=>WW. 0
$strWW1 E
;WWE F
publicXX 
staticXX 
stringXX 
HeaderMiddleXX )
=>XX* ,
$strXX- <
;XX< =
publicYY 
staticYY 
stringYY 
HeaderSelectorsYY ,
=>YY- /
$strYY0 B
;YYB C
publicZZ 
staticZZ 
stringZZ 
HeadHtmlTagZZ (
=>ZZ) +
$strZZ, ;
;ZZ; <
public[[ 
static[[ 
string[[ %
HomepageBeforeBestSellers[[ 6
=>[[7 9
$str[[: Y
;[[Y Z
public\\ 
static\\ 
string\\ $
HomepageBeforeCategories\\ 5
=>\\6 8
$str\\9 V
;\\V W
public]] 
static]] 
string]] 
HomepageBeforeNews]] /
=>]]0 2
$str]]3 J
;]]J K
public^^ 
static^^ 
string^^ 
HomepageBeforePoll^^ /
=>^^0 2
$str^^3 J
;^^J K
public__ 
static__ 
string__ "
HomepageBeforeProducts__ 3
=>__4 6
$str__7 R
;__R S
public`` 
static`` 
string`` 
HomepageBottom`` +
=>``, .
$str``/ A
;``A B
publicaa 
staticaa 
stringaa 
HomepageTopaa (
=>aa) +
$straa, ;
;aa; <
publicbb 
staticbb 
stringbb 
LeftSideColumnAfterbb 0
=>bb1 3
$strbb4 L
;bbL M
publiccc 
staticcc 
stringcc *
LeftSideColumnAfterBlogArchivecc ;
=>cc< >
$strcc? d
;ccd e
publicdd 
staticdd 
stringdd 1
%LeftSideColumnAfterCategoryNavigationdd B
=>ddC E
$strddF r
;ddr s
publicee 
staticee 
stringee  
LeftSideColumnBeforeee 1
=>ee2 4
$stree5 N
;eeN O
publicff 
staticff 
stringff #
LeftSideColumnBlogAfterff 4
=>ff5 7
$strff8 U
;ffU V
publicgg 
staticgg 
stringgg $
LeftSideColumnBlogBeforegg 5
=>gg6 8
$strgg9 W
;ggW X
publichh 
statichh 
stringhh 
MainColumnAfterhh ,
=>hh- /
$strhh0 C
;hhC D
publicii 
staticii 
stringii 
MainColumnBeforeii -
=>ii. 0
$strii1 E
;iiE F
publicjj 
staticjj 
stringjj 4
(ManufacturerDetailsAfterFeaturedProductsjj E
=>jjF H
$strjjI v
;jjv w
publickk 
statickk 
stringkk 5
)ManufacturerDetailsBeforeFeaturedProductskk F
=>kkG I
$strkkJ x
;kkx y
publicll 
staticll 
stringll ,
 ManufacturerDetailsBeforeFiltersll =
=>ll> @
$strllA e
;lle f
publicmm 
staticmm 
stringmm 0
$ManufacturerDetailsBeforeProductListmm A
=>mmB D
$strmmE n
;mmn o
publicnn 
staticnn 
stringnn %
ManufacturerDetailsBottomnn 6
=>nn7 9
$strnn: V
;nnV W
publicoo 
staticoo 
stringoo "
ManufacturerDetailsTopoo 3
=>oo4 6
$stroo7 P
;ooP Q
publicpp 
staticpp 
stringpp 
MobHeaderMenuAfterpp /
=>pp0 2
$strpp3 J
;ppJ K
publicqq 
staticqq 
stringqq 
MobHeaderMenuBeforeqq 0
=>qq1 3
$strqq4 L
;qqL M
publicrr 
staticrr 
stringrr %
NewsItemPageAfterCommentsrr 6
=>rr7 9
$strrr: X
;rrX Y
publicss 
staticss 
stringss "
NewsItemPageBeforeBodyss 3
=>ss4 6
$strss7 R
;ssR S
publictt 
statictt 
stringtt &
NewsItemPageBeforeCommentstt 7
=>tt8 :
$strtt; Z
;ttZ [
publicuu 
staticuu 
stringuu %
NewsItemPageInsideCommentuu 6
=>uu7 9
$struu: X
;uuX Y
publicvv 
staticvv 
stringvv "
NewsListPageAfterItemsvv 3
=>vv4 6
$strvv7 R
;vvR S
publicww 
staticww 
stringww #
NewsListPageBeforeItemsww 4
=>ww5 7
$strww8 T
;wwT U
publicxx 
staticxx 
stringxx "
NewsListPageInsideItemxx 3
=>xx4 6
$strxx7 R
;xxR S
publicyy 
staticyy 
stringyy 

=>yy+ -
$stryy. =
;yy= >
publiczz 
staticzz 
stringzz 
OpcContentAfterzz ,
=>zz- /
$strzz0 C
;zzC D
public{{ 
static{{ 
string{{ 
OpcContentBefore{{ -
=>{{. 0
$str{{1 E
;{{E F
public|| 
static|| 
string|| *
OpCheckoutBillingAddressBottom|| ;
=>||< >
$str||? c
;||c d
public}} 
static}} 
string}} *
OpCheckoutBillingAddressMiddle}} ;
=>}}< >
$str}}? c
;}}c d
public~~ 
static~~ 
string~~ '
OpCheckoutBillingAddressTop~~ 8
=>~~9 ;
$str~~< ]
;~~] ^
public 
static 
string #
OpCheckoutConfirmBottom 4
=>5 7
$str8 T
;T U
public
�� 
static
�� 
string
�� "
OpCheckoutConfirmTop
�� 1
=>
��2 4
$str
��5 N
;
��N O
public
�� 
static
�� 
string
�� )
OpCheckoutPaymentInfoBottom
�� 8
=>
��9 ;
$str
��< ]
;
��] ^
public
�� 
static
�� 
string
�� &
OpCheckoutPaymentInfoTop
�� 5
=>
��6 8
$str
��9 W
;
��W X
public
�� 
static
�� 
string
�� +
OpCheckoutPaymentMethodBottom
�� :
=>
��; =
$str
��> a
;
��a b
public
�� 
static
�� 
string
�� (
OpCheckoutPaymentMethodTop
�� 7
=>
��8 :
$str
��; [
;
��[ \
public
�� 
static
�� 
string
�� -
OpCheckoutShippingAddressBottom
�� <
=>
��= ?
$str
��@ e
;
��e f
public
�� 
static
�� 
string
�� -
OpCheckoutShippingAddressMiddle
�� <
=>
��= ?
$str
��@ e
;
��e f
public
�� 
static
�� 
string
�� *
OpCheckoutShippingAddressTop
�� 9
=>
��: <
$str
��= _
;
��_ `
public
�� 
static
�� 
string
�� ,
OpCheckoutShippingMethodBottom
�� ;
=>
��< >
$str
��? c
;
��c d
public
�� 
static
�� 
string
�� )
OpCheckoutShippingMethodTop
�� 8
=>
��9 ;
$str
��< ]
;
��] ^
public
�� 
static
�� 
string
�� +
OrderDetailsPageAfterproducts
�� :
=>
��; =
$str
��> _
;
��_ `
public
�� 
static
�� 
string
�� ,
OrderDetailsPageBeforeproducts
�� ;
=>
��< >
$str
��? a
;
��a b
public
�� 
static
�� 
string
�� $
OrderDetailsPageBottom
�� 3
=>
��4 6
$str
��7 Q
;
��Q R
public
�� 
static
�� 
string
�� &
OrderDetailsPageOverview
�� 5
=>
��6 8
$str
��9 U
;
��U V
public
�� 
static
�� 
string
�� !
OrderDetailsPageTop
�� 0
=>
��1 3
$str
��4 K
;
��K L
public
�� 
static
�� 
string
�� %
OrderDetailsProductLine
�� 4
=>
��5 7
$str
��8 S
;
��S T
public
�� 
static
�� 
string
�� $
OrderSummaryCartFooter
�� 3
=>
��4 6
$str
��7 R
;
��R S
public
�� 
static
�� 
string
�� &
OrderSummaryContentAfter
�� 5
=>
��6 8
$str
��9 V
;
��V W
public
�� 
static
�� 
string
�� '
OrderSummaryContentBefore
�� 6
=>
��7 9
$str
��: X
;
��X Y
public
�� 
static
�� 
string
�� &
OrderSummaryContentDeals
�� 5
=>
��6 8
$str
��9 V
;
��V W
public
�� 
static
�� 
string
�� $
ProductBoxAddinfoAfter
�� 3
=>
��4 6
$str
��7 Q
;
��Q R
public
�� 
static
�� 
string
�� %
ProductBoxAddinfoBefore
�� 4
=>
��5 7
$str
��8 S
;
��S T
public
�� 
static
�� 
string
�� %
ProductBoxAddinfoMiddle
�� 4
=>
��5 7
$str
��8 S
;
��S T
public
�� 
static
�� 
string
�� $
ProductBreadcrumbAfter
�� 3
=>
��4 6
$str
��7 P
;
��P Q
public
�� 
static
�� 
string
�� %
ProductBreadcrumbBefore
�� 4
=>
��5 7
$str
��8 R
;
��R S
public
�� 
static
�� 
string
�� #
ProductDetailsAddInfo
�� 2
=>
��3 5
$str
��6 O
;
��O P
public
�� 
static
�� 
string
�� +
ProductDetailsAfterBreadcrumb
�� :
=>
��; =
$str
��> _
;
��_ `
public
�� 
static
�� 
string
�� )
ProductDetailsAfterPictures
�� 8
=>
��9 ;
$str
��< [
;
��[ \
public
�� 
static
�� 
string
�� ,
ProductDetailsBeforeCollateral
�� ;
=>
��< >
$str
��? a
;
��a b
public
�� 
static
�� 
string
�� *
ProductDetailsBeforePictures
�� 9
=>
��: <
$str
��= ]
;
��] ^
public
�� 
static
�� 
string
�� "
ProductDetailsBottom
�� 1
=>
��2 4
$str
��5 L
;
��L M
public
�� 
static
�� 
string
�� +
ProductDetailsEssentialBottom
�� :
=>
��; =
$str
��> _
;
��_ `
public
�� 
static
�� 
string
�� (
ProductDetailsEssentialTop
�� 7
=>
��8 :
$str
��; Y
;
��Y Z
public
�� 
static
�� 
string
�� 6
(ProductDetailsInsideOverviewButtonsAfter
�� E
=>
��F H
$str
��I w
;
��w x
public
�� 
static
�� 
string
�� 7
)ProductDetailsInsideOverviewButtonsBefore
�� F
=>
��G I
$str
��J y
;
��y z
public
�� 
static
�� 
string
�� *
ProductDetailsOverviewBottom
�� 9
=>
��: <
$str
��= ]
;
��] ^
public
�� 
static
�� 
string
�� '
ProductDetailsOverviewTop
�� 6
=>
��7 9
$str
��: W
;
��W X
public
�� 
static
�� 
string
�� 
ProductDetailsTop
�� .
=>
��/ 1
$str
��2 F
;
��F G
public
�� 
static
�� 
string
�� &
ProductReviewsPageBottom
�� 5
=>
��6 8
$str
��9 U
;
��U V
public
�� 
static
�� 
string
�� ,
ProductReviewsPageInsideReview
�� ;
=>
��< >
$str
��? b
;
��b c
public
�� 
static
�� 
string
�� #
ProductReviewsPageTop
�� 2
=>
��3 5
$str
��6 O
;
��O P
public
�� 
static
�� 
string
�� ,
ProductsByTagBeforeProductList
�� ;
=>
��< >
$str
��? b
;
��b c
public
�� 
static
�� 
string
�� !
ProductsByTagBottom
�� 0
=>
��1 3
$str
��4 J
;
��J K
public
�� 
static
�� 
string
�� 
ProductsByTagTop
�� -
=>
��. 0
$str
��1 D
;
��D E
public
�� 
static
�� 
string
�� '
ProductSearchPageAdvanced
�� 6
=>
��7 9
$str
��: W
;
��W X
public
�� 
static
�� 
string
�� +
ProductSearchPageAfterResults
�� :
=>
��; =
$str
��> `
;
��` a
public
�� 
static
�� 
string
�� $
ProductSearchPageBasic
�� 3
=>
��4 6
$str
��7 Q
;
��Q R
public
�� 
static
�� 
string
�� ,
ProductSearchPageBeforeResults
�� ;
=>
��< >
$str
��? b
;
��b c
public
�� 
static
�� 
string
�� (
ProfilePageInfoUserdetails
�� 7
=>
��8 :
$str
��; Z
;
��Z [
public
�� 
static
�� 
string
�� &
ProfilePageInfoUserstats
�� 5
=>
��6 8
$str
��9 V
;
��V W
public
�� 
static
�� 
string
�� 
	SearchBox
�� &
=>
��' )
$str
��* 5
;
��5 6
public
�� 
static
�� 
string
�� )
SearchBoxBeforeSearchButton
�� 8
=>
��9 ;
$str
��< \
;
��\ ]
public
�� 
static
�� 
string
�� 
SitemapAfter
�� )
=>
��* ,
$str
��- <
;
��< =
public
�� 
static
�� 
string
�� 

�� *
=>
��+ -
$str
��. >
;
��> ?
public
�� 
static
�� 
string
�� !
VendorDetailsBottom
�� 0
=>
��1 3
$str
��4 J
;
��J K
public
�� 
static
�� 
string
�� 
VendorDetailsTop
�� -
=>
��. 0
$str
��1 D
;
��D E
}
�� 
}�� �7
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Localization\LocalizedRoute.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 
Localization

 (
{ 
public 

class 
LocalizedRoute 
:  !
Route" '
{ 
private 
readonly 
IRouter  
_target! (
;( )
private 
bool 
? /
#_seoFriendlyUrlsForLanguagesEnabled 9
;9 :
public$$ 
LocalizedRoute$$ 
($$ 
IRouter$$ %
target$$& ,
,$$, -
string$$. 4
	routeName$$5 >
,$$> ?
string$$@ F

,$$T U 
RouteValueDictionary$$V j
defaults$$k s
,$$s t
IDictionary%% 
<%% 
string%% 
,%% 
object%%  &
>%%& '
constraints%%( 3
,%%3 4 
RouteValueDictionary%%5 I

dataTokens%%J T
,%%T U%
IInlineConstraintResolver%%V o%
inlineConstraintResolver	%%p �
)
%%� �
:&& 
base&& 
(&& 
target&& 
,&& 
	routeName&& $
,&&$ %

,&&3 4
defaults&&5 =
,&&= >
constraints&&? J
,&&J K

dataTokens&&L V
,&&V W$
inlineConstraintResolver&&X p
)&&p q
{'' 	
_target(( 
=(( 
target(( 
??(( 
throw((  %
new((& )!
ArgumentNullException((* ?
(((? @
nameof((@ F
(((F G
target((G M
)((M N
)((N O
;((O P
})) 	
public44 
override44 
VirtualPathData44 '
GetVirtualPath44( 6
(446 7
VirtualPathContext447 I
context44J Q
)44Q R
{55 	
var77 
data77 
=77 
base77 
.77 
GetVirtualPath77 *
(77* +
context77+ 2
)772 3
;773 4
if88 
(88 
data88 
==88 
null88 
)88 
return99 
null99 
;99 
if;; 
(;; 
!;; 
DataSettingsManager;; $
.;;$ %
DatabaseIsInstalled;;% 8
||;;9 ;
!;;< =.
"SeoFriendlyUrlsForLanguagesEnabled;;= _
);;_ `
return<< 
data<< 
;<< 
var?? 
path?? 
=?? 
context?? 
.?? 
HttpContext?? *
.??* +
Request??+ 2
.??2 3
Path??3 7
.??7 8
Value??8 =
;??= >
if@@ 
(@@ 
path@@ 
.@@ 
IsLocalizedUrl@@ #
(@@# $
context@@$ +
.@@+ ,
HttpContext@@, 7
.@@7 8
Request@@8 ?
.@@? @
PathBase@@@ H
,@@H I
false@@J O
,@@O P
out@@Q T
Language@@U ]
language@@^ f
)@@f g
)@@g h
dataAA 
.AA 
VirtualPathAA  
=AA! "
$"AA# %
$strAA% &
{AA& '
languageAA' /
.AA/ 0

}AA= >
{AA> ?
dataAA? C
.AAC D
VirtualPathAAD O
}AAO P
"AAP Q
;AAQ R
returnCC 
dataCC 
;CC 
}DD 	
publicKK 
overrideKK 
TaskKK 

RouteAsyncKK '
(KK' (
RouteContextKK( 4
contextKK5 <
)KK< =
{LL 	
ifMM 
(MM 
!MM 
DataSettingsManagerMM $
.MM$ %
DatabaseIsInstalledMM% 8
||MM9 ;
!MM< =.
"SeoFriendlyUrlsForLanguagesEnabledMM= _
)MM_ `
returnNN 
baseNN 
.NN 

RouteAsyncNN &
(NN& '
contextNN' .
)NN. /
;NN/ 0
varQQ 
pathQQ 
=QQ 
contextQQ 
.QQ 
HttpContextQQ *
.QQ* +
RequestQQ+ 2
.QQ2 3
PathQQ3 7
.QQ7 8
ValueQQ8 =
;QQ= >
ifRR 
(RR 
!RR 
pathRR 
.RR 
IsLocalizedUrlRR $
(RR$ %
contextRR% ,
.RR, -
HttpContextRR- 8
.RR8 9
RequestRR9 @
.RR@ A
PathBaseRRA I
,RRI J
falseRRK P
,RRP Q
outRRR U
LanguageRRV ^
_RR_ `
)RR` a
)RRa b
returnSS 
baseSS 
.SS 

RouteAsyncSS &
(SS& '
contextSS' .
)SS. /
;SS/ 0
varVV 
newPathVV 
=VV 
pathVV 
.VV (
RemoveLanguageSeoCodeFromUrlVV ;
(VV; <
contextVV< C
.VVC D
HttpContextVVD O
.VVO P
RequestVVP W
.VVW X
PathBaseVVX `
,VV` a
falseVVb g
)VVg h
;VVh i
contextYY 
.YY 
HttpContextYY 
.YY  
RequestYY  '
.YY' (
PathYY( ,
=YY- .
newPathYY/ 6
;YY6 7
baseZZ 
.ZZ 

RouteAsyncZZ 
(ZZ 
contextZZ #
)ZZ# $
.ZZ$ %
WaitZZ% )
(ZZ) *
)ZZ* +
;ZZ+ ,
context]] 
.]] 
HttpContext]] 
.]]  
Request]]  '
.]]' (
Path]]( ,
=]]- .
path]]/ 3
;]]3 4
return^^ 
_target^^ 
.^^ 

RouteAsync^^ %
(^^% &
context^^& -
)^^- .
;^^. /
}__ 	
publicdd 
virtualdd 
voiddd +
ClearSeoFriendlyUrlsCachedValuedd ;
(dd; <
)dd< =
{ee 	/
#_seoFriendlyUrlsForLanguagesEnabledff /
=ff0 1
nullff2 6
;ff6 7
}gg 	
	protectedpp 
boolpp .
"SeoFriendlyUrlsForLanguagesEnabledpp 9
{qq 	
getrr 
{ss 
iftt 
(tt 
!tt /
#_seoFriendlyUrlsForLanguagesEnabledtt 8
.tt8 9
HasValuett9 A
)ttA B/
#_seoFriendlyUrlsForLanguagesEnableduu 7
=uu8 9

.uuG H
CurrentuuH O
.uuO P
ResolveuuP W
<uuW X 
LocalizationSettingsuuX l
>uul m
(uum n
)uun o
.uuo p/
"SeoFriendlyUrlsForLanguagesEnabled	uup �
;
uu� �
returnww /
#_seoFriendlyUrlsForLanguagesEnabledww :
.ww: ;
Valueww; @
;ww@ A
}xx 
}yy 	
}|| 
}}} �0
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Localization\LocalizedRouteExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Localization (
{ 
public 

static 
class $
LocalizedRouteExtensions 0
{ 
public 
static 

MapLocalizedRoute$ 5
(5 6
this6 :

routeBuilderI U
,U V
stringW ]
name^ b
,b c
stringd j
templatek s
)s t
{ 	
return 
MapLocalizedRoute $
($ %
routeBuilder% 1
,1 2
name3 7
,7 8
template9 A
,A B
defaultsC K
:K L
nullM Q
)Q R
;R S
} 	
public"" 
static"" 

MapLocalizedRoute""$ 5
(""5 6
this""6 :

routeBuilder""I U
,""U V
string""W ]
name""^ b
,""b c
string""d j
template""k s
,""s t
object""u {
defaults	""| �
)
""� �
{## 	
return$$ 
MapLocalizedRoute$$ $
($$$ %
routeBuilder$$% 1
,$$1 2
name$$3 7
,$$7 8
template$$9 A
,$$A B
defaults$$C K
,$$K L
constraints$$M X
:$$X Y
null$$Z ^
)$$^ _
;$$_ `
}%% 	
public22 
static22 

MapLocalizedRoute22$ 5
(225 6
this226 :

routeBuilder22I U
,22U V
string33 
name33 
,33 
string33 
template33  (
,33( )
object33* 0
defaults331 9
,339 :
object33; A
constraints33B M
)33M N
{44 	
return55 
MapLocalizedRoute55 $
(55$ %
routeBuilder55% 1
,551 2
name553 7
,557 8
template559 A
,55A B
defaults55C K
,55K L
constraints55M X
,55X Y

dataTokens55Z d
:55d e
null55f j
)55j k
;55k l
}66 	
publicEE 
staticEE 

MapLocalizedRouteEE$ 5
(EE5 6
thisEE6 :

routeBuilderEEI U
,EEU V
stringFF 
nameFF 
,FF 
stringFF 
templateFF  (
,FF( )
objectFF* 0
defaultsFF1 9
,FF9 :
objectFF; A
constraintsFFB M
,FFM N
objectFFO U

dataTokensFFV `
)FF` a
{GG 	
ifHH 
(HH 
routeBuilderHH 
.HH 
DefaultHandlerHH +
==HH, .
nullHH/ 3
)HH3 4
throwII 
newII !
ArgumentNullExceptionII /
(II/ 0
nameofII0 6
(II6 7
routeBuilderII7 C
)IIC D
)IID E
;IIE F
varLL $
inlineConstraintResolverLL (
=LL) *
routeBuilderLL+ 7
.LL7 8
ServiceProviderLL8 G
.LLG H
GetRequiredServiceLLH Z
<LLZ [%
IInlineConstraintResolverLL[ t
>LLt u
(LLu v
)LLv w
;LLw x
routeBuilderOO 
.OO 
RoutesOO 
.OO  
AddOO  #
(OO# $
newOO$ '
LocalizedRouteOO( 6
(OO6 7
routeBuilderOO7 C
.OOC D
DefaultHandlerOOD R
,OOR S
nameOOT X
,OOX Y
templateOOZ b
,OOb c
newPP  
RouteValueDictionaryPP (
(PP( )
defaultsPP) 1
)PP1 2
,PP2 3
newPP4 7 
RouteValueDictionaryPP8 L
(PPL M
constraintsPPM X
)PPX Y
,PPY Z
newPP[ ^ 
RouteValueDictionaryPP_ s
(PPs t

dataTokensPPt ~
)PP~ 
,	PP �$
inlineConstraintResolverQQ (
)QQ( )
)QQ) *
;QQ* +
returnSS 
routeBuilderSS 
;SS  
}TT 	
publicZZ 
staticZZ 
voidZZ 4
(ClearSeoFriendlyUrlsCachedValueForRoutesZZ C
(ZZC D
thisZZD H
IEnumerableZZI T
<ZZT U
IRouterZZU \
>ZZ\ ]
routersZZ^ e
)ZZe f
{[[ 	
if\\ 
(\\ 
routers\\ 
==\\ 
null\\ 
)\\  
throw]] 
new]] !
ArgumentNullException]] /
(]]/ 0
nameof]]0 6
(]]6 7
routers]]7 >
)]]> ?
)]]? @
;]]@ A
foreach`` 
(`` 
var`` 
router`` 
in``  "
routers``# *
)``* +
{aa 
varbb 
routeCollectionbb #
=bb$ %
routerbb& ,
asbb- /
RouteCollectionbb0 ?
;bb? @
ifcc 
(cc 
routeCollectioncc #
==cc$ &
nullcc' +
)cc+ ,
continuedd 
;dd 
forff 
(ff 
varff 
iff 
=ff 
$numff 
;ff 
iff  !
<ff" #
routeCollectionff$ 3
.ff3 4
Countff4 9
;ff9 :
iff; <
++ff< >
)ff> ?
{gg 
varhh 
routehh 
=hh 
routeCollectionhh  /
[hh/ 0
ihh0 1
]hh1 2
;hh2 3
(ii 
routeii 
asii 
LocalizedRouteii ,
)ii, -
?ii- .
.ii. /+
ClearSeoFriendlyUrlsCachedValueii/ N
(iiN O
)iiO P
;iiP Q
}jj 
}kk 
}ll 	
}mm 
}nn �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Localization\LocalizedString.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Localization (
{ 
public 

class 
LocalizedString  
:! "

HtmlString# -
{		 
public 
LocalizedString 
( 
string %
	localized& /
)/ 0
:0 1
base2 6
(7 8
	localized8 A
)A B
{ 	
Text 
= 
	localized 
; 
} 	
public 
string 
Text 
{ 
get  
;  !
}" #
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Localization\Localizer.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Localization (
{ 
public		 

delegate		 
LocalizedString		 #
	Localizer		$ -
(		- .
string		. 4
text		5 9
,		9 :
params		; A
object		B H
[		H I
]		I J
args		K O
)		O P
;		P Q
}

 �
yC:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Menu\Extensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Menu  
{ 
public		 

static		 
class		 

Extensions		 "
{

 
public 
static 
bool 
ContainsSystemName -
(- .
this. 2
SiteMapNode3 >
node? C
,C D
stringE K

systemNameL V
)V W
{ 	
if 
( 
node 
== 
null 
) 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
node7 ;
); <
)< =
;= >
if 
( 
string 
. 
IsNullOrWhiteSpace )
() *

systemName* 4
)4 5
)5 6
return 
false 
; 
if 
( 

systemName 
. 
Equals !
(! "
node" &
.& '

SystemName' 1
,1 2
StringComparison3 C
.C D&
InvariantCultureIgnoreCaseD ^
)^ _
)_ `
return 
true 
; 
return 
node 
. 

ChildNodes "
." #
Any# &
(& '
cn' )
=>* ,
ContainsSystemName- ?
(? @
cn@ B
,B C

systemNameD N
)N O
)O P
;P Q
} 	
} 
} �
C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Menu\IAdminMenuPlugin.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Menu  
{ 
public 

	interface 
IAdminMenuPlugin %
:& '
IPlugin( /
{		 
void 

( 
SiteMapNode &
rootNode' /
)/ 0
;0 1
} 
} �
zC:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Menu\SiteMapNode.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Menu  
{ 
public

 

class

 
SiteMapNode

 
{ 
public 
SiteMapNode 
( 
) 
{ 	
RouteValues 
= 
new  
RouteValueDictionary 2
(2 3
)3 4
;4 5

ChildNodes 
= 
new 
List !
<! "
SiteMapNode" -
>- .
(. /
)/ 0
;0 1
} 	
public 
string 

SystemName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public"" 
string"" 
ControllerName"" $
{""% &
get""' *
;""* +
set"", /
;""/ 0
}""1 2
public'' 
string'' 

ActionName''  
{''! "
get''# &
;''& '
set''( +
;''+ ,
}''- .
public,,  
RouteValueDictionary,, #
RouteValues,,$ /
{,,0 1
get,,2 5
;,,5 6
set,,7 :
;,,: ;
},,< =
public11 
string11 
Url11 
{11 
get11 
;11  
set11! $
;11$ %
}11& '
public66 
IList66 
<66 
SiteMapNode66  
>66  !

ChildNodes66" ,
{66- .
get66/ 2
;662 3
set664 7
;667 8
}669 :
public;; 
string;; 
	IconClass;; 
{;;  !
get;;" %
;;;% &
set;;' *
;;;* +
};;, -
public@@ 
bool@@ 
Visible@@ 
{@@ 
get@@ !
;@@! "
set@@# &
;@@& '
}@@( )
publicEE 
boolEE 
OpenUrlInNewTabEE #
{EE$ %
getEE& )
;EE) *
setEE+ .
;EE. /
}EE0 1
}FF 
}GG �[
yC:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Menu\XmlSiteMap.cs
	namespace
Nop
 
.
Web
.
	Framework
.
Menu
{ 
public 

class 

XmlSiteMap 
{ 
public 

XmlSiteMap 
( 
) 
{ 	
RootNode 
= 
new 
SiteMapNode &
(& '
)' (
;( )
} 	
public 
SiteMapNode 
RootNode #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public%% 
virtual%% 
void%% 
LoadFrom%% $
(%%$ %
string%%% +
physicalPath%%, 8
)%%8 9
{&& 	
var'' 
fileProvider'' 
='' 

.'', -
Current''- 4
.''4 5
Resolve''5 <
<''< =
INopFileProvider''= M
>''M N
(''N O
)''O P
;''P Q
var)) 
filePath)) 
=)) 
fileProvider)) '
.))' (
MapPath))( /
())/ 0
physicalPath))0 <
)))< =
;))= >
var** 
content** 
=** 
fileProvider** &
.**& '
ReadAllText**' 2
(**2 3
filePath**3 ;
,**; <
Encoding**= E
.**E F
UTF8**F J
)**J K
;**K L
if,, 
(,, 
!,, 
string,, 
.,, 

(,,% &
content,,& -
),,- .
),,. /
{-- 
using.. 
(.. 
var.. 
sr.. 
=.. 
new..  #
StringReader..$ 0
(..0 1
content..1 8
)..8 9
)..9 :
{// 
using00 
(00 
var00 
xr00 !
=00" #
	XmlReader00$ -
.00- .
Create00. 4
(004 5
sr005 7
,007 8
new11 
XmlReaderSettings11  1
{22 

CloseInput33  *
=33+ ,
true33- 1
,331 2
IgnoreWhitespace44  0
=441 2
true443 7
,447 8
IgnoreComments55  .
=55/ 0
true551 5
,555 6(
IgnoreProcessingInstructions66  <
=66= >
true66? C
}77 
)77 
)77 
{88 
var99 
doc99 
=99  !
new99" %
XmlDocument99& 1
(991 2
)992 3
;993 4
doc:: 
.:: 
Load::  
(::  !
xr::! #
)::# $
;::$ %
if<< 
(<< 
(<< 
doc<<  
.<<  !
DocumentElement<<! 0
!=<<1 3
null<<4 8
)<<8 9
&&<<: <
doc<<= @
.<<@ A

)<<N O
{== 
var>> 
xmlRootNode>>  +
=>>, -
doc>>. 1
.>>1 2
DocumentElement>>2 A
.>>A B

FirstChild>>B L
;>>L M
Iterate?? #
(??# $
RootNode??$ ,
,??, -
xmlRootNode??. 9
)??9 :
;??: ;
}@@ 
}AA 
}BB 
}CC 
}DD 	
privateFF 
staticFF 
voidFF 
IterateFF #
(FF# $
SiteMapNodeFF$ /
siteMapNodeFF0 ;
,FF; <
XmlNodeFF= D
xmlNodeFFE L
)FFL M
{GG 	
PopulateNodeHH 
(HH 
siteMapNodeHH $
,HH$ %
xmlNodeHH& -
)HH- .
;HH. /
foreachJJ 
(JJ 
XmlNodeJJ 
xmlChildNodeJJ )
inJJ* ,
xmlNodeJJ- 4
.JJ4 5

ChildNodesJJ5 ?
)JJ? @
{KK 
ifLL 
(LL 
xmlChildNodeLL  
.LL  !
	LocalNameLL! *
.LL* +
EqualsLL+ 1
(LL1 2
$strLL2 ?
,LL? @
StringComparisonLLA Q
.LLQ R&
InvariantCultureIgnoreCaseLLR l
)LLl m
)LLm n
{MM 
varNN 
siteMapChildNodeNN (
=NN) *
newNN+ .
SiteMapNodeNN/ :
(NN: ;
)NN; <
;NN< =
siteMapNodeOO 
.OO  

ChildNodesOO  *
.OO* +
AddOO+ .
(OO. /
siteMapChildNodeOO/ ?
)OO? @
;OO@ A
IterateQQ 
(QQ 
siteMapChildNodeQQ ,
,QQ, -
xmlChildNodeQQ. :
)QQ: ;
;QQ; <
}RR 
}SS 
}TT 	
privateVV 
staticVV 
voidVV 
PopulateNodeVV (
(VV( )
SiteMapNodeVV) 4
siteMapNodeVV5 @
,VV@ A
XmlNodeVVB I
xmlNodeVVJ Q
)VVQ R
{WW 	
siteMapNodeYY 
.YY 

SystemNameYY "
=YY# $'
GetStringValueFromAttributeYY% @
(YY@ A
xmlNodeYYA H
,YYH I
$strYYJ V
)YYV W
;YYW X
var\\ 
nopResource\\ 
=\\ '
GetStringValueFromAttribute\\ 9
(\\9 :
xmlNode\\: A
,\\A B
$str\\C P
)\\P Q
;\\Q R
var]] 
localizationService]] #
=]]$ %

.]]3 4
Current]]4 ;
.]]; <
Resolve]]< C
<]]C D 
ILocalizationService]]D X
>]]X Y
(]]Y Z
)]]Z [
;]][ \
siteMapNode^^ 
.^^ 
Title^^ 
=^^ 
localizationService^^  3
.^^3 4
GetResource^^4 ?
(^^? @
nopResource^^@ K
)^^K L
;^^L M
varaa 
controllerNameaa 
=aa  '
GetStringValueFromAttributeaa! <
(aa< =
xmlNodeaa= D
,aaD E
$straaF R
)aaR S
;aaS T
varbb 

actionNamebb 
=bb '
GetStringValueFromAttributebb 8
(bb8 9
xmlNodebb9 @
,bb@ A
$strbbB J
)bbJ K
;bbK L
varcc 
urlcc 
=cc '
GetStringValueFromAttributecc 1
(cc1 2
xmlNodecc2 9
,cc9 :
$strcc; @
)cc@ A
;ccA B
ifdd 
(dd 
!dd 
stringdd 
.dd 

(dd% &
controllerNamedd& 4
)dd4 5
&&dd6 8
!dd9 :
stringdd: @
.dd@ A

(ddN O

actionNameddO Y
)ddY Z
)ddZ [
{ee 
siteMapNodeff 
.ff 
ControllerNameff *
=ff+ ,
controllerNameff- ;
;ff; <
siteMapNodegg 
.gg 

ActionNamegg &
=gg' (

actionNamegg) 3
;gg3 4
siteMapNodejj 
.jj 
RouteValuesjj '
=jj( )
newjj* - 
RouteValueDictionaryjj. B
{jjC D
{jjE F
$strjjG M
,jjM N
	AreaNamesjjO X
.jjX Y
AdminjjY ^
}jj_ `
}jja b
;jjb c
}kk 
elsell 
ifll 
(ll 
!ll 
stringll 
.ll 

(ll* +
urlll+ .
)ll. /
)ll/ 0
{mm 
siteMapNodenn 
.nn 
Urlnn 
=nn  !
urlnn" %
;nn% &
}oo 
siteMapNoderr 
.rr 
	IconClassrr !
=rr" #'
GetStringValueFromAttributerr$ ?
(rr? @
xmlNoderr@ G
,rrG H
$strrrI T
)rrT U
;rrU V
varuu 
permissionNamesuu 
=uu  !'
GetStringValueFromAttributeuu" =
(uu= >
xmlNodeuu> E
,uuE F
$struuG X
)uuX Y
;uuY Z
ifvv 
(vv 
!vv 
stringvv 
.vv 

(vv% &
permissionNamesvv& 5
)vv5 6
)vv6 7
{ww 
varxx 
permissionServicexx %
=xx& '

.xx5 6
Currentxx6 =
.xx= >
Resolvexx> E
<xxE F
IPermissionServicexxF X
>xxX Y
(xxY Z
)xxZ [
;xx[ \
siteMapNodeyy 
.yy 
Visibleyy #
=yy$ %
permissionNamesyy& 5
.yy5 6
Splityy6 ;
(yy; <
newyy< ?
[yy? @
]yy@ A
{yyB C
$charyyD G
}yyH I
,yyI J
StringSplitOptionsyyK ]
.yy] ^
RemoveEmptyEntriesyy^ p
)yyp q
.zz 
Anyzz 
(zz 
permissionNamezz &
=>zz' )
permissionServicezz* ;
.zz; <
	Authorizezz< E
(zzE F
permissionNamezzF T
.zzT U
TrimzzU Y
(zzY Z
)zzZ [
)zz[ \
)zz\ ]
;zz] ^
}{{ 
else|| 
{}} 
siteMapNode~~ 
.~~ 
Visible~~ #
=~~$ %
true~~& *
;~~* +
} 
var
�� "
openUrlInNewTabValue
�� $
=
��% &)
GetStringValueFromAttribute
��' B
(
��B C
xmlNode
��C J
,
��J K
$str
��L ]
)
��] ^
;
��^ _
if
�� 
(
�� 
!
�� 
string
�� 
.
��  
IsNullOrWhiteSpace
�� *
(
��* +"
openUrlInNewTabValue
��+ ?
)
��? @
&&
��A C
bool
��D H
.
��H I
TryParse
��I Q
(
��Q R"
openUrlInNewTabValue
��R f
,
��f g
out
��h k
bool
��l p

��q ~
)
��~ 
)�� �
{
�� 
siteMapNode
�� 
.
�� 
OpenUrlInNewTab
�� +
=
��, -

��. ;
;
��; <
}
�� 
}
�� 	
private
�� 
static
�� 
string
�� )
GetStringValueFromAttribute
�� 9
(
��9 :
XmlNode
��: A
node
��B F
,
��F G
string
��H N

��O \
)
��\ ]
{
�� 	
string
�� 
value
�� 
=
�� 
null
�� 
;
��  
if
�� 
(
�� 
node
�� 
.
�� 

Attributes
�� 
!=
��  "
null
��# '
&&
��( *
node
��+ /
.
��/ 0

Attributes
��0 :
.
��: ;
Count
��; @
>
��A B
$num
��C D
)
��D E
{
�� 
var
�� 
	attribute
�� 
=
�� 
node
��  $
.
��$ %

Attributes
��% /
[
��/ 0

��0 =
]
��= >
;
��> ?
if
�� 
(
�� 
	attribute
�� 
!=
��  
null
��! %
)
��% &
{
�� 
value
�� 
=
�� 
	attribute
�� %
.
��% &
Value
��& +
;
��+ ,
}
�� 
}
�� 
return
�� 
value
�� 
;
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\ActionConfirmationModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

class #
ActionConfirmationModel (
{ 
public 
string 
ControllerName $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 

ActionName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
WindowId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string  
AdditonalConfirmText *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
} 
} �
{C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\AlertModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

class 
ActionAlertModel !
:" #
BaseNopEntityModel$ 6
{ 
public 
string 
WindowId 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
AlertId 
{ 
get  #
;# $
set% (
;( )
}* +
public 
string 
AlertMessage "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\BaseNopEntityModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

partial 
class 
BaseNopEntityModel +
:, -
BaseNopModel. :
{ 
public 
virtual 
int 
Id 
{ 
get  #
;# $
set% (
;( )
}* +
}
} �
}C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\BaseNopModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public

 

partial

 
class

 
BaseNopModel

 %
{ 
public 
BaseNopModel 
( 
) 
{ 	
CustomProperties 
= 
new "

Dictionary# -
<- .
string. 4
,4 5
object6 <
>< =
(= >
)> ?
;? @
PostInitialize 
( 
) 
; 
} 	
public   
virtual   
void   
	BindModel   %
(  % &
ModelBindingContext  & 9
bindingContext  : H
)  H I
{!! 	
}"" 	
	protected(( 
virtual(( 
void(( 
PostInitialize(( -
(((- .
)((. /
{)) 	
}** 	
[:: 	
	XmlIgnore::	 
]:: 
public;; 

Dictionary;; 
<;; 
string;;  
,;;  !
object;;" (
>;;( )
CustomProperties;;* :
{;;; <
get;;= @
;;;@ A
set;;B E
;;;E F
};;G H
}?? 
}@@ �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\BasePagedListModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

abstract 
partial 
class !
BasePagedListModel" 4
<4 5
T5 6
>6 7
:8 9
BaseNopModel: F
,F G
IPagedModelH S
<S T
TT U
>U V
whereW \
T] ^
:_ `
BaseNopModela m
{		 
public
IEnumerable
<
T
>
Data
{
get
;
set
;
}
public 
string 
Draw 
{ 
get  
;  !
set" %
;% &
}' (
public 
int 
RecordsFiltered "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
int 
RecordsTotal 
{  !
get" %
;% &
set' *
;* +
}, -
public 
int 
Total 
{ 
get 
; 
set  #
;# $
}% &
}   
}!! �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\BaseSearchModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public		 

abstract		 
partial		 
class		 !
BaseSearchModel		" 1
:		2 3
BaseNopModel		4 @
,		@ A
IPagingRequestModel		B U
{

 
public
BaseSearchModel
(
)
{ 	
Length 
= 
$num 
; 
} 	
public 
int 
Page 
=> 
( 
Start !
/" #
Length$ *
)* +
+, -
$num. /
;/ 0
public 
int 
PageSize 
=> 
Length %
;% &
public$$ 
string$$ 
AvailablePageSizes$$ (
{$$) *
get$$+ .
;$$. /
set$$0 3
;$$3 4
}$$5 6
public)) 
string)) 
Draw)) 
{)) 
get))  
;))  !
set))" %
;))% &
}))' (
public.. 
int.. 
Start.. 
{.. 
get.. 
;.. 
set..  #
;..# $
}..% &
public33 
int33 
Length33 
{33 
get33 
;33  
set33! $
;33$ %
}33& '
public<< 
void<< 
SetGridPageSize<< #
(<<# $
)<<$ %
{== 	
var>> 
adminAreaSettings>> !
=>>" #

.>>1 2
Current>>2 9
.>>9 :
Resolve>>: A
<>>A B
AdminAreaSettings>>B S
>>>S T
(>>T U
)>>U V
;>>V W
SetGridPageSize?? 
(?? 
adminAreaSettings?? -
.??- .
DefaultGridPageSize??. A
,??A B
adminAreaSettings??C T
.??T U

)??b c
;??c d
}@@ 	
publicEE 
voidEE  
SetPopupGridPageSizeEE (
(EE( )
)EE) *
{FF 	
varGG 
adminAreaSettingsGG !
=GG" #

.GG1 2
CurrentGG2 9
.GG9 :
ResolveGG: A
<GGA B
AdminAreaSettingsGGB S
>GGS T
(GGT U
)GGU V
;GGV W
SetGridPageSizeHH 
(HH 
adminAreaSettingsHH -
.HH- .
PopupGridPageSizeHH. ?
,HH? @
adminAreaSettingsHHA R
.HHR S

)HH` a
;HHa b
}II 	
publicPP 
voidPP 
SetGridPageSizePP #
(PP# $
intPP$ '
pageSizePP( 0
,PP0 1
stringPP2 8
availablePageSizesPP9 K
=PPL M
nullPPN R
)PPR S
{QQ 	
StartRR 
=RR 
$numRR 
;RR 
LengthSS 
=SS 
pageSizeSS 
;SS 
AvailablePageSizesTT 
=TT  
availablePageSizesTT! 3
;TT3 4
}UU 	
}XX 
}YY �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\ColumnProperty.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
ColumnProperty '
{ 
public 
ColumnProperty 
( 
string $
data% )
)) *
{ 	
Data 
= 
data 
; 
Visible 
= 
true 
; 
Encode 
= 
true 
; 
} 	
public 
string 
Data 
{ 
get  
;  !
set" %
;% &
}' (
public## 
string## 
Title## 
{## 
get## !
;##! "
set### &
;##& '
}##( )
public(( 
IRender(( 
Render(( 
{(( 
get((  #
;((# $
set((% (
;((( )
}((* +
public-- 
string-- 
Width-- 
{-- 
get-- !
;--! "
set--# &
;--& '
}--( )
public22 
bool22 
	AutoWidth22 
{22 
get22  #
;22# $
set22% (
;22( )
}22* +
public77 
bool77 
IsMasterCheckBox77 $
{77% &
get77' *
;77* +
set77, /
;77/ 0
}771 2
public<< 
string<< 
	ClassName<< 
{<<  !
get<<" %
;<<% &
set<<' *
;<<* +
}<<, -
publicAA 
boolAA 
VisibleAA 
{AA 
getAA !
;AA! "
setAA# &
;AA& '
}AA( )
publicFF 
boolFF 

SearchableFF 
{FF  
getFF! $
;FF$ %
setFF& )
;FF) *
}FF+ ,
publicKK 
boolKK 
EditableKK 
{KK 
getKK "
;KK" #
setKK$ '
;KK' (
}KK) *
publicPP 
EditTypePP 
EditTypePP  
{PP! "
getPP# &
;PP& '
setPP( +
;PP+ ,
}PP- .
publicUU 
boolUU 
EncodeUU 
{UU 
getUU  
;UU  !
setUU" %
;UU% &
}UU' (
}XX 
}YY �-
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\DataTablesModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
DataTablesModel (
:) *
BaseNopModel+ 7
{		 
	protected 
const 
string 
DEFAULT_PAGING_TYPE 2
=3 4
$str5 E
;E F
public 
DataTablesModel 
( 
)  
{ 	
Info 
= 
true 
; 

= 
true  
;  !

ServerSide 
= 
true 
; 

Processing 
= 
true 
; 
Paging 
= 
true 
; 

PagingType 
= 
DEFAULT_PAGING_TYPE ,
;, -
Filters 
= 
new 
List 
< 
FilterParameter .
>. /
(/ 0
)0 1
;1 2
ColumnCollection   
=   
new   "
List  # '
<  ' (
ColumnProperty  ( 6
>  6 7
(  7 8
)  8 9
;  9 :
}!! 	
public** 
string** 
Name** 
{** 
get**  
;**  !
set**" %
;**% &
}**' (
public// 
DataUrl// 
UrlRead// 
{//  
get//! $
;//$ %
set//& )
;//) *
}//+ ,
public44 
DataUrl44 
	UrlDelete44  
{44! "
get44# &
;44& '
set44( +
;44+ ,
}44- .
public99 
DataUrl99 
	UrlUpdate99  
{99! "
get99# &
;99& '
set99( +
;99+ ,
}99- .
public>> 
string>> 
SearchButtonId>> $
{>>% &
get>>' *
;>>* +
set>>, /
;>>/ 0
}>>1 2
publicCC 
IListCC 
<CC 
FilterParameterCC $
>CC$ %
FiltersCC& -
{CC. /
getCC0 3
;CC3 4
setCC5 8
;CC8 9
}CC: ;
publicHH 
objectHH 
DataHH 
{HH 
getHH  
;HH  !
setHH" %
;HH% &
}HH' (
publicMM 
boolMM 

ProcessingMM 
{MM  
getMM! $
;MM$ %
setMM& )
;MM) *
}MM+ ,
publicRR 
boolRR 

ServerSideRR 
{RR  
getRR! $
;RR$ %
setRR& )
;RR) *
}RR+ ,
publicWW 
boolWW 
PagingWW 
{WW 
getWW  
;WW  !
setWW" %
;WW% &
}WW' (
public\\ 
bool\\ 
Info\\ 
{\\ 
get\\ 
;\\ 
set\\  #
;\\# $
}\\% &
publicaa 
boolaa 

{aa" #
getaa$ '
;aa' (
setaa) ,
;aa, -
}aa. /
publicff 
stringff 

PagingTypeff  
{ff! "
getff# &
;ff& '
setff( +
;ff+ ,
}ff- .
publickk 
intkk 
Lengthkk 
{kk 
getkk 
;kk  
setkk! $
;kk$ %
}kk& '
publicpp 
stringpp 

LengthMenupp  
{pp! "
getpp# &
;pp& '
setpp( +
;pp+ ,
}pp- .
publicuu 
stringuu 
Domuu 
{uu 
getuu 
;uu  
setuu! $
;uu$ %
}uu& '
publiczz 
boolzz 
Orderingzz 
{zz 
getzz "
;zz" #
setzz$ '
;zz' (
}zz) *
public
�� 
string
�� 
HeaderCallback
�� $
{
��% &
get
��' *
;
��* +
set
��, /
;
��/ 0
}
��1 2
public
�� 
int
�� 

��  
{
��! "
get
��# &
;
��& '
set
��( +
;
��+ ,
}
��- .
public
�� 
string
�� 
FooterCallback
�� $
{
��% &
get
��' *
;
��* +
set
��, /
;
��/ 0
}
��1 2
public
�� 
bool
�� 
IsChildTable
��  
{
��! "
get
��# &
;
��& '
set
��( +
;
��+ ,
}
��- .
public
�� 
DataTablesModel
�� 

ChildTable
�� )
{
��* +
get
��, /
;
��/ 0
set
��1 4
;
��4 5
}
��6 7
public
�� 
string
�� 
PrimaryKeyColumn
�� &
{
��' (
get
��) ,
;
��, -
set
��. 1
;
��1 2
}
��3 4
public
�� 
string
�� (
BindColumnNameActionDelete
�� 0
{
��1 2
get
��3 6
;
��6 7
set
��8 ;
;
��; <
}
��= >
public
�� 
IList
�� 
<
�� 
ColumnProperty
�� #
>
��# $
ColumnCollection
��% 5
{
��6 7
get
��8 ;
;
��; <
set
��= @
;
��@ A
}
��B C
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\DataUrl.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
DataUrl  
{		 
public 
DataUrl 
( 
string 

actionName (
,( )
string* 0
controllerName1 ?
,? @ 
RouteValueDictionaryA U
routeValuesV a
)a b
{ 	

ActionName 
= 

actionName #
;# $
ControllerName 
= 
controllerName +
;+ ,
RouteValues 
= 
routeValues %
;% &
} 	
public 
DataUrl 
( 
string 
url !
)! "
{ 	
Url 
= 
url 
; 
}   	
public'' 
DataUrl'' 
('' 
string'' 
url'' !
,''! "
string''# )
dataId''* 0
)''0 1
{(( 	
Url)) 
=)) 
url)) 
;)) 
DataId** 
=** 
dataId** 
;** 
}++ 	
public22 
DataUrl22 
(22 
string22 
url22 !
,22! "
bool22# '
trimEnd22( /
)22/ 0
{33 	
Url44 
=44 
url44 
;44 
TrimEnd55 
=55 
trimEnd55 
;55 
}66 	
public?? 
string?? 

ActionName??  
{??! "
get??# &
;??& '
set??( +
;??+ ,
}??- .
publicDD 
stringDD 
ControllerNameDD $
{DD% &
getDD' *
;DD* +
setDD, /
;DD/ 0
}DD1 2
publicII 
stringII 
UrlII 
{II 
getII 
;II  
setII! $
;II$ %
}II& '
publicNN  
RouteValueDictionaryNN #
RouteValuesNN$ /
{NN0 1
getNN2 5
;NN5 6
setNN7 :
;NN: ;
}NN< =
publicSS 
stringSS 
DataIdSS 
{SS 
getSS "
;SS" #
setSS$ '
;SS' (
}SS) *
publicXX 
boolXX 
TrimEndXX 
{XX 
getXX !
;XX! "
setXX# &
;XX& '
}XX( )
}[[ 
}\\ �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\EditType.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

enum 
EditType 
{ 
Number 
= 
$num 
, 
Checkbox		 
=		 
$num		 
,		 
String

 
=

 
$num

 
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\FilterParameter.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
FilterParameter (
{		 
public 
FilterParameter 
( 
string %
name& *
)* +
{ 	
Name 
= 
name 
; 
Type 
= 
typeof 
( 
string  
)  !
;! "
} 	
public 
FilterParameter 
( 
string %
name& *
,* +
string, 2
	modelName3 <
)< =
{ 	
Name 
= 
name 
; 
	ModelName 
= 
	modelName !
;! "
Type 
= 
typeof 
( 
string  
)  !
;! "
}   	
public'' 
FilterParameter'' 
('' 
string'' %
name''& *
,''* +
Type'', 0
type''1 5
)''5 6
{(( 	
Name)) 
=)) 
name)) 
;)) 
Type** 
=** 
type** 
;** 
}++ 	
public22 
FilterParameter22 
(22 
string22 %
name22& *
,22* +
object22, 2
value223 8
)228 9
{33 	
Name44 
=44 
name44 
;44 
Type55 
=55 
value55 
.55 
GetType55  
(55  !
)55! "
;55" #
Value66 
=66 
value66 
;66 
}77 	
public?? 
FilterParameter?? 
(?? 
string?? %
name??& *
,??* +
string??, 2

parentName??3 =
,??= >
bool??? C"
isParentChildParameter??D Z
=??[ \
true??] a
)??a b
{@@ 	
NameAA 
=AA 
nameAA 
;AA 

ParentNameBB 
=BB 

parentNameBB #
;BB# $
TypeCC 
=CC 
typeofCC 
(CC 
stringCC  
)CC  !
;CC! "
}DD 	
publicMM 
stringMM 
NameMM 
{MM 
getMM  
;MM  !
}MM" #
publicRR 
stringRR 
	ModelNameRR 
{RR  !
getRR" %
;RR% &
}RR' (
publicWW 
TypeWW 
TypeWW 
{WW 
getWW 
;WW 
}WW  !
public\\ 
object\\ 
Value\\ 
{\\ 
get\\ !
;\\! "
set\\# &
;\\& '
}\\( )
publicaa 
stringaa 

ParentNameaa  
{aa! "
getaa# &
;aa& '
setaa( +
;aa+ ,
}aa- .
}dd 
}ee �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\IRender.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
	interface 
IRender $
{ 
} 
}		 �

�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\NopButtonClassDefaults.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

static 
partial 
class "
NopButtonClassDefaults  6
{ 
public 
static 
string 
Default $
=>% '
$str( 9
;9 :
public 
static 
string 
Primary $
=>% '
$str( 9
;9 :
public 
static 
string 
Success $
=>% '
$str( 9
;9 :
public 
static 
string 
Info !
=>" $
$str% 3
;3 4
public   
static   
string   
Danger   #
=>  $ &
$str  ' 7
;  7 8
public%% 
static%% 
string%% 
Warning%% $
=>%%% '
$str%%( 9
;%%9 :
public** 
static** 
string** 
Olive** "
=>**# %
$str**& 4
;**4 5
}++ 
},, �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\NopColumnClassDefaults.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

static 
partial 
class "
NopColumnClassDefaults  6
{ 
public 
static 
string 
	CenterAll &
=>' )
$str* 7
;7 8
public
static
string
ChildControl
=>
$str
;
public 
static 
string 
Button #
=>$ &
$str' 6
;6 7
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderBoolean.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 

:' (
IRender) 0
{ 
} 
}		 �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderButtonCustom.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
RenderButtonCustom +
:, -
IRender. 5
{ 
public 
RenderButtonCustom !
(! "
string" (
	className) 2
,2 3
string4 :
title; @
)@ A
{ 	
	ClassName 
= 
	className !
;! "
Title 
= 
title 
; 
} 	
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
public!! 
string!! 
	ClassName!! 
{!!  !
get!!" %
;!!% &
set!!' *
;!!* +
}!!, -
public&& 
string&& 
Title&& 
{&& 
get&& !
;&&! "
set&&# &
;&&& '
}&&( )
public++ 
string++ 
OnClickFunctionName++ )
{++* +
get++, /
;++/ 0
set++1 4
;++4 5
}++6 7
}.. 
}// �	
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderButtonEdit.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
RenderButtonEdit )
:* +
IRender, 3
{ 
public 
RenderButtonEdit 
(  
DataUrl  '
url( +
)+ ,
{ 	
Url 
= 
url 
; 
	ClassName 
= "
NopButtonClassDefaults .
.. /
Default/ 6
;6 7
} 	
public 
DataUrl 
Url 
{ 
get  
;  !
set" %
;% &
}' (
public   
string   
	ClassName   
{    !
get  " %
;  % &
set  ' *
;  * +
}  , -
}## 
}$$ �	
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderButtonRemove.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
RenderButtonRemove +
:, -
IRender. 5
{ 
public 
RenderButtonRemove !
(! "
string" (
title) .
). /
{ 	
Title 
= 
title 
; 
	ClassName 
= "
NopButtonClassDefaults .
.. /
Default/ 6
;6 7
} 	
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public   
string   
	ClassName   
{    !
get  " %
;  % &
set  ' *
;  * +
}  , -
}## 
}$$ �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderButtonsInlineEdit.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class #
RenderButtonsInlineEdit 0
:1 2
IRender3 :
{ 
public
RenderButtonsInlineEdit
(
)
{ 	
	ClassName 
= "
NopButtonClassDefaults .
.. /
Default/ 6
;6 7
} 	
public 
string 
	ClassName 
{  !
get" %
;% &
set' *
;* +
}, -
} 
} �	
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderButtonView.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
RenderButtonView )
:* +
IRender, 3
{ 
public 
RenderButtonView 
(  
DataUrl  '
url( +
)+ ,
{ 	
Url 
= 
url 
; 
	ClassName 
= "
NopButtonClassDefaults .
.. /
Default/ 6
;6 7
} 	
public 
DataUrl 
Url 
{ 
get  
;  !
set" %
;% &
}' (
public   
string   
	ClassName   
{    !
get  " %
;  % &
set  ' *
;  * +
}  , -
}## 
}$$ �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderCheckBox.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
RenderCheckBox '
:( )
IRender* 1
{ 
public 
RenderCheckBox 
( 
string $
name% )
)) *
{ 	
Name 
= 
name 
; 
} 	
public 
string 
Name 
{ 
get  
;  !
set" %
;% &
}' (
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderChildCaret.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
RenderChildCaret )
:* +
IRender, 3
{ 
}		 
}

 �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderCustom.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 
RenderCustom %
:& '
IRender( /
{ 
public 
RenderCustom 
( 
string "
functionName# /
)/ 0
{ 	
FunctionName 
= 
functionName '
;' (
} 	
public 
string 
FunctionName "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderDate.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 

RenderDate #
:$ %
IRender& -
{ 
private
string
DEFAULT_DATE_FORMAT
=
$str
;
public 

RenderDate 
( 
) 
{ 	
Format 
= 
DEFAULT_DATE_FORMAT (
;( )
} 	
public!! 
string!! 
Format!! 
{!! 
get!! "
;!!" #
set!!$ '
;!!' (
}!!) *
}$$ 
}%% �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderLink.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 

RenderLink #
:$ %
IRender& -
{ 
public 

RenderLink 
( 
DataUrl !
url" %
)% &
{ 	
Url 
= 
url 
; 
} 	
public 
DataUrl 
Url 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
}"" 
}## �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DataTables\RenderPicture.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

DataTables# -
{ 
public 

partial 
class 

:' (
IRender) 0
{ 
public

 


 
(

 
string

 #
	srcPrefix

$ -
=

. /
$str

0 2
)

2 3
{ 	
	SrcPrefix 
= 
	srcPrefix !
;! "
}
public 
string 
	SrcPrefix 
{  !
get" %
;% &
set' *
;* +
}, -
public 
string 
Src 
{ 
get 
;  
set! $
;$ %
}& '
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\DeleteConfirmationModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

class #
DeleteConfirmationModel (
:) *
BaseNopEntityModel+ =
{ 
public 
string 
ControllerName $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 

ActionName  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
WindowId 
{  
get! $
;$ %
set& )
;) *
}+ ,
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\Extensions\ModelExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
." #

Extensions# -
{ 
public

 

static

 
class

 
ModelExtensions

 '
{ 
public 
static 

IPagedList  
<  !
T! "
>" #
ToPagedList$ /
</ 0
T0 1
>1 2
(2 3
this3 7
IList8 =
<= >
T> ?
>? @
listA E
,E F
IPagingRequestModelG Z
pagingRequestModel[ m
)m n
{ 	
return 
new 
	PagedList  
<  !
T! "
>" #
(# $
list$ (
,( )
pagingRequestModel* <
.< =
Page= A
-B C
$numD E
,E F
pagingRequestModelG Y
.Y Z
PageSizeZ b
)b c
;c d
} 	
public## 
static## 

TListModel##  

<##. /

TListModel##/ 9
,##9 :
TModel##; A
,##A B
TObject##C J
>##J K
(##K L
this##L P

TListModel##Q [
	listModel##\ e
,##e f
BaseSearchModel$$ 
searchModel$$ '
,$$' (

IPagedList$$) 3
<$$3 4
TObject$$4 ;
>$$; <

objectList$$= G
,$$G H
Func$$I M
<$$M N
IEnumerable$$N Y
<$$Y Z
TModel$$Z `
>$$` a
>$$a b
dataFillFunction$$c s
)$$s t
where%% 

TListModel%% 
:%% 
BasePagedListModel%% 1
<%%1 2
TModel%%2 8
>%%8 9
where&& 
TModel&& 
:&& 
BaseNopModel&& '
{'' 	
if(( 
((( 
	listModel(( 
==(( 
null(( !
)((! "
throw)) 
new)) !
ArgumentNullException)) /
())/ 0
nameof))0 6
())6 7
	listModel))7 @
)))@ A
)))A B
;))B C
	listModel++ 
.++ 
Data++ 
=++ 
dataFillFunction++ -
?++- .
.++. /
Invoke++/ 5
(++5 6
)++6 7
;++7 8
	listModel,, 
.,, 
Draw,, 
=,, 
searchModel,, (
?,,( )
.,,) *
Draw,,* .
;,,. /
	listModel-- 
.-- 
RecordsTotal-- "
=--# $

objectList--% /
?--/ 0
.--0 1

TotalCount--1 ;
??--< >
$num--? @
;--@ A
	listModel.. 
... 
RecordsFiltered.. %
=..& '

objectList..( 2
?..2 3
...3 4

TotalCount..4 >
??..? A
$num..B C
;..C D
return00 
	listModel00 
;00 
}11 	
}22 
}33 �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\IAclSupportedModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public		 

partial		 
	interface		 
IAclSupportedModel		 /
{

 
IList 
<
int 
> #
SelectedCustomerRoleIds *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
IList 
<
SelectListItem 
> "
AvailableCustomerRoles 4
{5 6
get7 :
;: ;
set< ?
;? @
}A B
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\IDiscountSupportedModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public		 

partial		 
	interface		 #
IDiscountSupportedModel		 4
{

 
IList 
<
int 
> 
SelectedDiscountIds &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
IList 
<
SelectListItem 
> 
AvailableDiscounts 0
{1 2
get3 6
;6 7
set8 ;
;; <
}= >
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\ILocalizedLocaleModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

	interface !
ILocalizedLocaleModel *
{ 
int 

LanguageId 
{ 
get 
; 
set !
;! "
}# $
}
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\ILocalizedModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

	interface 
ILocalizedModel $
{		 
}

 
public 

	interface 
ILocalizedModel $
<$ %
TLocalizedModel% 4
>4 5
:6 7
ILocalizedModel8 G
{ 
IList 
<
TLocalizedModel 
> 
Locales &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} �
|C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\IPagedModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

partial 
	interface 
IPagedModel (
<( )
T) *
>* +
where, 1
T2 3
:4 5
BaseNopModel6 B
{ 
}		 
}

 �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\IPagingRequestModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

partial 
	interface 
IPagingRequestModel 0
{ 
int 
Page 
{ 
get 
; 
} 
int 
PageSize 
{ 
get 
; 
} 
} 
} �	
}C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\IPluginModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

partial 
	interface 
IPluginModel )
{ 
bool 
IsActive
{ 
get 
; 
set  
;  !
}" #
string 
FriendlyName 
{ 
get !
;! "
set# &
;& '
}( )
string 

SystemName 
{ 
get 
;  
set! $
;$ %
}& '
int 
DisplayOrder 
{ 
get 
; 
set  #
;# $
}% &
string   
ConfigurationUrl   
{    !
get  " %
;  % &
set  ' *
;  * +
}  , -
string%% 
LogoUrl%% 
{%% 
get%% 
;%% 
set%% !
;%%! "
}%%# $
}&& 
}'' �
C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\ISettingsModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public 

partial 
	interface 
ISettingsModel +
{ 
int )
ActiveStoreScopeConfiguration )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
}
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Models\IStoreMappingSupportedModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Models "
{ 
public		 

partial		 
	interface		 '
IStoreMappingSupportedModel		 8
{

 
IList 
<
int 
> 
SelectedStoreIds #
{$ %
get& )
;) *
set+ .
;. /
}0 1
IList 
<
SelectListItem 
> 
AvailableStores -
{. /
get0 3
;3 4
set5 8
;8 9
}: ;
} 
} �%
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\AdminAntiForgeryAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{ 
public 

class %
AdminAntiForgeryAttribute *
:+ ,
TypeFilterAttribute- @
{ 
private 
readonly 
bool 

;+ ,
public %
AdminAntiForgeryAttribute (
(( )
bool) -
ignore. 4
=5 6
false7 <
)< =
:> ?
base@ D
(D E
typeofE K
(K L"
AdminAntiForgeryFilterL b
)b c
)c d
{ 	

=   
ignore   "
;  " #
	Arguments!! 
=!! 
new!! 
object!! "
[!!" #
]!!# $
{!!% &
ignore!!& ,
}!!, -
;!!- .
}"" 	
public++ 
bool++ 
IgnoreFilter++  
=>++! #

;++1 2
private44 
class44 "
AdminAntiForgeryFilter44 ,
:44- .7
+ValidateAntiforgeryTokenAuthorizationFilter44/ Z
{55 	
private88 
readonly88 
bool88 !

;88/ 0
private99 
readonly99 
SecuritySettings99 -
_securitySettings99. ?
;99? @
public?? "
AdminAntiForgeryFilter?? )
(??) *
bool??* .
ignoreFilter??/ ;
,??; <
SecuritySettings@@  
securitySettings@@! 1
,@@1 2
IAntiforgeryAA 
antiforgeryAA (
,AA( )
ILoggerFactoryBB 

)BB, -
:BB. /
baseBB0 4
(BB4 5
antiforgeryBB5 @
,BB@ A

)BBO P
{CC 

=DD 
ignoreFilterDD  ,
;DD, -
_securitySettingsEE !
=EE" #
securitySettingsEE$ 4
;EE4 5
}FF 
	protectedQQ 
overrideQQ 
boolQQ #
ShouldValidateQQ$ 2
(QQ2 3&
AuthorizationFilterContextQQ3 M
contextQQN U
)QQU V
{RR 
ifSS 
(SS 
!SS 
baseSS 
.SS 
ShouldValidateSS (
(SS( )
contextSS) 0
)SS0 1
)SS1 2
returnTT 
falseTT  
;TT  !
ifVV 
(VV 
contextVV 
.VV 
HttpContextVV '
.VV' (
RequestVV( /
==VV0 2
nullVV3 7
)VV7 8
returnWW 
falseWW  
;WW  !
ifZZ 
(ZZ 
contextZZ 
.ZZ 
HttpContextZZ '
.ZZ' (
RequestZZ( /
.ZZ/ 0
MethodZZ0 6
.ZZ6 7
EqualsZZ7 =
(ZZ= >
WebRequestMethodsZZ> O
.ZZO P
HttpZZP T
.ZZT U
GetZZU X
,ZZX Y
StringComparisonZZZ j
.ZZj k'
InvariantCultureIgnoreCase	ZZk �
)
ZZ� �
)
ZZ� �
return[[ 
false[[  
;[[  !
if]] 
(]] 
!]] 
_securitySettings]] &
.]]& ',
 EnableXsrfProtectionForAdminArea]]' G
)]]G H
return^^ 
false^^  
;^^  !
varaa 
actionFilteraa  
=aa! "
contextaa# *
.aa* +
ActionDescriptoraa+ ;
.aa; <
FilterDescriptorsaa< M
.bb 
Wherebb 
(bb 
filterDescriptorbb +
=>bb, .
filterDescriptorbb/ ?
.bb? @
Scopebb@ E
==bbF H
FilterScopebbI T
.bbT U
ActionbbU [
)bb[ \
.cc 
Selectcc 
(cc 
filterDescriptorcc ,
=>cc- /
filterDescriptorcc0 @
.cc@ A
FilterccA G
)ccG H
.ccH I
OfTypeccI O
<ccO P%
AdminAntiForgeryAttributeccP i
>cci j
(ccj k
)cck l
.ccl m
FirstOrDefaultccm {
(cc{ |
)cc| }
;cc} ~
ifff 
(ff 
actionFilterff  
?ff  !
.ff! "
IgnoreFilterff" .
??ff/ 1

)ff? @
returngg 
falsegg  
;gg  !
returnii 
trueii 
;ii 
}jj 
}mm 	
}pp 
}qq �#
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\AuthorizeAdminAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{		 
public

class
AuthorizeAdminAttribute
:
TypeFilterAttribute
{ 
private 
readonly 
bool 

;+ ,
public #
AuthorizeAdminAttribute &
(& '
bool' +
ignore, 2
=3 4
false5 :
): ;
:< =
base> B
(B C
typeofC I
(I J 
AuthorizeAdminFilterJ ^
)^ _
)_ `
{ 	

= 
ignore "
;" #
	Arguments 
= 
new 
object "
[" #
]# $
{% &
ignore' -
}. /
;/ 0
} 	
public(( 
bool(( 
IgnoreFilter((  
=>((! #

;((1 2
private22 
class22  
AuthorizeAdminFilter22 *
:22+ , 
IAuthorizationFilter22- A
{33 	
private66 
readonly66 
bool66 !

;66/ 0
private77 
readonly77 
IPermissionService77 /
_permissionService770 B
;77B C
public==  
AuthorizeAdminFilter== '
(==' (
bool==( ,
ignoreFilter==- 9
,==9 :
IPermissionService==; M
permissionService==N _
)==_ `
{>> 

=?? 
ignoreFilter??  ,
;??, -
_permissionService@@ "
=@@# $
permissionService@@% 6
;@@6 7
}AA 
publicKK 
voidKK 
OnAuthorizationKK '
(KK' (&
AuthorizationFilterContextKK( B

)KKP Q
{LL 
ifMM 
(MM 

==MM" $
nullMM% )
)MM) *
throwNN 
newNN !
ArgumentNullExceptionNN 3
(NN3 4
nameofNN4 :
(NN: ;

)NNH I
)NNI J
;NNJ K
varQQ 
actionFilterQQ  
=QQ! "

.QQ0 1
ActionDescriptorQQ1 A
.QQA B
FilterDescriptorsQQB S
.RR 
WhereRR 
(RR 
filterDescriptorRR +
=>RR, .
filterDescriptorRR/ ?
.RR? @
ScopeRR@ E
==RRF H
FilterScopeRRI T
.RRT U
ActionRRU [
)RR[ \
.SS 
SelectSS 
(SS 
filterDescriptorSS ,
=>SS- /
filterDescriptorSS0 @
.SS@ A
FilterSSA G
)SSG H
.SSH I
OfTypeSSI O
<SSO P#
AuthorizeAdminAttributeSSP g
>SSg h
(SSh i
)SSi j
.SSj k
FirstOrDefaultSSk y
(SSy z
)SSz {
;SS{ |
ifVV 
(VV 
actionFilterVV  
?VV  !
.VV! "
IgnoreFilterVV" .
??VV/ 1

)VV? @
returnWW 
;WW 
ifYY 
(YY 
!YY 
DataSettingsManagerYY (
.YY( )
DatabaseIsInstalledYY) <
)YY< =
returnZZ 
;ZZ 
if]] 
(]] 

.]]! "
Filters]]" )
.]]) *
Any]]* -
(]]- .
filter]]. 4
=>]]5 7
filter]]8 >
is]]? A 
AuthorizeAdminFilter]]B V
)]]V W
)]]W X
{^^ 
if`` 
(`` 
!`` 
_permissionService`` +
.``+ ,
	Authorize``, 5
(``5 6&
StandardPermissionProvider``6 P
.``P Q
AccessAdminPanel``Q a
)``a b
)``b c

.aa% &
Resultaa& ,
=aa- .
newaa/ 2
ChallengeResultaa3 B
(aaB C
)aaC D
;aaD E
}bb 
}cc 
}ff 	
}ii 
}jj �D
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\CheckAccessClosedStoreAttribute.cs
	namespace
Nop
 
.
Web
.
	Framework
.
Mvc
.
Filters
{ 
public 

class +
CheckAccessClosedStoreAttribute 0
:1 2
TypeFilterAttribute3 F
{ 
private 
readonly 
bool 

;+ ,
public   +
CheckAccessClosedStoreAttribute   .
(  . /
bool  / 3
ignore  4 :
=  ; <
false  = B
)  B C
:  D E
base  F J
(  J K
typeof  K Q
(  Q R(
CheckAccessClosedStoreFilter  R n
)  n o
)  o p
{!! 	

="" 
ignore"" "
;""" #
	Arguments## 
=## 
new## 
object## "
[##" #
]### $
{##% &
ignore##' -
}##. /
;##/ 0
}$$ 	
public-- 
bool-- 
IgnoreFilter--  
=>--! #

;--1 2
private66 
class66 (
CheckAccessClosedStoreFilter66 2
:663 4

{77 	
private:: 
readonly:: 
bool:: !

;::/ 0
private;; 
readonly;; 
IPermissionService;; /
_permissionService;;0 B
;;;B C
private<< 
readonly<< 


;<<8 9
private== 
readonly== 


;==8 9
private>> 
readonly>> 
IUrlHelperFactory>> .
_urlHelperFactory>>/ @
;>>@ A
private?? 
readonly?? $
StoreInformationSettings?? 5%
_storeInformationSettings??6 O
;??O P
publicEE (
CheckAccessClosedStoreFilterEE /
(EE/ 0
boolEE0 4
ignoreFilterEE5 A
,EEA B
IPermissionServiceFF "
permissionServiceFF# 4
,FF4 5

storeContextGG *
,GG* +

topicServiceHH *
,HH* +
IUrlHelperFactoryII !
urlHelperFactoryII" 2
,II2 3$
StoreInformationSettingsJJ ($
storeInformationSettingsJJ) A
)JJA B
{KK 

=LL 
ignoreFilterLL  ,
;LL, -
_permissionServiceMM "
=MM# $
permissionServiceMM% 6
;MM6 7

=NN 
storeContextNN  ,
;NN, -

=OO 
topicServiceOO  ,
;OO, -
_urlHelperFactoryPP !
=PP" #
urlHelperFactoryPP$ 4
;PP4 5%
_storeInformationSettingsQQ )
=QQ* +$
storeInformationSettingsQQ, D
;QQD E
}RR 
public\\ 
void\\ 
OnActionExecuting\\ )
(\\) *"
ActionExecutingContext\\* @
context\\A H
)\\H I
{]] 
if^^ 
(^^ 
context^^ 
==^^ 
null^^ #
)^^# $
throw__ 
new__ !
ArgumentNullException__ 3
(__3 4
nameof__4 :
(__: ;
context__; B
)__B C
)__C D
;__D E
varbb 
actionFilterbb  
=bb! "
contextbb# *
.bb* +
ActionDescriptorbb+ ;
.bb; <
FilterDescriptorsbb< M
.cc 
Wherecc 
(cc 
filterDescriptorcc +
=>cc, .
filterDescriptorcc/ ?
.cc? @
Scopecc@ E
==ccF H
FilterScopeccI T
.ccT U
ActionccU [
)cc[ \
.dd 
Selectdd 
(dd 
filterDescriptordd ,
=>dd- /
filterDescriptordd0 @
.dd@ A
FilterddA G
)ddG H
.ddH I
OfTypeddI O
<ddO P+
CheckAccessClosedStoreAttributeddP o
>ddo p
(ddp q
)ddq r
.ddr s
FirstOrDefault	dds �
(
dd� �
)
dd� �
;
dd� �
ifgg 
(gg 
actionFiltergg  
?gg  !
.gg! "
IgnoreFiltergg" .
??gg/ 1

)gg? @
returnhh 
;hh 
ifjj 
(jj 
!jj 
DataSettingsManagerjj (
.jj( )
DatabaseIsInstalledjj) <
)jj< =
returnkk 
;kk 
ifnn 
(nn 
!nn %
_storeInformationSettingsnn .
.nn. /
StoreClosednn/ :
)nn: ;
returnoo 
;oo 
varrr 
actionDescriptorrr $
=rr% &
contextrr' .
.rr. /
ActionDescriptorrr/ ?
asrr@ B&
ControllerActionDescriptorrrC ]
;rr] ^
varss 

actionNamess 
=ss  
actionDescriptorss! 1
?ss1 2
.ss2 3

ActionNamess3 =
;ss= >
vartt 
controllerNamett "
=tt# $
actionDescriptortt% 5
?tt5 6
.tt6 7
ControllerNamett7 E
;ttE F
ifvv 
(vv 
stringvv 
.vv 

(vv( )

actionNamevv) 3
)vv3 4
||vv5 7
stringvv8 >
.vv> ?

(vvL M
controllerNamevvM [
)vv[ \
)vv\ ]
returnww 
;ww 
ifzz 
(zz 
controllerNamezz "
.zz" #
Equalszz# )
(zz) *
$strzz* 1
,zz1 2
StringComparisonzz3 C
.zzC D&
InvariantCultureIgnoreCasezzD ^
)zz^ _
&&zz` b

actionName{{ 
.{{ 
Equals{{ %
({{% &
$str{{& 4
,{{4 5
StringComparison{{6 F
.{{F G&
InvariantCultureIgnoreCase{{G a
){{a b
){{b c
{|| 
var~~ 
allowedTopicIds~~ '
=~~( )

.~~7 8
GetAllTopics~~8 D
(~~D E

.~~R S
CurrentStore~~S _
.~~_ `
Id~~` b
)~~b c
. 
Where 
( 
topic $
=>% '
topic( -
.- .%
AccessibleWhenStoreClosed. G
)G H
.H I
SelectI O
(O P
topicP U
=>V X
topicY ^
.^ _
Id_ a
)a b
;b c
var
�� 
requestedTopicId
�� (
=
��) *
context
��+ 2
.
��2 3
	RouteData
��3 <
.
��< =
Values
��= C
[
��C D
$str
��D M
]
��M N
as
��O Q
int
��R U
?
��U V
;
��V W
if
�� 
(
�� 
requestedTopicId
�� (
.
��( )
HasValue
��) 1
&&
��2 4
allowedTopicIds
��5 D
.
��D E
Contains
��E M
(
��M N
requestedTopicId
��N ^
.
��^ _
Value
��_ d
)
��d e
)
��e f
return
�� 
;
�� 
}
�� 
if
�� 
(
��  
_permissionService
�� &
.
��& '
	Authorize
��' 0
(
��0 1(
StandardPermissionProvider
��1 K
.
��K L
AccessClosedStore
��L ]
)
��] ^
)
��^ _
return
�� 
;
�� 
var
�� 
storeClosedUrl
�� "
=
��# $
_urlHelperFactory
��% 6
.
��6 7
GetUrlHelper
��7 C
(
��C D
context
��D K
)
��K L
.
��L M
RouteUrl
��M U
(
��U V
$str
��V c
)
��c d
;
��d e
context
�� 
.
�� 
Result
�� 
=
��  
new
��! $
RedirectResult
��% 3
(
��3 4
storeClosedUrl
��4 B
)
��B C
;
��C D
}
�� 
public
�� 
void
�� 
OnActionExecuted
�� (
(
��( )#
ActionExecutedContext
��) >
context
��? F
)
��F G
{
�� 
}
�� 
}
�� 	
}
�� 
}�� �!
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\CheckAccessPublicStoreAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{		 
public

class
CheckAccessPublicStoreAttribute
:
TypeFilterAttribute
{ 
private 
readonly 
bool 

;+ ,
public +
CheckAccessPublicStoreAttribute .
(. /
bool/ 3
ignore4 :
=; <
false= B
)B C
:D E
baseF J
(J K
typeofK Q
(Q R(
CheckAccessPublicStoreFilterR n
)n o
)o p
{ 	

= 
ignore "
;" #
	Arguments 
= 
new 
object "
[" #
]# $
{% &
ignore' -
}. /
;/ 0
} 	
public(( 
bool(( 
IgnoreFilter((  
=>((! #

;((1 2
private11 
class11 (
CheckAccessPublicStoreFilter11 2
:113 4 
IAuthorizationFilter115 I
{22 	
private55 
readonly55 
bool55 !

;55/ 0
private66 
readonly66 
IPermissionService66 /
_permissionService660 B
;66B C
public<< (
CheckAccessPublicStoreFilter<< /
(<</ 0
bool<<0 4
ignoreFilter<<5 A
,<<A B
IPermissionService<<C U
permissionService<<V g
)<<g h
{== 

=>> 
ignoreFilter>>  ,
;>>, -
_permissionService?? "
=??# $
permissionService??% 6
;??6 7
}@@ 
publicJJ 
voidJJ 
OnAuthorizationJJ '
(JJ' (&
AuthorizationFilterContextJJ( B

)JJP Q
{KK 
ifLL 
(LL 

==LL" $
nullLL% )
)LL) *
throwMM 
newMM !
ArgumentNullExceptionMM 3
(MM3 4
nameofMM4 :
(MM: ;

)MMH I
)MMI J
;MMJ K
varPP 
actionFilterPP  
=PP! "

.PP0 1
ActionDescriptorPP1 A
.PPA B
FilterDescriptorsPPB S
.QQ 
WhereQQ 
(QQ 
filterDescriptorQQ +
=>QQ, .
filterDescriptorQQ/ ?
.QQ? @
ScopeQQ@ E
==QQF H
FilterScopeQQI T
.QQT U
ActionQQU [
)QQ[ \
.RR 
SelectRR 
(RR 
filterDescriptorRR ,
=>RR- /
filterDescriptorRR0 @
.RR@ A
FilterRRA G
)RRG H
.RRH I
OfTypeRRI O
<RRO P+
CheckAccessPublicStoreAttributeRRP o
>RRo p
(RRp q
)RRq r
.RRr s
FirstOrDefault	RRs �
(
RR� �
)
RR� �
;
RR� �
ifUU 
(UU 
actionFilterUU  
?UU  !
.UU! "
IgnoreFilterUU" .
??UU/ 1

)UU? @
returnVV 
;VV 
ifXX 
(XX 
!XX 
DataSettingsManagerXX (
.XX( )
DatabaseIsInstalledXX) <
)XX< =
returnYY 
;YY 
if\\ 
(\\ 
_permissionService\\ &
.\\& '
	Authorize\\' 0
(\\0 1&
StandardPermissionProvider\\1 K
.\\K L&
PublicStoreAllowNavigation\\L f
)\\f g
)\\g h
return]] 
;]] 

.`` 
Result`` $
=``% &
new``' *
ChallengeResult``+ :
(``: ;
)``; <
;``< =
}aa 
}dd 	
}gg 
}hh �=
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\HttpsRequirementAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{ 
public 

class %
HttpsRequirementAttribute *
:+ ,
TypeFilterAttribute- @
{ 
private 
readonly 
SslRequirement '
_sslRequirement( 7
;7 8
public %
HttpsRequirementAttribute (
(( )
SslRequirement) 7
sslRequirement8 F
)F G
:H I
baseJ N
(N O
typeofO U
(U V"
HttpsRequirementFilterV l
)l m
)m n
{ 	
_sslRequirement   
=   
sslRequirement   ,
;  , -
	Arguments!! 
=!! 
new!! 
object!! "
[!!" #
]!!# $
{!!% &
sslRequirement!!' 5
}!!6 7
;!!7 8
}"" 	
public++ 
SslRequirement++ 
SslRequirement++ ,
=>++- /
_sslRequirement++0 ?
;++? @
private44 
class44 "
HttpsRequirementFilter44 ,
:44- . 
IAuthorizationFilter44/ C
{55 	
private88 
SslRequirement88 "
_sslRequirement88# 2
;882 3
private99 
readonly99 


;998 9
private:: 
readonly:: 

IWebHelper:: '

_webHelper::( 2
;::2 3
private;; 
readonly;; 
SecuritySettings;; -
_securitySettings;;. ?
;;;? @
publicAA "
HttpsRequirementFilterAA )
(AA) *
SslRequirementAA* 8
sslRequirementAA9 G
,AAG H

storeContextBB *
,BB* +

IWebHelperCC 
	webHelperCC $
,CC$ %
SecuritySettingsDD  
securitySettingsDD! 1
)DD1 2
{EE 
_sslRequirementFF 
=FF  !
sslRequirementFF" 0
;FF0 1

=GG 
storeContextGG  ,
;GG, -

_webHelperHH 
=HH 
	webHelperHH &
;HH& '
_securitySettingsII !
=II" #
securitySettingsII$ 4
;II4 5
}JJ 
	protectedUU 
voidUU 
RedirectRequestUU *
(UU* +&
AuthorizationFilterContextUU+ E

,UUS T
boolUUU Y
useSslUUZ `
)UU` a
{VV 
varXX $
currentConnectionSecuredXX ,
=XX- .

_webHelperXX/ 9
.XX9 :&
IsCurrentConnectionSecuredXX: T
(XXT U
)XXU V
;XXV W
if[[ 
([[ 
useSsl[[ 
&&[[ 
![[ $
currentConnectionSecured[[ 7
&&[[8 :

.[[H I
CurrentStore[[I U
.[[U V

SslEnabled[[V `
)[[` a

.\\! "
Result\\" (
=\\) *
new\\+ .
RedirectResult\\/ =
(\\= >

_webHelper\\> H
.\\H I
GetThisPageUrl\\I W
(\\W X
true\\X \
,\\\ ]
true\\^ b
)\\b c
,\\c d
true\\e i
)\\i j
;\\j k
if__ 
(__ 
!__ 
useSsl__ 
&&__ $
currentConnectionSecured__ 7
)__7 8

.``! "
Result``" (
=``) *
new``+ .
RedirectResult``/ =
(``= >

_webHelper``> H
.``H I
GetThisPageUrl``I W
(``W X
true``X \
,``\ ]
false``^ c
)``c d
,``d e
true``f j
)``j k
;``k l
}aa 
publickk 
voidkk 
OnAuthorizationkk '
(kk' (&
AuthorizationFilterContextkk( B

)kkP Q
{ll 
ifmm 
(mm 

==mm" $
nullmm% )
)mm) *
thrownn 
newnn !
ArgumentNullExceptionnn 3
(nn3 4
nameofnn4 :
(nn: ;

)nnH I
)nnI J
;nnJ K
ifpp 
(pp 

.pp! "
HttpContextpp" -
.pp- .
Requestpp. 5
==pp6 8
nullpp9 =
)pp= >
returnqq 
;qq 
iftt 
(tt 
!tt 

.tt" #
HttpContexttt# .
.tt. /
Requesttt/ 6
.tt6 7
Methodtt7 =
.tt= >
Equalstt> D
(ttD E
WebRequestMethodsttE V
.ttV W
HttpttW [
.tt[ \
Gettt\ _
,tt_ `
StringComparisontta q
.ttq r'
InvariantCultureIgnoreCase	ttr �
)
tt� �
)
tt� �
returnuu 
;uu 
ifww 
(ww 
!ww 
DataSettingsManagerww (
.ww( )
DatabaseIsInstalledww) <
)ww< =
returnxx 
;xx 
var{{ 
actionFilter{{  
={{! "

.{{0 1
ActionDescriptor{{1 A
.{{A B
FilterDescriptors{{B S
.|| 
Where|| 
(|| 
filterDescriptor|| +
=>||, .
filterDescriptor||/ ?
.||? @
Scope||@ E
==||F H
FilterScope||I T
.||T U
Action||U [
)||[ \
.}} 
Select}} 
(}} 
filterDescriptor}} ,
=>}}- /
filterDescriptor}}0 @
.}}@ A
Filter}}A G
)}}G H
.}}H I
OfType}}I O
<}}O P%
HttpsRequirementAttribute}}P i
>}}i j
(}}j k
)}}k l
.}}l m
FirstOrDefault}}m {
(}}{ |
)}}| }
;}}} ~
var 
sslRequirement "
=# $
actionFilter% 1
?1 2
.2 3
SslRequirement3 A
??B D
_sslRequirementE T
;T U
if
�� 
(
�� 
_securitySettings
�� %
.
��% &!
ForceSslForAllPages
��& 9
)
��9 :
sslRequirement
�� "
=
��# $
SslRequirement
��% 3
.
��3 4
Yes
��4 7
;
��7 8
switch
�� 
(
�� 
sslRequirement
�� &
)
��& '
{
�� 
case
�� 
SslRequirement
�� '
.
��' (
Yes
��( +
:
��+ ,
RedirectRequest
�� '
(
��' (

��( 5
,
��5 6
true
��7 ;
)
��; <
;
��< =
break
�� 
;
�� 
case
�� 
SslRequirement
�� '
.
��' (
No
��( *
:
��* +
RedirectRequest
�� '
(
��' (

��( 5
,
��5 6
false
��7 <
)
��< =
;
��= >
break
�� 
;
�� 
case
�� 
SslRequirement
�� '
.
��' (
NoMatter
��( 0
:
��0 1
break
�� 
;
�� 
default
�� 
:
�� 
throw
�� 
new
�� !
NopException
��" .
(
��. /
$str
��/ W
)
��W X
;
��X Y
}
�� 
}
�� 
}
�� 	
}
�� 
}�� �@
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\CheckDiscountCouponAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{ 
public 

class (
CheckDiscountCouponAttribute -
:. /
TypeFilterAttribute0 C
{ 
public (
CheckDiscountCouponAttribute +
(+ ,
), -
:. /
base0 4
(4 5
typeof5 ;
(; <%
CheckDiscountCouponFilter< U
)U V
)V W
{ 	
} 	
private'' 
class'' %
CheckDiscountCouponFilter'' /
:''0 1

{(( 	
private++ 
readonly++ 
ICustomerService++ -
_customerService++. >
;++> ?
private,, 
readonly,, 
IDiscountService,, -
_discountService,,. >
;,,> ?
private-- 
readonly--  
ILocalizationService-- 1 
_localizationService--2 F
;--F G
private.. 
readonly..  
INotificationService.. 1 
_notificationService..2 F
;..F G
private// 
readonly// 
IWorkContext// )
_workContext//* 6
;//6 7
public55 %
CheckDiscountCouponFilter55 ,
(55, -
ICustomerService55- =
customerService55> M
,55M N
IDiscountService66  
discountService66! 0
,660 1 
ILocalizationService77 $
localizationService77% 8
,778 9 
INotificationService88 $
notificationService88% 8
,888 9
IWorkContext99 
workContext99 (
)99( )
{:: 
_customerService;;  
=;;! "
customerService;;# 2
;;;2 3
_discountService<<  
=<<! "
discountService<<# 2
;<<2 3 
_localizationService== $
===% &
localizationService==' :
;==: ; 
_notificationService>> $
=>>% &
notificationService>>' :
;>>: ;
_workContext?? 
=?? 
workContext?? *
;??* +
}@@ 
publicJJ 
voidJJ 
OnActionExecutingJJ )
(JJ) *"
ActionExecutingContextJJ* @
contextJJA H
)JJH I
{KK 
ifLL 
(LL 
contextLL 
==LL 
nullLL #
)LL# $
throwMM 
newMM !
ArgumentNullExceptionMM 3
(MM3 4
nameofMM4 :
(MM: ;
contextMM; B
)MMB C
)MMC D
;MMD E
ifPP 
(PP 
!PP 
contextPP 
.PP 
HttpContextPP (
.PP( )
RequestPP) 0
?PP0 1
.PP1 2
QueryPP2 7
?PP7 8
.PP8 9
AnyPP9 <
(PP< =
)PP= >
??PP? A
truePPB F
)PPF G
returnQQ 
;QQ 
ifTT 
(TT 
!TT 
contextTT 
.TT 
HttpContextTT (
.TT( )
RequestTT) 0
.TT0 1
MethodTT1 7
.TT7 8
EqualsTT8 >
(TT> ?
WebRequestMethodsTT? P
.TTP Q
HttpTTQ U
.TTU V
GetTTV Y
,TTY Z
StringComparisonTT[ k
.TTk l'
InvariantCultureIgnoreCase	TTl �
)
TT� �
)
TT� �
returnUU 
;UU 
ifWW 
(WW 
!WW 
DataSettingsManagerWW (
.WW( )
DatabaseIsInstalledWW) <
)WW< =
returnXX 
;XX 
varZZ 
currentCustomerZZ #
=ZZ$ %
_workContextZZ& 2
.ZZ2 3
CurrentCustomerZZ3 B
;ZZB C
if]] 
(]] 
currentCustomer]] #
.]]# $!
IsSearchEngineAccount]]$ 9
(]]9 :
)]]: ;
)]]; <
return^^ 
;^^ 
varaa 
queryKeyaa 
=aa 
NopDiscountDefaultsaa 2
.aa2 3(
DiscountCouponQueryParameteraa3 O
;aaO P
ifbb 
(bb 
!bb 
contextbb 
.bb 
HttpContextbb (
.bb( )
Requestbb) 0
.bb0 1
Querybb1 6
.bb6 7
TryGetValuebb7 B
(bbB C
queryKeybbC K
,bbK L
outbbM P
varbbQ T
couponCodesbbU `
)bb` a
||bbb d
StringValuesbbe q
.bbq r

(	bb �
couponCodes
bb� �
)
bb� �
)
bb� �
returncc 
;cc 
varff 
	discountsff 
=ff 
couponCodesff  +
.gg 

SelectManygg 
(gg  

couponCodegg  *
=>gg+ -
_discountServicegg. >
.gg> ?%
GetAllDiscountsForCachinggg? X
(ggX Y

couponCodeggY c
:ggc d

couponCodegge o
)ggo p
)ggp q
.hh 
Distincthh 
(hh 
)hh 
.ii 
ToListii 
(ii 
)ii 
;ii 
varkk 
validCouponCodeskk $
=kk% &
newkk' *
Listkk+ /
<kk/ 0
stringkk0 6
>kk6 7
(kk7 8
)kk8 9
;kk9 :
foreachmm 
(mm 
varmm 
discountmm %
inmm& (
	discountsmm) 2
)mm2 3
{nn 
ifoo 
(oo 
!oo 
_discountServiceoo )
.oo) *
ValidateDiscountoo* :
(oo: ;
discountoo; C
,ooC D
currentCustomerooE T
,ooT U
couponCodesooV a
.ooa b
ToArrayoob i
(ooi j
)ooj k
)ook l
.ool m
IsValidoom t
)oot u
continuepp  
;pp  !
_customerServicess $
.ss$ %#
ApplyDiscountCouponCodess% <
(ss< =
currentCustomerss= L
,ssL M
discountssN V
.ssV W

CouponCodessW a
)ssa b
;ssb c
validCouponCodestt $
.tt$ %
Addtt% (
(tt( )
discounttt) 1
.tt1 2

CouponCodett2 <
)tt< =
;tt= >
}uu 
foreachxx 
(xx 
varxx 
validCouponCodexx ,
inxx- /
validCouponCodesxx0 @
.xx@ A
DistinctxxA I
(xxI J
)xxJ K
)xxK L
{yy  
_notificationServicezz (
.zz( )
SuccessNotificationzz) <
(zz< =
string{{ 
.{{ 
Format{{ %
({{% & 
_localizationService{{& :
.{{: ;
GetResource{{; F
({{F G
$str{{G r
){{r s
,{{s t
validCouponCode|| +
)||+ ,
)||, -
;||- .
}}} 
foreach
�� 
(
�� 
var
�� 
invalidCouponCode
�� .
in
��/ 1
couponCodes
��2 =
.
��= >
Except
��> D
(
��D E
validCouponCodes
�� $
.
��$ %
Distinct
��% -
(
��- .
)
��. /
)
��/ 0
)
��0 1
{
�� "
_notificationService
�� (
.
��( )!
WarningNotification
��) <
(
��< =
string
�� 
.
�� 
Format
�� %
(
��% &"
_localizationService
��& :
.
��: ;
GetResource
��; F
(
��F G
$str
��G p
)
��p q
,
��q r
invalidCouponCode
�� -
)
��- .
)
��. /
;
��/ 0
}
�� 
}
�� 
public
�� 
void
�� 
OnActionExecuted
�� (
(
��( )#
ActionExecutedContext
��) >
context
��? F
)
��F G
{
�� 
}
�� 
}
�� 	
}
�� 
}�� �,
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\CheckLanguageSeoCodeAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{
public 

class )
CheckLanguageSeoCodeAttribute .
:/ 0
TypeFilterAttribute1 D
{ 
public )
CheckLanguageSeoCodeAttribute ,
(, -
)- .
:/ 0
base1 5
(5 6
typeof6 <
(< =&
CheckLanguageSeoCodeFilter= W
)W X
)X Y
{ 	
} 	
private## 
class## &
CheckLanguageSeoCodeFilter## 0
:##1 2

{$$ 	
private'' 
readonly'' 
ILanguageService'' -
_languageService''. >
;''> ?
private(( 
readonly(( 

IWebHelper(( '

_webHelper((( 2
;((2 3
private)) 
readonly)) 
IWorkContext)) )
_workContext))* 6
;))6 7
private** 
readonly**  
LocalizationSettings** 1!
_localizationSettings**2 G
;**G H
public00 &
CheckLanguageSeoCodeFilter00 -
(00- .
ILanguageService00. >
languageService00? N
,00N O

IWebHelper11 
	webHelper11 $
,11$ %
IWorkContext22 
workContext22 (
,22( ) 
LocalizationSettings33 $ 
localizationSettings33% 9
)339 :
{44 
_languageService55  
=55! "
languageService55# 2
;552 3

_webHelper66 
=66 
	webHelper66 &
;66& '
_workContext77 
=77 
workContext77 *
;77* +!
_localizationSettings88 %
=88& ' 
localizationSettings88( <
;88< =
}99 
publicCC 
voidCC 
OnActionExecutingCC )
(CC) *"
ActionExecutingContextCC* @
contextCCA H
)CCH I
{DD 
ifEE 
(EE 
contextEE 
==EE 
nullEE #
)EE# $
throwFF 
newFF !
ArgumentNullExceptionFF 3
(FF3 4
nameofFF4 :
(FF: ;
contextFF; B
)FFB C
)FFC D
;FFD E
ifHH 
(HH 
contextHH 
.HH 
HttpContextHH '
.HH' (
RequestHH( /
==HH0 2
nullHH3 7
)HH7 8
returnII 
;II 
ifLL 
(LL 
!LL 
contextLL 
.LL 
HttpContextLL (
.LL( )
RequestLL) 0
.LL0 1
MethodLL1 7
.LL7 8
EqualsLL8 >
(LL> ?
WebRequestMethodsLL? P
.LLP Q
HttpLLQ U
.LLU V
GetLLV Y
,LLY Z
StringComparisonLL[ k
.LLk l'
InvariantCultureIgnoreCase	LLl �
)
LL� �
)
LL� �
returnMM 
;MM 
ifOO 
(OO 
!OO 
DataSettingsManagerOO (
.OO( )
DatabaseIsInstalledOO) <
)OO< =
returnPP 
;PP 
ifSS 
(SS 
!SS !
_localizationSettingsSS *
.SS* +.
"SeoFriendlyUrlsForLanguagesEnabledSS+ M
)SSM N
returnTT 
;TT 
ifWW 
(WW 
contextWW 
.WW 
	RouteDataWW %
?WW% &
.WW& '
RoutersWW' .
==WW/ 1
nullWW2 6
||WW7 9
!WW: ;
contextWW; B
.WWB C
	RouteDataWWC L
.WWL M
RoutersWWM T
.WWT U
ToListWWU [
(WW[ \
)WW\ ]
.WW] ^
AnyWW^ a
(WWa b
rWWb c
=>WWd f
rWWg h
isWWi k
LocalizedRouteWWl z
)WWz {
)WW{ |
returnXX 
;XX 
var[[ 
pageUrl[[ 
=[[ 

_webHelper[[ (
.[[( )
	GetRawUrl[[) 2
([[2 3
context[[3 :
.[[: ;
HttpContext[[; F
.[[F G
Request[[G N
)[[N O
;[[O P
if\\ 
(\\ 
pageUrl\\ 
.\\ 
IsLocalizedUrl\\ *
(\\* +
context\\+ 2
.\\2 3
HttpContext\\3 >
.\\> ?
Request\\? F
.\\F G
PathBase\\G O
,\\O P
true\\Q U
,\\U V
out\\W Z
Language\\[ c
_\\d e
)\\e f
)\\f g
return]] 
;]] 
pageUrl`` 
=`` 
pageUrl`` !
.``! "#
AddLanguageSeoCodeToUrl``" 9
(``9 :
context``: A
.``A B
HttpContext``B M
.``M N
Request``N U
.``U V
PathBase``V ^
,``^ _
true``` d
,``d e
_workContext``f r
.``r s
WorkingLanguage	``s �
)
``� �
;
``� �
contextaa 
.aa 
Resultaa 
=aa  
newaa! $
RedirectResultaa% 3
(aa3 4
pageUrlaa4 ;
,aa; <
falseaa= B
)aaB C
;aaC D
}bb 
publichh 
voidhh 
OnActionExecutedhh (
(hh( )!
ActionExecutedContexthh) >
contexthh? F
)hhF G
{ii 
}kk 
}nn 	
}qq 
}rr �6
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\CheckAffiliateAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{
public 

class #
CheckAffiliateAttribute (
:) *
TypeFilterAttribute+ >
{ 
public #
CheckAffiliateAttribute &
(& '
)' (
:) *
base+ /
(/ 0
typeof0 6
(6 7 
CheckAffiliateFilter7 K
)K L
)L M
{ 	
} 	
private## 
class##  
CheckAffiliateFilter## *
:##+ ,

{$$ 	
private'' 
const'' 
string''  -
!AFFILIATE_ID_QUERY_PARAMETER_NAME''! B
=''C D
$str''E R
;''R S
private(( 
const(( 
string((  :
.AFFILIATE_FRIENDLYURLNAME_QUERY_PARAMETER_NAME((! O
=((P Q
$str((R ]
;((] ^
private.. 
readonly.. 
IAffiliateService.. .
_affiliateService../ @
;..@ A
private// 
readonly// 
ICustomerService// -
_customerService//. >
;//> ?
private00 
readonly00 
IWorkContext00 )
_workContext00* 6
;006 7
public66  
CheckAffiliateFilter66 '
(66' (
IAffiliateService66( 9
affiliateService66: J
,66J K
ICustomerService77  
customerService77! 0
,770 1
IWorkContext88 
workContext88 (
)88( )
{99 
_affiliateService:: !
=::" #
affiliateService::$ 4
;::4 5
_customerService;;  
=;;! "
customerService;;# 2
;;;2 3
_workContext<< 
=<< 
workContext<< *
;<<* +
}== 
	protectedGG 
voidGG "
SetCustomerAffiliateIdGG 1
(GG1 2
	AffiliateGG2 ;
	affiliateGG< E
)GGE F
{HH 
ifII 
(II 
	affiliateII 
==II  
nullII! %
||II& (
	affiliateII) 2
.II2 3
DeletedII3 :
||II; =
!II> ?
	affiliateII? H
.IIH I
ActiveIII O
)IIO P
returnJJ 
;JJ 
ifLL 
(LL 
	affiliateLL 
.LL 
IdLL  
==LL! #
_workContextLL$ 0
.LL0 1
CurrentCustomerLL1 @
.LL@ A
AffiliateIdLLA L
)LLL M
returnMM 
;MM 
ifPP 
(PP 
_workContextPP  
.PP  !
CurrentCustomerPP! 0
.PP0 1!
IsSearchEngineAccountPP1 F
(PPF G
)PPG H
)PPH I
returnQQ 
;QQ 
_workContextTT 
.TT 
CurrentCustomerTT ,
.TT, -
AffiliateIdTT- 8
=TT9 :
	affiliateTT; D
.TTD E
IdTTE G
;TTG H
_customerServiceUU  
.UU  !
UpdateCustomerUU! /
(UU/ 0
_workContextUU0 <
.UU< =
CurrentCustomerUU= L
)UUL M
;UUM N
}VV 
public`` 
void`` 
OnActionExecuting`` )
(``) *"
ActionExecutingContext``* @
context``A H
)``H I
{aa 
ifbb 
(bb 
contextbb 
==bb 
nullbb #
)bb# $
throwcc 
newcc !
ArgumentNullExceptioncc 3
(cc3 4
nameofcc4 :
(cc: ;
contextcc; B
)ccB C
)ccC D
;ccD E
varff 
requestff 
=ff 
contextff %
.ff% &
HttpContextff& 1
.ff1 2
Requestff2 9
;ff9 :
ifgg 
(gg 
requestgg 
?gg 
.gg 
Querygg "
==gg# %
nullgg& *
||gg+ -
!gg. /
requestgg/ 6
.gg6 7
Querygg7 <
.gg< =
Anygg= @
(gg@ A
)ggA B
)ggB C
returnhh 
;hh 
ifjj 
(jj 
!jj 
DataSettingsManagerjj (
.jj( )
DatabaseIsInstalledjj) <
)jj< =
returnkk 
;kk 
varnn 
affiliateIdsnn  
=nn! "
requestnn# *
.nn* +
Querynn+ 0
[nn0 1-
!AFFILIATE_ID_QUERY_PARAMETER_NAMEnn1 R
]nnR S
;nnS T
ifoo 
(oo 
affiliateIdsoo  
.oo  !
Anyoo! $
(oo$ %
)oo% &
&&oo' )
intoo* -
.oo- .
TryParseoo. 6
(oo6 7
affiliateIdsoo7 C
.ooC D
FirstOrDefaultooD R
(ooR S
)ooS T
,ooT U
outooV Y
intooZ ]
affiliateIdoo^ i
)ooi j
&&pp 
affiliateIdpp "
>pp# $
$numpp% &
&&pp' )
affiliateIdpp* 5
!=pp6 8
_workContextpp9 E
.ppE F
CurrentCustomerppF U
.ppU V
AffiliateIdppV a
)ppa b
{qq "
SetCustomerAffiliateIdrr *
(rr* +
_affiliateServicerr+ <
.rr< =
GetAffiliateByIdrr= M
(rrM N
affiliateIdrrN Y
)rrY Z
)rrZ [
;rr[ \
returnss 
;ss 
}tt 
varww 
affiliateNamesww "
=ww# $
requestww% ,
.ww, -
Queryww- 2
[ww2 3:
.AFFILIATE_FRIENDLYURLNAME_QUERY_PARAMETER_NAMEww3 a
]wwa b
;wwb c
ifxx 
(xx 
affiliateNamesxx "
.xx" #
Anyxx# &
(xx& '
)xx' (
)xx( )
{yy 
varzz 

=zz& '
affiliateNameszz( 6
.zz6 7
FirstOrDefaultzz7 E
(zzE F
)zzF G
;zzG H
if{{ 
({{ 
!{{ 
string{{ 
.{{  

({{- .

){{; <
){{< ="
SetCustomerAffiliateId|| .
(||. /
_affiliateService||/ @
.||@ A)
GetAffiliateByFriendlyUrlName||A ^
(||^ _

)||l m
)||m n
;||n o
}}} 
}~~ 
public
�� 
void
�� 
OnActionExecuted
�� (
(
��( )#
ActionExecutedContext
��) >
context
��? F
)
��F G
{
�� 
}
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\ParameterBasedOnFormNameAndValueAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{ 
public

 

class

 5
)ParameterBasedOnFormNameAndValueAttribute

 :
:

; <
TypeFilterAttribute

= P
{ 
public 5
)ParameterBasedOnFormNameAndValueAttribute 8
(8 9
string9 ?
formKeyName@ K
,K L
stringM S
	formValueT ]
,] ^
string_ e
actionParameterNamef y
)y z
: 
base 
( 
typeof 
( 2
&ParameterBasedOnFormNameAndValueFilter @
)@ A
)A B
{ 	
	Arguments 
= 
new 
object "
[" #
]# $
{% &
formKeyName' 2
,2 3
	formValue4 =
,= >
actionParameterName? R
}S T
;T U
} 	
private!! 
class!! 2
&ParameterBasedOnFormNameAndValueFilter!! <
:!!= >

{"" 	
private%% 
readonly%% 
string%% #
_formKeyName%%$ 0
;%%0 1
private&& 
readonly&& 
string&& #

_formValue&&$ .
;&&. /
private'' 
readonly'' 
string'' # 
_actionParameterName''$ 8
;''8 9
public-- 2
&ParameterBasedOnFormNameAndValueFilter-- 9
(--9 :
string--: @
formKeyName--A L
,--L M
string--N T
	formValue--U ^
,--^ _
string--` f
actionParameterName--g z
)--z {
{.. 
_formKeyName// 
=// 
formKeyName// *
;//* +

_formValue00 
=00 
	formValue00 &
;00& ' 
_actionParameterName11 $
=11% &
actionParameterName11' :
;11: ;
}22 
public<< 
void<< 
OnActionExecuting<< )
(<<) *"
ActionExecutingContext<<* @
context<<A H
)<<H I
{== 
if>> 
(>> 
context>> 
==>> 
null>> #
)>># $
throw?? 
new?? !
ArgumentNullException?? 3
(??3 4
nameof??4 :
(??: ;
context??; B
)??B C
)??C D
;??D E
ifAA 
(AA 
contextAA 
.AA 
HttpContextAA '
.AA' (
RequestAA( /
==AA0 2
nullAA3 7
)AA7 8
returnBB 
;BB 
varFF 
	formValueFF 
=FF 
contextFF  '
.FF' (
HttpContextFF( 3
.FF3 4
RequestFF4 ;
.FF; <
FormFF< @
[FF@ A
_formKeyNameFFA M
]FFM N
;FFN O
contextGG 
.GG 
ActionArgumentsGG '
[GG' ( 
_actionParameterNameGG( <
]GG< =
=GG> ?
!GG@ A
stringGGA G
.GGG H

(GGU V
	formValueGGV _
)GG_ `
&&GGa c
	formValueGGd m
.GGm n
EqualsGGn t
(GGt u

_formValueGGu 
)	GG �
;
GG� �
}HH 
publicNN 
voidNN 
OnActionExecutedNN (
(NN( )!
ActionExecutedContextNN) >
contextNN? F
)NNF G
{OO 
}QQ 
}TT 	
}WW 
}XX �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\ParameterBasedOnFormNameAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{ 
public 

class -
!ParameterBasedOnFormNameAttribute 2
:3 4
TypeFilterAttribute5 H
{ 
public -
!ParameterBasedOnFormNameAttribute 0
(0 1
string1 7
formKeyName8 C
,C D
stringE K
actionParameterNameL _
)_ `
:a b
basec g
(g h
typeofh n
(n o+
ParameterBasedOnFormNameFilter	o �
)
� �
)
� �
{ 	
	Arguments 
= 
new 
object "
[" #
]# $
{% &
formKeyName' 2
,2 3
actionParameterName4 G
}H I
;I J
} 	
private   
class   *
ParameterBasedOnFormNameFilter   4
:  5 6

{!! 	
private$$ 
readonly$$ 
string$$ #
_formKeyName$$$ 0
;$$0 1
private%% 
readonly%% 
string%% # 
_actionParameterName%%$ 8
;%%8 9
public++ *
ParameterBasedOnFormNameFilter++ 1
(++1 2
string++2 8
formKeyName++9 D
,++D E
string++F L
actionParameterName++M `
)++` a
{,, 
_formKeyName-- 
=-- 
formKeyName-- *
;--* + 
_actionParameterName.. $
=..% &
actionParameterName..' :
;..: ;
}// 
public99 
void99 
OnActionExecuting99 )
(99) *"
ActionExecutingContext99* @
context99A H
)99H I
{:: 
if;; 
(;; 
context;; 
==;; 
null;; #
);;# $
throw<< 
new<< !
ArgumentNullException<< 3
(<<3 4
nameof<<4 :
(<<: ;
context<<; B
)<<B C
)<<C D
;<<D E
if>> 
(>> 
context>> 
.>> 
HttpContext>> '
.>>' (
Request>>( /
==>>0 2
null>>3 7
)>>7 8
return?? 
;?? 
contextBB 
.BB 
ActionArgumentsBB '
[BB' ( 
_actionParameterNameBB( <
]BB< =
=BB> ?
contextBB@ G
.BBG H
HttpContextBBH S
.BBS T
RequestBBT [
.BB[ \
FormBB\ `
.BB` a
KeysBBa e
.BBe f
AnyBBf i
(BBi j
keyBBj m
=>BBn p
keyBBq t
.BBt u
EqualsBBu {
(BB{ |
_formKeyName	BB| �
)
BB� �
)
BB� �
;
BB� �
}GG 
publicMM 
voidMM 
OnActionExecutedMM (
(MM( )!
ActionExecutedContextMM) >
contextMM? F
)MMF G
{NN 
}PP 
}SS 	
}VV 
}WW �&
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\PublicAntiForgeryAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{ 
public 

class &
PublicAntiForgeryAttribute +
:, -
TypeFilterAttribute. A
{ 
private 
readonly 
bool 

;+ ,
public &
PublicAntiForgeryAttribute )
() *
bool* .
ignore/ 5
=6 7
false8 =
)= >
:? @
baseA E
(E F
typeofF L
(L M#
PublicAntiForgeryFilterM d
)d e
)e f
{ 	

=   
ignore   "
;  " #
	Arguments!! 
=!! 
new!! 
object!! "
[!!" #
]!!# $
{!!% &
ignore!!' -
}!!. /
;!!/ 0
}"" 	
public++ 
bool++ 
IgnoreFilter++  
=>++! #

;++1 2
private44 
class44 #
PublicAntiForgeryFilter44 -
:44. /7
+ValidateAntiforgeryTokenAuthorizationFilter440 [
{55 	
private88 
readonly88 
bool88 !

;88/ 0
private99 
readonly99 
SecuritySettings99 -
_securitySettings99. ?
;99? @
public?? #
PublicAntiForgeryFilter?? *
(??* +
bool??+ /
ignoreFilter??0 <
,??< =
SecuritySettings@@  
securitySettings@@! 1
,@@1 2
IAntiforgeryAA 
antiforgeryAA (
,AA( )
ILoggerFactoryBB 

)BB, -
:BB. /
baseBB0 4
(BB4 5
antiforgeryBB5 @
,BB@ A

)BBO P
{CC 

=DD 
ignoreFilterDD  ,
;DD, -
_securitySettingsEE !
=EE" #
securitySettingsEE$ 4
;EE4 5
}FF 
	protectedQQ 
overrideQQ 
boolQQ #
ShouldValidateQQ$ 2
(QQ2 3&
AuthorizationFilterContextQQ3 M
contextQQN U
)QQU V
{RR 
ifSS 
(SS 
!SS 
baseSS 
.SS 
ShouldValidateSS (
(SS( )
contextSS) 0
)SS0 1
)SS1 2
returnTT 
falseTT  
;TT  !
ifVV 
(VV 
contextVV 
.VV 
HttpContextVV '
.VV' (
RequestVV( /
==VV0 2
nullVV3 7
)VV7 8
returnWW 
falseWW  
;WW  !
ifZZ 
(ZZ 
contextZZ 
.ZZ 
HttpContextZZ '
.ZZ' (
RequestZZ( /
.ZZ/ 0
MethodZZ0 6
.ZZ6 7
EqualsZZ7 =
(ZZ= >
WebRequestMethodsZZ> O
.ZZO P
HttpZZP T
.ZZT U
GetZZU X
,ZZX Y
StringComparisonZZZ j
.ZZj k'
InvariantCultureIgnoreCase	ZZk �
)
ZZ� �
)
ZZ� �
return[[ 
false[[  
;[[  !
if]] 
(]] 
!]] 
_securitySettings]] &
.]]& '.
"EnableXsrfProtectionForPublicStore]]' I
)]]I J
return^^ 
false^^  
;^^  !
varaa 
actionFilteraa  
=aa! "
contextaa# *
.aa* +
ActionDescriptoraa+ ;
.aa; <
FilterDescriptorsaa< M
.bb 
Wherebb 
(bb 
filterDescriptorbb +
=>bb, .
filterDescriptorbb/ ?
.bb? @
Scopebb@ E
==bbF H
FilterScopebbI T
.bbT U
ActionbbU [
)bb[ \
.cc 
Selectcc 
(cc 
filterDescriptorcc ,
=>cc- /
filterDescriptorcc0 @
.cc@ A
FilterccA G
)ccG H
.ccH I
OfTypeccI O
<ccO P&
PublicAntiForgeryAttributeccP j
>ccj k
(cck l
)ccl m
.ccm n
FirstOrDefaultccn |
(cc| }
)cc} ~
;cc~ 
ifff 
(ff 
actionFilterff  
?ff  !
.ff! "
IgnoreFilterff" .
??ff/ 1

)ff? @
returngg 
falsegg  
;gg  !
returnii 
trueii 
;ii 
}jj 
}mm 	
}pp 
}qq �<
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\PublishModelEventsAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{ 
public 

class '
PublishModelEventsAttribute ,
:- .
TypeFilterAttribute/ B
{ 
private 
readonly 
bool 

;+ ,
public '
PublishModelEventsAttribute *
(* +
bool+ /
ignore0 6
=7 8
false9 >
)> ?
:@ A
baseB F
(F G
typeofG M
(M N$
PublishModelEventsFilterN f
)f g
)g h
{   	

=!! 
ignore!! "
;!!" #
	Arguments"" 
="" 
new"" 
object"" "
[""" #
]""# $
{""% &
ignore""' -
}"". /
;""/ 0
}## 	
public,, 
bool,, 
IgnoreFilter,,  
=>,,! #

;,,1 2
private66 
class66 $
PublishModelEventsFilter66 .
:66/ 0

{77 	
private:: 
readonly:: 
bool:: !

;::/ 0
private;; 
readonly;; 
IEventPublisher;; ,
_eventPublisher;;- <
;;;< =
publicAA $
PublishModelEventsFilterAA +
(AA+ ,
boolAA, 0
ignoreFilterAA1 =
,AA= >
IEventPublisherBB 
eventPublisherBB  .
)BB. /
{CC 

=DD 
ignoreFilterDD  ,
;DD, -
_eventPublisherEE 
=EE  !
eventPublisherEE" 0
;EE0 1
}FF 
publicPP 
voidPP 
OnActionExecutingPP )
(PP) *"
ActionExecutingContextPP* @
contextPPA H
)PPH I
{QQ 
ifRR 
(RR 
contextRR 
==RR 
nullRR #
)RR# $
throwSS 
newSS !
ArgumentNullExceptionSS 3
(SS3 4
nameofSS4 :
(SS: ;
contextSS; B
)SSB C
)SSC D
;SSD E
varVV 
actionFilterVV  
=VV! "
contextVV# *
.VV* +
ActionDescriptorVV+ ;
.VV; <
FilterDescriptorsVV< M
.WW 
WhereWW 
(WW 
filterDescriptorWW +
=>WW, .
filterDescriptorWW/ ?
.WW? @
ScopeWW@ E
==WWF H
FilterScopeWWI T
.WWT U
ActionWWU [
)WW[ \
.XX 
SelectXX 
(XX 
filterDescriptorXX ,
=>XX- /
filterDescriptorXX0 @
.XX@ A
FilterXXA G
)XXG H
.XXH I
OfTypeXXI O
<XXO P'
PublishModelEventsAttributeXXP k
>XXk l
(XXl m
)XXm n
.XXn o
FirstOrDefaultXXo }
(XX} ~
)XX~ 
;	XX �
if[[ 
([[ 
actionFilter[[  
?[[  !
.[[! "
IgnoreFilter[[" .
??[[/ 1

)[[? @
return\\ 
;\\ 
if^^ 
(^^ 
context^^ 
.^^ 
HttpContext^^ '
.^^' (
Request^^( /
==^^0 2
null^^3 7
)^^7 8
return__ 
;__ 
ifbb 
(bb 
!bb 
contextbb 
.bb 
HttpContextbb (
.bb( )
Requestbb) 0
.bb0 1
Methodbb1 7
.bb7 8
Equalsbb8 >
(bb> ?
WebRequestMethodsbb? P
.bbP Q
HttpbbQ U
.bbU V
PostbbV Z
,bbZ [
StringComparisonbb\ l
.bbl m'
InvariantCultureIgnoreCase	bbm �
)
bb� �
)
bb� �
returncc 
;cc 
foreachff 
(ff 
varff 
modelff "
inff# %
contextff& -
.ff- .
ActionArgumentsff. =
.ff= >
Valuesff> D
.ffD E
OfTypeffE K
<ffK L
BaseNopModelffL X
>ffX Y
(ffY Z
)ffZ [
)ff[ \
{gg 
_eventPublisherjj #
.jj# $

(jj1 2
modeljj2 7
,jj7 8
contextjj9 @
.jj@ A

ModelStatejjA K
)jjK L
;jjL M
}kk 
}ll 
publicrr 
voidrr 
OnActionExecutedrr (
(rr( )!
ActionExecutedContextrr) >
contextrr? F
)rrF G
{ss 
iftt 
(tt 
contexttt 
==tt 
nulltt #
)tt# $
throwuu 
newuu !
ArgumentNullExceptionuu 3
(uu3 4
nameofuu4 :
(uu: ;
contextuu; B
)uuB C
)uuC D
;uuD E
varxx 
actionFilterxx  
=xx! "
contextxx# *
.xx* +
ActionDescriptorxx+ ;
.xx; <
FilterDescriptorsxx< M
.yy 
Whereyy 
(yy 
filterDescriptoryy +
=>yy, .
filterDescriptoryy/ ?
.yy? @
Scopeyy@ E
==yyF H
FilterScopeyyI T
.yyT U
ActionyyU [
)yy[ \
.zz 
Selectzz 
(zz 
filterDescriptorzz ,
=>zz- /
filterDescriptorzz0 @
.zz@ A
FilterzzA G
)zzG H
.zzH I
OfTypezzI O
<zzO P'
PublishModelEventsAttributezzP k
>zzk l
(zzl m
)zzm n
.zzn o
FirstOrDefaultzzo }
(zz} ~
)zz~ 
;	zz �
if}} 
(}} 
actionFilter}}  
?}}  !
.}}! "
IgnoreFilter}}" .
??}}/ 1

)}}? @
return~~ 
;~~ 
if
�� 
(
�� 
context
�� 
.
�� 
HttpContext
�� '
.
��' (
Request
��( /
==
��0 2
null
��3 7
)
��7 8
return
�� 
;
�� 
if
�� 
(
�� 
context
�� 
.
�� 

Controller
�� &
is
��' )

Controller
��* 4

controller
��5 ?
)
��? @
{
�� 
if
�� 
(
�� 

controller
�� "
.
��" #
ViewData
��# +
.
��+ ,
Model
��, 1
is
��2 4
BaseNopModel
��5 A
model
��B G
)
��G H
{
�� 
_eventPublisher
�� '
.
��' (

��( 5
(
��5 6
model
��6 ;
)
��; <
;
��< =
}
�� 
if
�� 
(
�� 

controller
�� "
.
��" #
ViewData
��# +
.
��+ ,
Model
��, 1
is
��2 4
IEnumerable
��5 @
<
��@ A
BaseNopModel
��A M
>
��M N
modelCollection
��O ^
)
��^ _
{
�� 
_eventPublisher
�� '
.
��' (

��( 5
(
��5 6
modelCollection
��6 E
)
��E F
;
��F G
}
�� 
}
�� 
}
�� 
}
�� 	
}
�� 
}�� �'
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\SaveIpAddressAttribute.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 
Mvc

 
.

  
Filters

  '
{ 
public 

class "
SaveIpAddressAttribute '
:( )
TypeFilterAttribute* =
{ 
public "
SaveIpAddressAttribute %
(% &
)& '
:( )
base* .
(. /
typeof/ 5
(5 6
SaveIpAddressFilter6 I
)I J
)J K
{ 	
} 	
private!! 
class!! 
SaveIpAddressFilter!! )
:!!* +

{"" 	
private%% 
readonly%% 
ICustomerService%% -
_customerService%%. >
;%%> ?
private&& 
readonly&& 

IWebHelper&& '

_webHelper&&( 2
;&&2 3
private'' 
readonly'' 
IWorkContext'' )
_workContext''* 6
;''6 7
private(( 
readonly(( 
CustomerSettings(( -
_customerSettings((. ?
;((? @
public.. 
SaveIpAddressFilter.. &
(..& '
ICustomerService..' 7
customerService..8 G
,..G H

IWebHelper// 
	webHelper// $
,//$ %
IWorkContext00 
workContext00 (
,00( )
CustomerSettings11  
customerSettings11! 1
)111 2
{22 
_customerService33  
=33! "
customerService33# 2
;332 3

_webHelper44 
=44 
	webHelper44 &
;44& '
_workContext55 
=55 
workContext55 *
;55* +
_customerSettings66 !
=66" #
customerSettings66$ 4
;664 5
}77 
publicAA 
voidAA 
OnActionExecutingAA )
(AA) *"
ActionExecutingContextAA* @
contextAAA H
)AAH I
{BB 
ifCC 
(CC 
contextCC 
==CC 
nullCC #
)CC# $
throwDD 
newDD !
ArgumentNullExceptionDD 3
(DD3 4
nameofDD4 :
(DD: ;
contextDD; B
)DDB C
)DDC D
;DDD E
ifFF 
(FF 
contextFF 
.FF 
HttpContextFF '
.FF' (
RequestFF( /
==FF0 2
nullFF3 7
)FF7 8
returnGG 
;GG 
ifJJ 
(JJ 
!JJ 
contextJJ 
.JJ 
HttpContextJJ (
.JJ( )
RequestJJ) 0
.JJ0 1
MethodJJ1 7
.JJ7 8
EqualsJJ8 >
(JJ> ?
WebRequestMethodsJJ? P
.JJP Q
HttpJJQ U
.JJU V
GetJJV Y
,JJY Z
StringComparisonJJ[ k
.JJk l'
InvariantCultureIgnoreCase	JJl �
)
JJ� �
)
JJ� �
returnKK 
;KK 
ifMM 
(MM 
!MM 
DataSettingsManagerMM (
.MM( )
DatabaseIsInstalledMM) <
)MM< =
returnNN 
;NN 
ifQQ 
(QQ 
!QQ 
_customerSettingsQQ &
.QQ& '
StoreIpAddressesQQ' 7
)QQ7 8
returnRR 
;RR 
varUU 
currentIpAddressUU $
=UU% &

_webHelperUU' 1
.UU1 2
GetCurrentIpAddressUU2 E
(UUE F
)UUF G
;UUG H
ifVV 
(VV 
stringVV 
.VV 

(VV( )
currentIpAddressVV) 9
)VV9 :
)VV: ;
returnWW 
;WW 
ifZZ 
(ZZ 
_workContextZZ  
.ZZ  !*
OriginalCustomerIfImpersonatedZZ! ?
==ZZ@ B
nullZZC G
&&ZZH J
![[ 
currentIpAddress[[ &
.[[& '
Equals[[' -
([[- .
_workContext[[. :
.[[: ;
CurrentCustomer[[; J
.[[J K

,[[X Y
StringComparison[[Z j
.[[j k'
InvariantCultureIgnoreCase	[[k �
)
[[� �
)
[[� �
{\\ 
_workContext]]  
.]]  !
CurrentCustomer]]! 0
.]]0 1

=]]? @
currentIpAddress]]A Q
;]]Q R
_customerService^^ $
.^^$ %
UpdateCustomer^^% 3
(^^3 4
_workContext^^4 @
.^^@ A
CurrentCustomer^^A P
)^^P Q
;^^Q R
}__ 
}`` 
publicff 
voidff 
OnActionExecutedff (
(ff( )!
ActionExecutedContextff) >
contextff? F
)ffF G
{gg 
}ii 
}ll 	
}oo 
}pp �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\SaveLastActivityAttribute.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 
Mvc		 
.		  
Filters		  '
{

 
public 

class %
SaveLastActivityAttribute *
:+ ,
TypeFilterAttribute- @
{ 
public %
SaveLastActivityAttribute (
(( )
)) *
:+ ,
base- 1
(1 2
typeof2 8
(8 9"
SaveLastActivityFilter9 O
)O P
)P Q
{ 	
} 	
private   
class   "
SaveLastActivityFilter   ,
:  - .

{!! 	
private$$ 
readonly$$ 
ICustomerService$$ -
_customerService$$. >
;$$> ?
private%% 
readonly%% 
IWorkContext%% )
_workContext%%* 6
;%%6 7
public++ "
SaveLastActivityFilter++ )
(++) *
ICustomerService++* :
customerService++; J
,++J K
IWorkContext,, 
workContext,, (
),,( )
{-- 
_customerService..  
=..! "
customerService..# 2
;..2 3
_workContext// 
=// 
workContext// *
;//* +
}00 
public:: 
void:: 
OnActionExecuting:: )
(::) *"
ActionExecutingContext::* @
context::A H
)::H I
{;; 
if<< 
(<< 
context<< 
==<< 
null<< #
)<<# $
throw== 
new== !
ArgumentNullException== 3
(==3 4
nameof==4 :
(==: ;
context==; B
)==B C
)==C D
;==D E
if?? 
(?? 
context?? 
.?? 
HttpContext?? '
.??' (
Request??( /
==??0 2
null??3 7
)??7 8
return@@ 
;@@ 
ifCC 
(CC 
!CC 
contextCC 
.CC 
HttpContextCC (
.CC( )
RequestCC) 0
.CC0 1
MethodCC1 7
.CC7 8
EqualsCC8 >
(CC> ?
WebRequestMethodsCC? P
.CCP Q
HttpCCQ U
.CCU V
GetCCV Y
,CCY Z
StringComparisonCC[ k
.CCk l'
InvariantCultureIgnoreCase	CCl �
)
CC� �
)
CC� �
returnDD 
;DD 
ifFF 
(FF 
!FF 
DataSettingsManagerFF (
.FF( )
DatabaseIsInstalledFF) <
)FF< =
returnGG 
;GG 
ifJJ 
(JJ 
_workContextJJ  
.JJ  !
CurrentCustomerJJ! 0
.JJ0 1
LastActivityDateUtcJJ1 D
.JJD E

AddMinutesJJE O
(JJO P
$numJJP S
)JJS T
<JJU V
DateTimeJJW _
.JJ_ `
UtcNowJJ` f
)JJf g
{KK 
_workContextLL  
.LL  !
CurrentCustomerLL! 0
.LL0 1
LastActivityDateUtcLL1 D
=LLE F
DateTimeLLG O
.LLO P
UtcNowLLP V
;LLV W
_customerServiceMM $
.MM$ %
UpdateCustomerMM% 3
(MM3 4
_workContextMM4 @
.MM@ A
CurrentCustomerMMA P
)MMP Q
;MMQ R
}NN 
}OO 
publicUU 
voidUU 
OnActionExecutedUU (
(UU( )!
ActionExecutedContextUU) >
contextUU? F
)UUF G
{VV 
}XX 
}[[ 	
}^^ 
}__ �)
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\SaveLastVisitedPageAttribute.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 
Mvc

 
.

  
Filters

  '
{ 
public 

class (
SaveLastVisitedPageAttribute -
:. /
TypeFilterAttribute0 C
{ 
public (
SaveLastVisitedPageAttribute +
(+ ,
), -
:. /
base0 4
(4 5
typeof5 ;
(; <%
SaveLastVisitedPageFilter< U
)U V
)V W
{ 	
} 	
private!! 
class!! %
SaveLastVisitedPageFilter!! /
:!!0 1

{"" 	
private%% 
readonly%% 
CustomerSettings%% -
_customerSettings%%. ?
;%%? @
private&& 
readonly&& $
IGenericAttributeService&& 5$
_genericAttributeService&&6 N
;&&N O
private'' 
readonly'' 

IWebHelper'' '

_webHelper''( 2
;''2 3
private(( 
readonly(( 
IWorkContext(( )
_workContext((* 6
;((6 7
public.. %
SaveLastVisitedPageFilter.. ,
(.., -
CustomerSettings..- =
customerSettings..> N
,..N O$
IGenericAttributeService// (#
genericAttributeService//) @
,//@ A

IWebHelper00 
	webHelper00 $
,00$ %
IWorkContext11 
workContext11 (
)11( )
{22 
_customerSettings33 !
=33" #
customerSettings33$ 4
;334 5$
_genericAttributeService44 (
=44) *#
genericAttributeService44+ B
;44B C

_webHelper55 
=55 
	webHelper55 &
;55& '
_workContext66 
=66 
workContext66 *
;66* +
}77 
publicAA 
voidAA 
OnActionExecutingAA )
(AA) *"
ActionExecutingContextAA* @
contextAAA H
)AAH I
{BB 
ifCC 
(CC 
contextCC 
==CC 
nullCC #
)CC# $
throwDD 
newDD !
ArgumentNullExceptionDD 3
(DD3 4
nameofDD4 :
(DD: ;
contextDD; B
)DDB C
)DDC D
;DDD E
ifFF 
(FF 
contextFF 
.FF 
HttpContextFF '
.FF' (
RequestFF( /
==FF0 2
nullFF3 7
)FF7 8
returnGG 
;GG 
ifJJ 
(JJ 
!JJ 
contextJJ 
.JJ 
HttpContextJJ (
.JJ( )
RequestJJ) 0
.JJ0 1
MethodJJ1 7
.JJ7 8
EqualsJJ8 >
(JJ> ?
WebRequestMethodsJJ? P
.JJP Q
HttpJJQ U
.JJU V
GetJJV Y
,JJY Z
StringComparisonJJ[ k
.JJk l'
InvariantCultureIgnoreCase	JJl �
)
JJ� �
)
JJ� �
returnKK 
;KK 
ifMM 
(MM 
!MM 
DataSettingsManagerMM (
.MM( )
DatabaseIsInstalledMM) <
)MM< =
returnNN 
;NN 
ifQQ 
(QQ 
!QQ 
_customerSettingsQQ &
.QQ& ' 
StoreLastVisitedPageQQ' ;
)QQ; <
returnRR 
;RR 
varUU 
pageUrlUU 
=UU 

_webHelperUU (
.UU( )
GetThisPageUrlUU) 7
(UU7 8
trueUU8 <
)UU< =
;UU= >
ifVV 
(VV 
stringVV 
.VV 

(VV( )
pageUrlVV) 0
)VV0 1
)VV1 2
returnWW 
;WW 
varZZ 
previousPageUrlZZ #
=ZZ$ %$
_genericAttributeServiceZZ& >
.ZZ> ?
GetAttributeZZ? K
<ZZK L
stringZZL R
>ZZR S
(ZZS T
_workContextZZT `
.ZZ` a
CurrentCustomerZZa p
,ZZp q 
NopCustomerDefaults	ZZr �
.
ZZ� �&
LastVisitedPageAttribute
ZZ� �
)
ZZ� �
;
ZZ� �
if]] 
(]] 
!]] 
pageUrl]] 
.]] 
Equals]] #
(]]# $
previousPageUrl]]$ 3
,]]3 4
StringComparison]]5 E
.]]E F&
InvariantCultureIgnoreCase]]F `
)]]` a
)]]a b$
_genericAttributeService^^ ,
.^^, -

(^^: ;
_workContext^^; G
.^^G H
CurrentCustomer^^H W
,^^W X
NopCustomerDefaults^^Y l
.^^l m%
LastVisitedPageAttribute	^^m �
,
^^� �
pageUrl
^^� �
)
^^� �
;
^^� �
}`` 
publicff 
voidff 
OnActionExecutedff (
(ff( )!
ActionExecutedContextff) >
contextff? F
)ffF G
{gg 
}ii 
}ll 	
}oo 
}pp �2
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\SaveSelectedTabsAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{ 
public 

class $
SaveSelectedTabAttribute )
:* +
TypeFilterAttribute, ?
{ 
private 
readonly 
bool 

;+ ,
private 
readonly 
bool %
_persistForTheNextRequest 7
;7 8
public   $
SaveSelectedTabAttribute   '
(  ' (
bool  ( ,
ignore  - 3
=  4 5
false  6 ;
,  ; <
bool  = A$
persistForTheNextRequest  B Z
=  [ \
true  ] a
)  a b
:  c d
base  e i
(  i j
typeof  j p
(  p q"
SaveSelectedTabFilter	  q �
)
  � �
)
  � �
{!! 	%
_persistForTheNextRequest"" %
=""& '$
persistForTheNextRequest""( @
;""@ A

=## 
ignore## "
;##" #
	Arguments$$ 
=$$ 
new$$ 
object$$ "
[$$" #
]$$# $
{$$% &
ignore$$' -
,$$- .$
persistForTheNextRequest$$/ G
}$$H I
;$$I J
}%% 	
public.. 
bool.. 
IgnoreFilter..  
=>..! #

;..1 2
public33 
bool33 $
PersistForTheNextRequest33 ,
=>33- /%
_persistForTheNextRequest330 I
;33I J
private<< 
class<< !
SaveSelectedTabFilter<< +
:<<, -

{== 	
private@@ 
readonly@@ 
bool@@ !

;@@/ 0
privateAA 
boolAA %
_persistForTheNextRequestAA 2
;AA2 3
privateBB 
readonlyBB 

IWebHelperBB '

_webHelperBB( 2
;BB2 3
publicHH !
SaveSelectedTabFilterHH (
(HH( )
boolHH) -
ignoreFilterHH. :
,HH: ;
boolHH< @$
persistForTheNextRequestHHA Y
,HHY Z

IWebHelperII 
	webHelperII $
)II$ %
{JJ 

=KK 
ignoreFilterKK  ,
;KK, -%
_persistForTheNextRequestLL )
=LL* +$
persistForTheNextRequestLL, D
;LLD E

_webHelperMM 
=MM 
	webHelperMM &
;MM& '
}NN 
publicXX 
voidXX 
OnActionExecutingXX )
(XX) *"
ActionExecutingContextXX* @
contextXXA H
)XXH I
{YY 
}[[ 
public`` 
void`` 
OnActionExecuted`` (
(``( )!
ActionExecutedContext``) >

)``L M
{aa 
ifbb 
(bb 

==bb" $
nullbb% )
)bb) *
throwcc 
newcc !
ArgumentNullExceptioncc 3
(cc3 4
nameofcc4 :
(cc: ;

)ccH I
)ccI J
;ccJ K
ifee 
(ee 

.ee! "
HttpContextee" -
.ee- .
Requestee. 5
==ee6 8
nullee9 =
)ee= >
returnff 
;ff 
ifii 
(ii 
!ii 

.ii" #
HttpContextii# .
.ii. /
Requestii/ 6
.ii6 7
Methodii7 =
.ii= >
Equalsii> D
(iiD E
WebRequestMethodsiiE V
.iiV W
HttpiiW [
.ii[ \
Postii\ `
,ii` a
StringComparisoniib r
.iir s'
InvariantCultureIgnoreCase	iis �
)
ii� �
)
ii� �
returnjj 
;jj 
ifll 
(ll 

_webHelperll 
.ll 

(ll, -

.ll: ;
HttpContextll; F
.llF G
RequestllG N
)llN O
)llO P
returnmm 
;mm 
ifoo 
(oo 
!oo 
DataSettingsManageroo (
.oo( )
DatabaseIsInstalledoo) <
)oo< =
returnpp 
;pp 
varss 
actionFilterss  
=ss! "

.ss0 1
ActionDescriptorss1 A
.ssA B
FilterDescriptorsssB S
.tt 
Wherett 
(tt 
filterDescriptortt +
=>tt, .
filterDescriptortt/ ?
.tt? @
Scopett@ E
==ttF H
FilterScopettI T
.ttT U
ActionttU [
)tt[ \
.uu 
Selectuu 
(uu 
filterDescriptoruu ,
=>uu- /
filterDescriptoruu0 @
.uu@ A
FilteruuA G
)uuG H
.uuH I
OfTypeuuI O
<uuO P$
SaveSelectedTabAttributeuuP h
>uuh i
(uui j
)uuj k
.uuk l
FirstOrDefaultuul z
(uuz {
)uu{ |
;uu| }
ifxx 
(xx 
actionFilterxx  
?xx  !
.xx! "
IgnoreFilterxx" .
??xx/ 1

)xx? @
returnyy 
;yy 
var{{ $
persistForTheNextRequest{{ ,
={{- .
actionFilter{{/ ;
?{{; <
.{{< =$
PersistForTheNextRequest{{= U
??{{V X%
_persistForTheNextRequest{{Y r
;{{r s
var}} 

controller}} 
=}}  

.}}. /

Controller}}/ 9
as}}: <
BaseController}}= K
;}}K L
if~~ 
(~~ 

controller~~ 
!=~~ !
null~~" &
)~~& '

controller 
. 
SaveSelectedTabName 2
(2 3$
persistForTheNextRequest3 K
:K L$
persistForTheNextRequestM e
)e f
;f g
}
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\SignOutFromExternalAuthenticationAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{ 
public 

class 6
*SignOutFromExternalAuthenticationAttribute ;
:< =
TypeFilterAttribute> Q
{
public 6
*SignOutFromExternalAuthenticationAttribute 9
(9 :
): ;
:< =
base> B
(B C
typeofC I
(I J3
'SignOutFromExternalAuthenticationFilterJ q
)q r
)r s
{ 	
} 	
private 
class 3
'SignOutFromExternalAuthenticationFilter =
:> ? 
IAuthorizationFilter@ T
{ 	
public&& 
async&& 
void&& 
OnAuthorization&& -
(&&- .&
AuthorizationFilterContext&&. H

)&&V W
{'' 
if(( 
((( 

==((" $
null((% )
)(() *
throw)) 
new)) !
ArgumentNullException)) 3
())3 4
nameof))4 :
()): ;

)))H I
)))I J
;))J K
var,, 
authenticateResult,, &
=,,' (
await,,) .

.,,< =
HttpContext,,= H
.,,H I
AuthenticateAsync,,I Z
(,,Z [%
NopAuthenticationDefaults,,[ t
.,,t u)
ExternalAuthenticationScheme	,,u �
)
,,� �
;
,,� �
if-- 
(-- 
authenticateResult-- &
.--& '
	Succeeded--' 0
)--0 1
await.. 

...' (
HttpContext..( 3
...3 4
SignOutAsync..4 @
(..@ A%
NopAuthenticationDefaults..A Z
...Z [(
ExternalAuthenticationScheme..[ w
)..w x
;..x y
}// 
}22 	
}55 
}66 �6
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\ValidateCaptchaAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Filters  '
{ 
public 

class $
ValidateCaptchaAttribute )
:* +
TypeFilterAttribute, ?
{ 
public $
ValidateCaptchaAttribute '
(' (
string( .
actionParameterName/ B
=C D
$strE S
)S T
:U V
baseW [
([ \
typeof\ b
(b c!
ValidateCaptchaFilterc x
)x y
)y z
{ 	
	Arguments 
= 
new 
object "
[" #
]# $
{% &
actionParameterName' :
}; <
;< =
} 	
private$$ 
class$$ !
ValidateCaptchaFilter$$ +
:$$, -

{%% 	
private(( 
const(( 
string((  
CHALLENGE_FIELD_KEY((! 4
=((5 6
$str((7 R
;((R S
private)) 
const)) 
string))  
RESPONSE_FIELD_KEY))! 3
=))4 5
$str))6 P
;))P Q
private** 
const** 
string**   
G_RESPONSE_FIELD_KEY**! 5
=**6 7
$str**8 N
;**N O
private00 
readonly00 
string00 # 
_actionParameterName00$ 8
;008 9
private11 
readonly11 
CaptchaHttpClient11 .
_captchaHttpClient11/ A
;11A B
private22 
readonly22 
CaptchaSettings22 ,
_captchaSettings22- =
;22= >
private33 
readonly33 
ILogger33 $
_logger33% ,
;33, -
private44 
readonly44 
IWorkContext44 )
_workContext44* 6
;446 7
public:: !
ValidateCaptchaFilter:: (
(::( )
string::) /
actionParameterName::0 C
,::C D
CaptchaHttpClient;; !
captchaHttpClient;;" 3
,;;3 4
CaptchaSettings<< 
captchaSettings<<  /
,<</ 0
ILogger== 
logger== 
,== 
IWorkContext>> 
workContext>> (
)>>( )
{?? 
_actionParameterName@@ $
=@@% &
actionParameterName@@' :
;@@: ;
_captchaHttpClientAA "
=AA# $
captchaHttpClientAA% 6
;AA6 7
_captchaSettingsBB  
=BB! "
captchaSettingsBB# 2
;BB2 3
_loggerCC 
=CC 
loggerCC  
;CC  !
_workContextDD 
=DD 
workContextDD *
;DD* +
}EE 
	protectedPP 
boolPP 
ValidateCaptchaPP *
(PP* +"
ActionExecutingContextPP+ A
contextPPB I
)PPI J
{QQ 
varRR 
isValidRR 
=RR 
falseRR #
;RR# $
varUU  
captchaResponseValueUU (
=UU) *
contextUU+ 2
.UU2 3
HttpContextUU3 >
.UU> ?
RequestUU? F
.UUF G
FormUUG K
[UUK L
RESPONSE_FIELD_KEYUUL ^
]UU^ _
;UU_ `
varVV !
gCaptchaResponseValueVV )
=VV* +
contextVV, 3
.VV3 4
HttpContextVV4 ?
.VV? @
RequestVV@ G
.VVG H
FormVVH L
[VVL M 
G_RESPONSE_FIELD_KEYVVM a
]VVa b
;VVb c
ifXX 
(XX 
!XX 
StringValuesXX !
.XX! "

(XX/ 0 
captchaResponseValueXX0 D
)XXD E
||XXF H
!XXI J
StringValuesXXJ V
.XXV W

(XXd e!
gCaptchaResponseValueXXe z
)XXz {
)XX{ |
{YY 
try[[ 
{\\ 
var]] 
value]] !
=]]" #
!]]$ %
StringValues]]% 1
.]]1 2

(]]? @ 
captchaResponseValue]]@ T
)]]T U
?]]V W 
captchaResponseValue]]X l
:]]m n"
gCaptchaResponseValue	]]o �
;
]]� �
var^^ 
response^^ $
=^^% &
_captchaHttpClient^^' 9
.^^9 : 
ValidateCaptchaAsync^^: N
(^^N O
value^^O T
)^^T U
.^^U V
Result^^V \
;^^\ ]
isValid__ 
=__  !
response__" *
.__* +
IsValid__+ 2
;__2 3
}`` 
catchaa 
(aa 
	Exceptionaa $
	exceptionaa% .
)aa. /
{bb 
_loggercc 
.cc  
Errorcc  %
(cc% &
$strcc& L
,ccL M
	exceptionccN W
,ccW X
_workContextccY e
.cce f
CurrentCustomerccf u
)ccu v
;ccv w
}dd 
}ee 
returngg 
isValidgg 
;gg 
}hh 
publicrr 
voidrr 
OnActionExecutingrr )
(rr) *"
ActionExecutingContextrr* @
contextrrA H
)rrH I
{ss 
iftt 
(tt 
contexttt 
==tt 
nulltt #
)tt# $
throwuu 
newuu !
ArgumentNullExceptionuu 3
(uu3 4
nameofuu4 :
(uu: ;
contextuu; B
)uuB C
)uuC D
;uuD E
ifww 
(ww 
!ww 
DataSettingsManagerww (
.ww( )
DatabaseIsInstalledww) <
)ww< =
returnxx 
;xx 
if{{ 
({{ 
_captchaSettings{{ $
.{{$ %
Enabled{{% ,
&&{{- /
context{{0 7
.{{7 8
HttpContext{{8 C
?{{C D
.{{D E
Request{{E L
!={{M O
null{{P T
){{T U
{|| 
context~~ 
.~~ 
ActionArguments~~ +
[~~+ , 
_actionParameterName~~, @
]~~@ A
=~~B C
ValidateCaptcha~~D S
(~~S T
context~~T [
)~~[ \
;~~\ ]
} 
else
�� 
context
�� 
.
�� 
ActionArguments
�� +
[
��+ ,"
_actionParameterName
��, @
]
��@ A
=
��B C
false
��D I
;
��I J
}
�� 
public
�� 
void
�� 
OnActionExecuted
�� (
(
��( )#
ActionExecutedContext
��) >
context
��? F
)
��F G
{
�� 
}
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\ValidateHoneypotAttribute.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 
Mvc

 
.

  
Filters

  '
{ 
public 

class %
ValidateHoneypotAttribute *
:+ ,
TypeFilterAttribute- @
{ 
public %
ValidateHoneypotAttribute (
(( )
)) *
:+ ,
base- 1
(1 2
typeof2 8
(8 9"
ValidateHoneypotFilter9 O
)O P
)P Q
{ 	
} 	
private!! 
class!! "
ValidateHoneypotFilter!! ,
:!!- . 
IAuthorizationFilter!!/ C
{"" 	
private%% 
readonly%% 
ILogger%% $
_logger%%% ,
;%%, -
private&& 
readonly&& 

IWebHelper&& '

_webHelper&&( 2
;&&2 3
private'' 
readonly'' 
SecuritySettings'' -
_securitySettings''. ?
;''? @
public-- "
ValidateHoneypotFilter-- )
(--) *
ILogger--* 1
logger--2 8
,--8 9

IWebHelper.. 
	webHelper.. $
,..$ %
SecuritySettings//  
securitySettings//! 1
)//1 2
{00 
_logger11 
=11 
logger11  
;11  !

_webHelper22 
=22 
	webHelper22 &
;22& '
_securitySettings33 !
=33" #
securitySettings33$ 4
;334 5
}44 
public>> 
void>> 
OnAuthorization>> '
(>>' (&
AuthorizationFilterContext>>( B

)>>P Q
{?? 
if@@ 
(@@ 

==@@" $
null@@% )
)@@) *
throwAA 
newAA !
ArgumentNullExceptionAA 3
(AA3 4
nameofAA4 :
(AA: ;

)AAH I
)AAI J
;AAJ K
ifCC 
(CC 

.CC! "
HttpContextCC" -
.CC- .
RequestCC. 5
==CC6 8
nullCC9 =
)CC= >
returnDD 
;DD 
ifFF 
(FF 
!FF 
DataSettingsManagerFF (
.FF( )
DatabaseIsInstalledFF) <
)FF< =
returnGG 
;GG 
ifJJ 
(JJ 
!JJ 
_securitySettingsJJ &
.JJ& '
HoneypotEnabledJJ' 6
)JJ6 7
returnKK 
;KK 
varNN 

inputValueNN 
=NN  

.NN. /
HttpContextNN/ :
.NN: ;
RequestNN; B
.NNB C
FormNNC G
[NNG H
_securitySettingsNNH Y
.NNY Z
HoneypotInputNameNNZ k
]NNk l
;NNl m
ifQQ 
(QQ 
!QQ 
StringValuesQQ !
.QQ! "

(QQ/ 0

inputValueQQ0 :
)QQ: ;
)QQ; <
{RR 
_loggerTT 
.TT 
WarningTT #
(TT# $
$strTT$ ?
)TT? @
;TT@ A

.WW! "
ResultWW" (
=WW) *
newWW+ .
RedirectResultWW/ =
(WW= >

_webHelperWW> H
.WWH I
GetThisPageUrlWWI W
(WWW X
trueWWX \
)WW\ ]
)WW] ^
;WW^ _
}XX 
}YY 
}\\ 	
}__ 
}`` �)
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\ValidateIpAddressAttribute.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 
Mvc

 
.

  
Filters

  '
{ 
public 

class &
ValidateIpAddressAttribute +
:, -
TypeFilterAttribute. A
{ 
public &
ValidateIpAddressAttribute )
() *
)* +
:, -
base. 2
(2 3
typeof3 9
(9 :#
ValidateIpAddressFilter: Q
)Q R
)R S
{ 	
} 	
private!! 
class!! #
ValidateIpAddressFilter!! -
:!!. /

{"" 	
private%% 
readonly%% 

IWebHelper%% '

_webHelper%%( 2
;%%2 3
private&& 
readonly&& 
SecuritySettings&& -
_securitySettings&&. ?
;&&? @
public,, #
ValidateIpAddressFilter,, *
(,,* +

IWebHelper,,+ 5
	webHelper,,6 ?
,,,? @
SecuritySettings--  
securitySettings--! 1
)--1 2
{.. 

_webHelper// 
=// 
	webHelper// &
;//& '
_securitySettings00 !
=00" #
securitySettings00$ 4
;004 5
}11 
public;; 
void;; 
OnActionExecuting;; )
(;;) *"
ActionExecutingContext;;* @
context;;A H
);;H I
{<< 
if== 
(== 
context== 
==== 
null== #
)==# $
throw>> 
new>> !
ArgumentNullException>> 3
(>>3 4
nameof>>4 :
(>>: ;
context>>; B
)>>B C
)>>C D
;>>D E
if@@ 
(@@ 
context@@ 
.@@ 
HttpContext@@ '
.@@' (
Request@@( /
==@@0 2
null@@3 7
)@@7 8
returnAA 
;AA 
ifCC 
(CC 
!CC 
DataSettingsManagerCC (
.CC( )
DatabaseIsInstalledCC) <
)CC< =
returnDD 
;DD 
varGG 
actionDescriptorGG $
=GG% &
contextGG' .
.GG. /
ActionDescriptorGG/ ?
asGG@ B&
ControllerActionDescriptorGGC ]
;GG] ^
varHH 

actionNameHH 
=HH  
actionDescriptorHH! 1
?HH1 2
.HH2 3

ActionNameHH3 =
;HH= >
varII 
controllerNameII "
=II# $
actionDescriptorII% 5
?II5 6
.II6 7
ControllerNameII7 E
;IIE F
ifKK 
(KK 
stringKK 
.KK 

(KK( )

actionNameKK) 3
)KK3 4
||KK5 7
stringKK8 >
.KK> ?

(KKL M
controllerNameKKM [
)KK[ \
)KK\ ]
returnLL 
;LL 
varOO 
ipAddressesOO 
=OO  !
_securitySettingsOO" 3
.OO3 4'
AdminAreaAllowedIpAddressesOO4 O
;OOO P
ifRR 
(RR 
ipAddressesRR 
==RR  "
nullRR# '
||RR( *
!RR+ ,
ipAddressesRR, 7
.RR7 8
AnyRR8 ;
(RR; <
)RR< =
)RR= >
returnSS 
;SS 
varVV 
	currentIpVV 
=VV 

_webHelperVV  *
.VV* +
GetCurrentIpAddressVV+ >
(VV> ?
)VV? @
;VV@ A
ifWW 
(WW 
ipAddressesWW 
.WW  
AnyWW  #
(WW# $
ipWW$ &
=>WW' )
ipWW* ,
.WW, -
EqualsWW- 3
(WW3 4
	currentIpWW4 =
,WW= >
StringComparisonWW? O
.WWO P&
InvariantCultureIgnoreCaseWWP j
)WWj k
)WWk l
)WWl m
returnXX 
;XX 
if[[ 
([[ 
![[ 
([[ 
controllerName[[ $
.[[$ %
Equals[[% +
([[+ ,
$str[[, 6
,[[6 7
StringComparison[[8 H
.[[H I&
InvariantCultureIgnoreCase[[I c
)[[c d
&&[[e g

actionName\\ 
.\\ 
Equals\\ %
(\\% &
$str\\& 4
,\\4 5
StringComparison\\6 F
.\\F G&
InvariantCultureIgnoreCase\\G a
)\\a b
)\\b c
)\\c d
{]] 
context__ 
.__ 
Result__ "
=__# $
new__% ("
RedirectToActionResult__) ?
(__? @
$str__@ N
,__N O
$str__P Z
,__Z [
context__\ c
.__c d
	RouteData__d m
.__m n
Values__n t
)__t u
;__u v
}`` 
}aa 
publicgg 
voidgg 
OnActionExecutedgg (
(gg( )!
ActionExecutedContextgg) >
contextgg? F
)ggF G
{hh 
}jj 
}mm 	
}pp 
}qq �'
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\ValidatePasswordAttribute.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 
Mvc

 
.

  
Filters

  '
{ 
public 

class %
ValidatePasswordAttribute *
:+ ,
TypeFilterAttribute- @
{ 
public %
ValidatePasswordAttribute (
(( )
)) *
:+ ,
base- 1
(1 2
typeof2 8
(8 9"
ValidatePasswordFilter9 O
)O P
)P Q
{ 	
} 	
private!! 
class!! "
ValidatePasswordFilter!! ,
:!!- .

{"" 	
private%% 
readonly%% 
ICustomerService%% -
_customerService%%. >
;%%> ?
private&& 
readonly&& 
IUrlHelperFactory&& .
_urlHelperFactory&&/ @
;&&@ A
private'' 
readonly'' 
IWorkContext'' )
_workContext''* 6
;''6 7
public-- "
ValidatePasswordFilter-- )
(--) *
ICustomerService--* :
customerService--; J
,--J K
IUrlHelperFactory.. !
urlHelperFactory.." 2
,..2 3
IWorkContext// 
workContext// (
)//( )
{00 
_customerService11  
=11! "
customerService11# 2
;112 3
_urlHelperFactory22 !
=22" #
urlHelperFactory22$ 4
;224 5
_workContext33 
=33 
workContext33 *
;33* +
}44 
public>> 
void>> 
OnActionExecuting>> )
(>>) *"
ActionExecutingContext>>* @
context>>A H
)>>H I
{?? 
if@@ 
(@@ 
context@@ 
==@@ 
null@@ #
)@@# $
throwAA 
newAA !
ArgumentNullExceptionAA 3
(AA3 4
nameofAA4 :
(AA: ;
contextAA; B
)AAB C
)AAC D
;AAD E
ifCC 
(CC 
contextCC 
.CC 
HttpContextCC '
.CC' (
RequestCC( /
==CC0 2
nullCC3 7
)CC7 8
returnDD 
;DD 
ifFF 
(FF 
!FF 
DataSettingsManagerFF (
.FF( )
DatabaseIsInstalledFF) <
)FF< =
returnGG 
;GG 
varJJ 
actionDescriptorJJ $
=JJ% &
contextJJ' .
.JJ. /
ActionDescriptorJJ/ ?
asJJ@ B&
ControllerActionDescriptorJJC ]
;JJ] ^
varKK 

actionNameKK 
=KK  
actionDescriptorKK! 1
?KK1 2
.KK2 3

ActionNameKK3 =
;KK= >
varLL 
controllerNameLL "
=LL# $
actionDescriptorLL% 5
?LL5 6
.LL6 7
ControllerNameLL7 E
;LLE F
ifNN 
(NN 
stringNN 
.NN 

(NN( )

actionNameNN) 3
)NN3 4
||NN5 7
stringNN8 >
.NN> ?

(NNL M
controllerNameNNM [
)NN[ \
)NN\ ]
returnOO 
;OO 
ifRR 
(RR 
!RR 
(RR 
controllerNameRR $
.RR$ %
EqualsRR% +
(RR+ ,
$strRR, 6
,RR6 7
StringComparisonRR8 H
.RRH I&
InvariantCultureIgnoreCaseRRI c
)RRc d
&&RRe g

actionNameSS 
.SS 
EqualsSS %
(SS% &
$strSS& 6
,SS6 7
StringComparisonSS8 H
.SSH I&
InvariantCultureIgnoreCaseSSI c
)SSc d
)SSd e
)SSe f
{TT 
ifVV 
(VV 
_customerServiceVV (
.VV( )
PasswordIsExpiredVV) :
(VV: ;
_workContextVV; G
.VVG H
CurrentCustomerVVH W
)VVW X
)VVX Y
{WW 
varYY 
changePasswordUrlYY -
=YY. /
_urlHelperFactoryYY0 A
.YYA B
GetUrlHelperYYB N
(YYN O
contextYYO V
)YYV W
.YYW X
RouteUrlYYX `
(YY` a
$strYYa y
)YYy z
;YYz {
contextZZ 
.ZZ  
ResultZZ  &
=ZZ' (
newZZ) ,
RedirectResultZZ- ;
(ZZ; <
changePasswordUrlZZ< M
)ZZM N
;ZZN O
}[[ 
}\\ 
}]] 
publiccc 
voidcc 
OnActionExecutedcc (
(cc( )!
ActionExecutedContextcc) >
contextcc? F
)ccF G
{dd 
}ff 
}ii 	
}ll 
}mm �!
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\ValidateVendorAttribute.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 
Mvc		 
.		  
Filters		  '
{

 
public 

class #
ValidateVendorAttribute (
:) *
TypeFilterAttribute+ >
{ 
private 
readonly 
bool 

;+ ,
public #
ValidateVendorAttribute &
(& '
bool' +
ignore, 2
=3 4
false5 :
): ;
:< =
base> B
(B C
typeofC I
(I J 
ValidateVendorFilterJ ^
)^ _
)_ `
{ 	

= 
ignore "
;" #
	Arguments 
= 
new 
object "
[" #
]# $
{% &
ignore' -
}. /
;/ 0
}   	
public)) 
bool)) 
IgnoreFilter))  
=>))! #

;))1 2
private22 
class22  
ValidateVendorFilter22 *
:22+ , 
IAuthorizationFilter22- A
{33 	
private66 
readonly66 
bool66 !

;66/ 0
private77 
readonly77 
IWorkContext77 )
_workContext77* 6
;776 7
public==  
ValidateVendorFilter== '
(==' (
bool==( ,
ignoreFilter==- 9
,==9 :
IWorkContext==; G
workContext==H S
)==S T
{>> 

=?? 
ignoreFilter??  ,
;??, -
_workContext@@ 
=@@ 
workContext@@ *
;@@* +
}AA 
publicKK 
voidKK 
OnAuthorizationKK '
(KK' (&
AuthorizationFilterContextKK( B

)KKP Q
{LL 
ifMM 
(MM 

==MM" $
nullMM% )
)MM) *
throwNN 
newNN !
ArgumentNullExceptionNN 3
(NN3 4
nameofNN4 :
(NN: ;

)NNH I
)NNI J
;NNJ K
varQQ 
actionFilterQQ  
=QQ! "

.QQ0 1
ActionDescriptorQQ1 A
.QQA B
FilterDescriptorsQQB S
.RR 
WhereRR 
(RR 
filterDescriptorRR +
=>RR, .
filterDescriptorRR/ ?
.RR? @
ScopeRR@ E
==RRF H
FilterScopeRRI T
.RRT U
ActionRRU [
)RR[ \
.SS 
SelectSS 
(SS 
filterDescriptorSS ,
=>SS- /
filterDescriptorSS0 @
.SS@ A
FilterSSA G
)SSG H
.SSH I
OfTypeSSI O
<SSO P#
ValidateVendorAttributeSSP g
>SSg h
(SSh i
)SSi j
.SSj k
FirstOrDefaultSSk y
(SSy z
)SSz {
;SS{ |
ifVV 
(VV 
actionFilterVV  
?VV  !
.VV! "
IgnoreFilterVV" .
??VV/ 1

)VV? @
returnWW 
;WW 
ifYY 
(YY 
!YY 
DataSettingsManagerYY (
.YY( )
DatabaseIsInstalledYY) <
)YY< =
returnZZ 
;ZZ 
if]] 
(]] 
!]] 
_workContext]] !
.]]! "
CurrentCustomer]]" 1
.]]1 2
IsVendor]]2 :
(]]: ;
)]]; <
)]]< =
return^^ 
;^^ 
ifaa 
(aa 
_workContextaa  
.aa  !

==aa/ 1
nullaa2 6
)aa6 7

.bb! "
Resultbb" (
=bb) *
newbb+ .
ChallengeResultbb/ >
(bb> ?
)bb? @
;bb@ A
}cc 
}ff 	
}ii 
}jj �/
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Filters\WwwRequirementAttribute.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 
Mvc		 
.		  
Filters		  '
{

 
public 

class #
WwwRequirementAttribute (
:) *
TypeFilterAttribute+ >
{ 
public #
WwwRequirementAttribute &
(& '
)' (
:) *
base+ /
(/ 0
typeof0 6
(6 7 
WwwRequirementFilter7 K
)K L
)L M
{ 	
} 	
private   
class    
WwwRequirementFilter   *
:  + , 
IAuthorizationFilter  - A
{!! 	
private$$ 
readonly$$ 

IWebHelper$$ '

_webHelper$$( 2
;$$2 3
private%% 
readonly%% 
SeoSettings%% (
_seoSettings%%) 5
;%%5 6
public++  
WwwRequirementFilter++ '
(++' (

IWebHelper++( 2
	webHelper++3 <
,++< =
SeoSettings,, 
seoSettings,, '
),,' (
{-- 

_webHelper.. 
=.. 
	webHelper.. &
;..& '
_seoSettings// 
=// 
seoSettings// *
;//* +
}00 
	protected;; 
void;; 
RedirectRequest;; *
(;;* +&
AuthorizationFilterContext;;+ E

,;;S T
bool;;U Y
withWww;;Z a
);;a b
{<< 
var>> 
	urlScheme>> 
=>> 
$">>  "
{>>" #

_webHelper>># -
.>>- ."
CurrentRequestProtocol>>. D
}>>D E
{>>E F
Uri>>F I
.>>I J
SchemeDelimiter>>J Y
}>>Y Z
">>Z [
;>>[ \
varAA 
	urlWith3WAA 
=AA 
$"AA  "
{AA" #
	urlSchemeAA# ,
}AA, -
$strAA- 1
"AA1 2
;AA2 3
varDD 

currentUrlDD 
=DD  

_webHelperDD! +
.DD+ ,
GetThisPageUrlDD, :
(DD: ;
trueDD; ?
)DD? @
;DD@ A
varGG 
urlStartsWith3WGG #
=GG$ %

currentUrlGG& 0
.GG0 1

StartsWithGG1 ;
(GG; <
	urlWith3WGG< E
,GGE F
StringComparisonGGG W
.GGW X
OrdinalIgnoreCaseGGX i
)GGi j
;GGj k
ifJJ 
(JJ 
withWwwJJ 
&&JJ 
!JJ  
urlStartsWith3WJJ  /
)JJ/ 0

.KK! "
ResultKK" (
=KK) *
newKK+ .
RedirectResultKK/ =
(KK= >

currentUrlKK> H
.KKH I
ReplaceKKI P
(KKP Q
	urlSchemeKKQ Z
,KKZ [
	urlWith3WKK\ e
)KKe f
,KKf g
trueKKh l
)KKl m
;KKm n
ifNN 
(NN 
!NN 
withWwwNN 
&&NN 
urlStartsWith3WNN  /
)NN/ 0

.OO! "
ResultOO" (
=OO) *
newOO+ .
RedirectResultOO/ =
(OO= >

currentUrlOO> H
.OOH I
ReplaceOOI P
(OOP Q
	urlWith3WOOQ Z
,OOZ [
	urlSchemeOO\ e
)OOe f
,OOf g
trueOOh l
)OOl m
;OOm n
}PP 
publicZZ 
voidZZ 
OnAuthorizationZZ '
(ZZ' (&
AuthorizationFilterContextZZ( B

)ZZP Q
{[[ 
if\\ 
(\\ 

==\\" $
null\\% )
)\\) *
throw]] 
new]] !
ArgumentNullException]] 3
(]]3 4
nameof]]4 :
(]]: ;

)]]H I
)]]I J
;]]J K
if`` 
(`` 
!`` 

.``" #
HttpContext``# .
.``. /
Request``/ 6
.``6 7
Method``7 =
.``= >
Equals``> D
(``D E
WebRequestMethods``E V
.``V W
Http``W [
.``[ \
Get``\ _
,``_ `
StringComparison``a q
.``q r'
InvariantCultureIgnoreCase	``r �
)
``� �
)
``� �
returnaa 
;aa 
ifcc 
(cc 
!cc 
DataSettingsManagercc (
.cc( )
DatabaseIsInstalledcc) <
)cc< =
returndd 
;dd 
ifgg 
(gg 

_webHelpergg 
.gg 
IsLocalRequestgg -
(gg- .

.gg; <
HttpContextgg< G
.ggG H
RequestggH O
)ggO P
)ggP Q
returnhh 
;hh 
switchjj 
(jj 
_seoSettingsjj $
.jj$ %
WwwRequirementjj% 3
)jj3 4
{kk 
casell 
WwwRequirementll '
.ll' (
WithWwwll( /
:ll/ 0
RedirectRequestnn '
(nn' (

,nn5 6
truenn7 ;
)nn; <
;nn< =
breakoo 
;oo 
casepp 
WwwRequirementpp '
.pp' (

WithoutWwwpp( 2
:pp2 3
RedirectRequestrr '
(rr' (

,rr5 6
falserr7 <
)rr< =
;rr= >
breakss 
;ss 
casett 
WwwRequirementtt '
.tt' (
NoMattertt( 0
:tt0 1
breakvv 
;vv 
defaultww 
:ww 
throwxx 
newxx !
NopExceptionxx" .
(xx. /
$strxx/ W
)xxW X
;xxX Y
}yy 
}zz 
}}} 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\ModelBinding\IModelAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
ModelBinding  ,
{ 
public 

	interface 
IModelAttribute $
{ 
string 
Name 
{ 
get 
; 
} 
}
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\ModelBinding\ModelStateExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
ModelBinding  ,
{ 
public 

static 
class  
ModelStateExtensions ,
{ 
private
static

Dictionary
<
string
,
object
>
SerializeModelState
(
ModelStateEntry

modelState
)
{ 	
var 
errors 
= 
new 
List !
<! "
string" (
>( )
() *
)* +
;+ ,
for 
( 
var 
i 
= 
$num 
; 
i 
< 

modelState  *
.* +
Errors+ 1
.1 2
Count2 7
;7 8
i9 :
++: <
)< =
{ 
var 

modelError 
=  

modelState! +
.+ ,
Errors, 2
[2 3
i3 4
]4 5
;5 6
var 
	errorText 
= 
ValidationHelpers  1
.1 2)
GetModelErrorMessageOrDefault2 O
(O P

modelErrorP Z
)Z [
;[ \
if 
( 
! 
string 
. 

() *
	errorText* 3
)3 4
)4 5
{ 
errors 
. 
Add 
( 
	errorText (
)( )
;) *
} 
} 
var 

dictionary 
= 
new  

Dictionary! +
<+ ,
string, 2
,2 3
object4 :
>: ;
(; <
)< =
;= >

dictionary 
[ 
$str 
]  
=! "
errors# )
.) *
ToArray* 1
(1 2
)2 3
;3 4
return 

dictionary 
; 
} 	
public%% 
static%% 
object%% 
SerializeErrors%% ,
(%%, -
this%%- 1 
ModelStateDictionary%%2 F 
modelStateDictionary%%G [
)%%[ \
{&& 	
return''  
modelStateDictionary'' '
.''' (
Where''( -
(''- .
entry''. 3
=>''4 6
entry''7 <
.''< =
Value''= B
.''B C
Errors''C I
.''I J
Any''J M
(''M N
)''N O
)''O P
.(( 
ToDictionary(( 
((( 
entry(( #
=>(($ &
entry((' ,
.((, -
Key((- 0
,((0 1
entry((2 7
=>((8 :
SerializeModelState((; N
(((N O
entry((O T
.((T U
Value((U Z
)((Z [
)(([ \
;((\ ]
})) 	
}** 
}++ �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\ModelBinding\NopMetadataProvider.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
ModelBinding  ,
{ 
public

 

class

 
NopMetadataProvider

 $
:

% &$
IDisplayMetadataProvider

' ?
{ 
public 
void !
CreateDisplayMetadata )
() **
DisplayMetadataProviderContext* H
contextI P
)P Q
{ 	
var 
additionalValues  
=! "
context# *
.* +

Attributes+ 5
.5 6
OfType6 <
<< =
IModelAttribute= L
>L M
(M N
)N O
.O P
ToListP V
(V W
)W X
;X Y
foreach 
( 
var 
additionalValue (
in) +
additionalValues, <
)< =
{ 
if 
( 
context 
. 
DisplayMetadata +
.+ ,
AdditionalValues, <
.< =
ContainsKey= H
(H I
additionalValueI X
.X Y
NameY ]
)] ^
)^ _
throw 
new 
NopException *
(* +
$str+ l
,l m
additionalValuen }
.} ~
Name	~ �
)
� �
;
� �
context 
. 
DisplayMetadata '
.' (
AdditionalValues( 8
.8 9
Add9 <
(< =
additionalValue= L
.L M
NameM Q
,Q R
additionalValueS b
)b c
;c d
} 
} 	
} 
} �"
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\ModelBinding\NopModelBinder.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 
Mvc

 
.

  
ModelBinding

  ,
{ 
public 

class 
NopModelBinder 
:  !"
ComplexTypeModelBinder" 8
{ 
public 
NopModelBinder 
( 
IDictionary )
<) *

,7 8
IModelBinder9 E
>E F
propertyBindersG V
,V W
ILoggerFactoryX f

)t u
: 
base 
( 
propertyBinders "
," #

)1 2
{ 	
} 	
	protected%% 
override%% 
object%% !
CreateModel%%" -
(%%- .
ModelBindingContext%%. A
bindingContext%%B P
)%%P Q
{&& 	
if'' 
('' 
bindingContext'' 
=='' !
null''" &
)''& '
throw(( 
new(( !
ArgumentNullException(( /
(((/ 0
nameof((0 6
(((6 7
bindingContext((7 E
)((E F
)((F G
;((G H
var++ 
model++ 
=++ 
base++ 
.++ 
CreateModel++ (
(++( )
bindingContext++) 7
)++7 8
;++8 9
if.. 
(.. 
model.. 
is.. 
BaseNopModel.. %
)..% &
(// 
model// 
as// 
BaseNopModel// &
)//& '
.//' (
	BindModel//( 1
(//1 2
bindingContext//2 @
)//@ A
;//A B
return11 
model11 
;11 
}22 	
	protected;; 
override;; 
void;; 
SetProperty;;  +
(;;+ ,
ModelBindingContext;;, ?
bindingContext;;@ N
,;;N O
string;;P V
	modelName;;W `
,;;` a

propertyMetadata<< *
,<<* +
ModelBindingResult<<, >

)<<L M
{== 	
if>> 
(>> 
bindingContext>> 
==>> !
null>>" &
)>>& '
throw?? 
new?? !
ArgumentNullException?? /
(??/ 0
nameof??0 6
(??6 7
bindingContext??7 E
)??E F
)??F G
;??G H
varBB 

=BB 

.BB- .
ModelBB. 3
asBB4 6
stringBB7 =
;BB= >
ifCC 
(CC 
bindingContextCC 
.CC 
ModelCC $
isCC% '
BaseNopModelCC( 4
&&CC5 7
!CC8 9
stringCC9 ?
.CC? @

(CCM N

)CC[ \
)CC\ ]
{DD 
varFF 
noTrimFF 
=FF 
(FF 
propertyMetadataFF .
asFF/ 1 
DefaultModelMetadataFF2 F
)FFF G
?FFG H
.FFH I

AttributesFFI S
?FFS T
.FFT U

AttributesFFU _
?FF_ `
.FF` a
OfTypeFFa g
<FFg h
NoTrimAttributeFFh w
>FFw x
(FFx y
)FFy z
.FFz {
AnyFF{ ~
(FF~ 
)	FF �
;
FF� �
ifGG 
(GG 
!GG 
noTrimGG 
.GG 
HasValueGG $
||GG% '
!GG( )
noTrimGG) /
.GG/ 0
ValueGG0 5
)GG5 6

=HH" #
ModelBindingResultHH$ 6
.HH6 7
SuccessHH7 >
(HH> ?

.HHL M
TrimHHM Q
(HHQ R
)HHR S
)HHS T
;HHT U
}II 
baseKK 
.KK 
SetPropertyKK 
(KK 
bindingContextKK +
,KK+ ,
	modelNameKK- 6
,KK6 7
propertyMetadataKK8 H
,KKH I

)KKW X
;KKX Y
}LL 	
}OO 
}PP �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\ModelBinding\NopModelBinderProvider.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
ModelBinding  ,
{		 
public

class
NopModelBinderProvider
:
IModelBinderProvider
{ 
public 
IModelBinder 
	GetBinder %
(% &&
ModelBinderProviderContext& @
contextA H
)H I
{ 	
if 
( 
context 
== 
null 
)  
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
context7 >
)> ?
)? @
;@ A
var 
	modelType 
= 
context #
.# $
Metadata$ ,
., -
	ModelType- 6
;6 7
if 
( 
! 
typeof 
( 
BaseNopModel $
)$ %
.% &
IsAssignableFrom& 6
(6 7
	modelType7 @
)@ A
)A B
return 
null 
; 
if 
( 
context 
. 
Metadata  
.  !

&&/ 1
!2 3
context3 :
.: ;
Metadata; C
.C D
IsCollectionTypeD T
)T U
{   
var"" 
propertyBinders"" #
=""$ %
context""& -
.""- .
Metadata"". 6
.""6 7

Properties""7 A
.## 
ToDictionary## !
(##! "

=>##0 2

,##@ A

=>##P R
context##S Z
.##Z [
CreateBinder##[ g
(##g h

)##u v
)##v w
;##w x
return%% 
new%% 
NopModelBinder%% )
(%%) *
propertyBinders%%* 9
,%%9 :

.%%H I
Current%%I P
.%%P Q
Resolve%%Q X
<%%X Y
ILoggerFactory%%Y g
>%%g h
(%%h i
)%%i j
)%%j k
;%%k l
}&& 
return)) 
null)) 
;)) 
}** 	
}++ 
},, �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\ModelBinding\NopResourceDisplayNameAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
ModelBinding  ,
{ 
public 

class +
NopResourceDisplayNameAttribute 0
:1 2 
DisplayNameAttribute3 G
,G H
IModelAttributeI X
{ 
private 
string 
_resourceValue %
=& '
string( .
.. /
Empty/ 4
;4 5
public +
NopResourceDisplayNameAttribute .
(. /
string/ 5
resourceKey6 A
)A B
:C D
baseE I
(I J
resourceKeyJ U
)U V
{ 	
ResourceKey 
= 
resourceKey %
;% &
} 	
public%% 
string%% 
ResourceKey%% !
{%%" #
get%%$ '
;%%' (
set%%) ,
;%%, -
}%%. /
public** 
override** 
string** 
DisplayName** *
{++ 	
get,, 
{-- 
var// 
workingLanguageId// %
=//& '

.//5 6
Current//6 =
.//= >
Resolve//> E
<//E F
IWorkContext//F R
>//R S
(//S T
)//T U
.//U V
WorkingLanguage//V e
.//e f
Id//f h
;//h i
_resourceValue22 
=22  

.22. /
Current22/ 6
.226 7
Resolve227 >
<22> ? 
ILocalizationService22? S
>22S T
(22T U
)22U V
.22V W
GetResource22W b
(22b c
ResourceKey22c n
,22n o
workingLanguageId	22p �
,
22� �
true
22� �
,
22� �
ResourceKey
22� �
)
22� �
;
22� �
return44 
_resourceValue44 %
;44% &
}55 
}66 	
public;; 
string;; 
Name;; 
{<< 	
get== 
{== 
return== 
nameof== 
(==  +
NopResourceDisplayNameAttribute==  ?
)==? @
;==@ A
}==B C
}>> 	
}AA 
}BB �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\ModelBinding\NoTrimAttribute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
ModelBinding  ,
{ 
public 

class 
NoTrimAttribute  
:! "
	Attribute# ,
{		 
}

 
} �
|C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\NullJsonResult.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
{ 
public 

class 
NullJsonResult 
:  !

JsonResult" ,
{		 
public
NullJsonResult
(
)
:
base
(
null
)
{ 	
} 	
} 
} �#
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Razor\NopRazorPage.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Razor  %
{		 
public 

abstract 
class 
NopRazorPage &
<& '
TModel' -
>- .
:/ 0
	Microsoft1 :
.: ;

AspNetCore; E
.E F
MvcF I
.I J
RazorJ O
.O P
	RazorPageP Y
<Y Z
TModelZ `
>` a
{ 
private  
ILocalizationService $ 
_localizationService% 9
;9 :
private 
	Localizer 

_localizer $
;$ %
public 
	Localizer 
T 
{ 	
get 
{ 
if 
(  
_localizationService (
==) +
null, 0
)0 1 
_localizationService (
=) *

.8 9
Current9 @
.@ A
ResolveA H
<H I 
ILocalizationServiceI ]
>] ^
(^ _
)_ `
;` a
if 
( 

_localizer 
== !
null" &
)& '
{ 

_localizer 
=  
(! "
format" (
,( )
args* .
). /
=>0 2
{   
var!! 
	resFormat!! %
=!!& ' 
_localizationService!!( <
.!!< =
GetResource!!= H
(!!H I
format!!I O
)!!O P
;!!P Q
if"" 
("" 
string"" "
.""" #

(""0 1
	resFormat""1 :
)"": ;
)""; <
{## 
return$$ "
new$$# &
LocalizedString$$' 6
($$6 7
format$$7 =
)$$= >
;$$> ?
}%% 
return&& 
new&& "
LocalizedString&&# 2
(&&2 3
(&&3 4
args&&4 8
==&&9 ;
null&&< @
||&&A C
args&&D H
.&&H I
Length&&I O
==&&P R
$num&&S T
)&&T U
?'' 
	resFormat'' '
:(( 
string(( $
.(($ %
Format((% +
(((+ ,
	resFormat((, 5
,((5 6
args((7 ;
)((; <
)((< =
;((= >
})) 
;)) 
}** 
return++ 

_localizer++ !
;++! "
},, 
}-- 	
public33 
bool33 
ShouldUseRtlTheme33 %
(33% &
)33& '
{44 	
var55 
workContext55 
=55 

.55+ ,
Current55, 3
.553 4
Resolve554 ;
<55; <
IWorkContext55< H
>55H I
(55I J
)55J K
;55K L
var66 

supportRtl66 
=66 
workContext66 (
.66( )
WorkingLanguage66) 8
.668 9
Rtl669 <
;66< =
if77 
(77 

supportRtl77 
)77 
{88 
var:: 

=::" #

.::1 2
Current::2 9
.::9 :
Resolve::: A
<::A B
IThemeProvider::B P
>::P Q
(::Q R
)::R S
;::S T
var;; 
themeContext;;  
=;;! "

.;;0 1
Current;;1 8
.;;8 9
Resolve;;9 @
<;;@ A

>;;N O
(;;O P
);;P Q
;;;Q R

supportRtl<< 
=<< 

.<<* + 
GetThemeBySystemName<<+ ?
(<<? @
themeContext<<@ L
.<<L M
WorkingThemeName<<M ]
)<<] ^
?<<^ _
.<<_ `

SupportRtl<<` j
??<<k m
false<<n s
;<<s t
}== 
return>> 

supportRtl>> 
;>> 
}?? 	
}@@ 
publicEE 

abstractEE 
classEE 
NopRazorPageEE &
:EE' (
NopRazorPageEE) 5
<EE5 6
dynamicEE6 =
>EE= >
{FF 
}GG 
}HH �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Routing\IRouteProvider.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Routing  '
{ 
public 

	interface 
IRouteProvider #
{		 
void 
RegisterRoutes
( 

routeBuilder* 6
)6 7
;7 8
int 
Priority 
{ 
get 
; 
} 
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Routing\IRoutePublisher.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Routing  '
{ 
public 

	interface 
IRoutePublisher $
{		 
void 
RegisterRoutes
( 

routeBuilder* 6
)6 7
;7 8
} 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Routing\NopRedirectResultExecutor.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 
Mvc

 
.

  
Routing

  '
{ 
public 

class %
NopRedirectResultExecutor *
:+ ,"
RedirectResultExecutor- C
{ 
private 
readonly 
SecuritySettings )
_securitySettings* ;
;; <
public %
NopRedirectResultExecutor (
(( )
ILoggerFactory) 7

,E F
IUrlHelperFactory 
urlHelperFactory .
,. /
SecuritySettings 
securitySettings -
)- .
:/ 0
base1 5
(5 6

,C D
urlHelperFactoryE U
)U V
{ 	
_securitySettings 
= 
securitySettings  0
;0 1
} 	
public** 
override** 
Task** 
ExecuteAsync** )
(**) *

context**8 ?
,**? @
RedirectResult**A O
result**P V
)**V W
{++ 	
if,, 
(,, 
result,, 
==,, 
null,, 
),, 
throw-- 
new-- !
ArgumentNullException-- /
(--/ 0
nameof--0 6
(--6 7
result--7 =
)--= >
)--> ?
;--? @
if// 
(// 
_securitySettings// !
.//! ",
 AllowNonAsciiCharactersInHeaders//" B
)//B C
{00 
result33 
.33 
Url33 
=33 
Uri33  
.33  !
EscapeUriString33! 0
(330 1

WebUtility331 ;
.33; <
	UrlDecode33< E
(33E F
result33F L
.33L M
Url33M P
)33P Q
)33Q R
;33R S
}44 
return66 
base66 
.66 
ExecuteAsync66 $
(66$ %
context66% ,
,66, -
result66. 4
)664 5
;665 6
}77 	
}:: 
};; �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\Routing\RoutePublisher.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Mvc 
.  
Routing  '
{ 
public 

class 
RoutePublisher 
:  !
IRoutePublisher" 1
{ 
	protected 
readonly 
ITypeFinder &
_typeFinder' 2
;2 3
public 
RoutePublisher 
( 
ITypeFinder )

typeFinder* 4
)4 5
{ 	
_typeFinder 
= 

typeFinder $
;$ %
} 	
public)) 
virtual)) 
void)) 
RegisterRoutes)) *
())* +

routeBuilder))9 E
)))E F
{** 	
var,, 
routeProviders,, 
=,,  
_typeFinder,,! ,
.,,, -
FindClassesOfType,,- >
<,,> ?
IRouteProvider,,? M
>,,M N
(,,N O
),,O P
;,,P Q
var// 
	instances// 
=// 
routeProviders// *
.00 
Select00 
(00 

=>00& (
(00) *
IRouteProvider00* 8
)008 9
	Activator009 B
.00B C
CreateInstance00C Q
(00Q R

)00_ `
)00` a
.11 
OrderByDescending11 "
(11" #

=>111 3

.11A B
Priority11B J
)11J K
;11K L
foreach44 
(44 
var44 

in44' )
	instances44* 3
)443 4

.55 
RegisterRoutes55 ,
(55, -
routeBuilder55- 9
)559 :
;55: ;
}66 	
}99 
}:: �
}C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Mvc\RssActionResult.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 
Mvc		 
{

 
public 

class 
RssActionResult  
:! "

{ 
public 
RssActionResult 
( 
RssFeed &
feed' +
,+ ,
string- 3
feedPageUrl4 ?
)? @
{ 	
ContentType 
= 
$str 0
;0 1
Feed 
= 
feed 
; 

XNamespace 
atom 
= 
$str ;
;; <
Feed 
. 
AttributeExtension #
=$ %
new& )
KeyValuePair* 6
<6 7
XmlQualifiedName7 G
,G H
stringI O
>O P
(P Q
newQ T
XmlQualifiedNameU e
(e f
$strf l
,l m

XNamespacen x
.x y
Xmlnsy ~
.~ 

)
� �
,
� �
atom
� �
.
� �

� �
)
� �
;
� �
Feed 
. 
ElementExtensions "
." #
Add# &
(& '
new' *
XElement+ 3
(3 4
atom4 8
+9 :
$str; A
,A B
newC F

XAttributeG Q
(Q R
$strR X
,X Y
newZ ]
Uri^ a
(a b
feedPageUrlb m
)m n
)n o
,o p
newq t

XAttributeu 
(	 �
$str
� �
,
� �
$str
� �
)
� �
,
� �
new
� �

XAttribute
� �
(
� �
$str
� �
,
� �
$str
� �
)
� �
)
� �
)
� �
;
� �
} 	
public$$ 
RssFeed$$ 
Feed$$ 
{$$ 
get$$ !
;$$! "
set$$# &
;$$& '
}$$( )
public++ 
override++ 
Task++ 
ExecuteResultAsync++ /
(++/ 0

context++> E
)++E F
{,, 	
Content-- 
=-- 
Feed-- 
.-- 

GetContent-- %
(--% &
)--& '
;--' (
return.. 
base.. 
... 
ExecuteResultAsync.. *
(..* +
context..+ 2
)..2 3
;..3 4
}// 	
public55 
override55 
void55 

(55* +

context559 @
)55@ A
{66 	
Content77 
=77 
Feed77 
.77 

GetContent77 %
(77% &
)77& '
;77' (
base88 
.88 

(88 
context88 &
)88& '
;88' (
}99 	
}:: 
};; �F
tC:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\RemotePost.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
{		 
public

partial
class

RemotePost
{ 
private 
readonly  
IHttpContextAccessor - 
_httpContextAccessor. B
;B C
private 
readonly 

IWebHelper #

_webHelper$ .
;. /
private 
readonly 
NameValueCollection ,
_inputValues- 9
;9 :
public 
string 
Url 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
Method 
{ 
get "
;" #
set$ '
;' (
}) *
public   
string   
FormName   
{    
get  ! $
;  $ %
set  & )
;  ) *
}  + ,
public%% 
string%% 

{%%$ %
get%%& )
;%%) *
set%%+ .
;%%. /
}%%0 1
public** 
bool**  
NewInputForEachValue** (
{**) *
get**+ .
;**. /
set**0 3
;**3 4
}**5 6
public// 
NameValueCollection// "
Params//# )
{00 	
get11 
{22 
return33 
_inputValues33 #
;33# $
}44 
}55 	
public:: 

RemotePost:: 
(:: 
):: 
:;; 
this;; 
(;; 

.;;  !
Current;;! (
.;;( )
Resolve;;) 0
<;;0 1 
IHttpContextAccessor;;1 E
>;;E F
(;;F G
);;G H
,;;H I

.;;W X
Current;;X _
.;;_ `
Resolve;;` g
<;;g h

IWebHelper;;h r
>;;r s
(;;s t
);;t u
);;u v
{<< 	
}== 	
publicDD 

RemotePostDD 
(DD  
IHttpContextAccessorDD .
httpContextAccessorDD/ B
,DDB C

IWebHelperDDD N
	webHelperDDO X
)DDX Y
{EE 	
_inputValuesFF 
=FF 
newFF 
NameValueCollectionFF 2
(FF2 3
)FF3 4
;FF4 5
UrlGG 
=GG 
$strGG *
;GG* +
MethodHH 
=HH 
$strHH 
;HH 
FormNameII 
=II 
$strII !
;II! " 
_httpContextAccessorKK  
=KK! "
httpContextAccessorKK# 6
;KK6 7

_webHelperLL 
=LL 
	webHelperLL "
;LL" #
}MM 	
publicTT 
voidTT 
AddTT 
(TT 
stringTT 
nameTT #
,TT# $
stringTT% +
valueTT, 1
)TT1 2
{UU 	
_inputValuesVV 
.VV 
AddVV 
(VV 
nameVV !
,VV! "
valueVV# (
)VV( )
;VV) *
}WW 	
public\\ 
void\\ 
Post\\ 
(\\ 
)\\ 
{]] 	
var__ 
sb__ 
=__ 
new__ 

(__& '
)__' (
;__( )
sb`` 
.`` 
Append`` 
(`` 
$str`` $
)``$ %
;``% &
sbaa 
.aa 
Appendaa 
(aa 
$"aa 
$straa 7
{aa7 8
FormNameaa8 @
}aa@ A
$straaA M
"aaM N
)aaN O
;aaO P
ifbb 
(bb 
!bb 
stringbb 
.bb 

(bb% &

)bb3 4
)bb4 5
{cc 
sbee 
.ee 
Appendee 
(ee 
$"ff 
$strff #
{ff# $
FormNameff$ ,
}ff, -
$strff- 9
{ff9 :
Methodff: @
}ff@ A
$strffA M
{ffM N
UrlffN Q
}ffQ R
$strffR f
{fff g

}fft u
$strffu x
"ffx y
)ffy z
;ffz {
}gg 
elsehh 
{ii 
sbkk 
.kk 
Appendkk 
(kk 
$"kk 
$strkk )
{kk) *
FormNamekk* 2
}kk2 3
$strkk3 ?
{kk? @
Methodkk@ F
}kkF G
$strkkG S
{kkS T
UrlkkT W
}kkW X
$strkkX \
"kk\ ]
)kk] ^
;kk^ _
}ll 
ifmm 
(mm  
NewInputForEachValuemm $
)mm$ %
{nn 
foreachoo 
(oo 
stringoo 
keyoo  #
inoo$ &
_inputValuesoo' 3
.oo3 4
Keysoo4 8
)oo8 9
{pp 
varqq 
valuesqq 
=qq  
_inputValuesqq! -
.qq- .
	GetValuesqq. 7
(qq7 8
keyqq8 ;
)qq; <
;qq< =
ifrr 
(rr 
valuesrr 
!=rr !
nullrr" &
)rr& '
{ss 
foreachtt 
(tt  !
vartt! $
valuett% *
intt+ -
valuestt. 4
)tt4 5
{uu 
sbvv 
.vv 
Appendvv %
(vv% &
$"ww  "
$strww" 0
{ww0 1

WebUtilityww1 ;
.ww; <

HtmlEncodeww< F
(wwF G
keywwG J
)wwJ K
}wwK L
$strwwL g
{wwg h

WebUtilitywwh r
.wwr s

HtmlEncodewws }
(ww} ~
value	ww~ �
)
ww� �
}
ww� �
$str
ww� �
"
ww� �
)
ww� �
;
ww� �
}xx 
}yy 
}zz 
}{{ 
else|| 
{}} 
for~~ 
(~~ 
var~~ 
i~~ 
=~~ 
$num~~ 
;~~ 
i~~  !
<~~" #
_inputValues~~$ 0
.~~0 1
Keys~~1 5
.~~5 6
Count~~6 ;
;~~; <
i~~= >
++~~> @
)~~@ A
sb 
. 
Append 
( 
$"
�� 
$str
�� (
{
��( )

WebUtility
��) 3
.
��3 4

HtmlEncode
��4 >
(
��> ?
_inputValues
��? K
.
��K L
Keys
��L P
[
��P Q
i
��Q R
]
��R S
)
��S T
}
��T U
$str
��U p
{
��p q

WebUtility
��q {
.
��{ |

HtmlEncode��| �
(��� �
_inputValues��� �
[��� �
_inputValues��� �
.��� �
Keys��� �
[��� �
i��� �
]��� �
]��� �
)��� �
}��� �
$str��� �
"��� �
)��� �
;��� �
}
�� 
sb
�� 
.
�� 
Append
�� 
(
�� 
$str
�� 
)
��  
;
��  !
sb
�� 
.
�� 
Append
�� 
(
�� 
$str
�� &
)
��& '
;
��' (
var
�� 
httpContext
�� 
=
�� "
_httpContextAccessor
�� 2
.
��2 3
HttpContext
��3 >
;
��> ?
var
�� 
response
�� 
=
�� 
httpContext
�� &
.
��& '
Response
��' /
;
��/ 0
response
�� 
.
�� 
Clear
�� 
(
�� 
)
�� 
;
�� 
var
�� 
data
�� 
=
�� 
Encoding
�� 
.
��  
UTF8
��  $
.
��$ %
GetBytes
��% -
(
��- .
sb
��. 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
)
��; <
;
��< =
response
�� 
.
�� 
ContentType
��  
=
��! "
$str
��# =
;
��= >
response
�� 
.
�� 

�� "
=
��# $
data
��% )
.
��) *
Length
��* 0
;
��0 1
response
�� 
.
�� 
Body
�� 
.
�� 
Write
�� 
(
��  
data
��  $
,
��$ %
$num
��& '
,
��' (
data
��) -
.
��- .
Length
��. 4
)
��4 5
;
��5 6

_webHelper
�� 
.
�� 
IsPostBeingDone
�� &
=
��' (
true
��) -
;
��- .
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Security\Captcha\CaptchaHttpClient.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 
Security

 $
.

$ %
Captcha

% ,
{ 
public 

partial 
class 
CaptchaHttpClient *
{ 
private 
readonly 
CaptchaSettings (
_captchaSettings) 9
;9 :
private 
readonly 

HttpClient #
_httpClient$ /
;/ 0
private 
readonly 

IWebHelper #

_webHelper$ .
;. /
public 
CaptchaHttpClient  
(  !
CaptchaSettings! 0
captchaSettings1 @
,@ A

HttpClient 
client 
, 

IWebHelper 
	webHelper  
)  !
{ 	
client   
.   
BaseAddress   
=    
new  ! $
Uri  % (
(  ( )
NopSecurityDefaults  ) <
.  < =
RecaptchaApiUrl  = L
)  L M
;  M N
client!! 
.!! 
Timeout!! 
=!! 
TimeSpan!! %
.!!% &
FromMilliseconds!!& 6
(!!6 7
$num!!7 ;
)!!; <
;!!< =
client"" 
."" !
DefaultRequestHeaders"" (
.""( )
Add"") ,
("", -
HeaderNames""- 8
.""8 9
	UserAgent""9 B
,""B C
$"""D F
$str""F R
{""R S

NopVersion""S ]
.""] ^
CurrentVersion""^ l
}""l m
"""m n
)""n o
;""o p
_captchaSettings$$ 
=$$ 
captchaSettings$$ .
;$$. /
_httpClient%% 
=%% 
client%%  
;%%  !

_webHelper&& 
=&& 
	webHelper&& "
;&&" #
}'' 	
public22 
virtual22 
async22 
Task22 !
<22! "
CaptchaResponse22" 1
>221 2 
ValidateCaptchaAsync223 G
(22G H
string22H N

)22\ ]
{33 	
var55 
url55 
=55 
string55 
.55 
Format55 #
(55# $
NopSecurityDefaults55$ 7
.557 8#
RecaptchaValidationPath558 O
,55O P
_captchaSettings66  
.66  !
ReCaptchaPrivateKey66! 4
,664 5

,77 

_webHelper88 
.88 
GetCurrentIpAddress88 .
(88. /
)88/ 0
)880 1
;881 2
var;; 
response;; 
=;; 
await;;  
_httpClient;;! ,
.;;, -
GetStringAsync;;- ;
(;;; <
url;;< ?
);;? @
;;;@ A
return<< 
JsonConvert<< 
.<< 
DeserializeObject<< 0
<<<0 1
CaptchaResponse<<1 @
><<@ A
(<<A B
response<<B J
)<<J K
;<<K L
}>> 	
}AA 
}BB �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Security\Captcha\CaptchaResponse.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Security $
.$ %
Captcha% ,
{ 
public

 

partial

 
class

 
CaptchaResponse

 (
{ 
public 
CaptchaResponse 
( 
)  
{ 	
Errors 
= 
new 
List 
< 
string $
>$ %
(% &
)& '
;' (
} 	
[ 	
JsonProperty	 
( 
PropertyName "
=# $
$str% .
). /
]/ 0
public 
bool 
IsValid 
{ 
get !
;! "
set# &
;& '
}( )
[   	
JsonProperty  	 
(   
PropertyName   "
=  # $
$str  % 3
)  3 4
]  4 5
public!! 
DateTime!! 
?!! 
ChallengeDateTime!! *
{!!+ ,
get!!- 0
;!!0 1
set!!2 5
;!!5 6
}!!7 8
[&& 	
JsonProperty&&	 
(&& 
PropertyName&& "
=&&# $
$str&&% /
)&&/ 0
]&&0 1
public'' 
string'' 
Hostname'' 
{''  
get''! $
;''$ %
set''& )
;'') *
}''+ ,
[,, 	
JsonProperty,,	 
(,, 
PropertyName,, "
=,,# $
$str,,% 2
),,2 3
],,3 4
public-- 
List-- 
<-- 
string-- 
>-- 
Errors-- "
{--# $
get--% (
;--( )
set--* -
;--- .
}--/ 0
}00 
}11 �M
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Security\Captcha\HtmlExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Security $
.$ %
Captcha% ,
{ 
public 

static 
class 
HtmlExtensions &
{ 
public 
static 
IHtmlContent "
GenerateCaptcha# 2
(2 3
this3 7
IHtmlHelper8 C
helperD J
)J K
{ 	
var 
captchaSettings 
=  !

./ 0
Current0 7
.7 8
Resolve8 ?
<? @
CaptchaSettings@ O
>O P
(P Q
)Q R
;R S
var 
language 
= 
( 
captchaSettings +
.+ ,$
ReCaptchaDefaultLanguage, D
??E G
stringH N
.N O
EmptyO T
)T U
.U V
ToLowerV ]
(] ^
)^ _
;_ `
if 
( 
captchaSettings 
.  '
AutomaticallyChooseLanguage  ;
); <
{ 
var!! "
supportedLanguageCodes!! *
=!!+ ,
new!!- 0
List!!1 5
<!!5 6
string!!6 <
>!!< =
{!!> ?
$str!!@ D
,!!D E
$str!!F J
,!!J K
$str!!L P
,!!P Q
$str!!R V
,!!V W
$str!!X \
,!!\ ]
$str!!^ b
,!!b c
$str!!d h
,!!h i
$str!!j n
,!!n o
$str!!p t
,!!t u
$str!!v z
,!!z {
$str	!!| �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
,
!!� �
$str
!!� �
}
!!� �
;
!!� �
var## 
languageService## #
=##$ %

.##3 4
Current##4 ;
.##; <
Resolve##< C
<##C D
ILanguageService##D T
>##T U
(##U V
)##V W
;##W X
var$$ 
workContext$$ 
=$$  !

.$$/ 0
Current$$0 7
.$$7 8
Resolve$$8 ?
<$$? @
IWorkContext$$@ L
>$$L M
($$M N
)$$N O
;$$O P
var%% 
twoLetterIsoCode%% $
=%%% &
workContext%%' 2
.%%2 3
WorkingLanguage%%3 B
!=%%C E
null%%F J
?&& 
languageService&& %
.&&% &'
GetTwoLetterIsoLanguageName&&& A
(&&A B
workContext&&B M
.&&M N
WorkingLanguage&&N ]
)&&] ^
.&&^ _
ToLower&&_ f
(&&f g
)&&g h
:'' 
string'' 
.'' 
Empty'' "
;''" #
language)) 
=)) "
supportedLanguageCodes)) 1
.))1 2
Contains))2 :
()): ;
twoLetterIsoCode)); K
)))K L
?))M N
twoLetterIsoCode))O _
:))` a
language))b j
;))j k
}** 
var-- 
theme-- 
=-- 
(-- 
captchaSettings-- (
.--( )
ReCaptchaTheme--) 7
??--8 :
string--; A
.--A B
Empty--B G
)--G H
.--H I
ToLower--I P
(--P Q
)--Q R
;--R S
switch.. 
(.. 
theme.. 
).. 
{// 
case00 
$str00 !
:00! "
case11 
$str11 
:11 
theme22 
=22 
$str22 "
;22" #
break33 
;33 
case55 
$str55 
:55 
case66 
$str66 
:66 
case77 
$str77 
:77 
case88 
$str88 
:88 
default99 
:99 
theme:: 
=:: 
$str:: #
;::# $
break;; 
;;; 
}<< 
var?? 
id?? 
=?? 
$"?? 
$str?? 
{??  
CommonHelper??  ,
.??, -!
GenerateRandomInteger??- B
(??B C
)??C D
}??D E
"??E F
;??F G
varBB 
	publicKeyBB 
=BB 
captchaSettingsBB +
.BB+ ,
ReCaptchaPublicKeyBB, >
??BB? A
stringBBB H
.BBH I
EmptyBBI N
;BBN O
varEE 
scriptCallbackTagEE !
=EE" #
newEE$ '

TagBuilderEE( 2
(EE2 3
$strEE3 ;
)EE; <
{EE= >

=EEM N

.EE\ ]
NormalEE] c
}EEd e
;EEe f
scriptCallbackTagFF 
.FF 
	InnerHtmlFF '
.GG 

AppendHtmlGG 
(GG 
$"GG 
$strGG 0
{GG0 1
idGG1 3
}GG3 4
$strGG4 W
{GGW X
idGGX Z
}GGZ [
$strGG[ m
{GGm n
	publicKeyGGn w
}GGw x
$str	GGx �
{
GG� �
theme
GG� �
}
GG� �
$str
GG� �
"
GG� �
)
GG� �
;
GG� �
varII 

captchaTagII 
=II 
newII  

TagBuilderII! +
(II+ ,
$strII, 1
)II1 2
{II3 4

=IIC D

.IIR S
NormalIIS Y
}IIZ [
;II[ \

captchaTagJJ 
.JJ 

AttributesJJ !
.JJ! "
AddJJ" %
(JJ% &
$strJJ& *
,JJ* +
idJJ, .
)JJ. /
;JJ/ 0
varLL 
urlLL 
=LL 
stringLL 
.LL 
FormatLL #
(LL# $
$"LL$ &
{LL& '
NopSecurityDefaultsLL' :
.LL: ;
RecaptchaApiUrlLL; J
}LLJ K
{LLK L
NopSecurityDefaultsLLL _
.LL_ `
RecaptchaScriptPathLL` s
}LLs t
"LLt u
,LLu v
idLLw y
,LLy z
!MM 
stringMM 
.MM 

(MM% &
languageMM& .
)MM. /
?MM0 1
$"MM2 4
$strMM4 8
{MM8 9
languageMM9 A
}MMA B
"MMB C
:MMD E
stringMMF L
.MML M
EmptyMMM R
)MMR S
;MMS T
varNN 
scriptLoadApiTagNN  
=NN! "
newNN# &

TagBuilderNN' 1
(NN1 2
$strNN2 :
)NN: ;
{NN< =

=NNL M

.NN[ \
NormalNN\ b
}NNc d
;NNd e
scriptLoadApiTagOO 
.OO 

AttributesOO '
.OO' (
AddOO( +
(OO+ ,
$strOO, 1
,OO1 2
urlOO3 6
)OO6 7
;OO7 8
scriptLoadApiTagPP 
.PP 

AttributesPP '
.PP' (
AddPP( +
(PP+ ,
$strPP, 3
,PP3 4
nullPP5 9
)PP9 :
;PP: ;
scriptLoadApiTagQQ 
.QQ 

AttributesQQ '
.QQ' (
AddQQ( +
(QQ+ ,
$strQQ, 3
,QQ3 4
nullQQ5 9
)QQ9 :
;QQ: ;
returnSS 
newSS 

HtmlStringSS !
(SS! "
scriptCallbackTagSS" 3
.SS3 4
RenderHtmlContentSS4 E
(SSE F
)SSF G
+SSH I

captchaTagSSJ T
.SST U
RenderHtmlContentSSU f
(SSf g
)SSg h
+SSi j
scriptLoadApiTagSSk {
.SS{ |
RenderHtmlContent	SS| �
(
SS� �
)
SS� �
)
SS� �
;
SS� �
}TT 	
}UU 
}VV �&
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Security\CurrentOSUser.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Security $
{ 
public 

static 
class 

{
static 

( 
) 
{ 	
Name 
= 
Environment 
. 
UserName '
;' (

DomainName 
= 
Environment $
.$ %
UserDomainName% 3
;3 4
switch 
( 
Environment 
.  
	OSVersion  )
.) *
Platform* 2
)2 3
{ 
case 

PlatformID 
.  
Win32NT  '
:' (
PopulateWindowsUser '
(' (
)( )
;) *
break 
; 
case 

PlatformID 
.  
Unix  $
:$ %
PopulateLinuxUser %
(% &
)& '
;' (
break 
; 
default 
: 
UserId 
= 
Name !
;! "
Groups   
=   
new    
List  ! %
<  % &
string  & ,
>  , -
(  - .
)  . /
;  / 0
break!! 
;!! 
}"" 
}## 	
public,, 
static,, 
void,, 
PopulateWindowsUser,, .
(,,. /
),,/ 0
{-- 	
Groups.. 
=.. 
WindowsIdentity.. $
...$ %

GetCurrent..% /
(../ 0
)..0 1
...1 2
Groups..2 8
?..8 9
...9 :
Select..: @
(..@ A
p..A B
=>..C E
p..F G
...G H
Value..H M
)..M N
...N O
ToList..O U
(..U V
)..V W
;..W X
UserId// 
=// 
Name// 
;// 
}00 	
public55 
static55 
void55 
PopulateLinuxUser55 ,
(55, -
)55- .
{66 	
var77 
process77 
=77 
new77 
Process77 %
{88 
	StartInfo99 
=99 
new99 
ProcessStartInfo99  0
{:: !
RedirectStandardInput;; )
=;;* +
true;;, 0
,;;0 1"
RedirectStandardOutput<< *
=<<+ ,
true<<- 1
,<<1 2
UseShellExecute== #
===$ %
false==& +
,==+ ,
FileName>> 
=>> 
$str>> #
,>># $
	Arguments?? 
=?? 
$str??  8
}@@ 
}AA 
;AA
processCC 
.CC 
StartCC 
(CC 
)CC 
;CC 
processDD 
.DD 
WaitForExitDD 
(DD  
)DD  !
;DD! "
varFF 
resFF 
=FF 
processFF 
.FF 
StandardOutputFF ,
.FF, -
	ReadToEndFF- 6
(FF6 7
)FF7 8
;FF8 9
varHH 
resparsHH 
=HH 
resHH 
.HH 
SplitHH #
(HH# $
$strHH$ (
)HH( )
;HH) *
UserIdJJ 
=JJ 
resparsJJ 
[JJ 
$numJJ 
]JJ 
;JJ  
GroupsKK 
=KK 
resparsKK 
[KK 
$numKK 
]KK 
.KK  
SplitKK  %
(KK% &
$strKK& )
)KK) *
.KK* +
ToListKK+ 1
(KK1 2
)KK2 3
;KK3 4
}LL 	
publicUU 
staticUU 
stringUU 
NameUU !
{UU" #
getUU$ '
;UU' (
}UU) *
publicZZ 
staticZZ 
stringZZ 

DomainNameZZ '
{ZZ( )
getZZ* -
;ZZ- .
}ZZ/ 0
public__ 
static__ 
List__ 
<__ 
string__ !
>__! "
Groups__# )
{__* +
get__, /
;__/ 0
private__1 8
set__9 <
;__< =
}__> ?
publicdd 
staticdd 
stringdd 
UserIddd #
{dd$ %
getdd& )
;dd) *
privatedd+ 2
setdd3 6
;dd6 7
}dd8 9
publicii 
staticii 
stringii 
FullNameii %
=>ii& (
$@"ii) ,
{ii, -

DomainNameii- 7
}ii7 8
$strii8 9
{ii9 :
Nameii: >
}ii> ?
"ii? @
;ii@ A
}ll 
}mm ݶ
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Security\FilePermissionHelper.cs
	namespace
Nop
 
.
Web
.
	Framework
.
Security
{ 
public 

static 
class  
FilePermissionHelper ,
{ 
private 
static 
bool $
CheckUserFilePermissions 4
(4 5
int5 8
userFilePermission9 K
,K L
boolM Q
	checkReadR [
,[ \
bool] a

checkWriteb l
,l m
booln r
checkModifys ~
,~ 
bool
� �
checkDelete
� �
)
� �
{ 	
var 
readPermissions 
=  !
new" %
[% &
]& '
{( )
$num* +
,+ ,
$num- .
,. /
$num0 1
}2 3
;3 4
var 
writePermissions  
=! "
new# &
[& '
]' (
{) *
$num+ ,
,, -
$num. /
,/ 0
$num1 2
,2 3
$num4 5
}6 7
;7 8
if 
( 
	checkRead 
& 
readPermissions +
.+ ,
Contains, 4
(4 5
userFilePermission5 G
)G H
)H I
return 
true 
; 
return!! 
(!! 

checkWrite!! 
||!! !
checkModify!!" -
||!!. 0
checkDelete!!1 <
)!!< =
&!!> ?
writePermissions!!@ P
.!!P Q
Contains!!Q Y
(!!Y Z
userFilePermission!!Z l
)!!l m
;!!m n
}"" 	
private$$ 
static$$ 
void$$ 
CheckAccessRule$$ +
($$+ , 
FileSystemAccessRule$$, @
rule$$A E
,$$E F
ref%% 
bool%% 
deleteIsDeny%% !
,%%! "
ref&& 
bool&& 
modifyIsDeny&& !
,&&! "
ref'' 
bool'' 

readIsDeny'' 
,''  
ref(( 
bool(( 
writeIsDeny((  
,((  !
ref)) 
bool)) 

,))" #
ref** 
bool** 

,**" #
ref++ 
bool++ 
readIsAllow++  
,++  !
ref,, 
bool,, 
writeIsAllow,, !
),,! "
{-- 	
switch.. 
(.. 
rule.. 
... 
AccessControlType.. *
)..* +
{// 
case00 
AccessControlType00 &
.00& '
Deny00' +
:00+ ,
if11 
(11  
CheckAccessRuleLocal11 ,
(11, -
rule11- 1
,111 2
FileSystemRights113 C
.11C D
Delete11D J
)11J K
)11K L
deleteIsDeny22 $
=22% &
true22' +
;22+ ,
if44 
(44  
CheckAccessRuleLocal44 ,
(44, -
rule44- 1
,441 2
FileSystemRights443 C
.44C D
Modify44D J
)44J K
)44K L
modifyIsDeny55 $
=55% &
true55' +
;55+ ,
if77 
(77  
CheckAccessRuleLocal77 ,
(77, -
rule77- 1
,771 2
FileSystemRights773 C
.77C D
Read77D H
)77H I
)77I J

readIsDeny88 "
=88# $
true88% )
;88) *
if:: 
(::  
CheckAccessRuleLocal:: ,
(::, -
rule::- 1
,::1 2
FileSystemRights::3 C
.::C D
Write::D I
)::I J
)::J K
writeIsDeny;; #
=;;$ %
true;;& *
;;;* +
return== 
;== 
case>> 
AccessControlType>> &
.>>& '
Allow>>' ,
:>>, -
if?? 
(??  
CheckAccessRuleLocal?? ,
(??, -
rule??- 1
,??1 2
FileSystemRights??3 C
.??C D
Delete??D J
)??J K
)??K L

=@@& '
true@@( ,
;@@, -
ifBB 
(BB  
CheckAccessRuleLocalBB ,
(BB, -
ruleBB- 1
,BB1 2
FileSystemRightsBB3 C
.BBC D
ModifyBBD J
)BBJ K
)BBK L

=CC& '
trueCC( ,
;CC, -
ifEE 
(EE  
CheckAccessRuleLocalEE ,
(EE, -
ruleEE- 1
,EE1 2
FileSystemRightsEE3 C
.EEC D
ReadEED H
)EEH I
)EEI J
readIsAllowFF #
=FF$ %
trueFF& *
;FF* +
ifHH 
(HH  
CheckAccessRuleLocalHH ,
(HH, -
ruleHH- 1
,HH1 2
FileSystemRightsHH3 C
.HHC D
WriteHHD I
)HHI J
)HHJ K
writeIsAllowII $
=II% &
trueII' +
;II+ ,
breakJJ 
;JJ 
}KK 
}LL 	
privateNN 
staticNN 
boolNN  
CheckAccessRuleLocalNN 0
(NN0 1 
FileSystemAccessRuleNN1 E 
fileSystemAccessRuleNNF Z
,NNZ [
FileSystemRightsNN\ l
fileSystemRightsNNm }
)NN} ~
{OO 	
returnPP 
(PP 
fileSystemRightsPP $
&PP% & 
fileSystemAccessRulePP' ;
.PP; <
FileSystemRightsPP< L
)PPL M
==PPN P
fileSystemRightsPPQ a
;PPa b
}QQ 	
private\\ 
static\\ 
bool\\ %
CheckPermissionsInWindows\\ 5
(\\5 6
string\\6 <
path\\= A
,\\A B
bool\\C G
	checkRead\\H Q
,\\Q R
bool\\S W

checkWrite\\X b
,\\b c
bool\\d h
checkModify\\i t
,\\t u
bool\\v z
checkDelete	\\{ �
)
\\� �
{]] 	
var^^ !
permissionsAreGranted^^ %
=^^& '
true^^( ,
;^^, -
try`` 
{aa 
varbb 
fileProviderbb  
=bb! "

.bb0 1
Currentbb1 8
.bb8 9
Resolvebb9 @
<bb@ A
INopFileProviderbbA Q
>bbQ R
(bbR S
)bbS T
;bbT U
ifdd 
(dd 
!dd 
(dd 
fileProviderdd "
.dd" #

FileExistsdd# -
(dd- .
pathdd. 2
)dd2 3
||dd4 6
fileProviderdd7 C
.ddC D
DirectoryExistsddD S
(ddS T
pathddT X
)ddX Y
)ddY Z
)ddZ [
{ee 
returnff 
trueff 
;ff  
}gg 
varii 
currentii 
=ii 
WindowsIdentityii -
.ii- .

GetCurrentii. 8
(ii8 9
)ii9 :
;ii: ;
varkk 

readIsDenykk 
=kk  
falsekk! &
;kk& '
varll 
writeIsDenyll 
=ll  !
falsell" '
;ll' (
varmm 
modifyIsDenymm  
=mm! "
falsemm# (
;mm( )
varnn 
deleteIsDenynn  
=nn! "
falsenn# (
;nn( )
varpp 
readIsAllowpp 
=pp  !
falsepp" '
;pp' (
varqq 
writeIsAllowqq  
=qq! "
falseqq# (
;qq( )
varrr 

=rr" #
falserr$ )
;rr) *
varss 

=ss" #
falsess$ )
;ss) *
varuu 
rulesuu 
=uu 
fileProvideruu (
.uu( )
GetAccessControluu) 9
(uu9 :
pathuu: >
)uu> ?
.uu? @
GetAccessRulesuu@ N
(uuN O
trueuuO S
,uuS T
trueuuU Y
,uuY Z
typeofuu[ a
(uua b
SecurityIdentifieruub t
)uut u
)uuu v
.vv 
Castvv 
<vv  
FileSystemAccessRulevv .
>vv. /
(vv/ 0
)vv0 1
.ww 
ToListww 
(ww 
)ww 
;ww 
foreachyy 
(yy 
varyy 
ruleyy !
inyy" $
rulesyy% *
.yy* +
Whereyy+ 0
(yy0 1
ruleyy1 5
=>yy6 8
currentyy9 @
.yy@ A
UseryyA E
?yyE F
.yyF G
EqualsyyG M
(yyM N
ruleyyN R
.yyR S
IdentityReferenceyyS d
)yyd e
??yyf h
falseyyi n
)yyn o
)yyo p
{zz 
CheckAccessRule{{ #
({{# $
rule{{$ (
,{{( )
ref{{* -
deleteIsDeny{{. :
,{{: ;
ref{{< ?
modifyIsDeny{{@ L
,{{L M
ref{{N Q

readIsDeny{{R \
,{{\ ]
ref{{^ a
writeIsDeny{{b m
,{{m n
ref{{o r

,
{{� �
ref
{{� �

{{� �
,
{{� �
ref
{{� �
readIsAllow
{{� �
,
{{� �
ref
{{� �
writeIsAllow
{{� �
)
{{� �
;
{{� �
}|| 
if~~ 
(~~ 
current~~ 
.~~ 
Groups~~ "
!=~~# %
null~~& *
)~~* +
{ 
foreach
�� 
(
�� 
var
��  
	reference
��! *
in
��+ -
current
��. 5
.
��5 6
Groups
��6 <
)
��< =
{
�� 
foreach
�� 
(
��  !
var
��! $
rule
��% )
in
��* ,
rules
��- 2
.
��2 3
Where
��3 8
(
��8 9
rule
��9 =
=>
��> @
	reference
��A J
.
��J K
Equals
��K Q
(
��Q R
rule
��R V
.
��V W
IdentityReference
��W h
)
��h i
)
��i j
)
��j k
{
�� 
CheckAccessRule
�� +
(
��+ ,
rule
��, 0
,
��0 1
ref
��2 5
deleteIsDeny
��6 B
,
��B C
ref
��D G
modifyIsDeny
��H T
,
��T U
ref
��V Y

readIsDeny
��Z d
,
��d e
ref
��f i
writeIsDeny
��j u
,
��u v
ref
��w z

,��� �
ref��� �

,��� �
ref��� �
readIsAllow��� �
,��� �
ref��� �
writeIsAllow��� �
)��� �
;��� �
}
�� 
}
�� 
}
�� 

�� 
=
�� 
!
��  !
deleteIsDeny
��! -
&&
��. 0

��1 >
;
��> ?

�� 
=
�� 
!
��  !
modifyIsDeny
��! -
&&
��. 0

��1 >
;
��> ?
readIsAllow
�� 
=
�� 
!
�� 

readIsDeny
�� )
&&
��* ,
readIsAllow
��- 8
;
��8 9
writeIsAllow
�� 
=
�� 
!
��  
writeIsDeny
��  +
&&
��, .
writeIsAllow
��/ ;
;
��; <
if
�� 
(
�� 
	checkRead
�� 
)
�� #
permissionsAreGranted
�� )
=
��* +
readIsAllow
��, 7
;
��7 8
if
�� 
(
�� 

checkWrite
�� 
)
�� #
permissionsAreGranted
�� )
=
��* +#
permissionsAreGranted
��, A
&&
��B D
writeIsAllow
��E Q
;
��Q R
if
�� 
(
�� 
checkModify
�� 
)
��  #
permissionsAreGranted
�� )
=
��* +#
permissionsAreGranted
��, A
&&
��B D

��E R
;
��R S
if
�� 
(
�� 
checkDelete
�� 
)
��  #
permissionsAreGranted
�� )
=
��* +#
permissionsAreGranted
��, A
&&
��B D

��E R
;
��R S
}
�� 
catch
�� 
(
�� 
IOException
�� 
)
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
catch
�� 
{
�� 
return
�� 
true
�� 
;
�� 
}
�� 
return
�� #
permissionsAreGranted
�� (
;
��( )
}
�� 	
private
�� 
static
�� 
bool
�� $
CheckPermissionsInUnix
�� 2
(
��2 3
string
��3 9
path
��: >
,
��> ?
bool
��@ D
	checkRead
��E N
,
��N O
bool
��P T

checkWrite
��U _
,
��_ `
bool
��a e
checkModify
��f q
,
��q r
bool
��s w
checkDelete��x �
)��� �
{
�� 	
var
�� 
	arguments
�� 
=
��  
RuntimeInformation
�� .
.
��. /
IsOSPlatform
��/ ;
(
��; <

OSPlatform
��< F
.
��F G
OSX
��G J
)
��J K
?
�� 
$"
�� 
$str
�� ,
{
��, -
path
��- 1
}
��1 2
$str
��2 4
"
��4 5
:
�� 
$"
�� 
$str
�� ,
{
��, -
path
��- 1
}
��1 2
$str
��2 4
"
��4 5
;
��5 6
try
�� 
{
�� 
var
�� 
process
�� 
=
�� 
new
�� !
Process
��" )
{
�� 
	StartInfo
�� 
=
�� 
new
��  #
ProcessStartInfo
��$ 4
{
�� #
RedirectStandardInput
�� -
=
��. /
true
��0 4
,
��4 5$
RedirectStandardOutput
�� .
=
��/ 0
true
��1 5
,
��5 6
UseShellExecute
�� '
=
��( )
false
��* /
,
��/ 0
FileName
��  
=
��! "
$str
��# '
,
��' (
	Arguments
�� !
=
��" #
	arguments
��$ -
}
�� 
}
�� 
;
�� 
process
�� 
.
�� 
Start
�� 
(
�� 
)
�� 
;
��  
process
�� 
.
�� 
WaitForExit
�� #
(
��# $
)
��$ %
;
��% &
var
�� 
result
�� 
=
�� 
process
�� $
.
��$ %
StandardOutput
��% 3
.
��3 4
	ReadToEnd
��4 =
(
��= >
)
��> ?
.
��? @
Trim
��@ D
(
��D E
$char
��E I
)
��I J
.
��J K
Split
��K P
(
��P Q
$char
��Q T
)
��T U
;
��U V
var
�� 
filePermissions
�� #
=
��$ %
result
��& ,
[
��, -
$num
��- .
]
��. /
.
��/ 0
Select
��0 6
(
��6 7
p
��7 8
=>
��9 ;
(
��< =
int
��= @
)
��@ A
char
��A E
.
��E F
GetNumericValue
��F U
(
��U V
p
��V W
)
��W X
)
��X Y
.
��Y Z
ToList
��Z `
(
��` a
)
��a b
;
��b c
var
�� 
isOwner
�� 
=
�� 

�� +
.
��+ ,
UserId
��, 2
==
��3 5
result
��6 <
[
��< =
$num
��= >
]
��> ?
;
��? @
var
�� 
	isInGroup
�� 
=
�� 

��  -
.
��- .
Groups
��. 4
.
��4 5
Contains
��5 =
(
��= >
result
��> D
[
��D E
$num
��E F
]
��F G
)
��G H
;
��H I
var
�� 
filePermission
�� "
=
��# $
isOwner
�� 
?
�� 
filePermissions
�� -
[
��- .
$num
��. /
]
��/ 0
:
��1 2
(
��3 4
	isInGroup
��4 =
?
��> ?
filePermissions
��@ O
[
��O P
$num
��P Q
]
��Q R
:
��S T
filePermissions
��U d
[
��d e
$num
��e f
]
��f g
)
��g h
;
��h i
return
�� &
CheckUserFilePermissions
�� /
(
��/ 0
filePermission
��0 >
,
��> ?
	checkRead
��@ I
,
��I J

checkWrite
��K U
,
��U V
checkModify
��W b
,
��b c
checkDelete
��d o
)
��o p
;
��p q
}
�� 
catch
�� 
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
static
�� 
bool
�� 
CheckPermissions
�� +
(
��+ ,
string
��, 2
path
��3 7
,
��7 8
bool
��9 =
	checkRead
��> G
,
��G H
bool
��I M

checkWrite
��N X
,
��X Y
bool
��Z ^
checkModify
��_ j
,
��j k
bool
��l p
checkDelete
��q |
)
��| }
{
�� 	
var
�� 
result
�� 
=
�� 
false
�� 
;
�� 
switch
�� 
(
�� 
Environment
�� 
.
��  
	OSVersion
��  )
.
��) *
Platform
��* 2
)
��2 3
{
�� 
case
�� 

PlatformID
�� 
.
��  
Win32NT
��  '
:
��' (
result
�� 
=
�� '
CheckPermissionsInWindows
�� 6
(
��6 7
path
��7 ;
,
��; <
	checkRead
��= F
,
��F G

checkWrite
��H R
,
��R S
checkModify
��T _
,
��_ `
checkDelete
��a l
)
��l m
;
��m n
break
�� 
;
�� 
case
�� 

PlatformID
�� 
.
��  
Unix
��  $
:
��$ %
result
�� 
=
�� $
CheckPermissionsInUnix
�� 3
(
��3 4
path
��4 8
,
��8 9
	checkRead
��: C
,
��C D

checkWrite
��E O
,
��O P
checkModify
��Q \
,
��\ ]
checkDelete
��^ i
)
��i j
;
��j k
break
�� 
;
�� 
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
IEnumerable
�� !
<
��! "
string
��" (
>
��( )!
GetDirectoriesWrite
��* =
(
��= >
)
��> ?
{
�� 	
var
�� 
fileProvider
�� 
=
�� 

�� ,
.
��, -
Current
��- 4
.
��4 5
Resolve
��5 <
<
��< =
INopFileProvider
��= M
>
��M N
(
��N O
)
��O P
;
��P Q
var
�� 
rootDir
�� 
=
�� 
fileProvider
�� &
.
��& '
MapPath
��' .
(
��. /
$str
��/ 3
)
��3 4
;
��4 5
var
�� 
dirsToCheck
�� 
=
�� 
new
�� !
List
��" &
<
��& '
string
��' -
>
��- .
{
�� 
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. 8
)
��8 9
,
��9 :
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. 3
)
��3 4
,
��4 5
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. 4
)
��4 5
,
��5 6
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. 7
)
��7 8
,
��8 9
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. <
)
��< =
,
��= >
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. @
)
��@ A
,
��A B
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. C
)
��C D
,
��D E
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. K
)
��K L
,
��L M
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. >
)
��> ?
,
��? @
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. ?
)
��? @
,
��@ A
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. F
)
��F G
,
��G H
fileProvider
�� 
.
�� 
Combine
�� $
(
��$ %
rootDir
��% ,
,
��, -
$str
��. H
)
��H I
}
�� 
;
��
return
�� 
dirsToCheck
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
IEnumerable
�� !
<
��! "
string
��" (
>
��( )

��* 7
(
��7 8
)
��8 9
{
�� 	
var
�� 
fileProvider
�� 
=
�� 

�� ,
.
��, -
Current
��- 4
.
��4 5
Resolve
��5 <
<
��< =
INopFileProvider
��= M
>
��M N
(
��N O
)
��O P
;
��P Q
return
�� 
new
�� 
List
�� 
<
�� 
string
�� "
>
��" #
{
�� 
fileProvider
�� 
.
�� 
MapPath
�� $
(
��$ %
NopPluginDefaults
��% 6
.
��6 7!
PluginsInfoFilePath
��7 J
)
��J K
,
��K L
fileProvider
�� 
.
�� 
MapPath
�� $
(
��$ %%
NopDataSettingsDefaults
��% <
.
��< =
FilePath
��= E
)
��E F
}
�� 
;
��
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Security\Honeypot\HtmlExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Security $
.$ %
Honeypot% -
{		 
public

static
class
HtmlExtensions
{ 
public 
static 
IHtmlContent "!
GenerateHoneypotInput# 8
(8 9
this9 =
IHtmlHelper> I
helperJ P
)P Q
{ 	
var 
sb 
= 
new 

(& '
)' (
;( )
sb 
. 
AppendFormat 
( 
$str ;
); <
;< =
sb 
. 
Append 
( 
Environment !
.! "
NewLine" )
)) *
;* +
var 
securitySettings  
=! "

.0 1
Current1 8
.8 9
Resolve9 @
<@ A
SecuritySettingsA Q
>Q R
(R S
)S T
;T U
sb 
. 
AppendFormat 
( 
$str K
,K L
securitySettingsM ]
.] ^
HoneypotInputName^ o
)o p
;p q
sb 
. 
Append 
( 
Environment !
.! "
NewLine" )
)) *
;* +
sb 
. 
Append 
( 
$str 
) 
;  
return!! 
new!! 

HtmlString!! !
(!!! "
sb!!" $
.!!$ %
ToString!!% -
(!!- .
)!!. /
)!!/ 0
;!!0 1
}"" 	
}## 
}$$ �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Security\SslRequirement.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Security $
{ 
public 

enum 
SslRequirement 
{ 
Yes 
, 
No 

,
 
NoMatter 
, 
} 
} �

�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Seo\CustomUrlRecordEntityNameRequestedEvent.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Seo 
{ 
public		 

class		 3
'CustomUrlRecordEntityNameRequestedEvent		 8
{

 
public 3
'CustomUrlRecordEntityNameRequestedEvent 6
(6 7
	RouteData7 @
	routeDataA J
,J K
UrlRecordServiceL \
.\ ]
UrlRecordForCaching] p
	urlRecordq z
)z {
{ 	
	RouteData 
= 
	routeData !
;! "
	UrlRecord 
= 
	urlRecord !
;! "
} 	
public 
	RouteData 
	RouteData "
{# $
get% (
;( )
private* 1
set2 5
;5 6
}7 8
public$$ 
UrlRecordService$$ 
.$$  
UrlRecordForCaching$$  3
	UrlRecord$$4 =
{$$> ?
get$$@ C
;$$C D
private$$E L
set$$M P
;$$P Q
}$$R S
}(( 
})) ¯
~C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Seo\GenericPathRoute.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Seo 
{ 
public 

class 
GenericPathRoute !
:" #
LocalizedRoute$ 2
{ 
private 
readonly 
IRouter  
_target! (
;( )
public)) 
GenericPathRoute)) 
())  
IRouter))  '
target))( .
,)). /
string))0 6
	routeName))7 @
,))@ A
string))B H

,))V W 
RouteValueDictionary))X l
defaults))m u
,))u v
IDictionary** 
<** 
string** 
,** 
object**  &
>**& '
constraints**( 3
,**3 4 
RouteValueDictionary**5 I

dataTokens**J T
,**T U%
IInlineConstraintResolver**V o%
inlineConstraintResolver	**p �
)
**� �
:++ 
base++ 
(++ 
target++ 
,++ 
	routeName++ $
,++$ %

,++3 4
defaults++5 =
,++= >
constraints++? J
,++J K

dataTokens++L V
,++V W$
inlineConstraintResolver++X p
)++p q
{,, 	
_target-- 
=-- 
target-- 
??-- 
throw--  %
new--& )!
ArgumentNullException--* ?
(--? @
nameof--@ F
(--F G
target--G M
)--M N
)--N O
;--O P
}.. 	
	protected99  
RouteValueDictionary99 &
GetRouteValues99' 5
(995 6
RouteContext996 B
context99C J
)99J K
{:: 	
var<< 
path<< 
=<< 
context<< 
.<< 
HttpContext<< *
.<<* +
Request<<+ 2
.<<2 3
Path<<3 7
.<<7 8
Value<<8 =
;<<= >
if== 
(== .
"SeoFriendlyUrlsForLanguagesEnabled== 2
&&==3 5
path==6 :
.==: ;
IsLocalizedUrl==; I
(==I J
context==J Q
.==Q R
HttpContext==R ]
.==] ^
Request==^ e
.==e f
PathBase==f n
,==n o
false==p u
,==u v
out==w z
Language	=={ �
_
==� �
)
==� �
)
==� �
path>> 
=>> 
path>> 
.>> (
RemoveLanguageSeoCodeFromUrl>> 8
(>>8 9
context>>9 @
.>>@ A
HttpContext>>A L
.>>L M
Request>>M T
.>>T U
PathBase>>U ]
,>>] ^
false>>_ d
)>>d e
;>>e f
varAA 
routeValuesAA 
=AA 
newAA ! 
RouteValueDictionaryAA" 6
(AA6 7
ParsedTemplateAA7 E
.AAE F

ParametersAAF P
.BB 
WhereBB 
(BB 
	parameterBB  
=>BB! #
	parameterBB$ -
.BB- .
DefaultValueBB. :
!=BB; =
nullBB> B
)BBB C
.CC 
ToDictionaryCC 
(CC 
	parameterCC '
=>CC( *
	parameterCC+ 4
.CC4 5
NameCC5 9
,CC9 :
	parameterCC; D
=>CCE G
	parameterCCH Q
.CCQ R
DefaultValueCCR ^
)CC^ _
)CC_ `
;CC` a
varDD 
matcherDD 
=DD 
newDD 
TemplateMatcherDD -
(DD- .
ParsedTemplateDD. <
,DD< =
routeValuesDD> I
)DDI J
;DDJ K
matcherEE 
.EE 
TryMatchEE 
(EE 
pathEE !
,EE! "
routeValuesEE# .
)EE. /
;EE/ 0
returnGG 
routeValuesGG 
;GG 
}HH 	
publicSS 
overrideSS 
TaskSS 

RouteAsyncSS '
(SS' (
RouteContextSS( 4
contextSS5 <
)SS< =
{TT 	
ifUU 
(UU 
!UU 
DataSettingsManagerUU $
.UU$ %
DatabaseIsInstalledUU% 8
)UU8 9
returnVV 
TaskVV 
.VV 

;VV) *
varYY 
routeValuesYY 
=YY 
GetRouteValuesYY ,
(YY, -
contextYY- 4
)YY4 5
;YY5 6
ifZZ 
(ZZ 
!ZZ 
routeValuesZZ 
.ZZ 
TryGetValueZZ (
(ZZ( )
$strZZ) 8
,ZZ8 9
outZZ: =
objectZZ> D
	slugValueZZE N
)ZZN O
||ZZP R
stringZZS Y
.ZZY Z

(ZZg h
	slugValueZZh q
asZZr t
stringZZu {
)ZZ{ |
)ZZ| }
return[[ 
Task[[ 
.[[ 

;[[) *
var]] 
slug]] 
=]] 
	slugValue]]  
as]]! #
string]]$ *
;]]* +
var`` 
urlRecordService``  
=``! "

.``0 1
Current``1 8
.``8 9
Resolve``9 @
<``@ A
IUrlRecordService``A R
>``R S
(``S T
)``T U
;``U V
varaa 
	urlRecordaa 
=aa 
urlRecordServiceaa ,
.aa, -
GetBySlugCachedaa- <
(aa< =
slugaa= A
)aaA B
;aaB C
ifff 
(ff 
	urlRecordff 
==ff 
nullff !
)ff! "
returngg 
Taskgg 
.gg 

;gg) *
varjj 
pathBasejj 
=jj 
contextjj "
.jj" #
HttpContextjj# .
.jj. /
Requestjj/ 6
.jj6 7
PathBasejj7 ?
;jj? @
ifmm 
(mm 
!mm 
	urlRecordmm 
.mm 
IsActivemm #
)mm# $
{nn 
varoo 

activeSlugoo 
=oo  
urlRecordServiceoo! 1
.oo1 2

(oo? @
	urlRecordoo@ I
.ooI J
EntityIdooJ R
,ooR S
	urlRecordooT ]
.oo] ^

EntityNameoo^ h
,ooh i
	urlRecordooj s
.oos t

LanguageIdoot ~
)oo~ 
;	oo �
ifpp 
(pp 
stringpp 
.pp 

(pp( )

activeSlugpp) 3
)pp3 4
)pp4 5
returnqq 
Taskqq 
.qq  

;qq- .
vartt  
redirectionRouteDatatt (
=tt) *
newtt+ .
	RouteDatatt/ 8
(tt8 9
contexttt9 @
.tt@ A
	RouteDatattA J
)ttJ K
;ttK L 
redirectionRouteDatauu $
.uu$ %
Valuesuu% +
[uu+ , 
NopPathRouteDefaultsuu, @
.uu@ A
ControllerFieldKeyuuA S
]uuS T
=uuU V
$struuW _
;uu_ ` 
redirectionRouteDatavv $
.vv$ %
Valuesvv% +
[vv+ , 
NopPathRouteDefaultsvv, @
.vv@ A
ActionFieldKeyvvA O
]vvO P
=vvQ R
$strvvS e
;vve f 
redirectionRouteDataww $
.ww$ %
Valuesww% +
[ww+ , 
NopPathRouteDefaultsww, @
.ww@ A
UrlFieldKeywwA L
]wwL M
=wwN O
$"wwP R
{wwR S
pathBasewwS [
}ww[ \
$strww\ ]
{ww] ^

activeSlugww^ h
}wwh i
{wwi j
contextwwj q
.wwq r
HttpContextwwr }
.ww} ~
Request	ww~ �
.
ww� �
QueryString
ww� �
}
ww� �
"
ww� �
;
ww� � 
redirectionRouteDataxx $
.xx$ %
Valuesxx% +
[xx+ , 
NopPathRouteDefaultsxx, @
.xx@ A%
PermanentRedirectFieldKeyxxA Z
]xxZ [
=xx\ ]
truexx^ b
;xxb c
contextyy 
.yy 
HttpContextyy #
.yy# $
Itemsyy$ )
[yy) *
$stryy* L
]yyL M
=yyN O
trueyyP T
;yyT U
contextzz 
.zz 
	RouteDatazz !
=zz" # 
redirectionRouteDatazz$ 8
;zz8 9
return{{ 
_target{{ 
.{{ 

RouteAsync{{ )
({{) *
context{{* 1
){{1 2
;{{2 3
}|| 
var
�� $
slugForCurrentLanguage
�� &
=
��' (
urlRecordService
��) 9
.
��9 :
	GetSeName
��: C
(
��C D
	urlRecord
��D M
.
��M N
EntityId
��N V
,
��V W
	urlRecord
��X a
.
��a b

EntityName
��b l
)
��l m
;
��m n
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 

�� %
(
��% &$
slugForCurrentLanguage
��& <
)
��< =
&&
��> @
!
��A B$
slugForCurrentLanguage
��B X
.
��X Y
Equals
��Y _
(
��_ `
slug
��` d
,
��d e
StringComparison
��f v
.
��v w)
InvariantCultureIgnoreCase��w �
)��� �
)��� �
{
�� 
var
�� "
redirectionRouteData
�� (
=
��) *
new
��+ .
	RouteData
��/ 8
(
��8 9
context
��9 @
.
��@ A
	RouteData
��A J
)
��J K
;
��K L"
redirectionRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
ControllerFieldKey
��A S
]
��S T
=
��U V
$str
��W _
;
��_ `"
redirectionRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
ActionFieldKey
��A O
]
��O P
=
��Q R
$str
��S e
;
��e f"
redirectionRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
UrlFieldKey
��A L
]
��L M
=
��N O
$"
��P R
{
��R S
pathBase
��S [
}
��[ \
$str
��\ ]
{
��] ^$
slugForCurrentLanguage
��^ t
}
��t u
{
��u v
context
��v }
.
��} ~
HttpContext��~ �
.��� �
Request��� �
.��� �
QueryString��� �
}��� �
"��� �
;��� �"
redirectionRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A'
PermanentRedirectFieldKey
��A Z
]
��Z [
=
��\ ]
false
��^ c
;
��c d
context
�� 
.
�� 
HttpContext
�� #
.
��# $
Items
��$ )
[
��) *
$str
��* L
]
��L M
=
��N O
true
��P T
;
��T U
context
�� 
.
�� 
	RouteData
�� !
=
��" #"
redirectionRouteData
��$ 8
;
��8 9
return
�� 
_target
�� 
.
�� 

RouteAsync
�� )
(
��) *
context
��* 1
)
��1 2
;
��2 3
}
�� 
var
�� 
currentRouteData
��  
=
��! "
new
��# &
	RouteData
��' 0
(
��0 1
context
��1 8
.
��8 9
	RouteData
��9 B
)
��B C
;
��C D
switch
�� 
(
�� 
	urlRecord
�� 
.
�� 

EntityName
�� (
.
��( )
ToLowerInvariant
��) 9
(
��9 :
)
��: ;
)
��; <
{
�� 
case
�� 
$str
�� 
:
�� 
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
ControllerFieldKey
��A S
]
��S T
=
��U V
$str
��W `
;
��` a
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
ActionFieldKey
��A O
]
��O P
=
��Q R
$str
��S c
;
��c d
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
ProductIdFieldKey
��A R
]
��R S
=
��T U
	urlRecord
��V _
.
��_ `
EntityId
��` h
;
��h i
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
SeNameFieldKey
��A O
]
��O P
=
��Q R
	urlRecord
��S \
.
��\ ]
Slug
��] a
;
��a b
break
�� 
;
�� 
case
�� 
$str
�� !
:
��! "
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
ControllerFieldKey
��A S
]
��S T
=
��U V
$str
��W `
;
��` a
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
ActionFieldKey
��A O
]
��O P
=
��Q R
$str
��S b
;
��b c
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A"
ProducttagIdFieldKey
��A U
]
��U V
=
��W X
	urlRecord
��Y b
.
��b c
EntityId
��c k
;
��k l
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
SeNameFieldKey
��A O
]
��O P
=
��Q R
	urlRecord
��S \
.
��\ ]
Slug
��] a
;
��a b
break
�� 
;
�� 
case
�� 
$str
�� 
:
��  
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
ControllerFieldKey
��A S
]
��S T
=
��U V
$str
��W `
;
��` a
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
ActionFieldKey
��A O
]
��O P
=
��Q R
$str
��S ]
;
��] ^
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
CategoryIdFieldKey
��A S
]
��S T
=
��U V
	urlRecord
��W `
.
��` a
EntityId
��a i
;
��i j
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
SeNameFieldKey
��A O
]
��O P
=
��Q R
	urlRecord
��S \
.
��\ ]
Slug
��] a
;
��a b
break
�� 
;
�� 
case
�� 
$str
�� #
:
��# $
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
ControllerFieldKey
��A S
]
��S T
=
��U V
$str
��W `
;
��` a
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
ActionFieldKey
��A O
]
��O P
=
��Q R
$str
��S a
;
��a b
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A$
ManufacturerIdFieldKey
��A W
]
��W X
=
��Y Z
	urlRecord
��[ d
.
��d e
EntityId
��e m
;
��m n
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
SeNameFieldKey
��A O
]
��O P
=
��Q R
	urlRecord
��S \
.
��\ ]
Slug
��] a
;
��a b
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� 
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
ControllerFieldKey
��A S
]
��S T
=
��U V
$str
��W `
;
��` a
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
ActionFieldKey
��A O
]
��O P
=
��Q R
$str
��S [
;
��[ \
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
VendorIdFieldKey
��A Q
]
��Q R
=
��S T
	urlRecord
��U ^
.
��^ _
EntityId
��_ g
;
��g h
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
SeNameFieldKey
��A O
]
��O P
=
��Q R
	urlRecord
��S \
.
��\ ]
Slug
��] a
;
��a b
break
�� 
;
�� 
case
�� 
$str
�� 
:
��  
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
ControllerFieldKey
��A S
]
��S T
=
��U V
$str
��W ]
;
��] ^
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
ActionFieldKey
��A O
]
��O P
=
��Q R
$str
��S ]
;
��] ^
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
NewsItemIdFieldKey
��A S
]
��S T
=
��U V
	urlRecord
��W `
.
��` a
EntityId
��a i
;
��i j
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
SeNameFieldKey
��A O
]
��O P
=
��Q R
	urlRecord
��S \
.
��\ ]
Slug
��] a
;
��a b
break
�� 
;
�� 
case
�� 
$str
�� 
:
��  
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
ControllerFieldKey
��A S
]
��S T
=
��U V
$str
��W ]
;
��] ^
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
ActionFieldKey
��A O
]
��O P
=
��Q R
$str
��S ]
;
��] ^
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
BlogPostIdFieldKey
��A S
]
��S T
=
��U V
	urlRecord
��W `
.
��` a
EntityId
��a i
;
��i j
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
SeNameFieldKey
��A O
]
��O P
=
��Q R
	urlRecord
��S \
.
��\ ]
Slug
��] a
;
��a b
break
�� 
;
�� 
case
�� 
$str
�� 
:
�� 
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A 
ControllerFieldKey
��A S
]
��S T
=
��U V
$str
��W ^
;
��^ _
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
ActionFieldKey
��A O
]
��O P
=
��Q R
$str
��S a
;
��a b
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
TopicIdFieldKey
��A P
]
��P Q
=
��R S
	urlRecord
��T ]
.
��] ^
EntityId
��^ f
;
��f g
currentRouteData
�� $
.
��$ %
Values
��% +
[
��+ ,"
NopPathRouteDefaults
��, @
.
��@ A
SeNameFieldKey
��A O
]
��O P
=
��Q R
	urlRecord
��S \
.
��\ ]
Slug
��] a
;
��a b
break
�� 
;
�� 
default
�� 
:
�� 

�� !
.
��! "
Current
��" )
.
��) *
Resolve
��* 1
<
��1 2
IEventPublisher
��2 A
>
��A B
(
��B C
)
��C D
?
�� 
.
�� 
Publish
�� !
(
��! "
new
��" %5
'CustomUrlRecordEntityNameRequestedEvent
��& M
(
��M N
currentRouteData
��N ^
,
��^ _
	urlRecord
��` i
)
��i j
)
��j k
;
��k l
break
�� 
;
�� 
}
�� 
context
�� 
.
�� 
	RouteData
�� 
=
�� 
currentRouteData
��  0
;
��0 1
return
�� 
_target
�� 
.
�� 

RouteAsync
�� %
(
��% &
context
��& -
)
��- .
;
��. /
}
�� 	
}
�� 
}�� �#
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Seo\GenericPathRouteExtensions.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Seo 
{ 
public

 

static

 
class

 &
GenericPathRouteExtensions

 2
{ 
public 
static 

MapGenericPathRoute$ 7
(7 8
this8 <

routeBuilderK W
,W X
stringY _
name` d
,d e
stringf l
templatem u
)u v
{ 	
return 
MapGenericPathRoute &
(& '
routeBuilder' 3
,3 4
name5 9
,9 :
template; C
,C D
defaultsE M
:M N
nullO S
)S T
;T U
} 	
public!! 
static!! 

MapGenericPathRoute!!$ 7
(!!7 8
this!!8 <

routeBuilder!!K W
,!!W X
string!!Y _
name!!` d
,!!d e
string!!f l
template!!m u
,!!u v
object!!w }
defaults	!!~ �
)
!!� �
{"" 	
return## 
MapGenericPathRoute## &
(##& '
routeBuilder##' 3
,##3 4
name##5 9
,##9 :
template##; C
,##C D
defaults##E M
,##M N
constraints##O Z
:##Z [
null##\ `
)##` a
;##a b
}$$ 	
public11 
static11 

MapGenericPathRoute11$ 7
(117 8
this118 <

routeBuilder11K W
,11W X
string22 
name22 
,22 
string22 
template22  (
,22( )
object22* 0
defaults221 9
,229 :
object22; A
constraints22B M
)22M N
{33 	
return44 
MapGenericPathRoute44 &
(44& '
routeBuilder44' 3
,443 4
name445 9
,449 :
template44; C
,44C D
defaults44E M
,44M N
constraints44O Z
,44Z [

dataTokens44\ f
:44f g
null44h l
)44l m
;44m n
}55 	
publicDD 
staticDD 

MapGenericPathRouteDD$ 7
(DD7 8
thisDD8 <

routeBuilderDDK W
,DDW X
stringEE 
nameEE 
,EE 
stringEE 
templateEE  (
,EE( )
objectEE* 0
defaultsEE1 9
,EE9 :
objectEE; A
constraintsEEB M
,EEM N
objectEEO U

dataTokensEEV `
)EE` a
{FF 	
ifGG 
(GG 
routeBuilderGG 
.GG 
DefaultHandlerGG +
==GG, .
nullGG/ 3
)GG3 4
throwHH 
newHH !
ArgumentNullExceptionHH /
(HH/ 0
nameofHH0 6
(HH6 7
routeBuilderHH7 C
)HHC D
)HHD E
;HHE F
varKK $
inlineConstraintResolverKK (
=KK) *
routeBuilderKK+ 7
.KK7 8
ServiceProviderKK8 G
.KKG H
GetRequiredServiceKKH Z
<KKZ [%
IInlineConstraintResolverKK[ t
>KKt u
(KKu v
)KKv w
;KKw x
routeBuilderNN 
.NN 
RoutesNN 
.NN  
AddNN  #
(NN# $
newNN$ '
GenericPathRouteNN( 8
(NN8 9
routeBuilderNN9 E
.NNE F
DefaultHandlerNNF T
,NNT U
nameNNV Z
,NNZ [
templateNN\ d
,NNd e
newOO  
RouteValueDictionaryOO (
(OO( )
defaultsOO) 1
)OO1 2
,OO2 3
newOO4 7 
RouteValueDictionaryOO8 L
(OOL M
constraintsOOM X
)OOX Y
,OOY Z
newOO[ ^ 
RouteValueDictionaryOO_ s
(OOs t

dataTokensOOt ~
)OO~ 
,	OO �$
inlineConstraintResolverPP (
)PP( )
)PP) *
;PP* +
returnRR 
routeBuilderRR 
;RR  
}SS 	
}TT 
}UU �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Seo\NopPathRouteDefaults.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Seo 
{ 
public 
static 
partial 
class   
NopPathRouteDefaults! 5
{ 
public 
static 
string 
ActionFieldKey +
=>, .
$str/ 7
;7 8
public 
static 
string 
ControllerFieldKey /
=>0 2
$str3 ?
;? @
public 
static 
string %
PermanentRedirectFieldKey 6
=>7 9
$str: M
;M N
public 
static 
string 
UrlFieldKey (
=>) +
$str, 1
;1 2
public   
static   
string   
BlogPostIdFieldKey   /
=>  0 2
$str  3 ?
;  ? @
public%% 
static%% 
string%% 
CategoryIdFieldKey%% /
=>%%0 2
$str%%3 ?
;%%? @
public** 
static** 
string** "
ManufacturerIdFieldKey** 3
=>**4 6
$str**7 G
;**G H
public// 
static// 
string// 
NewsItemIdFieldKey// /
=>//0 2
$str//3 ?
;//? @
public44 
static44 
string44 
ProductIdFieldKey44 .
=>44/ 1
$str442 =
;44= >
public99 
static99 
string99  
ProducttagIdFieldKey99 1
=>992 4
$str995 C
;99C D
public>> 
static>> 
string>> 
SeNameFieldKey>> +
=>>>, .
$str>>/ 7
;>>7 8
publicCC 
staticCC 
stringCC 
TopicIdFieldKeyCC ,
=>CC- /
$strCC0 9
;CC9 :
publicHH 
staticHH 
stringHH 
VendorIdFieldKeyHH -
=>HH. 0
$strHH1 ;
;HH; <
}II 
}JJ �C
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopActionConfirmationTagHelper.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 

TagHelpers

 &
.

& '
Admin

' ,
{ 
[ 
HtmlTargetElement 
( 
$str 0
,0 1

Attributes2 <
== >!
ButtonIdAttributeName? T
,T U
TagStructureV b
=c d
TagStructuree q
.q r

)	 �
]
� �
public 

class *
NopActionConfirmationTagHelper /
:0 1
	TagHelper2 ;
{ 
private 
const 
string !
ButtonIdAttributeName 2
=3 4
$str5 D
;D E
private 
const 
string 
ActionAttributeName 0
=1 2
$str3 ?
;? @
private 
const 
string  
AdditionaConfirmText 1
=2 3
$str4 L
;L M
private 
readonly 
IHtmlHelper $
_htmlHelper% 0
;0 1
	protected 
IHtmlGenerator  
	Generator! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[   	
HtmlAttributeName  	 
(   !
ButtonIdAttributeName   0
)  0 1
]  1 2
public!! 
string!! 
ButtonId!! 
{!!  
get!!! $
;!!$ %
set!!& )
;!!) *
}!!+ ,
[&& 	
HtmlAttributeName&&	 
(&& 
ActionAttributeName&& .
)&&. /
]&&/ 0
public'' 
string'' 
Action'' 
{'' 
get'' "
;''" #
set''$ '
;''' (
}'') *
[,, 	!
HtmlAttributeNotBound,,	 
],, 
[-- 	
ViewContext--	 
]-- 
public.. 
ViewContext.. 
ViewContext.. &
{..' (
get..) ,
;.., -
set... 1
;..1 2
}..3 4
[33 	
HtmlAttributeName33	 
(33  
AdditionaConfirmText33 /
)33/ 0
]330 1
public44 
string44 
ConfirmText44 !
{44" #
get44$ '
;44' (
set44) ,
;44, -
}44. /
public;; *
NopActionConfirmationTagHelper;; -
(;;- .
IHtmlGenerator;;. <
	generator;;= F
,;;F G
IHtmlHelper;;H S

htmlHelper;;T ^
);;^ _
{<< 	
	Generator== 
=== 
	generator== !
;==! "
_htmlHelper>> 
=>> 

htmlHelper>> $
;>>$ %
}?? 	
publicFF 
overrideFF 
asyncFF 
TaskFF "
ProcessAsyncFF# /
(FF/ 0
TagHelperContextFF0 @
contextFFA H
,FFH I
TagHelperOutputFFJ Y
outputFFZ `
)FF` a
{GG 	
ifHH 
(HH 
contextHH 
==HH 
nullHH 
)HH  
{II 
throwJJ 
newJJ !
ArgumentNullExceptionJJ /
(JJ/ 0
nameofJJ0 6
(JJ6 7
contextJJ7 >
)JJ> ?
)JJ? @
;JJ@ A
}KK 
ifMM 
(MM 
outputMM 
==MM 
nullMM 
)MM 
{NN 
throwOO 
newOO !
ArgumentNullExceptionOO /
(OO/ 0
nameofOO0 6
(OO6 7
outputOO7 =
)OO= >
)OO> ?
;OO? @
}PP 
varSS 
viewContextAwareSS  
=SS! "
_htmlHelperSS# .
asSS/ 1
IViewContextAwareSS2 C
;SSC D
viewContextAwareTT 
?TT 
.TT 

(TT+ ,
ViewContextTT, 7
)TT7 8
;TT8 9
ifVV 
(VV 
stringVV 
.VV 

(VV$ %
ActionVV% +
)VV+ ,
)VV, -
ActionWW 
=WW 
_htmlHelperWW $
.WW$ %
ViewContextWW% 0
.WW0 1
	RouteDataWW1 :
.WW: ;
ValuesWW; A
[WWA B
$strWWB J
]WWJ K
.WWK L
ToStringWWL T
(WWT U
)WWU V
;WWV W
varYY 
modalIdYY 
=YY 
newYY 

HtmlStringYY (
(YY( )
ButtonIdYY) 1
+YY2 3
$strYY4 J
)YYJ K
.YYK L
ToHtmlStringYYL X
(YYX Y
)YYY Z
;YYZ [
var[[ #
actionConfirmationModel[[ '
=[[( )
new[[* -#
ActionConfirmationModel[[. E
([[E F
)[[F G
{\\ 
ControllerName]] 
=]]  
_htmlHelper]]! ,
.]], -
ViewContext]]- 8
.]]8 9
	RouteData]]9 B
.]]B C
Values]]C I
[]]I J
$str]]J V
]]]V W
.]]W X
ToString]]X `
(]]` a
)]]a b
,]]b c

ActionName^^ 
=^^ 
Action^^ #
,^^# $
WindowId__ 
=__ 
modalId__ "
,__" # 
AdditonalConfirmText`` $
=``% &
ConfirmText``' 2
}aa 
;aa
outputdd 
.dd 
TagNamedd 
=dd 
$strdd "
;dd" #
outputee 
.ee 
TagModeee 
=ee 
TagModeee $
.ee$ %
StartTagAndEndTagee% 6
;ee6 7
outputgg 
.gg 

Attributesgg 
.gg 
Addgg !
(gg! "
$strgg" &
,gg& '
modalIdgg( /
)gg/ 0
;gg0 1
outputhh 
.hh 

Attributeshh 
.hh 
Addhh !
(hh! "
$strhh" )
,hh) *
$strhh+ 7
)hh7 8
;hh8 9
outputii 
.ii 

Attributesii 
.ii 
Addii !
(ii! "
$strii" ,
,ii, -
$strii. 2
)ii2 3
;ii3 4
outputjj 
.jj 

Attributesjj 
.jj 
Addjj !
(jj! "
$strjj" (
,jj( )
$strjj* 2
)jj2 3
;jj3 4
outputkk 
.kk 

Attributeskk 
.kk 
Addkk !
(kk! "
$strkk" 3
,kk3 4
$"kk5 7
{kk7 8
modalIdkk8 ?
}kk? @
$strkk@ F
"kkF G
)kkG H
;kkH I
outputll 
.ll 
Contentll 
.ll 
SetHtmlContentll )
(ll) *
awaitll* /
_htmlHelperll0 ;
.ll; <
PartialAsyncll< H
(llH I
$strllI R
,llR S#
actionConfirmationModelllT k
)llk l
)lll m
;llm n
varoo 
scriptoo 
=oo 
newoo 

TagBuilderoo '
(oo' (
$stroo( 0
)oo0 1
;oo1 2
scriptpp 
.pp 
	InnerHtmlpp 
.pp 

AppendHtmlpp '
(pp' (
$strpp( I
+ppJ K
$"qq( *
$strqq* .
{qq. /
ButtonIdqq/ 7
}qq7 8
$strqq8 u
{qqu v
modalIdqqv }
}qq} ~
$str	qq~ �
"
qq� �
+
qq� �
$"rr( *
$strrr* .
{rr. /
modalIdrr/ 6
}rr6 7
$strrr7 \
{rr\ ]
ButtonIdrr] e
}rre f
$strrrf z
"rrz {
+rr| }
$"ss( *
$strss* /
{ss/ 0
ButtonIdss0 8
}ss8 9
$strss9 R
"ssR S
+ssT U
$"tt( *
$strtt* 2
{tt2 3
ButtonIdtt3 ;
}tt; <
$strtt< b
{ttb c
ButtonIdttc k
}ttk l
$str	ttl �
"
tt� �
+
tt� �
$struu( -
)uu- .
;uu. /
outputvv 
.vv 
PostContentvv 
.vv 
SetHtmlContentvv -
(vv- .
scriptvv. 4
.vv4 5
RenderHtmlContentvv5 F
(vvF G
)vvG H
)vvH I
;vvI J
}ww 	
}xx 
}yy �5
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopAlertTagHelper.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 

TagHelpers

 &
.

& '
Admin

' ,
{ 
[ 
HtmlTargetElement 
( 
$str "
," #

Attributes$ .
=/ 0
AlertNameId1 <
,< =
TagStructure> J
=K L
TagStructureM Y
.Y Z

)g h
]h i
public 

class 
NopAlertTagHelper "
:# $
	TagHelper% .
{ 
private 
const 
string 
AlertNameId (
=) *
$str+ 9
;9 :
private 
const 
string 
AlertMessageName -
=. /
$str0 C
;C D
private 
readonly 
IHtmlHelper $
_htmlHelper% 0
;0 1
	protected 
IHtmlGenerator  
	Generator! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
HtmlAttributeName	 
( 
AlertNameId &
)& '
]' (
public   
string   
AlertId   
{   
get    #
;  # $
set  % (
;  ( )
}  * +
[%% 	!
HtmlAttributeNotBound%%	 
]%% 
[&& 	
ViewContext&&	 
]&& 
public'' 
ViewContext'' 
ViewContext'' &
{''' (
get'') ,
;'', -
set''. 1
;''1 2
}''3 4
[,, 	
HtmlAttributeName,,	 
(,, 
AlertMessageName,, +
),,+ ,
],,, -
public-- 
string-- 
Message-- 
{-- 
get--  #
;--# $
set--% (
;--( )
}--* +
public44 
NopAlertTagHelper44  
(44  !
IHtmlGenerator44! /
	generator440 9
,449 :
IHtmlHelper44; F

htmlHelper44G Q
)44Q R
{55 	
	Generator66 
=66 
	generator66 !
;66! "
_htmlHelper77 
=77 

htmlHelper77 $
;77$ %
}88 	
public?? 
override?? 
async?? 
Task?? "
ProcessAsync??# /
(??/ 0
TagHelperContext??0 @
context??A H
,??H I
TagHelperOutput??J Y
output??Z `
)??` a
{@@ 	
ifAA 
(AA 
contextAA 
==AA 
nullAA 
)AA  
{BB 
throwCC 
newCC !
ArgumentNullExceptionCC /
(CC/ 0
nameofCC0 6
(CC6 7
contextCC7 >
)CC> ?
)CC? @
;CC@ A
}DD 
ifFF 
(FF 
outputFF 
==FF 
nullFF 
)FF 
{GG 
throwHH 
newHH !
ArgumentNullExceptionHH /
(HH/ 0
nameofHH0 6
(HH6 7
outputHH7 =
)HH= >
)HH> ?
;HH? @
}II 
varLL 
viewContextAwareLL  
=LL! "
_htmlHelperLL# .
asLL/ 1
IViewContextAwareLL2 C
;LLC D
viewContextAwareMM 
?MM 
.MM 

(MM+ ,
ViewContextMM, 7
)MM7 8
;MM8 9
varOO 
modalIdOO 
=OO 
newOO 

HtmlStringOO (
(OO( )
AlertIdOO) 0
+OO1 2
$strOO3 B
)OOB C
.OOC D
ToHtmlStringOOD P
(OOP Q
)OOQ R
;OOR S
varQQ 
actionAlertModelQQ  
=QQ! "
newQQ# &
ActionAlertModelQQ' 7
(QQ7 8
)QQ8 9
{RR 
AlertIdSS 
=SS 
AlertIdSS !
,SS! "
WindowIdTT 
=TT 
modalIdTT "
,TT" #
AlertMessageUU 
=UU 
MessageUU &
}VV 
;VV
outputYY 
.YY 
TagNameYY 
=YY 
$strYY "
;YY" #
outputZZ 
.ZZ 
TagModeZZ 
=ZZ 
TagModeZZ $
.ZZ$ %
StartTagAndEndTagZZ% 6
;ZZ6 7
output\\ 
.\\ 

Attributes\\ 
.\\ 
Add\\ !
(\\! "
$str\\" &
,\\& '
modalId\\( /
)\\/ 0
;\\0 1
output]] 
.]] 

Attributes]] 
.]] 
Add]] !
(]]! "
$str]]" )
,]]) *
$str]]+ 7
)]]7 8
;]]8 9
output^^ 
.^^ 

Attributes^^ 
.^^ 
Add^^ !
(^^! "
$str^^" ,
,^^, -
$str^^. 2
)^^2 3
;^^3 4
output__ 
.__ 

Attributes__ 
.__ 
Add__ !
(__! "
$str__" (
,__( )
$str__* 2
)__2 3
;__3 4
output`` 
.`` 

Attributes`` 
.`` 
Add`` !
(``! "
$str``" 3
,``3 4
$"``5 7
{``7 8
modalId``8 ?
}``? @
$str``@ F
"``F G
)``G H
;``H I
outputaa 
.aa 
Contentaa 
.aa 
SetHtmlContentaa )
(aa) *
awaitaa* /
_htmlHelperaa0 ;
.aa; <
PartialAsyncaa< H
(aaH I
$straaI P
,aaP Q
actionAlertModelaaR b
)aab c
)aac d
;aad e
vardd 
scriptdd 
=dd 
newdd 

TagBuilderdd '
(dd' (
$strdd( 0
)dd0 1
;dd1 2
scriptee 
.ee 
	InnerHtmlee 
.ee 

AppendHtmlee '
(ee' (
$stree( I
+eeJ K
$"ff, .
$strff. 2
{ff2 3
AlertIdff3 :
}ff: ;
$strff; x
{ffx y
modalId	ffy �
}
ff� �
$str
ff� �
"
ff� �
+
ff� �
$str
ff� �
)
ff� �
;
ff� �
outputhh 
.hh 
PostContenthh 
.hh 
SetHtmlContenthh -
(hh- .
scripthh. 4
.hh4 5
RenderHtmlContenthh5 F
(hhF G
)hhG H
)hhH I
;hhI J
}ii 	
}jj 
}kk �D
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopDeleteConfirmationTagHelper.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 

TagHelpers

 &
.

& '
Admin

' ,
{ 
[ 
HtmlTargetElement 
( 
$str 0
,0 1

Attributes2 <
== > 
ModelIdAttributeName? S
+T U
$strV Y
+Z [!
ButtonIdAttributeName\ q
,q r
TagStructures 
=
� �
TagStructure
� �
.
� �

� �
)
� �
]
� �
public 

class *
NopDeleteConfirmationTagHelper /
:0 1
	TagHelper2 ;
{ 
private 
const 
string  
ModelIdAttributeName 1
=2 3
$str4 B
;B C
private 
const 
string !
ButtonIdAttributeName 2
=3 4
$str5 D
;D E
private 
const 
string 
ActionAttributeName 0
=1 2
$str3 ?
;? @
private 
readonly 
IHtmlHelper $
_htmlHelper% 0
;0 1
	protected 
IHtmlGenerator  
	Generator! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[   	
HtmlAttributeName  	 
(    
ModelIdAttributeName   /
)  / 0
]  0 1
public!! 
string!! 
ModelId!! 
{!! 
get!!  #
;!!# $
set!!% (
;!!( )
}!!* +
[&& 	
HtmlAttributeName&&	 
(&& !
ButtonIdAttributeName&& 0
)&&0 1
]&&1 2
public'' 
string'' 
ButtonId'' 
{''  
get''! $
;''$ %
set''& )
;'') *
}''+ ,
[,, 	
HtmlAttributeName,,	 
(,, 
ActionAttributeName,, .
),,. /
],,/ 0
public-- 
string-- 
Action-- 
{-- 
get-- "
;--" #
set--$ '
;--' (
}--) *
[22 	!
HtmlAttributeNotBound22	 
]22 
[33 	
ViewContext33	 
]33 
public44 
ViewContext44 
ViewContext44 &
{44' (
get44) ,
;44, -
set44. 1
;441 2
}443 4
public;; *
NopDeleteConfirmationTagHelper;; -
(;;- .
IHtmlGenerator;;. <
	generator;;= F
,;;F G
IHtmlHelper;;H S

htmlHelper;;T ^
);;^ _
{<< 	
	Generator== 
=== 
	generator== !
;==! "
_htmlHelper>> 
=>> 

htmlHelper>> $
;>>$ %
}?? 	
publicGG 
overrideGG 
asyncGG 
TaskGG "
ProcessAsyncGG# /
(GG/ 0
TagHelperContextGG0 @
contextGGA H
,GGH I
TagHelperOutputGGJ Y
outputGGZ `
)GG` a
{HH 	
ifII 
(II 
contextII 
==II 
nullII 
)II  
{JJ 
throwKK 
newKK !
ArgumentNullExceptionKK /
(KK/ 0
nameofKK0 6
(KK6 7
contextKK7 >
)KK> ?
)KK? @
;KK@ A
}LL 
ifNN 
(NN 
outputNN 
==NN 
nullNN 
)NN 
{OO 
throwPP 
newPP !
ArgumentNullExceptionPP /
(PP/ 0
nameofPP0 6
(PP6 7
outputPP7 =
)PP= >
)PP> ?
;PP? @
}QQ 
varTT 
viewContextAwareTT  
=TT! "
_htmlHelperTT# .
asTT/ 1
IViewContextAwareTT2 C
;TTC D
viewContextAwareUU 
?UU 
.UU 

(UU+ ,
ViewContextUU, 7
)UU7 8
;UU8 9
ifWW 
(WW 
stringWW 
.WW 

(WW$ %
ActionWW% +
)WW+ ,
)WW, -
ActionXX 
=XX 
$strXX !
;XX! "
varZZ 
	modelNameZZ 
=ZZ 
_htmlHelperZZ '
.ZZ' (
ViewDataZZ( 0
.ZZ0 1

.ZZ> ?
	ModelTypeZZ? H
.ZZH I
NameZZI M
.ZZM N
ToLowerZZN U
(ZZU V
)ZZV W
;ZZW X
if[[ 
([[ 
![[ 
string[[ 
.[[ 

([[% &
Action[[& ,
)[[, -
)[[- .
	modelName\\ 
+=\\ 
$str\\  
+\\! "
Action\\# )
;\\) *
var]] 
modalId]] 
=]] 
new]] 

HtmlString]] (
(]]( )
	modelName]]) 2
+]]3 4
$str]]5 K
)]]K L
.]]L M
ToHtmlString]]M Y
(]]Y Z
)]]Z [
;]][ \
if__ 
(__ 
int__ 
.__ 
TryParse__ 
(__ 
ModelId__ $
,__$ %
out__& )
int__* -
modelId__. 5
)__5 6
)__6 7
{`` 
varaa #
deleteConfirmationModelaa +
=aa, -
newaa. 1#
DeleteConfirmationModelaa2 I
{bb 
Idcc 
=cc 
modelIdcc  
,cc  !
ControllerNamedd "
=dd# $
_htmlHelperdd% 0
.dd0 1
ViewContextdd1 <
.dd< =
	RouteDatadd= F
.ddF G
ValuesddG M
[ddM N
$strddN Z
]ddZ [
.dd[ \
ToStringdd\ d
(ddd e
)dde f
,ddf g

ActionNameee 
=ee  
Actionee! '
,ee' (
WindowIdff 
=ff 
modalIdff &
}gg 
;gg 
outputjj 
.jj 
TagNamejj 
=jj  
$strjj! &
;jj& '
outputkk 
.kk 
TagModekk 
=kk  
TagModekk! (
.kk( )
StartTagAndEndTagkk) :
;kk: ;
outputmm 
.mm 

Attributesmm !
.mm! "
Addmm" %
(mm% &
$strmm& *
,mm* +
modalIdmm, 3
)mm3 4
;mm4 5
outputnn 
.nn 

Attributesnn !
.nn! "
Addnn" %
(nn% &
$strnn& -
,nn- .
$strnn/ ;
)nn; <
;nn< =
outputoo 
.oo 

Attributesoo !
.oo! "
Addoo" %
(oo% &
$stroo& 0
,oo0 1
$stroo2 6
)oo6 7
;oo7 8
outputpp 
.pp 

Attributespp !
.pp! "
Addpp" %
(pp% &
$strpp& ,
,pp, -
$strpp. 6
)pp6 7
;pp7 8
outputqq 
.qq 

Attributesqq !
.qq! "
Addqq" %
(qq% &
$strqq& 7
,qq7 8
$"qq9 ;
{qq; <
modalIdqq< C
}qqC D
$strqqD J
"qqJ K
)qqK L
;qqL M
outputrr 
.rr 
Contentrr 
.rr 
SetHtmlContentrr -
(rr- .
awaitrr. 3
_htmlHelperrr4 ?
.rr? @
PartialAsyncrr@ L
(rrL M
$strrrM U
,rrU V#
deleteConfirmationModelrrW n
)rrn o
)rro p
;rrp q
varuu 
scriptuu 
=uu 
newuu  

TagBuilderuu! +
(uu+ ,
$struu, 4
)uu4 5
;uu5 6
scriptvv 
.vv 
	InnerHtmlvv  
.vv  !

AppendHtmlvv! +
(vv+ ,
$strvv, M
+vvM N
$"ww, .
$strww. 2
{ww2 3
ButtonIdww3 ;
}ww; <
$strww< y
{wwy z
modalId	wwz �
}
ww� �
$str
ww� �
"
ww� �
+
ww� �
$str
ww� �
)
ww� �
;
ww� �
outputxx 
.xx 
PostContentxx "
.xx" #
SetHtmlContentxx# 1
(xx1 2
scriptxx2 8
.xx8 9
RenderHtmlContentxx9 J
(xxJ K
)xxK L
)xxL M
;xxM N
}yy 
}zz 	
}{{ 
}|| �W
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopEditorTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Admin' ,
{ 
[ 
HtmlTargetElement 
( 
$str #
,# $

Attributes% /
=0 1
ForAttributeName2 B
,B C
TagStructureD P
=Q R
TagStructureS _
._ `

)m n
]n o
public 

class 
NopEditorTagHelper #
:$ %
	TagHelper& /
{ 
private 
const 
string 
ForAttributeName -
=. /
$str0 9
;9 :
private 
const 
string !
DisabledAttributeName 2
=3 4
$str5 C
;C D
private 
const 
string !
RequiredAttributeName 2
=3 4
$str5 C
;C D
private 
const 
string /
#RenderFormControlClassAttributeName @
=A B
$strC b
;b c
private 
const 
string !
TemplateAttributeName 2
=3 4
$str5 C
;C D
private 
const 
string  
PostfixAttributeName 1
=2 3
$str4 A
;A B
private 
const 
string 
ValueAttributeName /
=0 1
$str2 =
;= >
private 
const 
string $
PlaceholderAttributeName 5
=6 7
$str8 E
;E F
private 
readonly 
IHtmlHelper $
_htmlHelper% 0
;0 1
[!! 	
HtmlAttributeName!!	 
(!! 
ForAttributeName!! +
)!!+ ,
]!!, -
public"" 
ModelExpression"" 
For"" "
{""# $
get""% (
;""( )
set""* -
;""- .
}""/ 0
['' 	
HtmlAttributeName''	 
('' !
DisabledAttributeName'' 0
)''0 1
]''1 2
public(( 
string(( 

IsDisabled((  
{((! "
set((# &
;((& '
get((( +
;((+ ,
}((- .
[-- 	
HtmlAttributeName--	 
(-- !
RequiredAttributeName-- 0
)--0 1
]--1 2
public.. 
string.. 

IsRequired..  
{..! "
set..# &
;..& '
get..( +
;..+ ,
}..- .
[33 	
HtmlAttributeName33	 
(33 $
PlaceholderAttributeName33 3
)333 4
]334 5
public44 
string44 
Placeholder44 !
{44" #
set44$ '
;44' (
get44) ,
;44, -
}44. /
[99 	
HtmlAttributeName99	 
(99 /
#RenderFormControlClassAttributeName99 >
)99> ?
]99? @
public:: 
string:: "
RenderFormControlClass:: ,
{::- .
set::/ 2
;::2 3
get::4 7
;::7 8
}::9 :
[?? 	
HtmlAttributeName??	 
(?? !
TemplateAttributeName?? 0
)??0 1
]??1 2
public@@ 
string@@ 
Template@@ 
{@@  
set@@! $
;@@$ %
get@@& )
;@@) *
}@@+ ,
[EE 	
HtmlAttributeNameEE	 
(EE  
PostfixAttributeNameEE /
)EE/ 0
]EE0 1
publicFF 
stringFF 
PostfixFF 
{FF 
setFF  #
;FF# $
getFF% (
;FF( )
}FF* +
[KK 	
HtmlAttributeNameKK	 
(KK 
ValueAttributeNameKK -
)KK- .
]KK. /
publicLL 
stringLL 
ValueLL 
{LL 
setLL !
;LL! "
getLL# &
;LL& '
}LL( )
[QQ 	!
HtmlAttributeNotBoundQQ	 
]QQ 
[RR 	
ViewContextRR	 
]RR 
publicSS 
ViewContextSS 
ViewContextSS &
{SS' (
getSS) ,
;SS, -
setSS. 1
;SS1 2
}SS3 4
publicYY 
NopEditorTagHelperYY !
(YY! "
IHtmlHelperYY" -

htmlHelperYY. 8
)YY8 9
{ZZ 	
_htmlHelper[[ 
=[[ 

htmlHelper[[ $
;[[$ %
}\\ 	
publiccc 
overridecc 
voidcc 
Processcc $
(cc$ %
TagHelperContextcc% 5
contextcc6 =
,cc= >
TagHelperOutputcc? N
outputccO U
)ccU V
{dd 	
ifee 
(ee 
contextee 
==ee 
nullee 
)ee  
{ff 
throwgg 
newgg !
ArgumentNullExceptiongg /
(gg/ 0
nameofgg0 6
(gg6 7
contextgg7 >
)gg> ?
)gg? @
;gg@ A
}hh 
ifjj 
(jj 
outputjj 
==jj 
nulljj 
)jj 
{kk 
throwll 
newll !
ArgumentNullExceptionll /
(ll/ 0
nameofll0 6
(ll6 7
outputll7 =
)ll= >
)ll> ?
;ll? @
}mm 
outputpp 
.pp 
SuppressOutputpp !
(pp! "
)pp" #
;pp# $
varss 
htmlAttributesss 
=ss  
newss! $

Dictionaryss% /
<ss/ 0
stringss0 6
,ss6 7
objectss8 >
>ss> ?
(ss? @
)ss@ A
;ssA B
ifvv 
(vv 
!vv 
stringvv 
.vv 

(vv% &
Placeholdervv& 1
)vv1 2
)vv2 3
htmlAttributesww 
.ww 
Addww "
(ww" #
$strww# 0
,ww0 1
Placeholderww2 =
)ww= >
;ww> ?
ifzz 
(zz 
!zz 
stringzz 
.zz 

(zz% &
Valuezz& +
)zz+ ,
)zz, -
htmlAttributes{{ 
.{{ 
Add{{ "
({{" #
$str{{# *
,{{* +
Value{{, 1
){{1 2
;{{2 3
bool~~ 
.~~ 
TryParse~~ 
(~~ 

IsDisabled~~ $
,~~$ %
out~~& )
bool~~* .
disabled~~/ 7
)~~7 8
;~~8 9
if 
( 
disabled 
) 
{
�� 
htmlAttributes
�� 
.
�� 
Add
�� "
(
��" #
$str
��# -
,
��- .
$str
��/ 9
)
��9 :
;
��: ;
}
�� 
bool
�� 
.
�� 
TryParse
�� 
(
�� 

IsRequired
�� $
,
��$ %
out
��& )
bool
��* .
required
��/ 7
)
��7 8
;
��8 9
if
�� 
(
�� 
required
�� 
)
�� 
{
�� 
output
�� 
.
�� 

PreElement
�� !
.
��! "
SetHtmlContent
��" 0
(
��0 1
$str
��1 a
)
��a b
;
��b c
output
�� 
.
�� 
PostElement
�� "
.
��" #
SetHtmlContent
��# 1
(
��1 2
$str��2 �
)��� �
;��� �
}
�� 
var
�� 
viewContextAware
��  
=
��! "
_htmlHelper
��# .
as
��/ 1
IViewContextAware
��2 C
;
��C D
viewContextAware
�� 
?
�� 
.
�� 

�� +
(
��+ ,
ViewContext
��, 7
)
��7 8
;
��8 9
bool
�� 
.
�� 
TryParse
�� 
(
�� $
RenderFormControlClass
�� 0
,
��0 1
out
��2 5
bool
��6 :$
renderFormControlClass
��; Q
)
��Q R
;
��R S
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %$
RenderFormControlClass
��% ;
)
��; <
&&
��= ?
For
��@ C
.
��C D
Metadata
��D L
.
��L M
	ModelType
��M V
.
��V W
Name
��W [
.
��[ \
Equals
��\ b
(
��b c
$str
��c k
)
��k l
||
��m o%
renderFormControlClass��p �
)��� �
htmlAttributes
�� 
.
�� 
Add
�� "
(
��" #
$str
��# *
,
��* +
$str
��, :
)
��: ;
;
��; <
var
�� 

viewEngine
�� 
=
�� 
CommonHelper
�� )
.
��) *"
GetPrivateFieldValue
��* >
(
��> ?
_htmlHelper
��? J
,
��J K
$str
��L Y
)
��Y Z
as
��[ ]
IViewEngine
��^ i
;
��i j
var
�� 
bufferScope
�� 
=
�� 
CommonHelper
�� *
.
��* +"
GetPrivateFieldValue
��+ ?
(
��? @
_htmlHelper
��@ K
,
��K L
$str
��M [
)
��[ \
as
��] _
IViewBufferScope
��` p
;
��p q
var
�� 
templateBuilder
�� 
=
��  !
new
��" %
TemplateBuilder
��& 5
(
��5 6

viewEngine
�� 
,
�� 
bufferScope
�� 
,
�� 
_htmlHelper
�� 
.
�� 
ViewContext
�� '
,
��' (
_htmlHelper
�� 
.
�� 
ViewData
�� $
,
��$ %
For
�� 
.
�� 

�� !
,
��! "
For
�� 
.
�� 
Name
�� 
,
�� 
Template
�� 
,
�� 
readOnly
�� 
:
�� 
false
�� 
,
��   
additionalViewData
�� "
:
��" #
new
��$ '
{
��( )
htmlAttributes
��* 8
,
��8 9
postfix
��: A
=
��B C
Postfix
��D K
}
��L M
)
��M N
;
��N O
var
�� 

htmlOutput
�� 
=
�� 
templateBuilder
�� ,
.
��, -
Build
��- 2
(
��2 3
)
��3 4
;
��4 5
output
�� 
.
�� 
Content
�� 
.
�� 
SetHtmlContent
�� )
(
��) *

htmlOutput
��* 4
.
��4 5
RenderHtmlContent
��5 F
(
��F G
)
��G H
)
��H I
;
��I J
}
�� 	
}
�� 
}�� �;
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopLabelTagHelper.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 

TagHelpers

 &
.

& '
Admin

' ,
{ 
[ 
HtmlTargetElement 
( 
$str "
," #

Attributes$ .
=/ 0
ForAttributeName1 A
,A B
TagStructureC O
=P Q
TagStructureR ^
.^ _

)l m
]m n
public 

class 
NopLabelTagHelper "
:# $
	TagHelper% .
{ 
private 
const 
string 
ForAttributeName -
=. /
$str0 9
;9 :
private 
const 
string $
DisplayHintAttributeName 5
=6 7
$str8 J
;J K
private 
readonly 
IWorkContext %
_workContext& 2
;2 3
private 
readonly  
ILocalizationService - 
_localizationService. B
;B C
	protected 
IHtmlGenerator  
	Generator! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[   	
HtmlAttributeName  	 
(   
ForAttributeName   +
)  + ,
]  , -
public!! 
ModelExpression!! 
For!! "
{!!# $
get!!% (
;!!( )
set!!* -
;!!- .
}!!/ 0
[&& 	
HtmlAttributeName&&	 
(&& $
DisplayHintAttributeName&& 3
)&&3 4
]&&4 5
public'' 
bool'' 
DisplayHint'' 
{''  !
get''" %
;''% &
set''' *
;''* +
}'', -
=''. /
true''0 4
;''4 5
[,, 	!
HtmlAttributeNotBound,,	 
],, 
[-- 	
ViewContext--	 
]-- 
public.. 
ViewContext.. 
ViewContext.. &
{..' (
get..) ,
;.., -
set... 1
;..1 2
}..3 4
public66 
NopLabelTagHelper66  
(66  !
IHtmlGenerator66! /
	generator660 9
,669 :
IWorkContext66; G
workContext66H S
,66S T 
ILocalizationService66U i
localizationService66j }
)66} ~
{77 	
	Generator88 
=88 
	generator88 !
;88! "
_workContext99 
=99 
workContext99 &
;99& ' 
_localizationService::  
=::! "
localizationService::# 6
;::6 7
};; 	
publicBB 
overrideBB 
voidBB 
ProcessBB $
(BB$ %
TagHelperContextBB% 5
contextBB6 =
,BB= >
TagHelperOutputBB? N
outputBBO U
)BBU V
{CC 	
ifDD 
(DD 
contextDD 
==DD 
nullDD 
)DD  
{EE 
throwFF 
newFF !
ArgumentNullExceptionFF /
(FF/ 0
nameofFF0 6
(FF6 7
contextFF7 >
)FF> ?
)FF? @
;FF@ A
}GG 
ifII 
(II 
outputII 
==II 
nullII 
)II 
{JJ 
throwKK 
newKK !
ArgumentNullExceptionKK /
(KK/ 0
nameofKK0 6
(KK6 7
outputKK7 =
)KK= >
)KK> ?
;KK? @
}LL 
varOO 

tagBuilderOO 
=OO 
	GeneratorOO &
.OO& '

(OO4 5
ViewContextOO5 @
,OO@ A
ForOOB E
.OOE F

,OOS T
ForOOU X
.OOX Y
NameOOY ]
,OO] ^
nullOO_ c
,OOc d
newOOe h
{OOi j
@classOOk q
=OOr s
$str	OOt �
}
OO� �
)
OO� �
;
OO� �
ifPP 
(PP 

tagBuilderPP 
!=PP 
nullPP "
)PP" #
{QQ 
outputSS 
.SS 
TagNameSS 
=SS  
$strSS! &
;SS& '
outputTT 
.TT 
TagModeTT 
=TT  
TagModeTT! (
.TT( )
StartTagAndEndTagTT) :
;TT: ;
varVV 

classValueVV 
=VV  
outputVV! '
.VV' (

AttributesVV( 2
.VV2 3
ContainsNameVV3 ?
(VV? @
$strVV@ G
)VVG H
?WW$ %
$"WW& (
{WW( )
outputWW) /
.WW/ 0

AttributesWW0 :
[WW: ;
$strWW; B
]WWB C
.WWC D
ValueWWD I
}WWI J
$strWWJ X
"WWX Y
:XX$ %
$strXX& 5
;XX5 6
outputYY 
.YY 

AttributesYY !
.YY! "
SetAttributeYY" .
(YY. /
$strYY/ 6
,YY6 7

classValueYY8 B
)YYB C
;YYC D
output\\ 
.\\ 
Content\\ 
.\\ 
SetHtmlContent\\ -
(\\- .

tagBuilder\\. 8
)\\8 9
;\\9 :
if__ 
(__ 
For__ 
.__ 
Metadata__  
.__  !
AdditionalValues__! 1
.__1 2
TryGetValue__2 =
(__= >
$str__> _
,___ `
out__a d
object__e k
value__l q
)__q r
)__r s
{`` 
varaa 
resourceDisplayNameaa +
=aa, -
valueaa. 3
asaa4 6+
NopResourceDisplayNameAttributeaa7 V
;aaV W
ifbb 
(bb 
resourceDisplayNamebb +
!=bb, .
nullbb/ 3
&&bb4 6
DisplayHintbb7 B
)bbB C
{cc 
vardd 
langIddd "
=dd# $
_workContextdd% 1
.dd1 2
WorkingLanguagedd2 A
.ddA B
IdddB D
;ddD E
varee 
hintResourceee (
=ee) * 
_localizationServiceee+ ?
.ee? @
GetResourceee@ K
(eeK L
resourceDisplayNameff /
.ff/ 0
ResourceKeyff0 ;
+ff< =
$strff> E
,ffE F
langIdffG M
,ffM N!
returnEmptyIfNotFoundffO d
:ffd e
truefff j
,ffj k

:gg) *
falsegg+ 0
)gg0 1
;gg1 2
ifii 
(ii 
!ii 
stringii #
.ii# $

(ii1 2
hintResourceii2 >
)ii> ?
)ii? @
{jj 
varkk 
hintContentkk  +
=kk, -
$"kk. 0
$strkk0 <
{kk< =

WebUtilitykk= G
.kkG H

HtmlEncodekkH R
(kkR S
hintResourcekkS _
)kk_ `
}kk` a
$str	kka �
"
kk� �
;
kk� �
outputll "
.ll" #
Contentll# *
.ll* +

AppendHtmlll+ 5
(ll5 6
hintContentll6 A
)llA B
;llB C
}mm 
}nn 
}oo 
}pp 
}qq 	
}rr 
}ss �,
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopNestedSettingTagHelper.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 

TagHelpers		 &
.		& '
Admin		' ,
{

 
[ 
HtmlTargetElement 
( 
$str +
,+ ,

Attributes- 7
=8 9
ForAttributeName: J
)J K
]K L
public 

class %
NopNestedSettingTagHelper *
:+ ,
	TagHelper- 6
{ 
private 
readonly 
AdminAreaSettings *
_adminAreaSettings+ =
;= >
private 
const 
string 
ForAttributeName -
=. /
$str0 9
;9 :
	protected 
IHtmlGenerator  
	Generator! *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
[ 	
HtmlAttributeName	 
( 
ForAttributeName +
)+ ,
], -
public 
ModelExpression 
For "
{# $
get% (
;( )
set* -
;- .
}/ 0
[## 	!
HtmlAttributeNotBound##	 
]## 
[$$ 	
ViewContext$$	 
]$$ 
public%% 
ViewContext%% 
ViewContext%% &
{%%' (
get%%) ,
;%%, -
set%%. 1
;%%1 2
}%%3 4
public,, %
NopNestedSettingTagHelper,, (
(,,( )
IHtmlGenerator,,) 7
	generator,,8 A
,,,A B
AdminAreaSettings,,C T
adminAreaSettings,,U f
),,f g
{-- 	
	Generator.. 
=.. 
	generator.. !
;..! "
_adminAreaSettings// 
=//  
adminAreaSettings//! 2
;//2 3
}00 	
public77 
override77 
void77 
Process77 $
(77$ %
TagHelperContext77% 5
context776 =
,77= >
TagHelperOutput77? N
output77O U
)77U V
{88 	
if99 
(99 
context99 
==99 
null99 
)99  
{:: 
throw;; 
new;; !
ArgumentNullException;; /
(;;/ 0
nameof;;0 6
(;;6 7
context;;7 >
);;> ?
);;? @
;;;@ A
}<< 
if>> 
(>> 
output>> 
==>> 
null>> 
)>> 
{?? 
throw@@ 
new@@ !
ArgumentNullException@@ /
(@@/ 0
nameof@@0 6
(@@6 7
output@@7 =
)@@= >
)@@> ?
;@@? @
}AA 
varCC 
parentSettingNameCC !
=CC" #
ForCC$ '
.CC' (
NameCC( ,
;CC, -
varEE 
randomEE 
=EE 
CommonHelperEE %
.EE% &!
GenerateRandomIntegerEE& ;
(EE; <
)EE< =
;EE= >
varFF 
nestedSettingIdFF 
=FF  !
$"FF" $
$strFF$ 1
{FF1 2
randomFF2 8
}FF8 9
"FF9 :
;FF: ;
varGG 
parentSettingIdGG 
=GG  !
$"GG" $
$strGG$ 1
{GG1 2
randomGG2 8
}GG8 9
"GG9 :
;GG: ;
outputJJ 
.JJ 
TagNameJJ 
=JJ 
$strJJ "
;JJ" #
outputKK 
.KK 
TagModeKK 
=KK 
TagModeKK $
.KK$ %
StartTagAndEndTagKK% 6
;KK6 7
outputLL 
.LL 

AttributesLL 
.LL 
AddLL !
(LL! "
$strLL" )
,LL) *
$strLL+ ;
)LL; <
;LL< =
ifNN 
(NN 
contextNN 
.NN 

.NN% &
ContainsNameNN& 2
(NN2 3
$strNN3 7
)NN7 8
)NN8 9
nestedSettingIdOO 
=OO  !
contextOO" )
.OO) *

[OO7 8
$strOO8 <
]OO< =
.OO= >
ValueOO> C
.OOC D
ToStringOOD L
(OOL M
)OOM N
;OON O
outputPP 
.PP 

AttributesPP 
.PP 
AddPP !
(PP! "
$strPP" &
,PP& '
nestedSettingIdPP( 7
)PP7 8
;PP8 9
varSS 
scriptSS 
=SS 
newSS 

TagBuilderSS '
(SS' (
$strSS( 0
)SS0 1
;SS1 2
scriptTT 
.TT 
	InnerHtmlTT 
.TT 

AppendHtmlTT '
(TT' (
$strTT( I
+TTJ K
$"UU, .
$strUU. A
{UUA B
parentSettingNameUUB S
}UUS T
$strUUT X
{UUX Y
parentSettingIdUUY h
}UUh i
$strUUi m
{UUm n
nestedSettingIdUUn }
}UU} ~
$str	UU~ �
"
UU� �
+
UU� �
$strVV( -
)VV- .
;VV. /
outputWW 
.WW 

PreContentWW 
.WW 
SetHtmlContentWW ,
(WW, -
scriptWW- 3
.WW3 4
RenderHtmlContentWW4 E
(WWE F
)WWF G
)WWG H
;WWH I
}XX 	
}YY 
}ZZ �?
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopOverrideStoreCheckboxHelper.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 

TagHelpers		 &
.		& '
Admin		' ,
{

 
[ 
HtmlTargetElement 
( 
$str 4
,4 5

Attributes6 @
=A B
ForAttributeNameC S
,S T
TagStructureU a
=b c
TagStructured p
.p q

)~ 
]	 �
public 

class *
NopOverrideStoreCheckboxHelper /
:0 1
	TagHelper2 ;
{ 
private 
const 
string 
ForAttributeName -
=. /
$str0 9
;9 :
private 
const 
string 
InputAttributeName /
=0 1
$str2 =
;= >
private 
const 
string 
Input2AttributeName 0
=1 2
$str3 ?
;? @
private 
const 
string #
StoreScopeAttributeName 4
=5 6
$str7 H
;H I
private 
const 
string (
ParentContainerAttributeName 9
=: ;
$str< R
;R S
private 
readonly 
IHtmlHelper $
_htmlHelper% 0
;0 1
[ 	
HtmlAttributeName	 
( 
ForAttributeName +
)+ ,
], -
public 
ModelExpression 
For "
{# $
get% (
;( )
set* -
;- .
}/ 0
["" 	
HtmlAttributeName""	 
("" 
InputAttributeName"" -
)""- .
]"". /
public## 
ModelExpression## 
Input## $
{##% &
set##' *
;##* +
get##, /
;##/ 0
}##1 2
[(( 	
HtmlAttributeName((	 
((( 
Input2AttributeName(( .
)((. /
]((/ 0
public)) 
ModelExpression)) 
Input2)) %
{))& '
set))( +
;))+ ,
get))- 0
;))0 1
}))2 3
[.. 	
HtmlAttributeName..	 
(.. #
StoreScopeAttributeName.. 2
)..2 3
]..3 4
public// 
int// 

StoreScope// 
{// 
set//  #
;//# $
get//% (
;//( )
}//* +
[44 	
HtmlAttributeName44	 
(44 (
ParentContainerAttributeName44 7
)447 8
]448 9
public55 
string55 
ParentContainer55 %
{55& '
set55( +
;55+ ,
get55- 0
;550 1
}552 3
[:: 	!
HtmlAttributeNotBound::	 
]:: 
[;; 	
ViewContext;;	 
];; 
public<< 
ViewContext<< 
ViewContext<< &
{<<' (
get<<) ,
;<<, -
set<<. 1
;<<1 2
}<<3 4
publicBB *
NopOverrideStoreCheckboxHelperBB -
(BB- .
IHtmlHelperBB. 9

htmlHelperBB: D
)BBD E
{CC 	
_htmlHelperDD 
=DD 

htmlHelperDD $
;DD$ %
}EE 	
publicLL 
overrideLL 
voidLL 
ProcessLL $
(LL$ %
TagHelperContextLL% 5
contextLL6 =
,LL= >
TagHelperOutputLL? N
outputLLO U
)LLU V
{MM 	
ifNN 
(NN 
contextNN 
==NN 
nullNN 
)NN  
{OO 
throwPP 
newPP !
ArgumentNullExceptionPP /
(PP/ 0
nameofPP0 6
(PP6 7
contextPP7 >
)PP> ?
)PP? @
;PP@ A
}QQ 
ifSS 
(SS 
outputSS 
==SS 
nullSS 
)SS 
{TT 
throwUU 
newUU !
ArgumentNullExceptionUU /
(UU/ 0
nameofUU0 6
(UU6 7
outputUU7 =
)UU= >
)UU> ?
;UU? @
}VV 
outputYY 
.YY 
SuppressOutputYY !
(YY! "
)YY" #
;YY# $
if\\ 
(\\ 

StoreScope\\ 
>\\ 
$num\\ 
)\\ 
{]] 
var__ 
viewContextAware__ $
=__% &
_htmlHelper__' 2
as__3 5
IViewContextAware__6 G
;__G H
viewContextAware``  
?``  !
.``! "

(``/ 0
ViewContext``0 ;
)``; <
;``< =
varbb 
dataInputIdsbb  
=bb! "
newbb# &
Listbb' +
<bb+ ,
stringbb, 2
>bb2 3
(bb3 4
)bb4 5
;bb5 6
ifcc 
(cc 
Inputcc 
!=cc 
nullcc !
)cc! "
dataInputIdsdd  
.dd  !
Adddd! $
(dd$ %
_htmlHelperdd% 0
.dd0 1
Iddd1 3
(dd3 4
Inputdd4 9
.dd9 :
Namedd: >
)dd> ?
)dd? @
;dd@ A
ifee 
(ee 
Input2ee 
!=ee 
nullee "
)ee" #
dataInputIdsff  
.ff  !
Addff! $
(ff$ %
_htmlHelperff% 0
.ff0 1
Idff1 3
(ff3 4
Input2ff4 :
.ff: ;
Nameff; ?
)ff? @
)ff@ A
;ffA B
consthh 
stringhh 
cssClasshh %
=hh& '
$strhh( E
;hhE F
varii 
dataInputSelectorii %
=ii& '
$strii( *
;ii* +
ifjj 
(jj 
!jj 
stringjj 
.jj 

(jj) *
ParentContainerjj* 9
)jj9 :
)jj: ;
{kk 
dataInputSelectorll %
=ll& '
$strll( +
+ll, -
ParentContainerll. =
+ll> ?
$strll@ K
+llL M
ParentContainerllN ]
+ll^ _
$strll` n
+llo p
ParentContainer	llq �
+
ll� �
$str
ll� �
;
ll� �
}mm 
ifnn 
(nn 
dataInputIdsnn  
.nn  !
Anynn! $
(nn$ %
)nn% &
)nn& '
{oo 
dataInputSelectorpp %
=pp& '
$strpp( +
+pp, -
stringpp. 4
.pp4 5
Joinpp5 9
(pp9 :
$strpp: ?
,pp? @
dataInputIdsppA M
)ppM N
;ppN O
}qq 
varrr 
onClickrr 
=rr 
$"rr  
$strrr  A
{rrA B
dataInputSelectorrrB S
}rrS T
$strrrT V
"rrV W
;rrW X
vartt 
htmlAttributestt "
=tt# $
newtt% (
{uu 
@classvv 
=vv 
cssClassvv %
,vv% &
onclickww 
=ww 
onClickww %
,ww% &#
data_for_input_selectorxx +
=xx, -
dataInputSelectorxx. ?
}yy 
;yy 
varzz 

htmlOutputzz 
=zz  
_htmlHelperzz! ,
.zz, -
CheckBoxzz- 5
(zz5 6
Forzz6 9
.zz9 :
Namezz: >
,zz> ?
nullzz@ D
,zzD E
htmlAttributeszzF T
)zzT U
;zzU V
output{{ 
.{{ 
Content{{ 
.{{ 
SetHtmlContent{{ -
({{- .

htmlOutput{{. 8
.{{8 9
RenderHtmlContent{{9 J
({{J K
){{K L
){{L M
;{{M N
}|| 
}}} 	
}~~ 
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopPanelsTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Admin' ,
{ 
[

 
HtmlTargetElement

 
(

 
$str

 #
,

# $

Attributes

% /
=

0 1
ID_ATTRIBUTE_NAME

2 C
)

C D
]

D E
public 

class 
NopPanelsTagHelper #
:$ %
	TagHelper& /
{ 
private
const
string
ID_ATTRIBUTE_NAME
=
$str
;
[ 	!
HtmlAttributeNotBound	 
] 
[ 	
ViewContext	 
] 
public 
ViewContext 
ViewContext &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
} 
} �d
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopPanelTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Admin' ,
{		 
[
HtmlTargetElement
(
$str
,

Attributes
=
NAME_ATTRIBUTE_NAME
)
]
public 

class 
NopPanelTagHelper "
:# $
	TagHelper% .
{ 
private 
const 
string 
NAME_ATTRIBUTE_NAME 0
=1 2
$str3 =
;= >
private 
const 
string  
TITLE_ATTRIBUTE_NAME 1
=2 3
$str4 ?
;? @
private 
const 
string 4
(HIDE_BLOCK_ATTRIBUTE_NAME_ATTRIBUTE_NAME E
=F G
$strH g
;g h
private 
const 
string "
IS_HIDE_ATTRIBUTE_NAME 3
=4 5
$str6 @
;@ A
private 
const 
string &
IS_ADVANCED_ATTRIBUTE_NAME 7
=8 9
$str: H
;H I
private 
const 
string %
PANEL_ICON_ATTRIBUTE_NAME 6
=7 8
$str9 C
;C D
private 
readonly 
IHtmlHelper $
_htmlHelper% 0
;0 1
[ 	
HtmlAttributeName	 
(  
TITLE_ATTRIBUTE_NAME /
)/ 0
]0 1
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
["" 	
HtmlAttributeName""	 
("" 
NAME_ATTRIBUTE_NAME"" .
)"". /
]""/ 0
public## 
string## 
Name## 
{## 
get##  
;##  !
set##" %
;##% &
}##' (
[(( 	
HtmlAttributeName((	 
((( 4
(HIDE_BLOCK_ATTRIBUTE_NAME_ATTRIBUTE_NAME(( C
)((C D
]((D E
public)) 
string)) "
HideBlockAttributeName)) ,
{))- .
get))/ 2
;))2 3
set))4 7
;))7 8
}))9 :
[.. 	
HtmlAttributeName..	 
(.. "
IS_HIDE_ATTRIBUTE_NAME.. 1
)..1 2
]..2 3
public// 
bool// 
IsHide// 
{// 
get//  
;//  !
set//" %
;//% &
}//' (
[44 	
HtmlAttributeName44	 
(44 &
IS_ADVANCED_ATTRIBUTE_NAME44 5
)445 6
]446 7
public55 
bool55 

IsAdvanced55 
{55  
get55! $
;55$ %
set55& )
;55) *
}55+ ,
[:: 	
HtmlAttributeName::	 
(:: %
PANEL_ICON_ATTRIBUTE_NAME:: 4
)::4 5
]::5 6
public;; 
string;; 
PanelIconIsAdvanced;; )
{;;* +
get;;, /
;;;/ 0
set;;1 4
;;;4 5
};;6 7
[@@ 	!
HtmlAttributeNotBound@@	 
]@@ 
[AA 	
ViewContextAA	 
]AA 
publicBB 
ViewContextBB 
ViewContextBB &
{BB' (
getBB) ,
;BB, -
setBB. 1
;BB1 2
}BB3 4
publicHH 
NopPanelTagHelperHH  
(HH  !
IHtmlHelperHH! ,

htmlHelperHH- 7
)HH7 8
{II 	
_htmlHelperJJ 
=JJ 

htmlHelperJJ $
;JJ$ %
}KK 	
publicRR 
overrideRR 
voidRR 
ProcessRR $
(RR$ %
TagHelperContextRR% 5
contextRR6 =
,RR= >
TagHelperOutputRR? N
outputRRO U
)RRU V
{SS 	
ifTT 
(TT 
contextTT 
==TT 
nullTT 
)TT  
{UU 
throwVV 
newVV !
ArgumentNullExceptionVV /
(VV/ 0
nameofVV0 6
(VV6 7
contextVV7 >
)VV> ?
)VV? @
;VV@ A
}WW 
ifYY 
(YY 
outputYY 
==YY 
nullYY 
)YY 
{ZZ 
throw[[ 
new[[ !
ArgumentNullException[[ /
([[/ 0
nameof[[0 6
([[6 7
output[[7 =
)[[= >
)[[> ?
;[[? @
}\\ 
var__ 
viewContextAware__  
=__! "
_htmlHelper__# .
as__/ 1
IViewContextAware__2 C
;__C D
viewContextAware`` 
?`` 
.`` 

(``+ ,
ViewContext``, 7
)``7 8
;``8 9
varcc 
panelcc 
=cc 
newcc 

TagBuildercc &
(cc& '
$strcc' ,
)cc, -
{dd 

Attributesee 
=ee 
{ff 
newgg 
KeyValuePairgg $
<gg$ %
stringgg% +
,gg+ ,
stringgg- 3
>gg3 4
(gg4 5
$strgg5 9
,gg9 :
Namegg; ?
)gg? @
,gg@ A
newhh 
KeyValuePairhh $
<hh$ %
stringhh% +
,hh+ ,
stringhh- 3
>hh3 4
(hh4 5
$strhh5 F
,hhF G
NamehhH L
)hhL M
,hhM N
}ii 
}jj 
;jj
panelkk 
.kk 
AddCssClasskk 
(kk 
$strkk E
)kkE F
;kkF G
ifll 
(ll 
contextll 
.ll 

.ll% &
ContainsNamell& 2
(ll2 3&
IS_ADVANCED_ATTRIBUTE_NAMEll3 M
)llM N
&&llO Q
contextllR Y
.llY Z

[llg h'
IS_ADVANCED_ATTRIBUTE_NAME	llh �
]
ll� �
.
ll� �
Value
ll� �
.
ll� �
Equals
ll� �
(
ll� �
true
ll� �
)
ll� �
)
ll� �
{mm 
panelnn 
.nn 
AddCssClassnn !
(nn! "
$strnn" 4
)nn4 5
;nn5 6
}oo 
varrr 
panelHeadingrr 
=rr 
newrr "

TagBuilderrr# -
(rr- .
$strrr. 3
)rr3 4
;rr4 5
panelHeadingss 
.ss 
AddCssClassss $
(ss$ %
$strss% 4
)ss4 5
;ss5 6
panelHeadingtt 
.tt 

Attributestt #
.tt# $
Addtt$ '
(tt' (
$strtt( <
,tt< =
contexttt> E
.ttE F

[ttS T4
(HIDE_BLOCK_ATTRIBUTE_NAME_ATTRIBUTE_NAMEttT |
]tt| }
.tt} ~
Value	tt~ �
.
tt� �
ToString
tt� �
(
tt� �
)
tt� �
)
tt� �
;
tt� �
ifvv 
(vv 
contextvv 
.vv 

[vv% &"
IS_HIDE_ATTRIBUTE_NAMEvv& <
]vv< =
.vv= >
Valuevv> C
.vvC D
EqualsvvD J
(vvJ K
falsevvK P
)vvP Q
)vvQ R
{ww 
panelHeadingxx 
.xx 
AddCssClassxx (
(xx( )
$strxx) 1
)xx1 2
;xx2 3
}yy 
if{{ 
({{ 
context{{ 
.{{ 

.{{% &
ContainsName{{& 2
({{2 3%
PANEL_ICON_ATTRIBUTE_NAME{{3 L
){{L M
){{M N
{|| 
var}} 
	panelIcon}} 
=}} 
new}}  #

TagBuilder}}$ .
(}}. /
$str}}/ 2
)}}2 3
;}}3 4
	panelIcon~~ 
.~~ 
AddCssClass~~ %
(~~% &
$str~~& 2
)~~2 3
;~~3 4
	panelIcon 
. 
AddCssClass %
(% &
context& -
.- .

[; <%
PANEL_ICON_ATTRIBUTE_NAME< U
]U V
.V W
ValueW \
.\ ]
ToString] e
(e f
)f g
)g h
;h i
var
�� 

�� !
=
��" #
new
��$ '

TagBuilder
��( 2
(
��2 3
$str
��3 8
)
��8 9
;
��9 :

�� 
.
�� 
AddCssClass
�� )
(
��) *
$str
��* :
)
��: ;
;
��; <

�� 
.
�� 
	InnerHtml
�� '
.
��' (

AppendHtml
��( 2
(
��2 3
	panelIcon
��3 <
)
��< =
;
��= >
panelHeading
�� 
.
�� 
	InnerHtml
�� &
.
��& '

AppendHtml
��' 1
(
��1 2

��2 ?
)
��? @
;
��@ A
}
�� 
panelHeading
�� 
.
�� 
	InnerHtml
�� "
.
��" #

AppendHtml
��# -
(
��- .
$"
��. 0
$str
��0 6
{
��6 7
context
��7 >
.
��> ?

��? L
[
��L M"
TITLE_ATTRIBUTE_NAME
��M a
]
��a b
.
��b c
Value
��c h
}
��h i
$str
��i p
"
��p q
)
��q r
;
��r s
var
�� 
collapseIcon
�� 
=
�� 
new
�� "

TagBuilder
��# -
(
��- .
$str
��. 1
)
��1 2
;
��2 3
collapseIcon
�� 
.
�� 
AddCssClass
�� $
(
��$ %
$str
��% )
)
��) *
;
��* +
collapseIcon
�� 
.
�� 
AddCssClass
�� $
(
��$ %
$str
��% 2
)
��2 3
;
��3 4
collapseIcon
�� 
.
�� 
AddCssClass
�� $
(
��$ %
context
��% ,
.
��, -

��- :
[
��: ;$
IS_HIDE_ATTRIBUTE_NAME
��; Q
]
��Q R
.
��R S
Value
��S X
.
��X Y
Equals
��Y _
(
��_ `
true
��` d
)
��d e
?
��f g
$str
��h q
:
��r s
$str
��t ~
)
��~ 
;�� �
panelHeading
�� 
.
�� 
	InnerHtml
�� "
.
��" #

AppendHtml
��# -
(
��- .
collapseIcon
��. :
)
��: ;
;
��; <
var
�� 
panelContainer
�� 
=
��  
new
��! $

TagBuilder
��% /
(
��/ 0
$str
��0 5
)
��5 6
;
��6 7
panelContainer
�� 
.
�� 
AddCssClass
�� &
(
��& '
$str
��' 8
)
��8 9
;
��9 :
if
�� 
(
�� 
context
�� 
.
�� 

�� %
[
��% &$
IS_HIDE_ATTRIBUTE_NAME
��& <
]
��< =
.
��= >
Value
��> C
.
��C D
Equals
��D J
(
��J K
true
��K O
)
��O P
)
��P Q
{
�� 
panelContainer
�� 
.
�� 
AddCssClass
�� *
(
��* +
$str
��+ 6
)
��6 7
;
��7 8
}
�� 
panelContainer
�� 
.
�� 
	InnerHtml
�� $
.
��$ %

AppendHtml
��% /
(
��/ 0
output
��0 6
.
��6 7"
GetChildContentAsync
��7 K
(
��K L
)
��L M
.
��M N
Result
��N T
.
��T U

GetContent
��U _
(
��_ `
)
��` a
)
��a b
;
��b c
panel
�� 
.
�� 
	InnerHtml
�� 
.
�� 

AppendHtml
�� &
(
��& '
panelHeading
��' 3
)
��3 4
;
��4 5
panel
�� 
.
�� 
	InnerHtml
�� 
.
�� 

AppendHtml
�� &
(
��& '
panelContainer
��' 5
)
��5 6
;
��6 7
output
�� 
.
�� 
Content
�� 
.
�� 

AppendHtml
�� %
(
��% &
panel
��& +
.
��+ ,
RenderHtmlContent
��, =
(
��= >
)
��> ?
)
��? @
;
��@ A
}
�� 	
}
�� 
}�� �K
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopSelectTagHelper.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 

TagHelpers		 &
.		& '
Admin		' ,
{

 
[ 
HtmlTargetElement 
( 
$str #
,# $
TagStructure% 1
=2 3
TagStructure4 @
.@ A

)N O
]O P
public 

class 
NopSelectTagHelper #
:$ %
	TagHelper& /
{ 
private 
const 
string 
ForAttributeName -
=. /
$str0 9
;9 :
private 
const 
string 
NameAttributeName .
=/ 0
$str1 ?
;? @
private 
const 
string 
ItemsAttributeName /
=0 1
$str2 =
;= >
private 
const 
string !
DisabledAttributeName 2
=3 4
$str5 C
;C D
private 
const 
string !
RequiredAttributeName 2
=3 4
$str5 C
;C D
private 
readonly 
IHtmlHelper $
_htmlHelper% 0
;0 1
[ 	
HtmlAttributeName	 
( 
ForAttributeName +
)+ ,
], -
public 
ModelExpression 
For "
{# $
get% (
;( )
set* -
;- .
}/ 0
["" 	
HtmlAttributeName""	 
("" 
NameAttributeName"" ,
)"", -
]""- .
public## 
string## 
Name## 
{## 
get##  
;##  !
set##" %
;##% &
}##' (
[(( 	
HtmlAttributeName((	 
((( 
ItemsAttributeName(( -
)((- .
]((. /
public)) 
IEnumerable)) 
<)) 
SelectListItem)) )
>))) *
Items))+ 0
{))1 2
set))3 6
;))6 7
get))8 ;
;)); <
}))= >
=))? @
new))A D
List))E I
<))I J
SelectListItem))J X
>))X Y
())Y Z
)))Z [
;))[ \
[.. 	
HtmlAttributeName..	 
(.. !
RequiredAttributeName.. 0
)..0 1
]..1 2
public// 
string// 

IsRequired//  
{//! "
set//# &
;//& '
get//( +
;//+ ,
}//- .
[44 	
HtmlAttributeName44	 
(44 !
DisabledAttributeName44 0
)440 1
]441 2
public55 
string55 

IsMultiple55  
{55! "
set55# &
;55& '
get55( +
;55+ ,
}55- .
[:: 	!
HtmlAttributeNotBound::	 
]:: 
[;; 	
ViewContext;;	 
];; 
public<< 
ViewContext<< 
ViewContext<< &
{<<' (
get<<) ,
;<<, -
set<<. 1
;<<1 2
}<<3 4
publicBB 
NopSelectTagHelperBB !
(BB! "
IHtmlHelperBB" -

htmlHelperBB. 8
)BB8 9
{CC 	
_htmlHelperDD 
=DD 

htmlHelperDD $
;DD$ %
}EE 	
publicLL 
overrideLL 
voidLL 
ProcessLL $
(LL$ %
TagHelperContextLL% 5
contextLL6 =
,LL= >
TagHelperOutputLL? N
outputLLO U
)LLU V
{MM 	
ifNN 
(NN 
contextNN 
==NN 
nullNN 
)NN  
{OO 
throwPP 
newPP !
ArgumentNullExceptionPP /
(PP/ 0
nameofPP0 6
(PP6 7
contextPP7 >
)PP> ?
)PP? @
;PP@ A
}QQ 
ifSS 
(SS 
outputSS 
==SS 
nullSS 
)SS 
{TT 
throwUU 
newUU !
ArgumentNullExceptionUU /
(UU/ 0
nameofUU0 6
(UU6 7
outputUU7 =
)UU= >
)UU> ?
;UU? @
}VV 
outputYY 
.YY 
SuppressOutputYY !
(YY! "
)YY" #
;YY# $
bool\\ 
.\\ 
TryParse\\ 
(\\ 

IsRequired\\ $
,\\$ %
out\\& )
bool\\* .
required\\/ 7
)\\7 8
;\\8 9
if]] 
(]] 
required]] 
)]] 
{^^ 
output__ 
.__ 

PreElement__ !
.__! "
SetHtmlContent__" 0
(__0 1
$str__1 a
)__a b
;__b c
output`` 
.`` 
PostElement`` "
.``" #
SetHtmlContent``# 1
(``1 2
$str	``2 �
)
``� �
;
``� �
}aa 
vardd 
viewContextAwaredd  
=dd! "
_htmlHelperdd# .
asdd/ 1
IViewContextAwaredd2 C
;ddC D
viewContextAwareee 
?ee 
.ee 

(ee+ ,
ViewContextee, 7
)ee7 8
;ee8 9
varhh 
htmlAttributeshh 
=hh  
newhh! $

Dictionaryhh% /
<hh/ 0
stringhh0 6
,hh6 7
objecthh8 >
>hh> ?
(hh? @
)hh@ A
;hhA B
varii 

attributesii 
=ii 
contextii $
.ii$ %

;ii2 3
foreachjj 
(jj 
varjj 
	attributejj "
injj# %

attributesjj& 0
)jj0 1
{kk 
ifll 
(ll 
!ll 
	attributell 
.ll 
Namell #
.ll# $
Equalsll$ *
(ll* +
ForAttributeNamell+ ;
)ll; <
&&ll= ?
!mm 
	attributemm 
.mm 
Namemm #
.mm# $
Equalsmm$ *
(mm* +
NameAttributeNamemm+ <
)mm< =
&&mm> @
!nn 
	attributenn 
.nn 
Namenn #
.nn# $
Equalsnn$ *
(nn* +
ItemsAttributeNamenn+ =
)nn= >
&&nn? A
!oo 
	attributeoo 
.oo 
Nameoo #
.oo# $
Equalsoo$ *
(oo* +!
DisabledAttributeNameoo+ @
)oo@ A
&&ooB D
!pp 
	attributepp 
.pp 
Namepp #
.pp# $
Equalspp$ *
(pp* +!
RequiredAttributeNamepp+ @
)pp@ A
)ppA B
{qq 
htmlAttributesrr "
.rr" #
Addrr# &
(rr& '
	attributerr' 0
.rr0 1
Namerr1 5
,rr5 6
	attributerr7 @
.rr@ A
ValuerrA F
)rrF G
;rrG H
}ss 
}tt 
varww 
tagNameww 
=ww 
Forww 
!=ww  
nullww! %
?ww& '
Forww( +
.ww+ ,
Nameww, 0
:ww1 2
Nameww3 7
;ww7 8
boolxx 
.xx 
TryParsexx 
(xx 

IsMultiplexx $
,xx$ %
outxx& )
boolxx* .
multiplexx/ 7
)xx7 8
;xx8 9
ifyy 
(yy 
!yy 
stringyy 
.yy 

(yy% &
tagNameyy& -
)yy- .
)yy. /
{zz 
IHtmlContent{{ 

selectList{{ '
;{{' (
if|| 
(|| 
multiple|| 
)|| 
{}} 

selectList~~ 
=~~  
_htmlHelper~~! ,
.~~, -
Editor~~- 3
(~~3 4
tagName~~4 ;
,~~; <
$str~~= J
,~~J K
new~~L O
{~~P Q
htmlAttributes~~Q _
,~~_ `

SelectList~~a k
=~~l m
Items~~n s
}~~s t
)~~t u
;~~u v
} 
else
�� 
{
�� 
if
�� 
(
�� 
htmlAttributes
�� &
.
��& '
ContainsKey
��' 2
(
��2 3
$str
��3 :
)
��: ;
)
��; <
htmlAttributes
�� &
[
��& '
$str
��' .
]
��. /
+=
��0 2
$str
��3 B
;
��B C
else
�� 
htmlAttributes
�� &
.
��& '
Add
��' *
(
��* +
$str
��+ 2
,
��2 3
$str
��4 B
)
��B C
;
��C D

selectList
�� 
=
��  
_htmlHelper
��! ,
.
��, -
DropDownList
��- 9
(
��9 :
tagName
��: A
,
��A B
Items
��C H
,
��H I
htmlAttributes
��J X
)
��X Y
;
��Y Z
}
�� 
output
�� 
.
�� 
Content
�� 
.
�� 
SetHtmlContent
�� -
(
��- .

selectList
��. 8
.
��8 9
RenderHtmlContent
��9 J
(
��J K
)
��K L
)
��L M
;
��M N
}
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopTabsTagHelper.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 

TagHelpers		 &
.		& '
Admin		' ,
{

 
[ 
HtmlTargetElement 
( 
$str !
,! "

Attributes# -
=. /
IdAttributeName0 ?
)? @
]@ A
public 

class 
NopTabsTagHelper !
:" #
	TagHelper$ -
{ 
private 
const 
string 
IdAttributeName ,
=- .
$str/ 3
;3 4
private 
const 
string (
TabNameToSelectAttributeName 9
=: ;
$str< T
;T U
private 
const 
string /
#RenderSelectedTabInputAttributeName @
=A B
$strC b
;b c
private 
readonly 
IHtmlHelper $
_htmlHelper% 0
;0 1
[ 	
HtmlAttributeName	 
( (
TabNameToSelectAttributeName 7
)7 8
]8 9
public 
string 
TabNameToSelect %
{& '
set( +
;+ ,
get- 0
;0 1
}2 3
[   	
HtmlAttributeName  	 
(   /
#RenderSelectedTabInputAttributeName   >
)  > ?
]  ? @
public!! 
string!! "
RenderSelectedTabInput!! ,
{!!- .
set!!/ 2
;!!2 3
get!!4 7
;!!7 8
}!!9 :
[&& 	!
HtmlAttributeNotBound&&	 
]&& 
['' 	
ViewContext''	 
]'' 
public(( 
ViewContext(( 
ViewContext(( &
{((' (
get(() ,
;((, -
set((. 1
;((1 2
}((3 4
public.. 
NopTabsTagHelper.. 
(..  
IHtmlHelper..  +

htmlHelper.., 6
)..6 7
{// 	
_htmlHelper00 
=00 

htmlHelper00 $
;00$ %
}11 	
public99 
override99 
async99 
Task99 "
ProcessAsync99# /
(99/ 0
TagHelperContext990 @
context99A H
,99H I
TagHelperOutput99J Y
output99Z `
)99` a
{:: 	
if;; 
(;; 
context;; 
==;; 
null;; 
);;  
{<< 
throw== 
new== !
ArgumentNullException== /
(==/ 0
nameof==0 6
(==6 7
context==7 >
)==> ?
)==? @
;==@ A
}>> 
if@@ 
(@@ 
output@@ 
==@@ 
null@@ 
)@@ 
{AA 
throwBB 
newBB !
ArgumentNullExceptionBB /
(BB/ 0
nameofBB0 6
(BB6 7
outputBB7 =
)BB= >
)BB> ?
;BB? @
}CC 
varFF 
viewContextAwareFF  
=FF! "
_htmlHelperFF# .
asFF/ 1
IViewContextAwareFF2 C
;FFC D
viewContextAwareGG 
?GG 
.GG 

(GG+ ,
ViewContextGG, 7
)GG7 8
;GG8 9
varJJ 

tabContextJJ 
=JJ 
newJJ  
ListJJ! %
<JJ% &
NopTabContextItemJJ& 7
>JJ7 8
(JJ8 9
)JJ9 :
;JJ: ;
contextKK 
.KK 
ItemsKK 
.KK 
AddKK 
(KK 
typeofKK $
(KK$ %
NopTabsTagHelperKK% 5
)KK5 6
,KK6 7

tabContextKK8 B
)KKB C
;KKC D
varOO 
tabNameToSelectOO 
=OO  !
ViewContextOO" -
.OO- .
HttpContextOO. 9
.OO9 :
RequestOO: A
.OOA B
QueryOOB G
[OOG H
$strOOH Y
]OOY Z
;OOZ [
ifRR 
(RR 
!RR 
stringRR 
.RR 

(RR% &
TabNameToSelectRR& 5
)RR5 6
)RR6 7
tabNameToSelectSS 
=SS  !
TabNameToSelectSS" 1
;SS1 2
ifVV 
(VV 
!VV 
stringVV 
.VV 

(VV% &
tabNameToSelectVV& 5
)VV5 6
)VV6 7
contextWW 
.WW 
ItemsWW 
.WW 
AddWW !
(WW! "
$strWW" 3
,WW3 4
tabNameToSelectWW5 D
)WWD E
;WWE F
awaitZZ 
outputZZ 
.ZZ  
GetChildContentAsyncZZ -
(ZZ- .
)ZZ. /
;ZZ/ 0
var]] 
	tabsTitle]] 
=]] 
new]] 

TagBuilder]]  *
(]]* +
$str]]+ /
)]]/ 0
;]]0 1
	tabsTitle^^ 
.^^ 
AddCssClass^^ !
(^^! "
$str^^" '
)^^' (
;^^( )
	tabsTitle__ 
.__ 
AddCssClass__ !
(__! "
$str__" ,
)__, -
;__- .
varbb 
tabsContentbb 
=bb 
newbb !

TagBuilderbb" ,
(bb, -
$strbb- 2
)bb2 3
;bb3 4
tabsContentcc 
.cc 
AddCssClasscc #
(cc# $
$strcc$ 1
)cc1 2
;cc2 3
foreachee 
(ee 
varee 
tabItemee  
inee! #

tabContextee$ .
)ee. /
{ff 
	tabsTitlegg 
.gg 
	InnerHtmlgg #
.gg# $

AppendHtmlgg$ .
(gg. /
tabItemgg/ 6
.gg6 7
Titlegg7 <
)gg< =
;gg= >
tabsContenthh 
.hh 
	InnerHtmlhh %
.hh% &

AppendHtmlhh& 0
(hh0 1
tabItemhh1 8
.hh8 9
Contenthh9 @
)hh@ A
;hhA B
}ii 
outputll 
.ll 
Contentll 
.ll 

AppendHtmlll %
(ll% &
	tabsTitlell& /
.ll/ 0
RenderHtmlContentll0 A
(llA B
)llB C
)llC D
;llD E
outputmm 
.mm 
Contentmm 
.mm 

AppendHtmlmm %
(mm% &
tabsContentmm& 1
.mm1 2
RenderHtmlContentmm2 C
(mmC D
)mmD E
)mmE F
;mmF G
booloo 
.oo 
TryParseoo 
(oo "
RenderSelectedTabInputoo 0
,oo0 1
outoo2 5
booloo6 :"
renderSelectedTabInputoo; Q
)ooQ R
;ooR S
ifpp 
(pp 
stringpp 
.pp 

(pp$ %"
RenderSelectedTabInputpp% ;
)pp; <
||pp= ?"
renderSelectedTabInputpp@ V
)ppV W
{qq 
varss 
selectedTabInputss $
=ss% &
newss' *

TagBuilderss+ 5
(ss5 6
$strss6 =
)ss= >
;ss> ?
selectedTabInputtt  
.tt  !

Attributestt! +
.tt+ ,
Addtt, /
(tt/ 0
$strtt0 6
,tt6 7
$strtt8 @
)tt@ A
;ttA B
selectedTabInputuu  
.uu  !

Attributesuu! +
.uu+ ,
Adduu, /
(uu/ 0
$struu0 4
,uu4 5
$struu6 I
)uuI J
;uuJ K
selectedTabInputvv  
.vv  !

Attributesvv! +
.vv+ ,
Addvv, /
(vv/ 0
$strvv0 6
,vv6 7
$strvv8 K
)vvK L
;vvL M
selectedTabInputww  
.ww  !

Attributesww! +
.ww+ ,
Addww, /
(ww/ 0
$strww0 7
,ww7 8
_htmlHelperww9 D
.wwD E
GetSelectedTabNamewwE W
(wwW X
)wwX Y
)wwY Z
;wwZ [
outputxx 
.xx 

PreContentxx !
.xx! "
SetHtmlContentxx" 0
(xx0 1
selectedTabInputxx1 A
.xxA B
RenderHtmlContentxxB S
(xxS T
)xxT U
)xxU V
;xxV W
if{{ 
({{ 
output{{ 
.{{ 

Attributes{{ %
.{{% &
ContainsName{{& 2
({{2 3
$str{{3 7
){{7 8
){{8 9
{|| 
var}} 
script}} 
=}}  
new}}! $

TagBuilder}}% /
(}}/ 0
$str}}0 8
)}}8 9
;}}9 :
script~~ 
.~~ 
	InnerHtml~~ $
.~~$ %

AppendHtml~~% /
(~~/ 0
$str~~0 n
+~~o p
output~~q w
.~~w x

Attributes	~~x �
[
~~� �
$str
~~� �
]
~~� �
.
~~� �
Value
~~� �
+
~~� �
$str
~~� �
)
~~� �
;
~~� �
output 
. 
PostContent &
.& '
SetHtmlContent' 5
(5 6
script6 <
.< =
RenderHtmlContent= N
(N O
)O P
)P Q
;Q R
}
�� 
}
�� 
output
�� 
.
�� 
TagName
�� 
=
�� 
$str
�� "
;
��" #
var
�� 
	itemClass
�� 
=
�� 
$str
�� -
;
��- .
var
�� 

classValue
�� 
=
�� 
output
�� #
.
��# $

Attributes
��$ .
.
��. /
ContainsName
��/ ;
(
��; <
$str
��< C
)
��C D
?
�� 
$"
�� 
{
�� 
output
�� 
.
�� 

Attributes
�� &
[
��& '
$str
��' .
]
��. /
.
��/ 0
Value
��0 5
}
��5 6
$str
��6 7
{
��7 8
	itemClass
��8 A
}
��A B
"
��B C
:
�� 
	itemClass
�� 
;
�� 
output
�� 
.
�� 

Attributes
�� 
.
�� 
SetAttribute
�� *
(
��* +
$str
��+ 2
,
��2 3

classValue
��4 >
)
��> ?
;
��? @
}
�� 	
}
�� 
[
�� 
HtmlTargetElement
�� 
(
�� 
$str
��  
,
��  !
	ParentTag
��" +
=
��, -
$str
��. 8
,
��8 9

Attributes
��: D
=
��E F
NameAttributeName
��G X
)
��X Y
]
��Y Z
public
�� 

class
�� 
NopTabTagHelper
��  
:
��! "
	TagHelper
��# ,
{
�� 
private
�� 
const
�� 
string
�� 
NameAttributeName
�� .
=
��/ 0
$str
��1 ;
;
��; <
private
�� 
const
�� 
string
��  
TitleAttributeName
�� /
=
��0 1
$str
��2 =
;
��= >
private
�� 
const
�� 
string
�� "
DefaultAttributeName
�� 1
=
��2 3
$str
��4 A
;
��A B
private
�� 
readonly
�� 
IHtmlHelper
�� $
_htmlHelper
��% 0
;
��0 1
[
�� 	
HtmlAttributeName
��	 
(
��  
TitleAttributeName
�� -
)
��- .
]
��. /
public
�� 
string
�� 
Title
�� 
{
�� 
set
�� !
;
��! "
get
��# &
;
��& '
}
��( )
[
�� 	
HtmlAttributeName
��	 
(
�� "
DefaultAttributeName
�� /
)
��/ 0
]
��0 1
public
�� 
string
�� 
	IsDefault
�� 
{
��  !
set
��" %
;
��% &
get
��' *
;
��* +
}
��, -
[
�� 	
HtmlAttributeName
��	 
(
�� 
NameAttributeName
�� ,
)
��, -
]
��- .
public
�� 
string
�� 
Name
�� 
{
�� 
set
��  
;
��  !
get
��" %
;
��% &
}
��' (
[
�� 	#
HtmlAttributeNotBound
��	 
]
�� 
[
�� 	
ViewContext
��	 
]
�� 
public
�� 
ViewContext
�� 
ViewContext
�� &
{
��' (
get
��) ,
;
��, -
set
��. 1
;
��1 2
}
��3 4
public
�� 
NopTabTagHelper
�� 
(
�� 
IHtmlHelper
�� *

htmlHelper
��+ 5
)
��5 6
{
�� 	
_htmlHelper
�� 
=
�� 

htmlHelper
�� $
;
��$ %
}
�� 	
public
�� 
override
�� 
void
�� 
Process
�� $
(
��$ %
TagHelperContext
��% 5
context
��6 =
,
��= >
TagHelperOutput
��? N
output
��O U
)
��U V
{
�� 	
if
�� 
(
�� 
context
�� 
==
�� 
null
�� 
)
��  
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
context
��7 >
)
��> ?
)
��? @
;
��@ A
}
�� 
if
�� 
(
�� 
output
�� 
==
�� 
null
�� 
)
�� 
{
�� 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
output
��7 =
)
��= >
)
��> ?
;
��? @
}
�� 
var
�� 
viewContextAware
��  
=
��! "
_htmlHelper
��# .
as
��/ 1
IViewContextAware
��2 C
;
��C D
viewContextAware
�� 
?
�� 
.
�� 

�� +
(
��+ ,
ViewContext
��, 7
)
��7 8
;
��8 9
bool
�� 
.
�� 
TryParse
�� 
(
�� 
	IsDefault
�� #
,
��# $
out
��% (
bool
��) -
isDefaultTab
��. :
)
��: ;
;
��; <
var
�� 
tabNameToSelect
�� 
=
��  !
context
��" )
.
��) *
Items
��* /
.
��/ 0
ContainsKey
��0 ;
(
��; <
$str
��< M
)
��M N
?
�� 
context
�� 
.
�� 
Items
�� 
[
��  
$str
��  1
]
��1 2
.
��2 3
ToString
��3 ;
(
��; <
)
��< =
:
�� 
$str
�� 
;
�� 
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
tabNameToSelect
��% 4
)
��4 5
)
��5 6
tabNameToSelect
�� 
=
��  !
_htmlHelper
��" -
.
��- . 
GetSelectedTabName
��. @
(
��@ A
)
��A B
;
��B C
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
tabNameToSelect
��% 4
)
��4 5
&&
��6 8
isDefaultTab
��9 E
)
��E F
tabNameToSelect
�� 
=
��  !
Name
��" &
;
��& '
var
�� 
tabTitle
�� 
=
�� 
new
�� 

TagBuilder
�� )
(
��) *
$str
��* .
)
��. /
;
��/ 0
var
�� 
a
�� 
=
�� 
new
�� 

TagBuilder
�� "
(
��" #
$str
��# &
)
��& '
{
�� 

Attributes
�� 
=
�� 
{
�� 
new
�� 
KeyValuePair
�� $
<
��$ %
string
��% +
,
��+ ,
string
��- 3
>
��3 4
(
��4 5
$str
��5 D
,
��D E
Name
��F J
)
��J K
,
��K L
new
�� 
KeyValuePair
�� $
<
��$ %
string
��% +
,
��+ ,
string
��- 3
>
��3 4
(
��4 5
$str
��5 ;
,
��; <
$"
��= ?
$str
��? @
{
��@ A
Name
��A E
}
��E F
"
��F G
)
��G H
,
��H I
new
�� 
KeyValuePair
�� $
<
��$ %
string
��% +
,
��+ ,
string
��- 3
>
��3 4
(
��4 5
$str
��5 B
,
��B C
$str
��D I
)
��I J
,
��J K
}
�� 
}
�� 
;
��
a
�� 
.
��
	InnerHtml
�� 
.
�� 

AppendHtml
�� "
(
��" #
Title
��# (
)
��( )
;
��) *
if
�� 
(
�� 
context
�� 
.
�� 

�� %
.
��% &
ContainsName
��& 2
(
��2 3
$str
��3 :
)
��: ;
)
��; <
tabTitle
�� 
.
�� 

Attributes
�� #
.
��# $
Add
��$ '
(
��' (
$str
��( /
,
��/ 0
context
��1 8
.
��8 9

��9 F
[
��F G
$str
��G N
]
��N O
.
��O P
Value
��P U
.
��U V
ToString
��V ^
(
��^ _
)
��_ `
)
��` a
;
��a b
tabTitle
�� 
.
�� 
	InnerHtml
�� 
.
�� 

AppendHtml
�� )
(
��) *
a
��* +
.
��+ ,
RenderHtmlContent
��, =
(
��= >
)
��> ?
)
��? @
;
��@ A
var
�� 

tabContent
�� 
=
�� 
new
��  

TagBuilder
��! +
(
��+ ,
$str
��, 1
)
��1 2
;
��2 3

tabContent
�� 
.
�� 
AddCssClass
�� "
(
��" #
$str
��# -
)
��- .
;
��. /

tabContent
�� 
.
�� 

Attributes
�� !
.
��! "
Add
��" %
(
��% &
$str
��& *
,
��* +
Name
��, 0
)
��0 1
;
��1 2

tabContent
�� 
.
�� 
	InnerHtml
��  
.
��  !

AppendHtml
��! +
(
��+ ,
output
��, 2
.
��2 3"
GetChildContentAsync
��3 G
(
��G H
)
��H I
.
��I J
Result
��J P
.
��P Q

GetContent
��Q [
(
��[ \
)
��\ ]
)
��] ^
;
��^ _
var
�� 
	itemClass
�� 
=
�� 
string
�� "
.
��" #
Empty
��# (
;
��( )
if
�� 
(
�� 
tabNameToSelect
�� 
==
��  "
Name
��# '
)
��' (
{
�� 
tabTitle
�� 
.
�� 
AddCssClass
�� $
(
��$ %
$str
��% -
)
��- .
;
��. /

tabContent
�� 
.
�� 
AddCssClass
�� &
(
��& '
$str
��' /
)
��/ 0
;
��0 1
}
�� 
var
�� 

tabContext
�� 
=
�� 
(
�� 
List
�� "
<
��" #
NopTabContextItem
��# 4
>
��4 5
)
��5 6
context
��6 =
.
��= >
Items
��> C
[
��C D
typeof
��D J
(
��J K
NopTabsTagHelper
��K [
)
��[ \
]
��\ ]
;
��] ^

tabContext
�� 
.
�� 
Add
�� 
(
�� 
new
�� 
NopTabContextItem
�� 0
(
��0 1
)
��1 2
{
�� 
Title
�� 
=
�� 
tabTitle
��  
.
��  !
RenderHtmlContent
��! 2
(
��2 3
)
��3 4
,
��4 5
Content
�� 
=
�� 

tabContent
�� $
.
��$ %
RenderHtmlContent
��% 6
(
��6 7
)
��7 8
,
��8 9
	IsDefault
�� 
=
�� 
isDefaultTab
�� (
}
�� 
)
��
;
�� 
output
�� 
.
�� 
SuppressOutput
�� !
(
��! "
)
��" #
;
��# $
}
�� 	
}
�� 
public
�� 

class
�� 
NopTabContextItem
�� "
{
�� 
public
�� 
string
�� 
Title
�� 
{
�� 
set
�� !
;
��! "
get
��# &
;
��& '
}
��( )
public
�� 
string
�� 
Content
�� 
{
�� 
set
��  #
;
��# $
get
��% (
;
��( )
}
��* +
public
�� 
bool
�� 
	IsDefault
�� 
{
�� 
set
��  #
;
��# $
get
��% (
;
��( )
}
��* +
}
�� 
}�� �-
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Admin\NopTextAreaTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Admin' ,
{ 
[

 
HtmlTargetElement

 
(

 
$str

 %
,

% &

Attributes

' 1
=

2 3
ForAttributeName

4 D
)

D E
]

E F
public 

class  
NopTextAreaTagHelper %
:& '
TextAreaTagHelper( 9
{ 
private
const
string
ForAttributeName
=
$str
;
private 
const 
string !
RequiredAttributeName 2
=3 4
$str5 C
;C D
private 
const 
string !
DisabledAttributeName 2
=3 4
$str5 C
;C D
[ 	
HtmlAttributeName	 
( !
DisabledAttributeName 0
)0 1
]1 2
public 
string 

IsDisabled  
{! "
set# &
;& '
get( +
;+ ,
}- .
[ 	
HtmlAttributeName	 
( !
RequiredAttributeName 0
)0 1
]1 2
public 
string 

IsRequired  
{! "
set# &
;& '
get( +
;+ ,
}- .
public!!  
NopTextAreaTagHelper!! #
(!!# $
IHtmlGenerator!!$ 2
	generator!!3 <
)!!< =
:!!> ?
base!!@ D
(!!D E
	generator!!E N
)!!N O
{"" 	
}## 	
public** 
override** 
void** 
Process** $
(**$ %
TagHelperContext**% 5
context**6 =
,**= >
TagHelperOutput**? N
output**O U
)**U V
{++ 	
output-- 
.-- 
TagName-- 
=-- 
$str-- '
;--' (
output.. 
... 
TagMode.. 
=.. 
TagMode.. $
...$ %
StartTagAndEndTag..% 6
;..6 7
var11 

classValue11 
=11 
output11 #
.11# $

Attributes11$ .
.11. /
ContainsName11/ ;
(11; <
$str11< C
)11C D
?22 
$"22 
{22 
output22 
.22 

Attributes22 &
[22& '
$str22' .
]22. /
.22/ 0
Value220 5
}225 6
$str226 C
"22C D
:33 
$str33  
;33  !
output44 
.44 

Attributes44 
.44 
SetAttribute44 *
(44* +
$str44+ 2
,442 3

classValue444 >
)44> ?
;44? @
bool77 
.77 
TryParse77 
(77 

IsDisabled77 $
,77$ %
out77& )
bool77* .
disabled77/ 7
)777 8
;778 9
if88 
(88 
disabled88 
)88 
{99 
var:: 
d:: 
=:: 
new:: 
TagHelperAttribute:: .
(::. /
$str::/ 9
,::9 :
$str::; E
)::E F
;::F G
output;; 
.;; 

Attributes;; !
.;;! "
Add;;" %
(;;% &
d;;& '
);;' (
;;;( )
}<< 
var?? 

rowsNumber?? 
=?? 
output?? #
.??# $

Attributes??$ .
.??. /
ContainsName??/ ;
(??; <
$str??< B
)??B C
???D E
output??F L
.??L M

Attributes??M W
[??W X
$str??X ^
]??^ _
.??_ `
Value??` e
:??f g
$num??h i
;??i j
output@@ 
.@@ 

Attributes@@ 
.@@ 
SetAttribute@@ *
(@@* +
$str@@+ 1
,@@1 2

rowsNumber@@3 =
)@@= >
;@@> ?
varAA 

colsNumberAA 
=AA 
outputAA #
.AA# $

AttributesAA$ .
.AA. /
ContainsNameAA/ ;
(AA; <
$strAA< B
)AAB C
?AAD E
outputAAF L
.AAL M

AttributesAAM W
[AAW X
$strAAX ^
]AA^ _
.AA_ `
ValueAA` e
:AAf g
$numAAh j
;AAj k
outputBB 
.BB 

AttributesBB 
.BB 
SetAttributeBB *
(BB* +
$strBB+ 1
,BB1 2

colsNumberBB3 =
)BB= >
;BB> ?
boolEE 
.EE 
TryParseEE 
(EE 

IsRequiredEE $
,EE$ %
outEE& )
boolEE* .
requiredEE/ 7
)EE7 8
;EE8 9
ifFF 
(FF 
requiredFF 
)FF 
{GG 
outputHH 
.HH 

PreElementHH !
.HH! "
SetHtmlContentHH" 0
(HH0 1
$strHH1 a
)HHa b
;HHb c
outputII 
.II 
PostElementII "
.II" #
SetHtmlContentII# 1
(II1 2
$str	II2 �
)
II� �
;
II� �
}JJ 
baseLL 
.LL 
ProcessLL 
(LL 
contextLL  
,LL  !
outputLL" (
)LL( )
;LL) *
}MM 	
}NN 
}OO �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Public\InputTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Public' -
{ 
[		 
HtmlTargetElement		 
(		 
$str		 
,		 

Attributes		  *
=		+ ,
ForAttributeName		- =
)		= >
]		> ?
public

 

class

 
InputTagHelper

 
:

  !
	Microsoft

" +
.

+ ,

AspNetCore

, 6
.

6 7
Mvc

7 :
.

: ;

TagHelpers

; E
.

E F
InputTagHelper

F T
{ 
private 
const 
string 
ForAttributeName -
=. /
$str0 9
;9 :
private
const
string
DisabledAttributeName
=
$str
;
[ 	
HtmlAttributeName	 
( !
DisabledAttributeName 0
)0 1
]1 2
public 
string 

IsDisabled  
{! "
set# &
;& '
get( +
;+ ,
}- .
public 
InputTagHelper 
( 
IHtmlGenerator ,
	generator- 6
)6 7
:8 9
base: >
(> ?
	generator? H
)H I
{ 	
} 	
public"" 
override"" 
void"" 
Process"" $
(""$ %
TagHelperContext""% 5
context""6 =
,""= >
TagHelperOutput""? N
output""O U
)""U V
{## 	
bool%% 
.%% 
TryParse%% 
(%% 

IsDisabled%% $
,%%$ %
out%%& )
bool%%* .
disabled%%/ 7
)%%7 8
;%%8 9
if&& 
(&& 
disabled&& 
)&& 
{'' 
var(( 
d(( 
=(( 
new(( 
TagHelperAttribute(( .
(((. /
$str((/ 9
,((9 :
$str((; E
)((E F
;((F G
output)) 
.)) 

Attributes)) !
.))! "
Add))" %
())% &
d))& '
)))' (
;))( )
}** 
base,, 
.,, 
Process,, 
(,, 
context,,  
,,,  !
output,," (
),,( )
;,,) *
}-- 	
}.. 
}// �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Public\LabelTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Public' -
{ 
[

 
HtmlTargetElement

 
(

 
$str

 
,

 

Attributes

  *
=

+ ,
ForAttributeName

- =
)

= >
]

> ?
public 

class 
LabelTagHelper 
:  !
	Microsoft" +
.+ ,

AspNetCore, 6
.6 7
Mvc7 :
.: ;

TagHelpers; E
.E F
LabelTagHelperF T
{ 
private
const
string
ForAttributeName
=
$str
;
private 
const 
string  
PostfixAttributeName 1
=2 3
$str4 A
;A B
[ 	
HtmlAttributeName	 
(  
PostfixAttributeName /
)/ 0
]0 1
public 
string 
Postfix 
{ 
get  #
;# $
set% (
;( )
}* +
public 
LabelTagHelper 
( 
IHtmlGenerator ,
	generator- 6
)6 7
:8 9
base: >
(> ?
	generator? H
)H I
{ 	
} 	
public$$ 
override$$ 
Task$$ 
ProcessAsync$$ )
($$) *
TagHelperContext$$* :
context$$; B
,$$B C
TagHelperOutput$$D S
output$$T Z
)$$Z [
{%% 	
output&& 
.&& 
Content&& 
.&& 
Append&& !
(&&! "
Postfix&&" )
)&&) *
;&&* +
return(( 
base(( 
.(( 
ProcessAsync(( $
((($ %
context((% ,
,((, -
output((. 4
)((4 5
;((5 6
})) 	
}** 
}++ �%
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Public\NopBBCodeEditorTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Public' -
{ 
[ 
HtmlTargetElement 
( 
$str +
,+ ,

Attributes- 7
=8 9
ForAttributeName: J
,J K
TagStructureL X
=Y Z
TagStructure[ g
.g h

)u v
]v w
public

class
NopBBCodeEditorTagHelper
:
	TagHelper
{ 
private 
const 
string 
ForAttributeName -
=. /
$str0 9
;9 :
private 
readonly 

IWebHelper #

_webHelper$ .
;. /
[ 	
HtmlAttributeName	 
( 
ForAttributeName +
)+ ,
], -
public 
ModelExpression 
For "
{# $
get% (
;( )
set* -
;- .
}/ 0
public $
NopBBCodeEditorTagHelper '
(' (

IWebHelper( 2
	webHelper3 <
)< =
{ 	

_webHelper 
= 
	webHelper "
;" #
}   	
public'' 
override'' 
void'' 
Process'' $
(''$ %
TagHelperContext''% 5
context''6 =
,''= >
TagHelperOutput''? N
output''O U
)''U V
{(( 	
if)) 
()) 
context)) 
==)) 
null)) 
)))  
{** 
throw++ 
new++ !
ArgumentNullException++ /
(++/ 0
nameof++0 6
(++6 7
context++7 >
)++> ?
)++? @
;++@ A
},, 
if.. 
(.. 
output.. 
==.. 
null.. 
).. 
{// 
throw00 
new00 !
ArgumentNullException00 /
(00/ 0
nameof000 6
(006 7
output007 =
)00= >
)00> ?
;00? @
}11 
output33 
.33 
TagName33 
=33 
$str33 "
;33" #
output44 
.44 
TagMode44 
=44 
TagMode44 $
.44$ %
StartTagAndEndTag44% 6
;446 7
output55 
.55 

Attributes55 
.55 
Add55 !
(55! "
$str55" )
,55) *
$str55+ C
)55C D
;55D E
var77 

=77 

_webHelper77  *
.77* +
GetStoreLocation77+ ;
(77; <
)77< =
;77= >
var88 
bbEditorWebRoot88 
=88  !
$"88" $
{88$ %

}882 3
$str883 6
"886 7
;887 8
var:: 
script1:: 
=:: 
new:: 

TagBuilder:: (
(::( )
$str::) 1
)::1 2
;::2 3
script1;; 
.;; 

Attributes;; 
.;; 
Add;; "
(;;" #
$str;;# (
,;;( )
$";;* ,
{;;, -

};;: ;
$str;;; L
";;L M
);;M N
;;;N O
var== 
script2== 
=== 
new== 

TagBuilder== (
(==( )
$str==) 1
)==1 2
;==2 3
script2>> 
.>> 

Attributes>> 
.>> 
Add>> "
(>>" #
$str>># -
,>>- .
$str>>/ ;
)>>; <
;>>< =
script2?? 
.?? 
	InnerHtml?? 
.?? 

AppendHtml?? (
(??( )
$"??) +
$str??+ 6
{??6 7
For??7 :
.??: ;
Name??; ?
}??? @
$str??@ C
{??C D
bbEditorWebRoot??D S
}??S T
$str??T W
"??W X
)??X Y
;??Y Z
outputAA 
.AA 
ContentAA 
.AA 

AppendHtmlAA %
(AA% &
script1AA& -
)AA- .
;AA. /
outputBB 
.BB 
ContentBB 
.BB 

AppendHtmlBB %
(BB% &
script2BB& -
)BB- .
;BB. /
}CC 	
}DD 
}EE �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Public\NopGenerateCaptchaTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Public' -
{ 
[ 
HtmlTargetElement 
( 
$str $
,$ %
TagStructure& 2
=3 4
TagStructure5 A
.A B

)O P
]P Q
public

class
NopGenerateCaptchaTagHelper
:
	TagHelper
{ 
private 
readonly 
IHtmlHelper $
_htmlHelper% 0
;0 1
[ 	!
HtmlAttributeNotBound	 
] 
[ 	
ViewContext	 
] 
public 
ViewContext 
ViewContext &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public '
NopGenerateCaptchaTagHelper *
(* +
IHtmlHelper+ 6

htmlHelper7 A
)A B
{ 	
_htmlHelper 
= 

htmlHelper $
;$ %
} 	
public&& 
override&& 
void&& 
Process&& $
(&&$ %
TagHelperContext&&% 5
context&&6 =
,&&= >
TagHelperOutput&&? N
output&&O U
)&&U V
{'' 	
if(( 
((( 
context(( 
==(( 
null(( 
)((  
{)) 
throw** 
new** !
ArgumentNullException** /
(**/ 0
nameof**0 6
(**6 7
context**7 >
)**> ?
)**? @
;**@ A
}++ 
if-- 
(-- 
output-- 
==-- 
null-- 
)-- 
{.. 
throw// 
new// !
ArgumentNullException// /
(/// 0
nameof//0 6
(//6 7
output//7 =
)//= >
)//> ?
;//? @
}00 
var33 
viewContextAware33  
=33! "
_htmlHelper33# .
as33/ 1
IViewContextAware332 C
;33C D
viewContextAware44 
?44 
.44 

(44+ ,
ViewContext44, 7
)447 8
;448 9
output77 
.77 
TagName77 
=77 
$str77 "
;77" #
output88 
.88 
TagMode88 
=88 
TagMode88 $
.88$ %
StartTagAndEndTag88% 6
;886 7
output99 
.99 
Content99 
.99 
SetHtmlContent99 )
(99) *
_htmlHelper99* 5
.995 6
GenerateCaptcha996 E
(99E F
)99F G
)99G H
;99H I
}:: 	
};; 
}<< �+
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Public\ScriptTagHelper.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 

TagHelpers

 &
.

& '
Public

' -
{ 
[ 
HtmlTargetElement 
( 
$str 
,  

Attributes! +
=, -!
LocationAttributeName. C
)C D
]D E
public 

class 
ScriptTagHelper  
:! "
	TagHelper# ,
{ 
private 
const 
string !
LocationAttributeName 2
=3 4
$str5 C
;C D
private 
readonly 
IHtmlHelper $
_htmlHelper% 0
;0 1
private 
readonly  
IHttpContextAccessor - 
_httpContextAccessor. B
;B C
[ 	
HtmlAttributeName	 
( !
LocationAttributeName 0
)0 1
]1 2
public 
ResourceLocation 
Location  (
{) *
set+ .
;. /
get0 3
;3 4
}5 6
[ 	!
HtmlAttributeNotBound	 
] 
[   	
ViewContext  	 
]   
public!! 
ViewContext!! 
ViewContext!! &
{!!' (
get!!) ,
;!!, -
set!!. 1
;!!1 2
}!!3 4
public(( 
ScriptTagHelper(( 
((( 
IHtmlHelper(( *

htmlHelper((+ 5
,((5 6 
IHttpContextAccessor((7 K
httpContextAccessor((L _
)((_ `
{)) 	
_htmlHelper** 
=** 

htmlHelper** $
;**$ % 
_httpContextAccessor++  
=++! "
httpContextAccessor++# 6
;++6 7
},, 	
public33 
override33 
void33 
Process33 $
(33$ %
TagHelperContext33% 5
context336 =
,33= >
TagHelperOutput33? N
output33O U
)33U V
{44 	
if55 
(55 
context55 
==55 
null55 
)55  
{66 
throw77 
new77 !
ArgumentNullException77 /
(77/ 0
nameof770 6
(776 7
context777 >
)77> ?
)77? @
;77@ A
}88 
if:: 
(:: 
output:: 
==:: 
null:: 
):: 
{;; 
throw<< 
new<< !
ArgumentNullException<< /
(<</ 0
nameof<<0 6
(<<6 7
output<<7 =
)<<= >
)<<> ?
;<<? @
}== 
ifAA 
(AA  
_httpContextAccessorAA $
.AA$ %
HttpContextAA% 0
.AA0 1
ItemsAA1 6
[AA6 7
$strAA7 T
]AAT U
!=AAV X
nullAAY ]
&&AA^ `
ConvertBB 
.BB 
	ToBooleanBB !
(BB! " 
_httpContextAccessorBB" 6
.BB6 7
HttpContextBB7 B
.BBB C
ItemsBBC H
[BBH I
$strBBI f
]BBf g
)BBg h
)BBh i
returnCC 
;CC 
varFF 
viewContextAwareFF  
=FF! "
_htmlHelperFF# .
asFF/ 1
IViewContextAwareFF2 C
;FFC D
viewContextAwareGG 
?GG 
.GG 

(GG+ ,
ViewContextGG, 7
)GG7 8
;GG8 9
varJJ 
scriptJJ 
=JJ 
outputJJ 
.JJ   
GetChildContentAsyncJJ  4
(JJ4 5
)JJ5 6
.JJ6 7
ResultJJ7 =
.JJ= >

GetContentJJ> H
(JJH I
)JJI J
;JJJ K
varMM 
	scriptTagMM 
=MM 
newMM 

TagBuilderMM  *
(MM* +
$strMM+ 3
)MM3 4
;MM4 5
	scriptTagNN 
.NN 
	InnerHtmlNN 
.NN  
SetHtmlContentNN  .
(NN. /
newNN/ 2

HtmlStringNN3 =
(NN= >
scriptNN> D
)NND E
)NNE F
;NNF G
foreachQQ 
(QQ 
varQQ 
	attributeQQ "
inQQ# %
contextQQ& -
.QQ- .

)QQ; <
ifRR 
(RR 
!RR 
	attributeRR 
.RR 
NameRR #
.RR# $

StartsWithRR$ .
(RR. /
$strRR/ 5
)RR5 6
)RR6 7
	scriptTagSS 
.SS 

AttributesSS (
.SS( )
AddSS) ,
(SS, -
	attributeSS- 6
.SS6 7
NameSS7 ;
,SS; <
	attributeSS= F
.SSF G
ValueSSG L
.SSL M
ToStringSSM U
(SSU V
)SSV W
)SSW X
;SSX Y
_htmlHelperUU 
.UU  
AddInlineScriptPartsUU ,
(UU, -
LocationUU- 5
,UU5 6
	scriptTagUU7 @
.UU@ A
RenderHtmlContentUUA R
(UUR S
)UUS T
)UUT U
;UUU V
outputXX 
.XX 
SuppressOutputXX !
(XX! "
)XX" #
;XX# $
}YY 	
}ZZ 
}\\ �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Public\TextAreaTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Public' -
{ 
[		 
HtmlTargetElement		 
(		 
$str		 !
,		! "

Attributes		# -
=		. /
ForAttributeName		0 @
)		@ A
]		A B
public

 

class

 
TextAreaTagHelper

 "
:

# $
	Microsoft

% .
.

. /

AspNetCore

/ 9
.

9 :
Mvc

: =
.

= >

TagHelpers

> H
.

H I
TextAreaTagHelper

I Z
{ 
private 
const 
string 
ForAttributeName -
=. /
$str0 9
;9 :
[ 	
HtmlAttributeName	 
( 
$str )
)) *
]* +
public 
string 

IsDisabled  
{! "
set# &
;& '
get( +
;+ ,
}- .
public 
TextAreaTagHelper  
(  !
IHtmlGenerator! /
	generator0 9
)9 :
:; <
base= A
(A B
	generatorB K
)K L
{ 	
} 	
public!! 
override!! 
void!! 
Process!! $
(!!$ %
TagHelperContext!!% 5
context!!6 =
,!!= >
TagHelperOutput!!? N
output!!O U
)!!U V
{"" 	
bool$$ 
.$$ 
TryParse$$ 
($$ 

IsDisabled$$ $
,$$$ %
out$$& )
bool$$* .
disabled$$/ 7
)$$7 8
;$$8 9
if%% 
(%% 
disabled%% 
)%% 
{&& 
var'' 
d'' 
='' 
new'' 
TagHelperAttribute'' .
(''. /
$str''/ 9
,''9 :
$str''; E
)''E F
;''F G
output(( 
.(( 

Attributes(( !
.((! "
Add((" %
(((% &
d((& '
)((' (
;((( )
})) 
base++ 
.++ 
Process++ 
(++ 
context++  
,++  !
output++" (
)++( )
;++) *
},, 	
}-- 
}.. �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Shared\NopAntiForgeryTokenTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Shared' -
{ 
[ 
HtmlTargetElement 
( 
$str .
,. /
TagStructure0 <
== >
TagStructure? K
.K L

)Y Z
]Z [
public 

class (
NopAntiForgeryTokenTagHelper -
:. /
	TagHelper0 9
{
[ 	!
HtmlAttributeNotBound	 
] 
[ 	
ViewContext	 
] 
public 
ViewContext 
ViewContext &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
	protected 
IHtmlGenerator  
	Generator! *
{+ ,
get- 0
;0 1
}2 3
public (
NopAntiForgeryTokenTagHelper +
(+ ,
IHtmlGenerator, :
	generator; D
)D E
{ 	
	Generator   
=   
	generator   !
;  ! "
}!! 	
public(( 
override(( 
void(( 
Process(( $
((($ %
TagHelperContext((% 5
context((6 =
,((= >
TagHelperOutput((? N
output((O U
)((U V
{)) 	
if** 
(** 
context** 
==** 
null** 
)**  
{++ 
throw,, 
new,, !
ArgumentNullException,, /
(,,/ 0
nameof,,0 6
(,,6 7
context,,7 >
),,> ?
),,? @
;,,@ A
}-- 
if// 
(// 
output// 
==// 
null// 
)// 
{00 
throw11 
new11 !
ArgumentNullException11 /
(11/ 0
nameof110 6
(116 7
output117 =
)11= >
)11> ?
;11? @
}22 
output55 
.55 
SuppressOutput55 !
(55! "
)55" #
;55# $
var88 
antiforgeryTag88 
=88  
	Generator88! *
.88* +
GenerateAntiforgery88+ >
(88> ?
ViewContext88? J
)88J K
;88K L
if99 
(99 
antiforgeryTag99 
!=99 !
null99" &
)99& '
{:: 
output;; 
.;; 
Content;; 
.;; 
SetHtmlContent;; -
(;;- .
antiforgeryTag;;. <
);;< =
;;;= >
}<< 
}== 	
}>> 
}?? ��
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Shared\NopDatePickerTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Shared' -
{
[ 
HtmlTargetElement 
( 
$str (
,( )

Attributes 
=  
DayNameAttributeName )
+* +
$str, /
+0 1"
MonthNameAttributeName2 H
+I J
$strK N
+O P!
YearNameAttributeNameQ f
,f g
TagStructure 
= 
TagStructure #
.# $

)1 2
]2 3
public 

class "
NopDatePickerTagHelper '
:( )
	TagHelper* 3
{ 
private 
const 
string  
DayNameAttributeName 1
=2 3
$str4 B
;B C
private 
const 
string "
MonthNameAttributeName 3
=4 5
$str6 F
;F G
private 
const 
string !
YearNameAttributeName 2
=3 4
$str5 D
;D E
private 
const 
string "
BeginYearAttributeName 3
=4 5
$str6 F
;F G
private 
const 
string  
EndYearAttributeName 1
=2 3
$str4 B
;B C
private 
const 
string $
SelectedDayAttributeName 5
=6 7
$str8 J
;J K
private 
const 
string &
SelectedMonthAttributeName 7
=8 9
$str: N
;N O
private 
const 
string %
SelectedYearAttributeName 6
=7 8
$str9 L
;L M
private!! 
const!! 
string!! !
WrapTagsAttributeName!! 2
=!!3 4
$str!!5 D
;!!D E
private## 
readonly## 
IHtmlHelper## $
_htmlHelper##% 0
;##0 1
	protected(( 
IHtmlGenerator((  
	Generator((! *
{((+ ,
get((- 0
;((0 1
set((2 5
;((5 6
}((7 8
[-- 	
HtmlAttributeName--	 
(--  
DayNameAttributeName-- /
)--/ 0
]--0 1
public.. 
string.. 
DayName.. 
{.. 
get..  #
;..# $
set..% (
;..( )
}..* +
[33 	
HtmlAttributeName33	 
(33 "
MonthNameAttributeName33 1
)331 2
]332 3
public44 
string44 
	MonthName44 
{44  !
get44" %
;44% &
set44' *
;44* +
}44, -
[99 	
HtmlAttributeName99	 
(99 !
YearNameAttributeName99 0
)990 1
]991 2
public:: 
string:: 
YearName:: 
{::  
get::! $
;::$ %
set::& )
;::) *
}::+ ,
[?? 	
HtmlAttributeName??	 
(?? "
BeginYearAttributeName?? 1
)??1 2
]??2 3
public@@ 
int@@ 
?@@ 
	BeginYear@@ 
{@@ 
get@@  #
;@@# $
set@@% (
;@@( )
}@@* +
[EE 	
HtmlAttributeNameEE	 
(EE  
EndYearAttributeNameEE /
)EE/ 0
]EE0 1
publicFF 
intFF 
?FF 
EndYearFF 
{FF 
getFF !
;FF! "
setFF# &
;FF& '
}FF( )
[KK 	
HtmlAttributeNameKK	 
(KK $
SelectedDayAttributeNameKK 3
)KK3 4
]KK4 5
publicLL 
intLL 
?LL 
SelectedDayLL 
{LL  !
getLL" %
;LL% &
setLL' *
;LL* +
}LL, -
[QQ 	
HtmlAttributeNameQQ	 
(QQ &
SelectedMonthAttributeNameQQ 5
)QQ5 6
]QQ6 7
publicRR 
intRR 
?RR 

{RR" #
getRR$ '
;RR' (
setRR) ,
;RR, -
}RR. /
[WW 	
HtmlAttributeNameWW	 
(WW %
SelectedYearAttributeNameWW 4
)WW4 5
]WW5 6
publicXX 
intXX 
?XX 
SelectedYearXX  
{XX! "
getXX# &
;XX& '
setXX( +
;XX+ ,
}XX- .
[]] 	
HtmlAttributeName]]	 
(]] !
WrapTagsAttributeName]] 0
)]]0 1
]]]1 2
public^^ 
string^^ 
WrapTags^^ 
{^^  
get^^! $
;^^$ %
set^^& )
;^^) *
}^^+ ,
[cc 	!
HtmlAttributeNotBoundcc	 
]cc 
[dd 	
ViewContextdd	 
]dd 
publicee 
ViewContextee 
ViewContextee &
{ee' (
getee) ,
;ee, -
setee. 1
;ee1 2
}ee3 4
publicll "
NopDatePickerTagHelperll %
(ll% &
IHtmlGeneratorll& 4
	generatorll5 >
,ll> ?
IHtmlHelperll@ K

htmlHelperllL V
)llV W
{mm 	
	Generatornn 
=nn 
	generatornn !
;nn! "
_htmlHelperoo 
=oo 

htmlHelperoo $
;oo$ %
}pp 	
publicww 
overrideww 
voidww 
Processww $
(ww$ %
TagHelperContextww% 5
contextww6 =
,ww= >
TagHelperOutputww? N
outputwwO U
)wwU V
{xx 	
ifyy 
(yy 
contextyy 
==yy 
nullyy 
)yy  
{zz 
throw{{ 
new{{ !
ArgumentNullException{{ /
({{/ 0
nameof{{0 6
({{6 7
context{{7 >
){{> ?
){{? @
;{{@ A
}|| 
if~~ 
(~~ 
output~~ 
==~~ 
null~~ 
)~~ 
{ 
throw
�� 
new
�� #
ArgumentNullException
�� /
(
��/ 0
nameof
��0 6
(
��6 7
output
��7 =
)
��= >
)
��> ?
;
��? @
}
�� 
var
�� 
viewContextAware
��  
=
��! "
_htmlHelper
��# .
as
��/ 1
IViewContextAware
��2 C
;
��C D
viewContextAware
�� 
?
�� 
.
�� 

�� +
(
��+ ,
ViewContext
��, 7
)
��7 8
;
��8 9
output
�� 
.
�� 
TagName
�� 
=
�� 
$str
�� "
;
��" #
output
�� 
.
�� 
TagMode
�� 
=
�� 
TagMode
�� $
.
��$ %
StartTagAndEndTag
��% 6
;
��6 7
output
�� 
.
�� 

Attributes
�� 
.
�� 
SetAttribute
�� *
(
��* +
$str
��+ 2
,
��2 3
$str
��4 I
)
��I J
;
��J K
var
�� 
daysList
�� 
=
�� 
new
�� 

TagBuilder
�� )
(
��) *
$str
��* 2
)
��2 3
;
��3 4
var
�� 

monthsList
�� 
=
�� 
new
��  

TagBuilder
��! +
(
��+ ,
$str
��, 4
)
��4 5
;
��5 6
var
�� 
	yearsList
�� 
=
�� 
new
�� 

TagBuilder
��  *
(
��* +
$str
��+ 3
)
��3 4
;
��4 5
daysList
�� 
.
�� 

Attributes
�� 
.
��  
Add
��  #
(
��# $
$str
��$ *
,
��* +
DayName
��, 3
)
��3 4
;
��4 5

monthsList
�� 
.
�� 

Attributes
�� !
.
��! "
Add
��" %
(
��% &
$str
��& ,
,
��, -
	MonthName
��. 7
)
��7 8
;
��8 9
	yearsList
�� 
.
�� 

Attributes
��  
.
��  !
Add
��! $
(
��$ %
$str
��% +
,
��+ ,
YearName
��- 5
)
��5 6
;
��6 7
var
�� !
tagHelperAttributes
�� #
=
��$ %
new
��& )
List
��* .
<
��. /
string
��/ 5
>
��5 6
{
�� 
DayNameAttributeName
�� $
,
��$ %$
MonthNameAttributeName
�� &
,
��& '#
YearNameAttributeName
�� %
,
��% &$
BeginYearAttributeName
�� &
,
��& '"
EndYearAttributeName
�� $
,
��$ %&
SelectedDayAttributeName
�� (
,
��( )(
SelectedMonthAttributeName
�� *
,
��* +'
SelectedYearAttributeName
�� )
,
��) *#
WrapTagsAttributeName
�� %
}
�� 
;
��
var
��  
customerAttributes
�� "
=
��# $
new
��% (

Dictionary
��) 3
<
��3 4
string
��4 :
,
��: ;
object
��< B
>
��B C
(
��C D
)
��D E
;
��E F
foreach
�� 
(
�� 
var
�� 
	attribute
�� "
in
��# %
context
��& -
.
��- .

��. ;
)
��; <
{
�� 
if
�� 
(
�� 
!
�� !
tagHelperAttributes
�� (
.
��( )
Contains
��) 1
(
��1 2
	attribute
��2 ;
.
��; <
Name
��< @
)
��@ A
)
��A B 
customerAttributes
�� &
.
��& '
Add
��' *
(
��* +
	attribute
��+ 4
.
��4 5
Name
��5 9
,
��9 :
	attribute
��; D
.
��D E
Value
��E J
)
��J K
;
��K L
}
�� 
var
�� &
htmlAttributesDictionary
�� (
=
��) *

HtmlHelper
��+ 5
.
��5 6-
AnonymousObjectToHtmlAttributes
��6 U
(
��U V 
customerAttributes
��V h
)
��h i
;
��i j
daysList
�� 
.
�� 
MergeAttributes
�� $
(
��$ %&
htmlAttributesDictionary
��% =
,
��= >
true
��? C
)
��C D
;
��D E

monthsList
�� 
.
�� 
MergeAttributes
�� &
(
��& '&
htmlAttributesDictionary
��' ?
,
��? @
true
��A E
)
��E F
;
��F G
	yearsList
�� 
.
�� 
MergeAttributes
�� %
(
��% &&
htmlAttributesDictionary
��& >
,
��> ?
true
��@ D
)
��D E
;
��E F
var
�� 
days
�� 
=
�� 
new
�� 

�� (
(
��( )
)
��) *
;
��* +
var
�� 
months
�� 
=
�� 
new
�� 

�� *
(
��* +
)
��+ ,
;
��, -
var
�� 
years
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
var
�� 

locService
�� 
=
�� 

�� *
.
��* +
Current
��+ 2
.
��2 3
Resolve
��3 :
<
��: ;"
ILocalizationService
��; O
>
��O P
(
��P Q
)
��Q R
;
��R S
days
�� 
.
�� 
AppendFormat
�� 
(
�� 
$str
�� @
,
��@ A
$str
��B E
,
��E F

locService
��G Q
.
��Q R
GetResource
��R ]
(
��] ^
$str
��^ j
)
��j k
)
��k l
;
��l m
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<=
��  
$num
��! #
;
��# $
i
��% &
++
��& (
)
��( )
days
�� 
.
�� 
AppendFormat
�� !
(
��! "
$str
��" G
,
��G H
i
��I J
,
��J K
(
�� 
SelectedDay
��  
.
��  !
HasValue
��! )
&&
��* ,
SelectedDay
��- 8
.
��8 9
Value
��9 >
==
��? A
i
��B C
)
��C D
?
��E F
$str
��G _
:
��` a
null
��b f
)
��f g
;
��g h
months
�� 
.
�� 
AppendFormat
�� 
(
��  
$str
��  B
,
��B C
$str
��D G
,
��G H

locService
��I S
.
��S T
GetResource
��T _
(
��_ `
$str
��` n
)
��n o
)
��o p
;
��p q
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
$num
�� 
;
�� 
i
�� 
<=
��  
$num
��! #
;
��# $
i
��% &
++
��& (
)
��( )
{
�� 
months
�� 
.
�� 
AppendFormat
�� #
(
��# $
$str
��$ I
,
��I J
i
�� 
,
�� 
(
�� 

�� "
.
��" #
HasValue
��# +
&&
��, .

��/ <
.
��< =
Value
��= B
==
��C E
i
��F G
)
��G H
?
��I J
$str
��K c
:
��d e
null
��f j
,
��j k
CultureInfo
�� 
.
��  
CurrentUICulture
��  0
.
��0 1
DateTimeFormat
��1 ?
.
��? @
GetMonthName
��@ L
(
��L M
i
��M N
)
��N O
)
��O P
;
��P Q
}
�� 
years
�� 
.
�� 
AppendFormat
�� 
(
�� 
$str
�� A
,
��A B
$str
��C F
,
��F G

locService
��H R
.
��R S
GetResource
��S ^
(
��^ _
$str
��_ l
)
��l m
)
��m n
;
��n o
if
�� 
(
�� 
	BeginYear
�� 
==
�� 
null
�� !
)
��! "
	BeginYear
�� 
=
�� 
DateTime
�� $
.
��$ %
UtcNow
��% +
.
��+ ,
Year
��, 0
-
��1 2
$num
��3 6
;
��6 7
if
�� 
(
�� 
EndYear
�� 
==
�� 
null
�� 
)
��  
EndYear
�� 
=
�� 
DateTime
�� "
.
��" #
UtcNow
��# )
.
��) *
Year
��* .
;
��. /
if
�� 
(
�� 
EndYear
�� 
>
�� 
	BeginYear
�� #
)
��# $
{
�� 
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
	BeginYear
�� &
.
��& '
Value
��' ,
;
��, -
i
��. /
<=
��0 2
EndYear
��3 :
.
��: ;
Value
��; @
;
��@ A
i
��B C
++
��C E
)
��E F
years
�� 
.
�� 
AppendFormat
�� &
(
��& '
$str
��' L
,
��L M
i
��N O
,
��O P
(
�� 
SelectedYear
�� %
.
��% &
HasValue
��& .
&&
��/ 1
SelectedYear
��2 >
.
��> ?
Value
��? D
==
��E G
i
��H I
)
��I J
?
��K L
$str
��M e
:
��f g
null
��h l
)
��l m
;
��m n
}
�� 
else
�� 
{
�� 
for
�� 
(
�� 
var
�� 
i
�� 
=
�� 
	BeginYear
�� &
.
��& '
Value
��' ,
;
��, -
i
��. /
>=
��0 2
EndYear
��3 :
.
��: ;
Value
��; @
;
��@ A
i
��B C
--
��C E
)
��E F
years
�� 
.
�� 
AppendFormat
�� &
(
��& '
$str
��' L
,
��L M
i
��N O
,
��O P
(
�� 
SelectedYear
�� %
.
��% &
HasValue
��& .
&&
��/ 1
SelectedYear
��2 >
.
��> ?
Value
��? D
==
��E G
i
��H I
)
��I J
?
��K L
$str
��M e
:
��f g
null
��h l
)
��l m
;
��m n
}
�� 
daysList
�� 
.
�� 
	InnerHtml
�� 
.
�� 

AppendHtml
�� )
(
��) *
days
��* .
.
��. /
ToString
��/ 7
(
��7 8
)
��8 9
)
��9 :
;
��: ;

monthsList
�� 
.
�� 
	InnerHtml
��  
.
��  !

AppendHtml
��! +
(
��+ ,
months
��, 2
.
��2 3
ToString
��3 ;
(
��; <
)
��< =
)
��= >
;
��> ?
	yearsList
�� 
.
�� 
	InnerHtml
�� 
.
��  

AppendHtml
��  *
(
��* +
years
��+ 0
.
��0 1
ToString
��1 9
(
��9 :
)
��: ;
)
��; <
;
��< =
if
�� 
(
�� 
bool
�� 
.
�� 
TryParse
�� 
(
�� 
WrapTags
�� &
,
��& '
out
��( +
bool
��, 0
wrapTags
��1 9
)
��9 :
&&
��; =
wrapTags
��> F
)
��F G
{
�� 
var
�� 
wrapDaysList
��  
=
��! "
$str
��# N
+
��O P
daysList
��Q Y
.
��Y Z
RenderHtmlContent
��Z k
(
��k l
)
��l m
+
��n o
$str
��p y
;
��y z
var
�� 
wrapMonthsList
�� "
=
��# $
$str
��% R
+
��S T

monthsList
��U _
.
��_ `
RenderHtmlContent
��` q
(
��q r
)
��r s
+
��t u
$str
��v 
;�� �
var
�� 

�� !
=
��" #
$str
��$ P
+
��Q R
	yearsList
��S \
.
��\ ]
RenderHtmlContent
��] n
(
��n o
)
��o p
+
��q r
$str
��s |
;
��| }
output
�� 
.
�� 
Content
�� 
.
�� 

AppendHtml
�� )
(
��) *
wrapDaysList
��* 6
)
��6 7
;
��7 8
output
�� 
.
�� 
Content
�� 
.
�� 

AppendHtml
�� )
(
��) *
wrapMonthsList
��* 8
)
��8 9
;
��9 :
output
�� 
.
�� 
Content
�� 
.
�� 

AppendHtml
�� )
(
��) *

��* 7
)
��7 8
;
��8 9
}
�� 
else
�� 
{
�� 
output
�� 
.
�� 
Content
�� 
.
�� 

AppendHtml
�� )
(
��) *
daysList
��* 2
)
��2 3
;
��3 4
output
�� 
.
�� 
Content
�� 
.
�� 

AppendHtml
�� )
(
��) *

monthsList
��* 4
)
��4 5
;
��5 6
output
�� 
.
�� 
Content
�� 
.
�� 

AppendHtml
�� )
(
��) *
	yearsList
��* 3
)
��3 4
;
��4 5
}
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\TagHelpers\Shared\NopRequiredTagHelper.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 

TagHelpers &
.& '
Shared' -
{ 
[		 
HtmlTargetElement		 
(		 
$str		 %
,		% &
TagStructure		' 3
=		4 5
TagStructure		6 B
.		B C

)		P Q
]		Q R
public

 

class

  
NopRequiredTagHelper

 %
:

& '
	TagHelper

( 1
{ 
public 
override 
void 
Process $
($ %
TagHelperContext% 5
context6 =
,= >
TagHelperOutput? N
outputO U
)U V
{ 	
if 
( 
context 
== 
null 
)  
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
context7 >
)> ?
)? @
;@ A
} 
if 
( 
output 
== 
null 
) 
{ 
throw 
new !
ArgumentNullException /
(/ 0
nameof0 6
(6 7
output7 =
)= >
)> ?
;? @
} 
output 
. 
SuppressOutput !
(! "
)" #
;# $
output   
.   
TagName   
=   
$str   #
;  # $
output!! 
.!! 
TagMode!! 
=!! 
TagMode!! $
.!!$ %
StartTagAndEndTag!!% 6
;!!6 7
output"" 
."" 

Attributes"" 
."" 
SetAttribute"" *
(""* +
$str""+ 2
,""2 3
$str""4 >
)""> ?
;""? @
output## 
.## 
Content## 
.## 

SetContent## %
(##% &
$str##& )
)##) *
;##* +
}$$ 	
}%% 
}&& �
~C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Themes\IThemeContext.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Themes "
{ 
public 

	interface 

{ 
string 
WorkingThemeName 
{  !
get" %
;% &
set' *
;* +
}, -
}
} �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Themes\ThemeableViewLocationExpander.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
Themes "
{ 
public

 

class

 )
ThemeableViewLocationExpander

 .
:

/ 0!
IViewLocationExpander

1 F
{ 
private 
const 
string 
	THEME_KEY &
=' (
$str) 8
;8 9
public 
void 
PopulateValues "
(" #'
ViewLocationExpanderContext# >
context? F
)F G
{ 	
if 
( 
context 
. 
AreaName  
?  !
.! "
Equals" (
(( )
	AreaNames) 2
.2 3
Admin3 8
)8 9
??: <
false= B
)B C
return 
; 
var 
themeContext 
= 
(  

)- .
context. 5
.5 6

.C D
HttpContextD O
.O P
RequestServicesP _
._ `

GetService` j
(j k
typeofk q
(q r

)	 �
)
� �
;
� �
context 
. 
Values 
[ 
	THEME_KEY $
]$ %
=& '
themeContext( 4
.4 5
WorkingThemeName5 E
;E F
} 	
public$$ 
IEnumerable$$ 
<$$ 
string$$ !
>$$! "
ExpandViewLocations$$# 6
($$6 7'
ViewLocationExpanderContext$$7 R
context$$S Z
,$$Z [
IEnumerable$$\ g
<$$g h
string$$h n
>$$n o

)$$} ~
{%% 	
if&& 
(&& 
context&& 
.&& 
Values&& 
.&& 
TryGetValue&& *
(&&* +
	THEME_KEY&&+ 4
,&&4 5
out&&6 9
string&&: @
theme&&A F
)&&F G
)&&G H
{'' 

=(( 
new((  #
[((# $
](($ %
{((& '
$")) 
$str)) "
{))" #
theme))# (
}))( )
$str))) B
"))B C
,))C D
$"** 
$str** "
{**" #
theme**# (
}**( )
$str**) C
"**C D
,**D E
}++ 
.,, 
Concat,, 
(,, 

),,) *
;,,* +
}-- 
return00 

;00  !
}11 	
}22 
}33 �)
}C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Themes\ThemeContext.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 
Themes		 "
{

 
public 

partial 
class 
ThemeContext %
:& '

{ 
private 
readonly $
IGenericAttributeService 1$
_genericAttributeService2 J
;J K
private 
readonly 


;4 5
private 
readonly 
IThemeProvider '
_themeProvider( 6
;6 7
private 
readonly 
IWorkContext %
_workContext& 2
;2 3
private 
readonly $
StoreInformationSettings 1%
_storeInformationSettings2 K
;K L
private 
string 
_cachedThemeName '
;' (
public&& 
ThemeContext&& 
(&& $
IGenericAttributeService&& 4#
genericAttributeService&&5 L
,&&L M

storeContext'' &
,''& '
IThemeProvider(( 

,((( )
IWorkContext)) 
workContext)) $
,))$ %$
StoreInformationSettings** $$
storeInformationSettings**% =
)**= >
{++ 	$
_genericAttributeService,, $
=,,% &#
genericAttributeService,,' >
;,,> ?

=-- 
storeContext-- (
;--( )
_themeProvider.. 
=.. 

;..* +
_workContext// 
=// 
workContext// &
;//& '%
_storeInformationSettings00 %
=00& '$
storeInformationSettings00( @
;00@ A
}11 	
public:: 
string:: 
WorkingThemeName:: &
{;; 	
get<< 
{== 
if>> 
(>> 
!>> 
string>> 
.>> 

(>>) *
_cachedThemeName>>* :
)>>: ;
)>>; <
return?? 
_cachedThemeName?? +
;??+ ,
varAA 
	themeNameAA 
=AA 
stringAA  &
.AA& '
EmptyAA' ,
;AA, -
ifDD 
(DD %
_storeInformationSettingsDD -
.DD- .&
AllowCustomerToSelectThemeDD. H
&&DDI K
_workContextDDL X
.DDX Y
CurrentCustomerDDY h
!=DDi k
nullDDl p
)DDp q
{EE 
	themeNameFF 
=FF $
_genericAttributeServiceFF  8
.FF8 9
GetAttributeFF9 E
<FFE F
stringFFF L
>FFL M
(FFM N
_workContextFFN Z
.FFZ [
CurrentCustomerFF[ j
,FFj k
NopCustomerDefaultsGG +
.GG+ ,%
WorkingThemeNameAttributeGG, E
,GGE F

.GGT U
CurrentStoreGGU a
.GGa b
IdGGb d
)GGd e
;GGe f
}HH 
ifKK 
(KK 
stringKK 
.KK 

(KK( )
	themeNameKK) 2
)KK2 3
)KK3 4
	themeNameLL 
=LL %
_storeInformationSettingsLL  9
.LL9 :
DefaultStoreThemeLL: K
;LLK L
ifOO 
(OO 
!OO 
_themeProviderOO #
.OO# $
ThemeExistsOO$ /
(OO/ 0
	themeNameOO0 9
)OO9 :
)OO: ;
{PP 
	themeNameRR 
=RR 
_themeProviderRR  .
.RR. /
	GetThemesRR/ 8
(RR8 9
)RR9 :
.RR: ;
FirstOrDefaultRR; I
(RRI J
)RRJ K
?RRK L
.RRL M

SystemNameRRM W
??SS 
throwSS  
newSS! $
	ExceptionSS% .
(SS. /
$strSS/ I
)SSI J
;SSJ K
}TT 
_cachedThemeNameWW  
=WW! "
	themeNameWW# ,
;WW, -
returnYY 
	themeNameYY  
;YY  !
}ZZ 
set[[ 
{\\ 
if^^ 
(^^ 
!^^ %
_storeInformationSettings^^ .
.^^. /&
AllowCustomerToSelectTheme^^/ I
||^^J L
_workContext^^M Y
.^^Y Z
CurrentCustomer^^Z i
==^^j l
null^^m q
)^^q r
return__ 
;__ $
_genericAttributeServicebb (
.bb( )

(bb6 7
_workContextbb7 C
.bbC D
CurrentCustomerbbD S
,bbS T
NopCustomerDefaultscc '
.cc' (%
WorkingThemeNameAttributecc( A
,ccA B
valueccC H
,ccH I

.ccW X
CurrentStoreccX d
.ccd e
Idcce g
)ccg h
;cch i
_cachedThemeNameff  
=ff! "
nullff# '
;ff' (
}gg 
}hh 	
}kk 
}ll �-
}C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\UI\IPageHeadBuilder.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
UI 
{ 
public 

partial 
	interface 
IPageHeadBuilder -
{		 
void 

( 
string !
part" &
)& '
;' (
void 
AppendTitleParts
( 
string $
part% )
)) *
;* +
string 

( 
bool !
addDefaultTitle" 1
)1 2
;2 3
void #
AddMetaDescriptionParts
($ %
string% +
part, 0
)0 1
;1 2
void$$ &
AppendMetaDescriptionParts$$
($$' (
string$$( .
part$$/ 3
)$$3 4
;$$4 5
string)) #
GenerateMetaDescription)) &
())& '
)))' (
;))( )
void// 
AddMetaKeywordParts//
(//  !
string//! '
part//( ,
)//, -
;//- .
void44 "
AppendMetaKeywordParts44
(44# $
string44$ *
part44+ /
)44/ 0
;440 1
string99  
GenerateMetaKeywords99 #
(99# $
)99$ %
;99% &
voidCC 
AddScriptPartsCC
(CC 
ResourceLocationCC ,
locationCC- 5
,CC5 6
stringCC7 =
srcCC> A
,CCA B
stringCCC I
debugSrcCCJ R
,CCR S
boolCCT X
excludeFromBundleCCY j
,CCj k
boolCCl p
isAsyncCCq x
)CCx y
;CCy z
voidLL 
AppendScriptPartsLL
(LL 
ResourceLocationLL /
locationLL0 8
,LL8 9
stringLL: @
srcLLA D
,LLD E
stringLLF L
debugSrcLLM U
,LLU V
boolLLW [
excludeFromBundleLL\ m
,LLm n
boolLLo s
isAsyncLLt {
)LL{ |
;LL| }
stringSS 
GenerateScriptsSS 
(SS 
ResourceLocationSS /
locationSS0 8
,SS8 9
boolSS: >
?SS> ?
bundleFilesSS@ K
=SSL M
nullSSN R
)SSR S
;SSS T
voidZZ  
AddInlineScriptPartsZZ
(ZZ! "
ResourceLocationZZ" 2
locationZZ3 ;
,ZZ; <
stringZZ= C
scriptZZD J
)ZZJ K
;ZZK L
void`` #
AppendInlineScriptParts``
(``$ %
ResourceLocation``% 5
location``6 >
,``> ?
string``@ F
script``G M
)``M N
;``N O
stringff !
GenerateInlineScriptsff $
(ff$ %
ResourceLocationff% 5
locationff6 >
)ff> ?
;ff? @
voidoo 
AddCssFilePartsoo
(oo 
ResourceLocationoo -
locationoo. 6
,oo6 7
stringoo8 >
srcoo? B
,ooB C
stringooD J
debugSrcooK S
,ooS T
boolooU Y
excludeFromBundleooZ k
=ool m
falseoon s
)oos t
;oot u
voidww 
AppendCssFilePartsww
(ww  
ResourceLocationww  0
locationww1 9
,ww9 :
stringww; A
srcwwB E
,wwE F
stringwwG M
debugSrcwwN V
,wwV W
boolwwX \
excludeFromBundleww] n
=wwo p
falsewwq v
)wwv w
;www x
string~~ 
GenerateCssFiles~~ 
(~~  
ResourceLocation~~  0
location~~1 9
,~~9 :
bool~~; ?
?~~? @
bundleFiles~~A L
=~~M N
null~~O S
)~~S T
;~~T U
void
�� "
AddCanonicalUrlParts
��
(
��! "
string
��" (
part
��) -
)
��- .
;
��. /
void
�� %
AppendCanonicalUrlParts
��
(
��$ %
string
��% +
part
��, 0
)
��0 1
;
��1 2
string
�� #
GenerateCanonicalUrls
�� $
(
��$ %
)
��% &
;
��& '
void
��  
AddHeadCustomParts
��
(
��  
string
��  &
part
��' +
)
��+ ,
;
��, -
void
�� #
AppendHeadCustomParts
��
(
��" #
string
��# )
part
��* .
)
��. /
;
��/ 0
string
��  
GenerateHeadCustom
�� !
(
��! "
)
��" #
;
��# $
void
�� "
AddPageCssClassParts
��
(
��! "
string
��" (
part
��) -
)
��- .
;
��. /
void
�� %
AppendPageCssClassParts
��
(
��$ %
string
��% +
part
��, 0
)
��0 1
;
��1 2
string
�� $
GeneratePageCssClasses
�� %
(
��% &
)
��& '
;
��' (
void
�� 
AddEditPageUrl
��
(
�� 
string
�� "
url
��# &
)
��& '
;
��' (
string
�� 
GetEditPageUrl
�� 
(
�� 
)
�� 
;
��  
void
�� )
SetActiveMenuItemSystemName
��
(
��( )
string
��) /

systemName
��0 :
)
��: ;
;
��; <
string
�� )
GetActiveMenuItemSystemName
�� *
(
��* +
)
��+ ,
;
��, -
}
�� 
}�� ��
}C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\UI\LayoutExtensions.cs
	namespace		 	
Nop		
 
.		
Web		 
.		 
	Framework		 
.		 
UI		 
{

 
public 

static 
class 
LayoutExtensions (
{ 
public 
static 
void 

(( )
this) -
IHtmlHelper. 9
html: >
,> ?
string@ F
partG K
)K L
{ 	
var 
pageHeadBuilder 
=! "

.0 1
Current1 8
.8 9
Resolve9 @
<@ A
IPageHeadBuilderA Q
>Q R
(R S
)S T
;T U
pageHeadBuilder 
. 

() *
part* .
). /
;/ 0
} 	
public 
static 
void 
AppendTitleParts +
(+ ,
this, 0
IHtmlHelper1 <
html= A
,A B
stringC I
partJ N
)N O
{   	
var!! 
pageHeadBuilder!! 
=!!! "

.!!0 1
Current!!1 8
.!!8 9
Resolve!!9 @
<!!@ A
IPageHeadBuilder!!A Q
>!!Q R
(!!R S
)!!S T
;!!T U
pageHeadBuilder"" 
."" 
AppendTitleParts"" ,
("", -
part""- 1
)""1 2
;""2 3
}## 	
public++ 
static++ 
IHtmlContent++ "
NopTitle++# +
(+++ ,
this++, 0
IHtmlHelper++1 <
html++= A
,++A B
bool++C G
addDefaultTitle++H W
=++X Y
true++Z ^
,++^ _
string++` f
part++g k
=++l m
$str++n p
)++p q
{,, 	
var-- 
pageHeadBuilder-- 
=--  !

.--/ 0
Current--0 7
.--7 8
Resolve--8 ?
<--? @
IPageHeadBuilder--@ P
>--P Q
(--Q R
)--R S
;--S T
html.. 
... 
AppendTitleParts.. !
(..! "
part.." &
)..& '
;..' (
return// 
new// 

HtmlString// !
(//! "
html//" &
.//& '
Encode//' -
(//- .
pageHeadBuilder//. =
.//= >

(//K L
addDefaultTitle//L [
)//[ \
)//\ ]
)//] ^
;//^ _
}00 	
public88 
static88 
void88 #
AddMetaDescriptionParts88 2
(882 3
this883 7
IHtmlHelper888 C
html88D H
,88H I
string88J P
part88Q U
)88U V
{99 	
var:: 
pageHeadBuilder:: 
=::  !

.::/ 0
Current::0 7
.::7 8
Resolve::8 ?
<::? @
IPageHeadBuilder::@ P
>::P Q
(::Q R
)::R S
;::S T
pageHeadBuilder;; 
.;; #
AddMetaDescriptionParts;; 3
(;;3 4
part;;4 8
);;8 9
;;;9 :
}<< 	
publicBB 
staticBB 
voidBB &
AppendMetaDescriptionPartsBB 5
(BB5 6
thisBB6 :
IHtmlHelperBB; F
htmlBBG K
,BBK L
stringBBM S
partBBT X
)BBX Y
{CC 	
varDD 
pageHeadBuilderDD 
=DD  !

.DD/ 0
CurrentDD0 7
.DD7 8
ResolveDD8 ?
<DD? @
IPageHeadBuilderDD@ P
>DDP Q
(DDQ R
)DDR S
;DDS T
pageHeadBuilderEE 
.EE &
AppendMetaDescriptionPartsEE 6
(EE6 7
partEE7 ;
)EE; <
;EE< =
}FF 	
publicMM 
staticMM 
IHtmlContentMM "
NopMetaDescriptionMM# 5
(MM5 6
thisMM6 :
IHtmlHelperMM; F
htmlMMG K
,MMK L
stringMMM S
partMMT X
=MMY Z
$strMM[ ]
)MM] ^
{NN 	
varOO 
pageHeadBuilderOO 
=OO  !

.OO/ 0
CurrentOO0 7
.OO7 8
ResolveOO8 ?
<OO? @
IPageHeadBuilderOO@ P
>OOP Q
(OOQ R
)OOR S
;OOS T
htmlPP 
.PP &
AppendMetaDescriptionPartsPP +
(PP+ ,
partPP, 0
)PP0 1
;PP1 2
returnQQ 
newQQ 

HtmlStringQQ !
(QQ! "
htmlQQ" &
.QQ& '
EncodeQQ' -
(QQ- .
pageHeadBuilderQQ. =
.QQ= >#
GenerateMetaDescriptionQQ> U
(QQU V
)QQV W
)QQW X
)QQX Y
;QQY Z
}RR 	
publicZZ 
staticZZ 
voidZZ 
AddMetaKeywordPartsZZ .
(ZZ. /
thisZZ/ 3
IHtmlHelperZZ4 ?
htmlZZ@ D
,ZZD E
stringZZF L
partZZM Q
)ZZQ R
{[[ 	
var\\ 
pageHeadBuilder\\ 
=\\  !

.\\/ 0
Current\\0 7
.\\7 8
Resolve\\8 ?
<\\? @
IPageHeadBuilder\\@ P
>\\P Q
(\\Q R
)\\R S
;\\S T
pageHeadBuilder]] 
.]] 
AddMetaKeywordParts]] /
(]]/ 0
part]]0 4
)]]4 5
;]]5 6
}^^ 	
publicdd 
staticdd 
voiddd "
AppendMetaKeywordPartsdd 1
(dd1 2
thisdd2 6
IHtmlHelperdd7 B
htmlddC G
,ddG H
stringddI O
partddP T
)ddT U
{ee 	
varff 
pageHeadBuilderff 
=ff  !

.ff/ 0
Currentff0 7
.ff7 8
Resolveff8 ?
<ff? @
IPageHeadBuilderff@ P
>ffP Q
(ffQ R
)ffR S
;ffS T
pageHeadBuildergg 
.gg "
AppendMetaKeywordPartsgg 2
(gg2 3
partgg3 7
)gg7 8
;gg8 9
}hh 	
publicoo 
staticoo 
IHtmlContentoo "
NopMetaKeywordsoo# 2
(oo2 3
thisoo3 7
IHtmlHelperoo8 C
htmlooD H
,ooH I
stringooJ P
partooQ U
=ooV W
$strooX Z
)ooZ [
{pp 	
varqq 
pageHeadBuilderqq 
=qq  !

.qq/ 0
Currentqq0 7
.qq7 8
Resolveqq8 ?
<qq? @
IPageHeadBuilderqq@ P
>qqP Q
(qqQ R
)qqR S
;qqS T
htmlrr 
.rr "
AppendMetaKeywordPartsrr '
(rr' (
partrr( ,
)rr, -
;rr- .
returnss 
newss 

HtmlStringss !
(ss! "
htmlss" &
.ss& '
Encodess' -
(ss- .
pageHeadBuilderss. =
.ss= > 
GenerateMetaKeywordsss> R
(ssR S
)ssS T
)ssT U
)ssU V
;ssV W
}tt 	
public 
static 
void 
AddScriptParts )
() *
this* .
IHtmlHelper/ :
html; ?
,? @
stringA G
srcH K
,K L
stringM S
debugSrcT \
=] ^
$str_ a
,a b
bool
�� 
excludeFromBundle
�� "
=
��# $
false
��% *
,
��* +
bool
��, 0
isAsync
��1 8
=
��9 :
false
��; @
)
��@ A
{
�� 	
AddScriptParts
�� 
(
�� 
html
�� 
,
��  
ResourceLocation
��! 1
.
��1 2
Head
��2 6
,
��6 7
src
��8 ;
,
��; <
debugSrc
��= E
,
��E F
excludeFromBundle
��G X
,
��X Y
isAsync
��Z a
)
��a b
;
��b c
}
�� 	
public
�� 
static
�� 
void
�� 
AddScriptParts
�� )
(
��) *
this
��* .
IHtmlHelper
��/ :
html
��; ?
,
��? @
ResourceLocation
��A Q
location
��R Z
,
��Z [
string
�� 
src
�� 
,
�� 
string
�� 
debugSrc
�� '
=
��( )
$str
��* ,
,
��, -
bool
��. 2
excludeFromBundle
��3 D
=
��E F
false
��G L
,
��L M
bool
��N R
isAsync
��S Z
=
��[ \
false
��] b
)
��b c
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� 
AddScriptParts
�� *
(
��* +
location
��+ 3
,
��3 4
src
��5 8
,
��8 9
debugSrc
��: B
,
��B C
excludeFromBundle
��D U
,
��U V
isAsync
��W ^
)
��^ _
;
��_ `
}
�� 	
public
�� 
static
�� 
void
�� 
AppendScriptParts
�� ,
(
��, -
this
��- 1
IHtmlHelper
��2 =
html
��> B
,
��B C
string
��D J
src
��K N
,
��N O
string
��P V
debugSrc
��W _
=
��` a
$str
��b d
,
��d e
bool
�� 
excludeFromBundle
�� "
=
��# $
false
��% *
,
��* +
bool
��, 0
isAsync
��1 8
=
��9 :
false
��; @
)
��@ A
{
�� 	
AppendScriptParts
�� 
(
�� 
html
�� "
,
��" #
ResourceLocation
��$ 4
.
��4 5
Head
��5 9
,
��9 :
src
��; >
,
��> ?
debugSrc
��@ H
,
��H I
excludeFromBundle
��J [
,
��[ \
isAsync
��] d
)
��d e
;
��e f
}
�� 	
public
�� 
static
�� 
void
�� 
AppendScriptParts
�� ,
(
��, -
this
��- 1
IHtmlHelper
��2 =
html
��> B
,
��B C
ResourceLocation
��D T
location
��U ]
,
��] ^
string
�� 
src
�� 
,
�� 
string
�� 
debugSrc
�� '
=
��( )
$str
��* ,
,
��, -
bool
��. 2
excludeFromBundle
��3 D
=
��E F
false
��G L
,
��L M
bool
��N R
isAsync
��S Z
=
��[ \
false
��] b
)
��b c
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� 
AppendScriptParts
�� -
(
��- .
location
��. 6
,
��6 7
src
��8 ;
,
��; <
debugSrc
��= E
,
��E F
excludeFromBundle
��G X
,
��X Y
isAsync
��Z a
)
��a b
;
��b c
}
�� 	
public
�� 
static
�� 
IHtmlContent
�� "

NopScripts
��# -
(
��- .
this
��. 2
IHtmlHelper
��3 >
html
��? C
,
��C D
ResourceLocation
��E U
location
��V ^
,
��^ _
bool
��` d
?
��d e
bundleFiles
��f q
=
��r s
null
��t x
)
��x y
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
return
�� 
new
�� 

HtmlString
�� !
(
��! "
pageHeadBuilder
��" 1
.
��1 2
GenerateScripts
��2 A
(
��A B
location
��B J
,
��J K
bundleFiles
��L W
)
��W X
)
��X Y
;
��Y Z
}
�� 	
public
�� 
static
�� 
void
�� "
AddInlineScriptParts
�� /
(
��/ 0
this
��0 4
IHtmlHelper
��5 @
html
��A E
,
��E F
ResourceLocation
��G W
location
��X `
,
��` a
string
��b h
script
��i o
)
��o p
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� "
AddInlineScriptParts
�� 0
(
��0 1
location
��1 9
,
��9 :
script
��; A
)
��A B
;
��B C
}
�� 	
public
�� 
static
�� 
void
�� %
AppendInlineScriptParts
�� 2
(
��2 3
this
��3 7
IHtmlHelper
��8 C
html
��D H
,
��H I
ResourceLocation
��J Z
location
��[ c
,
��c d
string
��e k
script
��l r
)
��r s
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� %
AppendInlineScriptParts
�� 3
(
��3 4
location
��4 <
,
��< =
script
��> D
)
��D E
;
��E F
}
�� 	
public
�� 
static
�� 
IHtmlContent
�� "
NopInlineScripts
��# 3
(
��3 4
this
��4 8
IHtmlHelper
��9 D
html
��E I
,
��I J
ResourceLocation
��K [
location
��\ d
)
��d e
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
return
�� 
new
�� 

HtmlString
�� !
(
��! "
pageHeadBuilder
��" 1
.
��1 2#
GenerateInlineScripts
��2 G
(
��G H
location
��H P
)
��P Q
)
��Q R
;
��R S
}
�� 	
public
�� 
static
�� 
void
�� 
AddCssFileParts
�� *
(
��* +
this
��+ /
IHtmlHelper
��0 ;
html
��< @
,
��@ A
string
��B H
src
��I L
,
��L M
string
��N T
debugSrc
��U ]
=
��^ _
$str
��` b
,
��b c
bool
��d h
excludeFromBundle
��i z
=
��{ |
false��} �
)��� �
{
�� 	
AddCssFileParts
�� 
(
�� 
html
��  
,
��  !
ResourceLocation
��" 2
.
��2 3
Head
��3 7
,
��7 8
src
��9 <
,
��< =
debugSrc
��> F
,
��F G
excludeFromBundle
��H Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
static
�� 
void
�� 
AddCssFileParts
�� *
(
��* +
this
��+ /
IHtmlHelper
��0 ;
html
��< @
,
��@ A
ResourceLocation
��B R
location
��S [
,
��[ \
string
�� 
src
�� 
,
�� 
string
�� 
debugSrc
�� '
=
��( )
$str
��* ,
,
��, -
bool
��. 2
excludeFromBundle
��3 D
=
��E F
false
��G L
)
��L M
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� 
AddCssFileParts
�� +
(
��+ ,
location
��, 4
,
��4 5
src
��6 9
,
��9 :
debugSrc
��; C
,
��C D
excludeFromBundle
��E V
)
��V W
;
��W X
}
�� 	
public
�� 
static
�� 
void
��  
AppendCssFileParts
�� -
(
��- .
this
��. 2
IHtmlHelper
��3 >
html
��? C
,
��C D
string
��E K
src
��L O
,
��O P
string
��Q W
debugSrc
��X `
=
��a b
$str
��c e
,
��e f
bool
��g k
excludeFromBundle
��l }
=
��~ 
false��� �
)��� �
{
�� 	 
AppendCssFileParts
�� 
(
�� 
html
�� #
,
��# $
ResourceLocation
��% 5
.
��5 6
Head
��6 :
,
��: ;
src
��< ?
,
��? @
debugSrc
��A I
,
��I J
excludeFromBundle
��K \
)
��\ ]
;
��] ^
}
�� 	
public
�� 
static
�� 
void
��  
AppendCssFileParts
�� -
(
��- .
this
��. 2
IHtmlHelper
��3 >
html
��? C
,
��C D
ResourceLocation
��E U
location
��V ^
,
��^ _
string
�� 
src
�� 
,
�� 
string
�� 
debugSrc
�� '
=
��( )
$str
��* ,
,
��, -
bool
��. 2
excludeFromBundle
��3 D
=
��E F
false
��G L
)
��L M
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
��  
AppendCssFileParts
�� .
(
��. /
location
��/ 7
,
��7 8
src
��9 <
,
��< =
debugSrc
��> F
,
��F G
excludeFromBundle
��H Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
static
�� 
IHtmlContent
�� "
NopCssFiles
��# .
(
��. /
this
��/ 3
IHtmlHelper
��4 ?
html
��@ D
,
��D E
ResourceLocation
��F V
location
��W _
,
��_ `
bool
��a e
?
��e f
bundleFiles
��g r
=
��s t
null
��u y
)
��y z
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
return
�� 
new
�� 

HtmlString
�� !
(
��! "
pageHeadBuilder
��" 1
.
��1 2
GenerateCssFiles
��2 B
(
��B C
location
��C K
,
��K L
bundleFiles
��M X
)
��X Y
)
��Y Z
;
��Z [
}
�� 	
public
�� 
static
�� 
void
�� "
AddCanonicalUrlParts
�� /
(
��/ 0
this
��0 4
IHtmlHelper
��5 @
html
��A E
,
��E F
string
��G M
part
��N R
,
��R S
bool
��T X
withQueryString
��Y h
=
��i j
false
��k p
)
��p q
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
if
�� 
(
�� 
withQueryString
�� 
)
��  
{
�� 
var
�� 
queryParameters
�� #
=
��$ %
html
��& *
.
��* +
ViewContext
��+ 6
.
��6 7
HttpContext
��7 B
.
��B C
Request
��C J
.
��J K
Query
��K P
.
��P Q
OrderBy
��Q X
(
��X Y
	parameter
��Y b
=>
��c e
	parameter
��f o
.
��o p
Key
��p s
)
��s t
.
�� 
ToDictionary
�� !
(
��! "
	parameter
��" +
=>
��, .
	parameter
��/ 8
.
��8 9
Key
��9 <
,
��< =
	parameter
��> G
=>
��H J
	parameter
��K T
.
��T U
Value
��U Z
.
��Z [
ToString
��[ c
(
��c d
)
��d e
)
��e f
;
��f g
part
�� 
=
�� 
QueryHelpers
�� #
.
��# $
AddQueryString
��$ 2
(
��2 3
part
��3 7
,
��7 8
queryParameters
��9 H
)
��H I
;
��I J
}
�� 
pageHeadBuilder
�� 
.
�� "
AddCanonicalUrlParts
�� 0
(
��0 1
part
��1 5
)
��5 6
;
��6 7
}
�� 	
public
�� 
static
�� 
void
�� %
AppendCanonicalUrlParts
�� 2
(
��2 3
this
��3 7
IHtmlHelper
��8 C
html
��D H
,
��H I
string
��J P
part
��Q U
)
��U V
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� %
AppendCanonicalUrlParts
�� 3
(
��3 4
part
��4 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
static
�� 
IHtmlContent
�� "
NopCanonicalUrls
��# 3
(
��3 4
this
��4 8
IHtmlHelper
��9 D
html
��E I
,
��I J
string
��K Q
part
��R V
=
��W X
$str
��Y [
)
��[ \
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
html
�� 
.
�� %
AppendCanonicalUrlParts
�� (
(
��( )
part
��) -
)
��- .
;
��. /
return
�� 
new
�� 

HtmlString
�� !
(
��! "
pageHeadBuilder
��" 1
.
��1 2#
GenerateCanonicalUrls
��2 G
(
��G H
)
��H I
)
��I J
;
��J K
}
�� 	
public
�� 
static
�� 
void
��  
AddHeadCustomParts
�� -
(
��- .
this
��. 2
IHtmlHelper
��3 >
html
��? C
,
��C D
string
��E K
part
��L P
)
��P Q
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
��  
AddHeadCustomParts
�� .
(
��. /
part
��/ 3
)
��3 4
;
��4 5
}
�� 	
public
�� 
static
�� 
void
�� #
AppendHeadCustomParts
�� 0
(
��0 1
this
��1 5
IHtmlHelper
��6 A
html
��B F
,
��F G
string
��H N
part
��O S
)
��S T
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� #
AppendHeadCustomParts
�� 1
(
��1 2
part
��2 6
)
��6 7
;
��7 8
}
�� 	
public
�� 
static
�� 
IHtmlContent
�� "

��# 0
(
��0 1
this
��1 5
IHtmlHelper
��6 A
html
��B F
)
��F G
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
return
�� 
new
�� 

HtmlString
�� !
(
��! "
pageHeadBuilder
��" 1
.
��1 2 
GenerateHeadCustom
��2 D
(
��D E
)
��E F
)
��F G
;
��G H
}
�� 	
public
�� 
static
�� 
void
�� "
AddPageCssClassParts
�� /
(
��/ 0
this
��0 4
IHtmlHelper
��5 @
html
��A E
,
��E F
string
��G M
part
��N R
)
��R S
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� "
AddPageCssClassParts
�� 0
(
��0 1
part
��1 5
)
��5 6
;
��6 7
}
�� 	
public
�� 
static
�� 
void
�� %
AppendPageCssClassParts
�� 2
(
��2 3
this
��3 7
IHtmlHelper
��8 C
html
��D H
,
��H I
string
��J P
part
��Q U
)
��U V
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� %
AppendPageCssClassParts
�� 3
(
��3 4
part
��4 8
)
��8 9
;
��9 :
}
�� 	
public
�� 
static
�� 
IHtmlContent
�� "
NopPageCssClasses
��# 4
(
��4 5
this
��5 9
IHtmlHelper
��: E
html
��F J
,
��J K
string
��L R
part
��S W
=
��X Y
$str
��Z \
,
��\ ]
bool
��^ b!
includeClassElement
��c v
=
��w x
true
��y }
)
��} ~
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
html
�� 
.
�� %
AppendPageCssClassParts
�� (
(
��( )
part
��) -
)
��- .
;
��. /
var
�� 
classes
�� 
=
�� 
pageHeadBuilder
�� )
.
��) *$
GeneratePageCssClasses
��* @
(
��@ A
)
��A B
;
��B C
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
classes
��% ,
)
��, -
)
��- .
return
�� 
null
�� 
;
�� 
var
�� 
result
�� 
=
�� !
includeClassElement
�� ,
?
��- .
$"
��/ 1
$str
��1 9
{
��9 :
classes
��: A
}
��A B
$str
��B D
"
��D E
:
��F G
classes
��H O
;
��O P
return
�� 
new
�� 

HtmlString
�� !
(
��! "
result
��" (
)
��( )
;
��) *
}
�� 	
public
�� 
static
�� 
void
�� )
SetActiveMenuItemSystemName
�� 6
(
��6 7
this
��7 ;
IHtmlHelper
��< G
html
��H L
,
��L M
string
��N T

systemName
��U _
)
��_ `
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
pageHeadBuilder
�� 
.
�� )
SetActiveMenuItemSystemName
�� 7
(
��7 8

systemName
��8 B
)
��B C
;
��C D
}
�� 	
public
�� 
static
�� 
string
�� )
GetActiveMenuItemSystemName
�� 8
(
��8 9
this
��9 =
IHtmlHelper
��> I
html
��J N
)
��N O
{
�� 	
var
�� 
pageHeadBuilder
�� 
=
��  !

��" /
.
��/ 0
Current
��0 7
.
��7 8
Resolve
��8 ?
<
��? @
IPageHeadBuilder
��@ P
>
��P Q
(
��Q R
)
��R S
;
��S T
return
�� 
pageHeadBuilder
�� "
.
��" #)
GetActiveMenuItemSystemName
��# >
(
��> ?
)
��? @
;
��@ A
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\UI\NopNotificationsDefaults.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
UI 
{ 
public 

static 
partial 
class $
NopNotificationsDefaults! 9
{ 
public 
static 
string 
Prefix #
=>$ &
$str' ;
;; <
}
} ��
|C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\UI\PageHeadBuilder.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
UI 
{ 
public 

partial 
class 
PageHeadBuilder (
:) *
IPageHeadBuilder+ ;
{ 
private 
static 
readonly 
object  &
_lock' ,
=- .
new/ 2
object3 9
(9 :
): ;
;; <
private 
readonly 
BundleFileProcessor ,

_processor- 7
;7 8
private 
readonly 
CommonSettings '
_commonSettings( 7
;7 8
private   
readonly   "
IActionContextAccessor   /"
_actionContextAccessor  0 F
;  F G
private!! 
readonly!! 
IHostingEnvironment!! ,
_hostingEnvironment!!- @
;!!@ A
private"" 
readonly"" 
INopFileProvider"" )

;""7 8
private## 
readonly## 
IStaticCacheManager## ,

;##: ;
private$$ 
readonly$$ 
IUrlHelperFactory$$ *
_urlHelperFactory$$+ <
;$$< =
private%% 
readonly%% 
IUrlRecordService%% *
_urlRecordService%%+ <
;%%< =
private&& 
readonly&& 
SeoSettings&& $
_seoSettings&&% 1
;&&1 2
private(( 
readonly(( 
List(( 
<(( 
string(( $
>(($ %
_titleParts((& 1
;((1 2
private)) 
readonly)) 
List)) 
<)) 
string)) $
>))$ %!
_metaDescriptionParts))& ;
;)); <
private** 
readonly** 
List** 
<** 
string** $
>**$ %
_metaKeywordParts**& 7
;**7 8
private++ 
readonly++ 

Dictionary++ #
<++# $
ResourceLocation++$ 4
,++4 5
List++6 :
<++: ;
ScriptReferenceMeta++; N
>++N O
>++O P
_scriptParts++Q ]
;++] ^
private,, 
readonly,, 

Dictionary,, #
<,,# $
ResourceLocation,,$ 4
,,,4 5
List,,6 :
<,,: ;
string,,; A
>,,A B
>,,B C
_inlineScriptParts,,D V
;,,V W
private-- 
readonly-- 

Dictionary-- #
<--# $
ResourceLocation--$ 4
,--4 5
List--6 :
<--: ;
CssReferenceMeta--; K
>--K L
>--L M
	_cssParts--N W
;--W X
private.. 
readonly.. 
List.. 
<.. 
string.. $
>..$ %
_canonicalUrlParts..& 8
;..8 9
private// 
readonly// 
List// 
<// 
string// $
>//$ %
_headCustomParts//& 6
;//6 7
private00 
readonly00 
List00 
<00 
string00 $
>00$ %
_pageCssClassParts00& 8
;008 9
private11 
string11 &
_activeAdminMenuSystemName11 1
;111 2
private22 
string22 
_editPageUrl22 #
;22# $
private55 
const55 
int55 (
RECHECK_BUNDLED_FILES_PERIOD55 6
=557 8
$num559 <
;55< =
public;; 
PageHeadBuilder;; 
(;; 
CommonSettings<< 
commonSettings<< )
,<<) *"
IActionContextAccessor== "!
actionContextAccessor==# 8
,==8 9
IHostingEnvironment>> 
hostingEnvironment>>  2
,>>2 3
INopFileProvider?? 
fileProvider?? )
,??) *
IStaticCacheManager@@ 
cacheManager@@  ,
,@@, -
IUrlHelperFactoryAA 
urlHelperFactoryAA .
,AA. /
IUrlRecordServiceBB 
urlRecordServiceBB .
,BB. /
SeoSettingsCC 
seoSettingsCC #
)DD 
{EE 	

_processorFF 
=FF 
newFF 
BundleFileProcessorFF 0
(FF0 1
)FF1 2
;FF2 3
_commonSettingsGG 
=GG 
commonSettingsGG ,
;GG, -"
_actionContextAccessorHH "
=HH# $!
actionContextAccessorHH% :
;HH: ;
_hostingEnvironmentII 
=II  !
hostingEnvironmentII" 4
;II4 5

=JJ 
fileProviderJJ (
;JJ( )

=KK 
cacheManagerKK (
;KK( )
_urlHelperFactoryLL 
=LL 
urlHelperFactoryLL  0
;LL0 1
_urlRecordServiceMM 
=MM 
urlRecordServiceMM  0
;MM0 1
_seoSettingsNN 
=NN 
seoSettingsNN &
;NN& '
_titlePartsPP 
=PP 
newPP 
ListPP "
<PP" #
stringPP# )
>PP) *
(PP* +
)PP+ ,
;PP, -!
_metaDescriptionPartsQQ !
=QQ" #
newQQ$ '
ListQQ( ,
<QQ, -
stringQQ- 3
>QQ3 4
(QQ4 5
)QQ5 6
;QQ6 7
_metaKeywordPartsRR 
=RR 
newRR  #
ListRR$ (
<RR( )
stringRR) /
>RR/ 0
(RR0 1
)RR1 2
;RR2 3
_scriptPartsSS 
=SS 
newSS 

DictionarySS )
<SS) *
ResourceLocationSS* :
,SS: ;
ListSS< @
<SS@ A
ScriptReferenceMetaSSA T
>SST U
>SSU V
(SSV W
)SSW X
;SSX Y
_inlineScriptPartsTT 
=TT  
newTT! $

DictionaryTT% /
<TT/ 0
ResourceLocationTT0 @
,TT@ A
ListTTB F
<TTF G
stringTTG M
>TTM N
>TTN O
(TTO P
)TTP Q
;TTQ R
	_cssPartsUU 
=UU 
newUU 

DictionaryUU &
<UU& '
ResourceLocationUU' 7
,UU7 8
ListUU9 =
<UU= >
CssReferenceMetaUU> N
>UUN O
>UUO P
(UUP Q
)UUQ R
;UUR S
_canonicalUrlPartsVV 
=VV  
newVV! $
ListVV% )
<VV) *
stringVV* 0
>VV0 1
(VV1 2
)VV2 3
;VV3 4
_headCustomPartsWW 
=WW 
newWW "
ListWW# '
<WW' (
stringWW( .
>WW. /
(WW/ 0
)WW0 1
;WW1 2
_pageCssClassPartsXX 
=XX  
newXX! $
ListXX% )
<XX) *
stringXX* 0
>XX0 1
(XX1 2
)XX2 3
;XX3 4
}YY 	
	protecteddd 
virtualdd 
stringdd  
GetBundleFileNamedd! 2
(dd2 3
stringdd3 9
[dd9 :
]dd: ;
partsdd< A
)ddA B
{ee 	
ifff 
(ff 
partsff 
==ff 
nullff 
||ff  
partsff! &
.ff& '
Lengthff' -
==ff. 0
$numff1 2
)ff2 3
throwgg 
newgg 
ArgumentExceptiongg +
(gg+ ,
$strgg, 3
)gg3 4
;gg4 5
varjj 
hashjj 
=jj 
$strjj 
;jj 
usingkk 
(kk 
SHA256kk 
shakk 
=kk 
newkk  #

(kk1 2
)kk2 3
)kk3 4
{ll 
varnn 
	hashInputnn 
=nn 
$strnn  "
;nn" #
foreachoo 
(oo 
varoo 
partoo !
inoo" $
partsoo% *
)oo* +
{pp 
	hashInputqq 
+=qq  
partqq! %
;qq% &
	hashInputrr 
+=rr  
$strrr! $
;rr$ %
}ss 
varuu 
inputuu 
=uu 
shauu 
.uu  
ComputeHashuu  +
(uu+ ,
Encodinguu, 4
.uu4 5
Unicodeuu5 <
.uu< =
GetBytesuu= E
(uuE F
	hashInputuuF O
)uuO P
)uuP Q
;uuQ R
hashvv 
=vv 
WebEncodersvv "
.vv" #
Base64UrlEncodevv# 2
(vv2 3
inputvv3 8
)vv8 9
;vv9 :
}ww 
hashyy 
=yy 
_urlRecordServiceyy $
.yy$ %
	GetSeNameyy% .
(yy. /
hashyy/ 3
,yy3 4
_seoSettingsyy5 A
.yyA B"
ConvertNonWesternCharsyyB X
,yyX Y
_seoSettingsyyZ f
.yyf g#
AllowUnicodeCharsInUrlsyyg ~
)yy~ 
;	yy �
return{{ 
hash{{ 
;{{ 
}|| 	
public
�� 
virtual
�� 
void
�� 

�� )
(
��) *
string
��* 0
part
��1 5
)
��5 6
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
�� 
_titleParts
�� 
.
�� 
Add
�� 
(
�� 
part
��  
)
��  !
;
��! "
}
�� 	
public
�� 
virtual
�� 
void
�� 
AppendTitleParts
�� ,
(
��, -
string
��- 3
part
��4 8
)
��8 9
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
�� 
_titleParts
�� 
.
�� 
Insert
�� 
(
�� 
$num
��  
,
��  !
part
��" &
)
��& '
;
��' (
}
�� 	
public
�� 
virtual
�� 
string
�� 

�� +
(
��+ ,
bool
��, 0
addDefaultTitle
��1 @
)
��@ A
{
�� 	
var
�� 
result
�� 
=
�� 
$str
�� 
;
�� 
var
�� 

�� 
=
�� 
string
��  &
.
��& '
Join
��' +
(
��+ ,
_seoSettings
��, 8
.
��8 9 
PageTitleSeparator
��9 K
,
��K L
_titleParts
��M X
.
��X Y
AsEnumerable
��Y e
(
��e f
)
��f g
.
��g h
Reverse
��h o
(
��o p
)
��p q
.
��q r
ToArray
��r y
(
��y z
)
��z {
)
��{ |
;
��| }
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 

�� %
(
��% &

��& 3
)
��3 4
)
��4 5
{
�� 
if
�� 
(
�� 
addDefaultTitle
�� #
)
��# $
{
�� 
switch
�� 
(
�� 
_seoSettings
�� (
.
��( )$
PageTitleSeoAdjustment
��) ?
)
��? @
{
�� 
case
�� $
PageTitleSeoAdjustment
�� 3
.
��3 4$
PagenameAfterStorename
��4 J
:
��J K
{
�� 
result
��  &
=
��' (
string
��) /
.
��/ 0
Join
��0 4
(
��4 5
_seoSettings
��5 A
.
��A B 
PageTitleSeparator
��B T
,
��T U
_seoSettings
��V b
.
��b c
DefaultTitle
��c o
,
��o p

��q ~
)
��~ 
;�� �
}
�� 
break
�� !
;
��! "
case
�� $
PageTitleSeoAdjustment
�� 3
.
��3 4$
StorenameAfterPagename
��4 J
:
��J K
default
�� 
:
��  
{
�� 
result
��  &
=
��' (
string
��) /
.
��/ 0
Join
��0 4
(
��4 5
_seoSettings
��5 A
.
��A B 
PageTitleSeparator
��B T
,
��T U

��V c
,
��c d
_seoSettings
��e q
.
��q r
DefaultTitle
��r ~
)
��~ 
;�� �
}
�� 
break
�� !
;
��! "
}
�� 
}
�� 
else
�� 
{
�� 
result
�� 
=
�� 

�� *
;
��* +
}
�� 
}
�� 
else
�� 
{
�� 
result
�� 
=
�� 
_seoSettings
�� %
.
��% &
DefaultTitle
��& 2
;
��2 3
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� %
AddMetaDescriptionParts
�� 3
(
��3 4
string
��4 :
part
��; ?
)
��? @
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
�� #
_metaDescriptionParts
�� !
.
��! "
Add
��" %
(
��% &
part
��& *
)
��* +
;
��+ ,
}
�� 	
public
�� 
virtual
�� 
void
�� (
AppendMetaDescriptionParts
�� 6
(
��6 7
string
��7 =
part
��> B
)
��B C
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
�� #
_metaDescriptionParts
�� !
.
��! "
Insert
��" (
(
��( )
$num
��) *
,
��* +
part
��, 0
)
��0 1
;
��1 2
}
�� 	
public
�� 
virtual
�� 
string
�� %
GenerateMetaDescription
�� 5
(
��5 6
)
��6 7
{
�� 	
var
�� 
metaDescription
�� 
=
��  !
string
��" (
.
��( )
Join
��) -
(
��- .
$str
��. 2
,
��2 3#
_metaDescriptionParts
��4 I
.
��I J
AsEnumerable
��J V
(
��V W
)
��W X
.
��X Y
Reverse
��Y `
(
��` a
)
��a b
.
��b c
ToArray
��c j
(
��j k
)
��k l
)
��l m
;
��m n
var
�� 
result
�� 
=
�� 
!
�� 
string
��  
.
��  !

��! .
(
��. /
metaDescription
��/ >
)
��> ?
?
��@ A
metaDescription
��B Q
:
��R S
_seoSettings
��T `
.
��` a$
DefaultMetaDescription
��a w
;
��w x
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� !
AddMetaKeywordParts
�� /
(
��/ 0
string
��0 6
part
��7 ;
)
��; <
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
�� 
_metaKeywordParts
�� 
.
�� 
Add
�� !
(
��! "
part
��" &
)
��& '
;
��' (
}
�� 	
public
�� 
virtual
�� 
void
�� $
AppendMetaKeywordParts
�� 2
(
��2 3
string
��3 9
part
��: >
)
��> ?
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
�� 
_metaKeywordParts
�� 
.
�� 
Insert
�� $
(
��$ %
$num
��% &
,
��& '
part
��( ,
)
��, -
;
��- .
}
�� 	
public
�� 
virtual
�� 
string
�� "
GenerateMetaKeywords
�� 2
(
��2 3
)
��3 4
{
�� 	
var
�� 
metaKeyword
�� 
=
�� 
string
�� $
.
��$ %
Join
��% )
(
��) *
$str
��* .
,
��. /
_metaKeywordParts
��0 A
.
��A B
AsEnumerable
��B N
(
��N O
)
��O P
.
��P Q
Reverse
��Q X
(
��X Y
)
��Y Z
.
��Z [
ToArray
��[ b
(
��b c
)
��c d
)
��d e
;
��e f
var
�� 
result
�� 
=
�� 
!
�� 
string
��  
.
��  !

��! .
(
��. /
metaKeyword
��/ :
)
��: ;
?
��< =
metaKeyword
��> I
:
��J K
_seoSettings
��L X
.
��X Y!
DefaultMetaKeywords
��Y l
;
��l m
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
AddScriptParts
�� *
(
��* +
ResourceLocation
��+ ;
location
��< D
,
��D E
string
��F L
src
��M P
,
��P Q
string
��R X
debugSrc
��Y a
,
��a b
bool
��c g
excludeFromBundle
��h y
,
��y z
bool
��{ 
isAsync��� �
)��� �
{
�� 	
if
�� 
(
�� 
!
�� 
_scriptParts
�� 
.
�� 
ContainsKey
�� )
(
��) *
location
��* 2
)
��2 3
)
��3 4
_scriptParts
�� 
.
�� 
Add
��  
(
��  !
location
��! )
,
��) *
new
��+ .
List
��/ 3
<
��3 4!
ScriptReferenceMeta
��4 G
>
��G H
(
��H I
)
��I J
)
��J K
;
��K L
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
src
��% (
)
��( )
)
��) *
return
�� 
;
�� 
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
debugSrc
��% -
)
��- .
)
��. /
debugSrc
�� 
=
�� 
src
�� 
;
�� 
_scriptParts
�� 
[
�� 
location
�� !
]
��! "
.
��" #
Add
��# &
(
��& '
new
��' *!
ScriptReferenceMeta
��+ >
{
�� 
ExcludeFromBundle
�� !
=
��" #
excludeFromBundle
��$ 5
,
��5 6
IsAsync
�� 
=
�� 
isAsync
�� !
,
��! "
Src
�� 
=
�� 
src
�� 
,
�� 
DebugSrc
�� 
=
�� 
debugSrc
�� #
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
AppendScriptParts
�� -
(
��- .
ResourceLocation
��. >
location
��? G
,
��G H
string
��I O
src
��P S
,
��S T
string
��U [
debugSrc
��\ d
,
��d e
bool
��f j
excludeFromBundle
��k |
,
��| }
bool��~ �
isAsync��� �
)��� �
{
�� 	
if
�� 
(
�� 
!
�� 
_scriptParts
�� 
.
�� 
ContainsKey
�� )
(
��) *
location
��* 2
)
��2 3
)
��3 4
_scriptParts
�� 
.
�� 
Add
��  
(
��  !
location
��! )
,
��) *
new
��+ .
List
��/ 3
<
��3 4!
ScriptReferenceMeta
��4 G
>
��G H
(
��H I
)
��I J
)
��J K
;
��K L
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
src
��% (
)
��( )
)
��) *
return
�� 
;
�� 
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
debugSrc
��% -
)
��- .
)
��. /
debugSrc
�� 
=
�� 
src
�� 
;
�� 
_scriptParts
�� 
[
�� 
location
�� !
]
��! "
.
��" #
Insert
��# )
(
��) *
$num
��* +
,
��+ ,
new
��- 0!
ScriptReferenceMeta
��1 D
{
�� 
ExcludeFromBundle
�� !
=
��" #
excludeFromBundle
��$ 5
,
��5 6
IsAsync
�� 
=
�� 
isAsync
�� !
,
��! "
Src
�� 
=
�� 
src
�� 
,
�� 
DebugSrc
�� 
=
�� 
debugSrc
�� #
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
virtual
�� 
string
�� 
GenerateScripts
�� -
(
��- .
ResourceLocation
��. >
location
��? G
,
��G H
bool
��I M
?
��M N
bundleFiles
��O Z
=
��[ \
null
��] a
)
��a b
{
�� 	
if
�� 
(
�� 
!
�� 
_scriptParts
�� 
.
�� 
ContainsKey
�� )
(
��) *
location
��* 2
)
��2 3
||
��4 6
_scriptParts
��7 C
[
��C D
location
��D L
]
��L M
==
��N P
null
��Q U
)
��U V
return
�� 
$str
�� 
;
�� 
if
�� 
(
�� 
!
�� 
_scriptParts
�� 
.
�� 
Any
�� !
(
��! "
)
��" #
)
��# $
return
�� 
$str
�� 
;
�� 
var
�� 
	urlHelper
�� 
=
�� 
_urlHelperFactory
�� -
.
��- .
GetUrlHelper
��. :
(
��: ;$
_actionContextAccessor
��; Q
.
��Q R

��R _
)
��_ `
;
��` a
var
�� 

debugModel
�� 
=
�� !
_hostingEnvironment
�� 0
.
��0 1

��1 >
(
��> ?
)
��? @
;
��@ A
if
�� 
(
�� 
!
�� 
bundleFiles
�� 
.
�� 
HasValue
�� %
)
��% &
{
�� 
bundleFiles
�� 
=
�� 
_commonSettings
�� -
.
��- .
EnableJsBundling
��. >
;
��> ?
}
�� 
if
�� 
(
�� 
bundleFiles
�� 
.
�� 
Value
�� !
)
��! "
{
�� 
var
�� 

�� !
=
��" #
_scriptParts
��$ 0
[
��0 1
location
��1 9
]
��9 :
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
!
��  !
x
��! "
.
��" #
ExcludeFromBundle
��# 4
)
��4 5
.
�� 
Distinct
�� 
(
�� 
)
�� 
.
�� 
ToArray
�� 
(
�� 
)
�� 
;
�� 
var
�� 
partsToDontBundle
�� %
=
��& '
_scriptParts
��( 4
[
��4 5
location
��5 =
]
��= >
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
ExcludeFromBundle
��" 3
)
��3 4
.
�� 
Distinct
�� 
(
�� 
)
�� 
.
�� 
ToArray
�� 
(
�� 
)
�� 
;
�� 
var
�� 
result
�� 
=
�� 
new
��  

��! .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� 

�� !
.
��! "
Any
��" %
(
��% &
)
��& '
)
��' (
{
�� 

�� !
.
��! "
CreateDirectory
��" 1
(
��1 2

��2 ?
.
��? @
GetAbsolutePath
��@ O
(
��O P
$str
��P Y
)
��Y Z
)
��Z [
;
��[ \
var
�� 
bundle
�� 
=
��  
new
��! $
Bundle
��% +
(
��+ ,
)
��, -
;
��- .
foreach
�� 
(
�� 
var
��  
item
��! %
in
��& (

��) 6
)
��6 7
{
�� 
new
�� 

PathString
�� &
(
��& '
	urlHelper
��' 0
.
��0 1
Content
��1 8
(
��8 9

debugModel
��9 C
?
��D E
item
��F J
.
��J K
DebugSrc
��K S
:
��T U
item
��V Z
.
��Z [
Src
��[ ^
)
��^ _
)
��_ `
.
��  
StartsWithSegments
�� /
(
��/ 0
	urlHelper
��0 9
.
��9 :

��: G
.
��G H
HttpContext
��H S
.
��S T
Request
��T [
.
��[ \
PathBase
��\ d
,
��d e
out
��f i

PathString
��j t
path
��u y
)
��y z
;
��z {
var
�� 
src
�� 
=
��  !
path
��" &
.
��& '
Value
��' ,
.
��, -
	TrimStart
��- 6
(
��6 7
$char
��7 :
)
��: ;
;
��; <
if
�� 
(
�� 
!
�� 

�� *
.
��* +

FileExists
��+ 5
(
��5 6

��6 C
.
��C D
MapPath
��D K
(
��K L
path
��L P
)
��P Q
)
��Q R
)
��R S
src
�� 
=
��  !
$"
��" $
$str
��$ ,
{
��, -
src
��- 0
}
��0 1
"
��1 2
;
��2 3
bundle
�� 
.
�� 

InputFiles
�� )
.
��) *
Add
��* -
(
��- .
src
��. 1
)
��1 2
;
��2 3
}
�� 
var
�� 
outputFileName
�� &
=
��' (
GetBundleFileName
��) :
(
��: ;

��; H
.
��H I
Select
��I O
(
��O P
x
��P Q
=>
��R T

debugModel
��U _
?
��` a
x
��b c
.
��c d
DebugSrc
��d l
:
��m n
x
��o p
.
��p q
Src
��q t
)
��t u
.
��u v
ToArray
��v }
(
��} ~
)
��~ 
)�� �
;��� �
bundle
�� 
.
�� 
OutputFileName
�� )
=
��* +
$str
��, >
+
��? @
outputFileName
��A O
+
��P Q
$str
��R W
;
��W X
var
�� 
configFilePath
�� &
=
��' (!
_hostingEnvironment
��) <
.
��< =
ContentRootPath
��= L
+
��M N
$str
��O S
+
��T U
outputFileName
��V d
+
��e f
$str
��g n
;
��n o
bundle
�� 
.
�� 
FileName
�� #
=
��$ %
configFilePath
��& 4
;
��4 5
var
�� 
cacheKey
��  
=
��! "
$"
��# %
$str
��% G
{
��G H
outputFileName
��H V
}
��V W
"
��W X
;
��X Y
var
�� 

�� %
=
��& '

��( 5
.
��5 6
Get
��6 9
(
��9 :
cacheKey
��: B
,
��B C
(
��D E
)
��E F
=>
��G I
true
��J N
,
��N O*
RECHECK_BUNDLED_FILES_PERIOD
��P l
)
��l m
;
��m n
if
�� 
(
�� 

�� %
)
��% &
{
�� 
lock
�� 
(
�� 
_lock
�� #
)
��# $
{
�� 

_processor
�� &
.
��& '
Process
��' .
(
��. /
configFilePath
��/ =
,
��= >
new
��? B
List
��C G
<
��G H
Bundle
��H N
>
��N O
{
��P Q
bundle
��Q W
}
��W X
)
��X Y
;
��Y Z
}
�� 

�� %
.
��% &
Set
��& )
(
��) *
cacheKey
��* 2
,
��2 3
false
��4 9
,
��9 :*
RECHECK_BUNDLED_FILES_PERIOD
��; W
)
��W X
;
��X Y
}
�� 
result
�� 
.
�� 
AppendFormat
�� '
(
��' (
$str
��( G
,
��G H
	urlHelper
��I R
.
��R S
Content
��S Z
(
��Z [
$str
��[ g
+
��h i
outputFileName
��j x
+
��y z
$str��{ �
)��� �
)��� �
;��� �
result
�� 
.
�� 
Append
�� !
(
��! "
Environment
��" -
.
��- .
NewLine
��. 5
)
��5 6
;
��6 7
}
�� 
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
partsToDontBundle
��% 6
)
��6 7
{
�� 
var
�� 
src
�� 
=
�� 

debugModel
�� (
?
��) *
item
��+ /
.
��/ 0
DebugSrc
��0 8
:
��9 :
item
��; ?
.
��? @
Src
��@ C
;
��C D
result
�� 
.
�� 
AppendFormat
�� '
(
��' (
$str
��( J
,
��J K
	urlHelper
��L U
.
��U V
Content
��V ]
(
��] ^
src
��^ a
)
��a b
,
��b c
item
��d h
.
��h i
IsAsync
��i p
?
��q r
$str
��s {
:
��| }
$str��~ �
)��� �
;��� �
result
�� 
.
�� 
Append
�� !
(
��! "
Environment
��" -
.
��- .
NewLine
��. 5
)
��5 6
;
��6 7
}
�� 
return
�� 
result
�� 
.
�� 
ToString
�� &
(
��& '
)
��' (
;
��( )
}
�� 
else
�� 
{
�� 
var
�� 
result
�� 
=
�� 
new
��  

��! .
(
��. /
)
��/ 0
;
��0 1
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
_scriptParts
��% 1
[
��1 2
location
��2 :
]
��: ;
.
��; <
Distinct
��< D
(
��D E
)
��E F
)
��F G
{
�� 
var
�� 
src
�� 
=
�� 

debugModel
�� (
?
��) *
item
��+ /
.
��/ 0
DebugSrc
��0 8
:
��9 :
item
��; ?
.
��? @
Src
��@ C
;
��C D
result
�� 
.
�� 
AppendFormat
�� '
(
��' (
$str
��( J
,
��J K
	urlHelper
��L U
.
��U V
Content
��V ]
(
��] ^
src
��^ a
)
��a b
,
��b c
item
��d h
.
��h i
IsAsync
��i p
?
��q r
$str
��s {
:
��| }
$str��~ �
)��� �
;��� �
result
�� 
.
�� 
Append
�� !
(
��! "
Environment
��" -
.
��- .
NewLine
��. 5
)
��5 6
;
��6 7
}
�� 
return
�� 
result
�� 
.
�� 
ToString
�� &
(
��& '
)
��' (
;
��( )
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� "
AddInlineScriptParts
�� 0
(
��0 1
ResourceLocation
��1 A
location
��B J
,
��J K
string
��L R
script
��S Y
)
��Y Z
{
�� 	
if
�� 
(
�� 
!
��  
_inlineScriptParts
�� #
.
��# $
ContainsKey
��$ /
(
��/ 0
location
��0 8
)
��8 9
)
��9 : 
_inlineScriptParts
�� "
.
��" #
Add
��# &
(
��& '
location
��' /
,
��/ 0
new
��1 4
List
��5 9
<
��9 :
string
��: @
>
��@ A
(
��A B
)
��B C
)
��C D
;
��D E
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
script
��% +
)
��+ ,
)
��, -
return
�� 
;
��  
_inlineScriptParts
�� 
[
�� 
location
�� '
]
��' (
.
��( )
Add
��) ,
(
��, -
script
��- 3
)
��3 4
;
��4 5
}
�� 	
public
�� 
virtual
�� 
void
�� %
AppendInlineScriptParts
�� 3
(
��3 4
ResourceLocation
��4 D
location
��E M
,
��M N
string
��O U
script
��V \
)
��\ ]
{
�� 	
if
�� 
(
�� 
!
��  
_inlineScriptParts
�� #
.
��# $
ContainsKey
��$ /
(
��/ 0
location
��0 8
)
��8 9
)
��9 : 
_inlineScriptParts
�� "
.
��" #
Add
��# &
(
��& '
location
��' /
,
��/ 0
new
��1 4
List
��5 9
<
��9 :
string
��: @
>
��@ A
(
��A B
)
��B C
)
��C D
;
��D E
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
script
��% +
)
��+ ,
)
��, -
return
�� 
;
��  
_inlineScriptParts
�� 
[
�� 
location
�� '
]
��' (
.
��( )
Insert
��) /
(
��/ 0
$num
��0 1
,
��1 2
script
��3 9
)
��9 :
;
��: ;
}
�� 	
public
�� 
virtual
�� 
string
�� #
GenerateInlineScripts
�� 3
(
��3 4
ResourceLocation
��4 D
location
��E M
)
��M N
{
�� 	
if
�� 
(
�� 
!
��  
_inlineScriptParts
�� #
.
��# $
ContainsKey
��$ /
(
��/ 0
location
��0 8
)
��8 9
||
��: < 
_inlineScriptParts
��= O
[
��O P
location
��P X
]
��X Y
==
��Z \
null
��] a
)
��a b
return
�� 
$str
�� 
;
�� 
if
�� 
(
�� 
!
��  
_inlineScriptParts
�� #
.
��# $
Any
��$ '
(
��' (
)
��( )
)
��) *
return
�� 
$str
�� 
;
�� 
var
�� 
result
�� 
=
�� 
new
�� 

�� *
(
��* +
)
��+ ,
;
��, -
foreach
�� 
(
�� 
var
�� 
item
�� 
in
��   
_inlineScriptParts
��! 3
[
��3 4
location
��4 <
]
��< =
)
��= >
{
�� 
result
�� 
.
�� 
Append
�� 
(
�� 
item
�� "
)
��" #
;
��# $
result
�� 
.
�� 
Append
�� 
(
�� 
Environment
�� )
.
��) *
NewLine
��* 1
)
��1 2
;
��2 3
}
�� 
return
�� 
result
�� 
.
�� 
ToString
�� "
(
��" #
)
��# $
;
��$ %
}
�� 	
public
�� 
virtual
�� 
void
�� 
AddCssFileParts
�� +
(
��+ ,
ResourceLocation
��, <
location
��= E
,
��E F
string
��G M
src
��N Q
,
��Q R
string
��S Y
debugSrc
��Z b
,
��b c
bool
��d h
excludeFromBundle
��i z
=
��{ |
false��} �
)��� �
{
�� 	
if
�� 
(
�� 
!
�� 
	_cssParts
�� 
.
�� 
ContainsKey
�� &
(
��& '
location
��' /
)
��/ 0
)
��0 1
	_cssParts
�� 
.
�� 
Add
�� 
(
�� 
location
�� &
,
��& '
new
��( +
List
��, 0
<
��0 1
CssReferenceMeta
��1 A
>
��A B
(
��B C
)
��C D
)
��D E
;
��E F
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
src
��% (
)
��( )
)
��) *
return
�� 
;
�� 
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
debugSrc
��% -
)
��- .
)
��. /
debugSrc
�� 
=
�� 
src
�� 
;
�� 
	_cssParts
�� 
[
�� 
location
�� 
]
�� 
.
��  
Add
��  #
(
��# $
new
��$ '
CssReferenceMeta
��( 8
{
�� 
ExcludeFromBundle
�� !
=
��" #
excludeFromBundle
��$ 5
,
��5 6
Src
�� 
=
�� 
src
�� 
,
�� 
DebugSrc
�� 
=
�� 
debugSrc
�� #
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
virtual
�� 
void
��  
AppendCssFileParts
�� .
(
��. /
ResourceLocation
��/ ?
location
��@ H
,
��H I
string
��J P
src
��Q T
,
��T U
string
��V \
debugSrc
��] e
,
��e f
bool
��g k
excludeFromBundle
��l }
=
��~ 
false��� �
)��� �
{
�� 	
if
�� 
(
�� 
!
�� 
	_cssParts
�� 
.
�� 
ContainsKey
�� &
(
��& '
location
��' /
)
��/ 0
)
��0 1
	_cssParts
�� 
.
�� 
Add
�� 
(
�� 
location
�� &
,
��& '
new
��( +
List
��, 0
<
��0 1
CssReferenceMeta
��1 A
>
��A B
(
��B C
)
��C D
)
��D E
;
��E F
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
src
��% (
)
��( )
)
��) *
return
�� 
;
�� 
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
debugSrc
��% -
)
��- .
)
��. /
debugSrc
�� 
=
�� 
src
�� 
;
�� 
	_cssParts
�� 
[
�� 
location
�� 
]
�� 
.
��  
Insert
��  &
(
��& '
$num
��' (
,
��( )
new
��* -
CssReferenceMeta
��. >
{
�� 
ExcludeFromBundle
�� !
=
��" #
excludeFromBundle
��$ 5
,
��5 6
Src
�� 
=
�� 
src
�� 
,
�� 
DebugSrc
�� 
=
�� 
debugSrc
�� #
}
�� 
)
��
;
�� 
}
�� 	
public
�� 
virtual
�� 
string
�� 
GenerateCssFiles
�� .
(
��. /
ResourceLocation
��/ ?
location
��@ H
,
��H I
bool
��J N
?
��N O
bundleFiles
��P [
=
��\ ]
null
��^ b
)
��b c
{
�� 	
if
�� 
(
�� 
!
�� 
	_cssParts
�� 
.
�� 
ContainsKey
�� &
(
��& '
location
��' /
)
��/ 0
||
��1 3
	_cssParts
��4 =
[
��= >
location
��> F
]
��F G
==
��H J
null
��K O
)
��O P
return
�� 
$str
�� 
;
�� 
if
�� 
(
�� 
!
�� 
	_cssParts
�� 
.
�� 
Any
�� 
(
�� 
)
��  
)
��  !
return
�� 
$str
�� 
;
�� 
var
�� 
	urlHelper
�� 
=
�� 
_urlHelperFactory
�� -
.
��- .
GetUrlHelper
��. :
(
��: ;$
_actionContextAccessor
��; Q
.
��Q R

��R _
)
��_ `
;
��` a
var
�� 

debugModel
�� 
=
�� !
_hostingEnvironment
�� 0
.
��0 1

��1 >
(
��> ?
)
��? @
;
��@ A
if
�� 
(
�� 
!
�� 
bundleFiles
�� 
.
�� 
HasValue
�� %
)
��% &
{
�� 
bundleFiles
�� 
=
�� 
_commonSettings
�� -
.
��- .
EnableCssBundling
��. ?
;
��? @
}
�� 
if
�� 
(
�� 
	urlHelper
�� 
.
�� 

�� '
.
��' (
HttpContext
��( 3
.
��3 4
Request
��4 ;
.
��; <
PathBase
��< D
.
��D E
HasValue
��E M
)
��M N
bundleFiles
�� 
=
�� 
false
�� #
;
��# $
if
�� 
(
�� 
bundleFiles
�� 
.
�� 
Value
�� !
)
��! "
{
�� 
var
�� 

�� !
=
��" #
	_cssParts
��$ -
[
��- .
location
��. 6
]
��6 7
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
!
��  !
x
��! "
.
��" #
ExcludeFromBundle
��# 4
)
��4 5
.
�� 
Distinct
�� 
(
�� 
)
�� 
.
�� 
ToArray
�� 
(
�� 
)
�� 
;
�� 
var
�� 
partsToDontBundle
�� %
=
��& '
	_cssParts
��( 1
[
��1 2
location
��2 :
]
��: ;
.
�� 
Where
�� 
(
�� 
x
�� 
=>
�� 
x
��  !
.
��! "
ExcludeFromBundle
��" 3
)
��3 4
.
�� 
Distinct
�� 
(
�� 
)
�� 
.
�� 
ToArray
�� 
(
�� 
)
�� 
;
�� 
var
�� 
result
�� 
=
�� 
new
��  

��! .
(
��. /
)
��/ 0
;
��0 1
if
�� 
(
�� 

�� !
.
��! "
Any
��" %
(
��% &
)
��& '
)
��' (
{
�� 

�� !
.
��! "
CreateDirectory
��" 1
(
��1 2

��2 ?
.
��? @
GetAbsolutePath
��@ O
(
��O P
$str
��P Y
)
��Y Z
)
��Z [
;
��[ \
var
�� 
bundle
�� 
=
��  
new
��! $
Bundle
��% +
(
��+ ,
)
��, -
;
��- .
foreach
�� 
(
�� 
var
��  
item
��! %
in
��& (

��) 6
)
��6 7
{
�� 
var
�� 
src
�� 
=
��  !

debugModel
��" ,
?
��- .
item
��/ 3
.
��3 4
DebugSrc
��4 <
:
��= >
item
��? C
.
��C D
Src
��D G
;
��G H
src
�� 
=
�� 
	urlHelper
�� '
.
��' (
Content
��( /
(
��/ 0
src
��0 3
)
��3 4
;
��4 5
var
�� 
srcPath
�� #
=
��$ %

��& 3
.
��3 4
Combine
��4 ;
(
��; <!
_hostingEnvironment
��< O
.
��O P
ContentRootPath
��P _
,
��_ `
src
��a d
.
��d e
Remove
��e k
(
��k l
$num
��l m
,
��m n
$num
��o p
)
��p q
.
��q r
Replace
��r y
(
��y z
$str
��z }
,
��} ~
$str�� �
)��� �
)��� �
;��� �
if
�� 
(
�� 

�� )
.
��) *

FileExists
��* 4
(
��4 5
srcPath
��5 <
)
��< =
)
��= >
{
�� 
src
�� 
=
��  !
src
��" %
.
��% &
Remove
��& ,
(
��, -
$num
��- .
,
��. /
$num
��0 1
)
��1 2
;
��2 3
}
�� 
else
�� 
{
�� 
src
�� 
=
��  !
$str
��" ,
+
��- .
src
��/ 2
;
��2 3
}
�� 
bundle
�� 
.
�� 

InputFiles
�� )
.
��) *
Add
��* -
(
��- .
src
��. 1
)
��1 2
;
��2 3
}
�� 
var
�� 
outputFileName
�� &
=
��' (
GetBundleFileName
��) :
(
��: ;

��; H
.
��H I
Select
��I O
(
��O P
x
��P Q
=>
��R T
{
��U V
return
��W ]

debugModel
��^ h
?
��i j
x
��k l
.
��l m
DebugSrc
��m u
:
��v w
x
��x y
.
��y z
Src
��z }
;
��} ~
}�� �
)��� �
.��� �
ToArray��� �
(��� �
)��� �
)��� �
;��� �
bundle
�� 
.
�� 
OutputFileName
�� )
=
��* +
$str
��, >
+
��? @
outputFileName
��A O
+
��P Q
$str
��R X
;
��X Y
var
�� 
configFilePath
�� &
=
��' (!
_hostingEnvironment
��) <
.
��< =
ContentRootPath
��= L
+
��M N
$str
��O S
+
��T U
outputFileName
��V d
+
��e f
$str
��g n
;
��n o
bundle
�� 
.
�� 
FileName
�� #
=
��$ %
configFilePath
��& 4
;
��4 5
var
�� 
cacheKey
��  
=
��! "
$"
��# %
$str
��% H
{
��H I
outputFileName
��I W
}
��W X
"
��X Y
;
��Y Z
var
�� 

�� %
=
��& '

��( 5
.
��5 6
Get
��6 9
(
��9 :
cacheKey
��: B
,
��B C
(
��D E
)
��E F
=>
��G I
true
��J N
,
��N O*
RECHECK_BUNDLED_FILES_PERIOD
��P l
)
��l m
;
��m n
if
�� 
(
�� 

�� %
)
��% &
{
�� 
lock
�� 
(
�� 
_lock
�� #
)
��# $
{
�� 

_processor
�� &
.
��& '
Process
��' .
(
��. /
configFilePath
��/ =
,
��= >
new
��? B
List
��C G
<
��G H
Bundle
��H N
>
��N O
{
��P Q
bundle
��Q W
}
��W X
)
��X Y
;
��Y Z
}
�� 

�� %
.
��% &
Set
��& )
(
��) *
cacheKey
��* 2
,
��2 3
false
��4 9
,
��9 :*
RECHECK_BUNDLED_FILES_PERIOD
��; W
)
��W X
;
��X Y
}
�� 
result
�� 
.
�� 
AppendFormat
�� '
(
��' (
$str
��( _
,
��_ `
	urlHelper
��a j
.
��j k
Content
��k r
(
��r s
$str
��s 
+��� �
outputFileName��� �
+��� �
$str��� �
)��� �
,��� �
	MimeTypes��� �
.��� �
TextCss��� �
)��� �
;��� �
result
�� 
.
�� 
Append
�� !
(
��! "
Environment
��" -
.
��- .
NewLine
��. 5
)
��5 6
;
��6 7
}
�� 
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
partsToDontBundle
��% 6
)
��6 7
{
�� 
var
�� 
src
�� 
=
�� 

debugModel
�� (
?
��) *
item
��+ /
.
��/ 0
DebugSrc
��0 8
:
��9 :
item
��; ?
.
��? @
Src
��@ C
;
��C D
result
�� 
.
�� 
AppendFormat
�� '
(
��' (
$str
��( _
,
��_ `
	urlHelper
��a j
.
��j k
Content
��k r
(
��r s
src
��s v
)
��v w
,
��w x
	MimeTypes��y �
.��� �
TextCss��� �
)��� �
;��� �
result
�� 
.
�� 
Append
�� !
(
��! "
Environment
��" -
.
��- .
NewLine
��. 5
)
��5 6
;
��6 7
}
�� 
return
�� 
result
�� 
.
�� 
ToString
�� &
(
��& '
)
��' (
;
��( )
}
�� 
else
�� 
{
�� 
var
�� 
result
�� 
=
�� 
new
��  

��! .
(
��. /
)
��/ 0
;
��0 1
foreach
�� 
(
�� 
var
�� 
item
�� !
in
��" $
	_cssParts
��% .
[
��. /
location
��/ 7
]
��7 8
.
��8 9
Distinct
��9 A
(
��A B
)
��B C
)
��C D
{
�� 
var
�� 
src
�� 
=
�� 

debugModel
�� (
?
��) *
item
��+ /
.
��/ 0
DebugSrc
��0 8
:
��9 :
item
��; ?
.
��? @
Src
��@ C
;
��C D
result
�� 
.
�� 
AppendFormat
�� '
(
��' (
$str
��( _
,
��_ `
	urlHelper
��a j
.
��j k
Content
��k r
(
��r s
src
��s v
)
��v w
,
��w x
	MimeTypes��y �
.��� �
TextCss��� �
)��� �
;��� �
result
�� 
.
�� 

AppendLine
�� %
(
��% &
)
��& '
;
��' (
}
�� 
return
�� 
result
�� 
.
�� 
ToString
�� &
(
��& '
)
��' (
;
��( )
}
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� "
AddCanonicalUrlParts
�� 0
(
��0 1
string
��1 7
part
��8 <
)
��< =
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
��  
_canonicalUrlParts
�� 
.
�� 
Add
�� "
(
��" #
part
��# '
)
��' (
;
��( )
}
�� 	
public
�� 
virtual
�� 
void
�� %
AppendCanonicalUrlParts
�� 3
(
��3 4
string
��4 :
part
��; ?
)
��? @
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
��  
_canonicalUrlParts
�� 
.
�� 
Insert
�� %
(
��% &
$num
��& '
,
��' (
part
��) -
)
��- .
;
��. /
}
�� 	
public
�� 
virtual
�� 
string
�� #
GenerateCanonicalUrls
�� 3
(
��3 4
)
��4 5
{
�� 	
var
�� 
result
�� 
=
�� 
new
�� 

�� *
(
��* +
)
��+ ,
;
��, -
foreach
�� 
(
�� 
var
�� 
canonicalUrl
�� %
in
��& ( 
_canonicalUrlParts
��) ;
)
��; <
{
�� 
result
�� 
.
�� 
AppendFormat
�� #
(
��# $
$str
��$ M
,
��M N
canonicalUrl
��O [
)
��[ \
;
��\ ]
result
�� 
.
�� 
Append
�� 
(
�� 
Environment
�� )
.
��) *
NewLine
��* 1
)
��1 2
;
��2 3
}
�� 
return
�� 
result
�� 
.
�� 
ToString
�� "
(
��" #
)
��# $
;
��$ %
}
�� 	
public
�� 
virtual
�� 
void
��  
AddHeadCustomParts
�� .
(
��. /
string
��/ 5
part
��6 :
)
��: ;
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
�� 
_headCustomParts
�� 
.
�� 
Add
��  
(
��  !
part
��! %
)
��% &
;
��& '
}
�� 	
public
�� 
virtual
�� 
void
�� #
AppendHeadCustomParts
�� 1
(
��1 2
string
��2 8
part
��9 =
)
��= >
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
�� 
_headCustomParts
�� 
.
�� 
Insert
�� #
(
��# $
$num
��$ %
,
��% &
part
��' +
)
��+ ,
;
��, -
}
�� 	
public
�� 
virtual
�� 
string
��  
GenerateHeadCustom
�� 0
(
��0 1
)
��1 2
{
�� 	
var
�� 

�� 
=
�� 
_headCustomParts
��  0
.
��0 1
Distinct
��1 9
(
��9 :
)
��: ;
.
��; <
ToList
��< B
(
��B C
)
��C D
;
��D E
if
�� 
(
�� 
!
�� 

�� 
.
�� 
Any
�� "
(
��" #
)
��# $
)
��$ %
return
�� 
$str
�� 
;
�� 
var
�� 
result
�� 
=
�� 
new
�� 

�� *
(
��* +
)
��+ ,
;
��, -
foreach
�� 
(
�� 
var
�� 
path
�� 
in
��  

��! .
)
��. /
{
�� 
result
�� 
.
�� 
Append
�� 
(
�� 
path
�� "
)
��" #
;
��# $
result
�� 
.
�� 
Append
�� 
(
�� 
Environment
�� )
.
��) *
NewLine
��* 1
)
��1 2
;
��2 3
}
�� 
return
�� 
result
�� 
.
�� 
ToString
�� "
(
��" #
)
��# $
;
��$ %
}
�� 	
public
�� 
virtual
�� 
void
�� "
AddPageCssClassParts
�� 0
(
��0 1
string
��1 7
part
��8 <
)
��< =
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
��  
_pageCssClassParts
�� 
.
�� 
Add
�� "
(
��" #
part
��# '
)
��' (
;
��( )
}
�� 	
public
�� 
virtual
�� 
void
�� %
AppendPageCssClassParts
�� 3
(
��3 4
string
��4 :
part
��; ?
)
��? @
{
�� 	
if
�� 
(
�� 
string
�� 
.
�� 

�� $
(
��$ %
part
��% )
)
��) *
)
��* +
return
�� 
;
��  
_pageCssClassParts
�� 
.
�� 
Insert
�� %
(
��% &
$num
��& '
,
��' (
part
��) -
)
��- .
;
��. /
}
�� 	
public
�� 
virtual
�� 
string
�� $
GeneratePageCssClasses
�� 4
(
��4 5
)
��5 6
{
�� 	
var
�� 
result
�� 
=
�� 
string
�� 
.
��  
Join
��  $
(
��$ %
$str
��% (
,
��( ) 
_pageCssClassParts
��* <
.
��< =
AsEnumerable
��= I
(
��I J
)
��J K
.
��K L
Reverse
��L S
(
��S T
)
��T U
.
��U V
ToArray
��V ]
(
��] ^
)
��^ _
)
��_ `
;
��` a
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
void
�� 
AddEditPageUrl
�� *
(
��* +
string
��+ 1
url
��2 5
)
��5 6
{
�� 	
_editPageUrl
�� 
=
�� 
url
�� 
;
�� 
}
�� 	
public
�� 
virtual
�� 
string
�� 
GetEditPageUrl
�� ,
(
��, -
)
��- .
{
�� 	
return
�� 
_editPageUrl
�� 
;
��  
}
�� 	
public
�� 
virtual
�� 
void
�� )
SetActiveMenuItemSystemName
�� 7
(
��7 8
string
��8 >

systemName
��? I
)
��I J
{
�� 	(
_activeAdminMenuSystemName
�� &
=
��' (

systemName
��) 3
;
��3 4
}
�� 	
public
�� 
virtual
�� 
string
�� )
GetActiveMenuItemSystemName
�� 9
(
��9 :
)
��: ;
{
�� 	
return
�� (
_activeAdminMenuSystemName
�� -
;
��- .
}
�� 	
private
�� 
class
�� !
ScriptReferenceMeta
�� )
:
��* +

IEquatable
��, 6
<
��6 7!
ScriptReferenceMeta
��7 J
>
��J K
{
�� 	
public
�� 
bool
�� 
ExcludeFromBundle
�� )
{
��* +
get
��, /
;
��/ 0
set
��1 4
;
��4 5
}
��6 7
public
�� 
bool
�� 
IsAsync
�� 
{
��  !
get
��" %
;
��% &
set
��' *
;
��* +
}
��, -
public
�� 
string
�� 
Src
�� 
{
�� 
get
��  #
;
��# $
set
��% (
;
��( )
}
��* +
public
�� 
string
�� 
DebugSrc
�� "
{
��# $
get
��% (
;
��( )
set
��* -
;
��- .
}
��/ 0
public
�� 
bool
�� 
Equals
�� 
(
�� !
ScriptReferenceMeta
�� 2
item
��3 7
)
��7 8
{
�� 
if
�� 
(
�� 
item
�� 
==
�� 
null
��  
)
��  !
return
�� 
false
��  
;
��  !
return
�� 
Src
�� 
.
�� 
Equals
�� !
(
��! "
item
��" &
.
��& '
Src
��' *
)
��* +
&&
��, .
DebugSrc
��/ 7
.
��7 8
Equals
��8 >
(
��> ?
item
��? C
.
��C D
DebugSrc
��D L
)
��L M
;
��M N
}
�� 
public
�� 
override
�� 
int
�� 
GetHashCode
��  +
(
��+ ,
)
��, -
{
�� 
return
�� 
Src
�� 
==
�� 
null
�� "
?
��# $
$num
��% &
:
��' (
Src
��) ,
.
��, -
GetHashCode
��- 8
(
��8 9
)
��9 :
;
��: ;
}
�� 
}
�� 	
private
�� 
class
�� 
CssReferenceMeta
�� &
:
��' (

IEquatable
��) 3
<
��3 4
CssReferenceMeta
��4 D
>
��D E
{
�� 	
public
�� 
bool
�� 
ExcludeFromBundle
�� )
{
��* +
get
��, /
;
��/ 0
set
��1 4
;
��4 5
}
��6 7
public
�� 
string
�� 
Src
�� 
{
�� 
get
��  #
;
��# $
set
��% (
;
��( )
}
��* +
public
�� 
string
�� 
DebugSrc
�� "
{
��# $
get
��% (
;
��( )
set
��* -
;
��- .
}
��/ 0
public
�� 
bool
�� 
Equals
�� 
(
�� 
CssReferenceMeta
�� /
item
��0 4
)
��4 5
{
�� 
if
�� 
(
�� 
item
�� 
==
�� 
null
��  
)
��  !
return
�� 
false
��  
;
��  !
return
�� 
Src
�� 
.
�� 
Equals
�� !
(
��! "
item
��" &
.
��& '
Src
��' *
)
��* +
&&
��, .
DebugSrc
��/ 7
.
��7 8
Equals
��8 >
(
��> ?
item
��? C
.
��C D
DebugSrc
��D L
)
��L M
;
��M N
}
�� 
public
�� 
override
�� 
int
�� 
GetHashCode
��  +
(
��+ ,
)
��, -
{
�� 
return
�� 
Src
�� 
==
�� 
null
�� "
?
��# $
$num
��% &
:
��' (
Src
��) ,
.
��, -
GetHashCode
��- 8
(
��8 9
)
��9 :
;
��: ;
}
�� 
}
�� 	
}
�� 
}�� �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\UI\Paging\BasePageableModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
UI 
. 
Paging %
{ 
public 

abstract 
class 
BasePageableModel +
:, -
BaseNopModel. :
,: ;
IPageableModel< J
{
public 
virtual 
void 

<* +
T+ ,
>, -
(- .

IPagedList. 8
<8 9
T9 :
>: ;
	pagedList< E
)E F
{ 	
	FirstItem 
= 
( 
	pagedList "
." #
	PageIndex# ,
*- .
	pagedList/ 8
.8 9
PageSize9 A
)A B
+C D
$numE F
;F G
HasNextPage 
= 
	pagedList #
.# $
HasNextPage$ /
;/ 0
HasPreviousPage 
= 
	pagedList '
.' (
HasPreviousPage( 7
;7 8
LastItem 
= 
Math 
. 
Min 
(  
	pagedList  )
.) *

TotalCount* 4
,4 5
(6 7
(7 8
	pagedList8 A
.A B
	PageIndexB K
*L M
	pagedListN W
.W X
PageSizeX `
)` a
+b c
	pagedListd m
.m n
PageSizen v
)v w
)w x
;x y

PageNumber 
= 
	pagedList "
." #
	PageIndex# ,
+- .
$num/ 0
;0 1
PageSize 
= 
	pagedList  
.  !
PageSize! )
;) *

TotalItems 
= 
	pagedList "
." #

TotalCount# -
;- .

TotalPages 
= 
	pagedList "
." #

TotalPages# -
;- .
} 	
public(( 
int(( 
	PageIndex(( 
{)) 	
get** 
{++ 
if,, 
(,, 

PageNumber,, 
>,,  
$num,,! "
),," #
return-- 

PageNumber-- %
---& '
$num--( )
;--) *
return// 
$num// 
;// 
}00 
}11 	
public66 
int66 

PageNumber66 
{66 
get66  #
;66# $
set66% (
;66( )
}66* +
public;; 
int;; 
PageSize;; 
{;; 
get;; !
;;;! "
set;;# &
;;;& '
};;( )
public@@ 
int@@ 

TotalItems@@ 
{@@ 
get@@  #
;@@# $
set@@% (
;@@( )
}@@* +
publicEE 
intEE 

TotalPagesEE 
{EE 
getEE  #
;EE# $
setEE% (
;EE( )
}EE* +
publicJJ 
intJJ 
	FirstItemJJ 
{JJ 
getJJ "
;JJ" #
setJJ$ '
;JJ' (
}JJ) *
publicOO 
intOO 
LastItemOO 
{OO 
getOO !
;OO! "
setOO# &
;OO& '
}OO( )
publicTT 
boolTT 
HasPreviousPageTT #
{TT$ %
getTT& )
;TT) *
setTT+ .
;TT. /
}TT0 1
publicYY 
boolYY 
HasNextPageYY 
{YY  !
getYY" %
;YY% &
setYY' *
;YY* +
}YY, -
}\\ 
}]] �
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\UI\Paging\IPageableModel.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
UI 
. 
Paging %
{ 
public 
	interface 
IPageableModel  
{		 
int
	PageIndex
{
get
;
}
int 

PageNumber 
{ 
get 
; 
} 
int 
PageSize 
{ 
get 
; 
} 
int 

TotalItems 
{ 
get 
; 
} 
int 

TotalPages 
{ 
get 
; 
} 
int!! 
	FirstItem!! 
{!! 
get!! 
;!! 
}!! 
int%% 
LastItem%% 
{%% 
get%% 
;%% 
}%% 
bool)) 
HasPreviousPage)) 
{)) 
get)) 
;)) 
})) 
bool-- 
HasNextPage-- 
{-- 
get-- 
;-- 
}-- 
}.. 
public55 
	interface55 
IPagination55 
<55 
T55 
>55  
:55! "
IPageableModel55# 1
{66 
}88 
}99 ��
yC:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\UI\Paging\Pager.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
UI 
. 
Paging %
{ 
public 

partial 
class 
Pager 
:  
IHtmlContent! -
{ 
	protected 
readonly 
IPageableModel )
model* /
;/ 0
	protected 
readonly 
ViewContext &
viewContext' 2
;2 3
	protected## 
string## 

=##' (
$str##) /
;##/ 0
	protected'' 
bool'' 
showTotalSummary'' '
;''' (
	protected++ 
bool++ 
showPagerItems++ %
=++& '
true++( ,
;++, -
	protected// 
bool// 
	showFirst//  
=//! "
true//# '
;//' (
	protected33 
bool33 
showPrevious33 #
=33$ %
true33& *
;33* +
	protected77 
bool77 
showNext77 
=77  !
true77" &
;77& '
	protected;; 
bool;; 
showLast;; 
=;;  !
true;;" &
;;;& '
	protected?? 
bool?? 
showIndividualPages?? *
=??+ ,
true??- 1
;??1 2
	protectedCC 
boolCC !
renderEmptyParametersCC ,
=CC- .
trueCC/ 3
;CC3 4
	protectedGG 
intGG )
individualPagesDisplayedCountGG 3
=GG4 5
$numGG6 7
;GG7 8
	protectedKK 
IListKK 
<KK 
stringKK 
>KK !
booleanParameterNamesKK  5
;KK5 6
	protectedOO 
stringOO 
firstPageCssClassOO $
=OO% &
$strOO' 3
;OO3 4
	protectedSS 
stringSS  
previousPageCssClassSS '
=SS( )
$strSS* 9
;SS9 :
	protectedWW 
stringWW 
currentPageCssClassWW ,
=WW- .
$strWW/ =
;WW= >
	protected[[ 
string[[ "
individualPageCssClass[[ /
=[[0 1
$str[[2 C
;[[C D
	protected__ 
string__ 
nextPageCssClass__ )
=__* +
$str__, 7
;__7 8
	protectedcc 
stringcc 
lastPageCssClasscc )
=cc* +
$strcc, 7
;cc7 8
	protectedgg 
stringgg 
mainUlCssClassgg '
=gg( )
$strgg* ,
;gg, -
publicoo 
Pageroo	 
(oo 
IPageableModeloo 
modeloo #
,oo# $
ViewContextoo% 0
contextoo1 8
)oo8 9
{pp 
thisqq 
.qq 
modelqq 
=qq 
modelqq 
;qq 
viewContextrr 
=rr 
contextrr !
;rr! "!
booleanParameterNamesss !
=ss" #
newss$ '
Listss( ,
<ss, -
stringss- 3
>ss3 4
(ss4 5
)ss5 6
;ss6 7
}tt 
	protectedyy 
ViewContextyy 
ViewContextyy #
{zz 
get{{ 
{{{ 
return{{	 
viewContext{{ 
;{{ 
}{{ 
}|| 
public
�� 
Pager
�� 

QueryParam
�� 
(
��  
string
��  &
value
��' ,
)
��, -
{
�� 

�� 
=
�� 
value
�� !
;
��! "
return
�� 	
this
��
 
;
�� 
}
�� 	
public
�� 
Pager
�� 
ShowTotalSummary
�� %
(
��% &
bool
��& *
value
��+ 0
)
��0 1
{
�� 	
showTotalSummary
�� 
=
�� 
value
�� $
;
��$ %
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� 
ShowPagerItems
�� #
(
��# $
bool
��$ (
value
��) .
)
��. /
{
�� 	
showPagerItems
�� 
=
�� 
value
�� "
;
��" #
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� 
	ShowFirst
�� 
(
�� 
bool
�� #
value
��$ )
)
��) *
{
�� 	
	showFirst
�� 
=
�� 
value
�� 
;
�� 
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� 
ShowPrevious
�� !
(
��! "
bool
��" &
value
��' ,
)
��, -
{
�� 	
showPrevious
�� 
=
�� 
value
��  
;
��  !
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� 
ShowNext
�� 
(
�� 
bool
�� "
value
��# (
)
��( )
{
�� 	
showNext
�� 
=
�� 
value
�� 
;
�� 
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� 
ShowLast
�� 
(
�� 
bool
�� "
value
��# (
)
��( )
{
�� 	
showLast
�� 
=
�� 
value
�� 
;
�� 
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� !
ShowIndividualPages
�� (
(
��( )
bool
��) -
value
��. 3
)
��3 4
{
�� 	!
showIndividualPages
�� 
=
��  !
value
��" '
;
��' (
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� #
RenderEmptyParameters
�� *
(
��* +
bool
��+ /
value
��0 5
)
��5 6
{
�� 	#
renderEmptyParameters
�� !
=
��" #
value
��$ )
;
��) *
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� +
IndividualPagesDisplayedCount
�� 2
(
��2 3
int
��3 6
value
��7 <
)
��< =
{
�� 	+
individualPagesDisplayedCount
�� )
=
��* +
value
��, 1
;
��1 2
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� "
BooleanParameterName
�� )
(
��) *
string
��* 0
	paramName
��1 :
)
��: ;
{
�� 	#
booleanParameterNames
�� !
.
��! "
Add
��" %
(
��% &
	paramName
��& /
)
��/ 0
;
��0 1
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� 
FirstPageCssClass
�� &
(
��& '
string
��' -
value
��. 3
)
��3 4
{
��5 6
firstPageCssClass
�� 
=
�� 
value
��  %
;
��% &
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� "
PreviousPageCssClass
�� )
(
��) *
string
��* 0
value
��1 6
)
��6 7
{
��8 9"
previousPageCssClass
��  
=
��! "
value
��# (
;
��( )
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� !
CurrentPageCssClass
�� (
(
��( )
string
��) /
value
��0 5
)
��5 6
{
��7 8!
currentPageCssClass
�� 
=
��  !
value
��" '
;
��' (
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� $
IndividualPageCssClass
�� +
(
��+ ,
string
��, 2
value
��3 8
)
��8 9
{
��: ;$
individualPageCssClass
�� "
=
��# $
value
��% *
;
��* +
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� 
NextPageCssClass
�� %
(
��% &
string
��& ,
value
��- 2
)
��2 3
{
��4 5
nextPageCssClass
�� 
=
�� 
value
�� $
;
��$ %
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� 
LastPageCssClass
�� %
(
��% &
string
��& ,
value
��- 2
)
��2 3
{
��4 5
lastPageCssClass
�� 
=
�� 
value
�� $
;
��$ %
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
Pager
�� 
MainUlCssClass
�� #
(
��# $
string
��$ *
value
��+ 0
)
��0 1
{
��2 3
mainUlCssClass
�� 
=
�� 
value
�� "
;
��" #
return
�� 
this
�� 
;
�� 
}
�� 	
public
�� 
void
�� 
WriteTo
�� 
(
�� 

TextWriter
�� #
writer
��$ *
,
��* +
HtmlEncoder
��, 7
encoder
��8 ?
)
��? @
{
�� 
var
�� 

htmlString
�� 
=
��  
GenerateHtmlString
�� /
(
��/ 0
)
��0 1
;
��1 2
writer
��	 
.
�� 
Write
�� 
(
�� 

htmlString
��  
)
��  !
;
��! "
}
�� 
public
�� 
override
�� 
string
�� 
ToString
�� $
(
��$ %
)
��% &
{
�� 
return
��	  
GenerateHtmlString
�� "
(
��" #
)
��# $
;
��$ %
}
�� 
public
�� 
virtual
�� 
string
��  
GenerateHtmlString
�� 0
(
��0 1
)
��1 2
{
�� 
if
�� 
(
�� 
model
�� 
.
�� 

TotalItems
��  
==
��! #
$num
��$ %
)
��% &
return
�� 

null
�� 
;
�� 
var
�� !
localizationService
�� #
=
��$ %

��& 3
.
��3 4
Current
��4 ;
.
��; <
Resolve
��< C
<
��C D"
ILocalizationService
��D X
>
��X Y
(
��Y Z
)
��Z [
;
��[ \
var
�� 
links
�� 
=
�� 
new
�� 

�� )
(
��) *
)
��* +
;
��+ ,
if
�� 
(
�� 
showTotalSummary
��  
&&
��! #
(
��$ %
model
��% *
.
��* +

TotalPages
��+ 5
>
��6 7
$num
��8 9
)
��9 :
)
��: ;
{
�� 
links
�� 
.
�� 
Append
�� 
(
�� 
$str
�� ;
)
��; <
;
��< =
links
�� 
.
�� 
Append
�� 
(
�� 
string
�� #
.
��# $
Format
��$ *
(
��* +!
localizationService
��+ >
.
��> ?
GetResource
��? J
(
��J K
$str
��K ^
)
��^ _
,
��_ `
model
��a f
.
��f g
	PageIndex
��g p
+
��q r
$num
��s t
,
��t u
model
��v {
.
��{ |

TotalPages��| �
,��� �
model��� �
.��� �

TotalItems��� �
)��� �
)��� �
;��� �
links
�� 
.
�� 
Append
�� 
(
�� 
$str
�� $
)
��$ %
;
��% &
}
�� 
if
�� 
(
�� 
showPagerItems
�� 
&&
�� !
(
��" #
model
��# (
.
��( )

TotalPages
��) 3
>
��4 5
$num
��6 7
)
��7 8
)
��8 9
{
�� 
if
�� 
(
�� 
	showFirst
�� 
)
�� 
{
�� 
if
�� 
(
�� 
(
�� 
model
�� 
.
�� 
	PageIndex
�� (
>=
��) +
$num
��, -
)
��- .
&&
��/ 1
(
��2 3
model
��3 8
.
��8 9

TotalPages
��9 C
>
��D E+
individualPagesDisplayedCount
��F c
)
��c d
)
��d e
{
�� 
links
�� 
.
�� 
Append
�� $
(
��$ %
CreatePageLink
��% 3
(
��3 4
$num
��4 5
,
��5 6!
localizationService
��7 J
.
��J K
GetResource
��K V
(
��V W
$str
��W d
)
��d e
,
��e f
firstPageCssClass
��g x
)
��x y
)
��y z
;
��z {
}
�� 
}
�� 
if
�� 
(
�� 
showPrevious
��  
)
��  !
{
�� 
if
�� 
(
�� 
model
�� 
.
�� 
	PageIndex
�� '
>
��( )
$num
��* +
)
��+ ,
{
�� 
links
�� 
.
�� 
Append
�� $
(
��$ %
CreatePageLink
��% 3
(
��3 4
model
��4 9
.
��9 :
	PageIndex
��: C
,
��C D!
localizationService
��E X
.
��X Y
GetResource
��Y d
(
��d e
$str
��e u
)
��u v
,
��v w#
previousPageCssClass��x �
)��� �
)��� �
;��� �
}
�� 
}
�� 
if
�� 
(
�� !
showIndividualPages
�� '
)
��' (
{
�� 
var
�� &
firstIndividualPageIndex
�� 0
=
��1 2)
GetFirstIndividualPageIndex
��3 N
(
��N O
)
��O P
;
��P Q
var
�� %
lastIndividualPageIndex
�� /
=
��0 1(
GetLastIndividualPageIndex
��2 L
(
��L M
)
��M N
;
��N O
for
�� 
(
�� 
var
�� 
i
�� 
=
��  &
firstIndividualPageIndex
��! 9
;
��9 :
i
��; <
<=
��= ?%
lastIndividualPageIndex
��@ W
;
��W X
i
��Y Z
++
��Z \
)
��\ ]
{
�� 
if
�� 
(
�� 
model
�� !
.
��! "
	PageIndex
��" +
==
��, .
i
��/ 0
)
��0 1
{
�� 
links
�� !
.
��! "
AppendFormat
��" .
(
��. /
$str
��/ =
+
��> ?!
currentPageCssClass
��@ S
+
��T U
$str
��V p
,
��p q
(
��r s
i
��s t
+
��u v
$num
��w x
)
��x y
)
��y z
;
��z {
}
�� 
else
�� 
{
�� 
links
�� !
.
��! "
Append
��" (
(
��( )
CreatePageLink
��) 7
(
��7 8
i
��8 9
+
��: ;
$num
��< =
,
��= >
(
��? @
i
��@ A
+
��B C
$num
��D E
)
��E F
.
��F G
ToString
��G O
(
��O P
)
��P Q
,
��Q R$
individualPageCssClass
��S i
)
��i j
)
��j k
;
��k l
}
�� 
}
�� 
}
�� 
if
�� 
(
�� 
showNext
�� 
)
�� 
{
�� 
if
�� 
(
�� 
(
�� 
model
�� 
.
�� 
	PageIndex
�� (
+
��) *
$num
��+ ,
)
��, -
<
��. /
model
��0 5
.
��5 6

TotalPages
��6 @
)
��@ A
{
�� 
links
�� 
.
�� 
Append
�� $
(
��$ %
CreatePageLink
��% 3
(
��3 4
model
��4 9
.
��9 :
	PageIndex
��: C
+
��D E
$num
��F G
,
��G H!
localizationService
��I \
.
��\ ]
GetResource
��] h
(
��h i
$str
��i u
)
��u v
,
��v w
nextPageCssClass��x �
)��� �
)��� �
;��� �
}
�� 
}
�� 
if
�� 
(
�� 
showLast
�� 
)
�� 
{
�� 
if
�� 
(
�� 
(
�� 
(
�� 
model
�� 
.
��  
	PageIndex
��  )
+
��* +
$num
��, -
)
��- .
<
��/ 0
model
��1 6
.
��6 7

TotalPages
��7 A
)
��A B
&&
��C E
(
��F G
model
��G L
.
��L M

TotalPages
��M W
>
��X Y+
individualPagesDisplayedCount
��Z w
)
��w x
)
��x y
{
�� 
links
�� 
.
�� 
Append
�� $
(
��$ %
CreatePageLink
��% 3
(
��3 4
model
��4 9
.
��9 :

TotalPages
��: D
,
��D E!
localizationService
��F Y
.
��Y Z
GetResource
��Z e
(
��e f
$str
��f r
)
��r s
,
��s t
lastPageCssClass��u �
)��� �
)��� �
;��� �
}
�� 
}
�� 
}
�� 
var
�� 
result
�� 
=
�� 
links
�� 
.
�� 
ToString
�� '
(
��' (
)
��( )
;
��) *
if
�� 
(
�� 
!
�� 
string
�� 
.
�� 

�� %
(
��% &
result
��& ,
)
��, -
)
��- .
{
�� 
result
�� 
=
�� 
string
�� 
.
��  
Format
��  &
(
��& '
$str
��' 0
,
��0 1
string
��2 8
.
��8 9

��9 F
(
��F G
mainUlCssClass
��G U
)
��U V
?
��W X
$str
��Y [
:
��\ ]
$str
��^ i
+
��j k
mainUlCssClass
��l z
+
��{ |
$str��} �
)��� �
+��� �
result��� �
+��� �
$str��� �
;��� �
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 
public
�� 
virtual
�� 
bool
�� 
IsEmpty
��  
(
��  !
)
��! "
{
�� 
var
�� 
html
�� 
=
��  
GenerateHtmlString
�� )
(
��) *
)
��* +
;
��+ ,
return
��	 
string
�� 
.
�� 

�� $
(
��$ %
html
��% )
)
��) *
;
��* +
}
�� 
	protected
�� 
virtual
�� 
int
�� )
GetFirstIndividualPageIndex
�� 9
(
��9 :
)
��: ;
{
�� 	
if
�� 
(
�� 
(
�� 
model
�� 
.
�� 

TotalPages
�� !
<
��" #+
individualPagesDisplayedCount
��$ A
)
��A B
||
��C E
(
�� 
(
�� 
model
�� 
.
�� 
	PageIndex
�� !
-
��" #
(
��$ %+
individualPagesDisplayedCount
��% B
/
��C D
$num
��E F
)
��F G
)
��G H
<
��I J
$num
��K L
)
��L M
)
��M N
{
�� 
return
�� 
$num
�� 
;
�� 
}
�� 
if
�� 
(
�� 
(
�� 
model
�� 
.
�� 
	PageIndex
��  
+
��! "
(
��# $+
individualPagesDisplayedCount
��$ A
/
��B C
$num
��D E
)
��E F
)
��F G
>=
��H J
model
��K P
.
��P Q

TotalPages
��Q [
)
��[ \
{
�� 
return
�� 
(
�� 
model
�� 
.
�� 

TotalPages
�� (
-
��) *+
individualPagesDisplayedCount
��+ H
)
��H I
;
��I J
}
�� 
return
�� 
(
�� 
model
�� 
.
�� 
	PageIndex
�� #
-
��$ %
(
��& '+
individualPagesDisplayedCount
��' D
/
��E F
$num
��G H
)
��H I
)
��I J
;
��J K
}
�� 	
	protected
�� 
virtual
�� 
int
�� (
GetLastIndividualPageIndex
�� 8
(
��8 9
)
��9 :
{
�� 	
var
�� 
num
�� 
=
�� +
individualPagesDisplayedCount
�� 3
/
��4 5
$num
��6 7
;
��7 8
if
�� 
(
�� 
(
�� +
individualPagesDisplayedCount
�� .
%
��/ 0
$num
��1 2
)
��2 3
==
��4 6
$num
��7 8
)
��8 9
{
�� 
num
�� 
--
�� 
;
�� 
}
�� 
if
�� 
(
�� 
(
�� 
model
�� 
.
�� 

TotalPages
�� !
<
��" #+
individualPagesDisplayedCount
��$ A
)
��A B
||
��C E
(
�� 
(
�� 
model
�� 
.
�� 
	PageIndex
�� !
+
��" #
num
��$ '
)
��' (
>=
��) +
model
��, 1
.
��1 2

TotalPages
��2 <
)
��< =
)
��= >
{
�� 
return
�� 
(
�� 
model
�� 
.
�� 

TotalPages
�� (
-
��) *
$num
��+ ,
)
��, -
;
��- .
}
�� 
if
�� 
(
�� 
(
�� 
model
�� 
.
�� 
	PageIndex
��  
-
��! "
(
��# $+
individualPagesDisplayedCount
��$ A
/
��B C
$num
��D E
)
��E F
)
��F G
<
��H I
$num
��J K
)
��K L
{
�� 
return
�� 
(
�� +
individualPagesDisplayedCount
�� 5
-
��6 7
$num
��8 9
)
��9 :
;
��: ;
}
�� 
return
�� 
(
�� 
model
�� 
.
�� 
	PageIndex
�� #
+
��$ %
num
��& )
)
��) *
;
��* +
}
�� 	
	protected
�� 
virtual
�� 
string
�� 
CreatePageLink
�� )
(
��) *
int
��* -

pageNumber
��. 8
,
��8 9
string
��: @
text
��A E
,
��E F
string
��G M
cssClass
��N V
)
��V W
{
�� 
var
�� 
	liBuilder
�� 
=
�� 
new
�� 

TagBuilder
��  *
(
��* +
$str
��+ /
)
��/ 0
;
��0 1
if
�� 
(
�� 
!
�� 
string
�� 
.
��  
IsNullOrWhiteSpace
�� *
(
��* +
cssClass
��+ 3
)
��3 4
)
��4 5
	liBuilder
�� 
.
�� 
AddCssClass
�� %
(
��% &
cssClass
��& .
)
��. /
;
��/ 0
var
�� 
aBuilder
�� 
=
�� 
new
�� 

TagBuilder
�� )
(
��) *
$str
��* -
)
��- .
;
��. /
aBuilder
�� 
.
�� 
	InnerHtml
�� 
.
�� 

AppendHtml
�� )
(
��) *
text
��* .
)
��. /
;
��/ 0
aBuilder
�� 
.
�� 
MergeAttribute
�� #
(
��# $
$str
��$ *
,
��* +
CreateDefaultUrl
��, <
(
��< =

pageNumber
��= G
)
��G H
)
��H I
;
��I J
	liBuilder
�� 
.
�� 
	InnerHtml
�� 
.
��  

AppendHtml
��  *
(
��* +
aBuilder
��+ 3
)
��3 4
;
��4 5
return
�� 
	liBuilder
��
.
�� 
RenderHtmlContent
�� (
(
��( )
)
��) *
;
��* +
}
�� 
	protected
�� 
virtual
�� 
string
��  
CreateDefaultUrl
��! 1
(
��1 2
int
��2 5

pageNumber
��6 @
)
��@ A
{
�� 
var
�� 
routeValues
�� 
=
�� 
new
�� !"
RouteValueDictionary
��" 6
(
��6 7
)
��7 8
;
��8 9
var
�� '
parametersWithEmptyValues
�� )
=
��* +
new
��, /
List
��0 4
<
��4 5
string
��5 ;
>
��; <
(
��< =
)
��= >
;
��> ?
foreach
�� 

(
�� 
var
�� 
key
�� 
in
�� 
viewContext
�� "
.
��" #
HttpContext
��# .
.
��. /
Request
��/ 6
.
��6 7
Query
��7 <
.
��< =
Keys
��= A
.
��A B
Where
��B G
(
��G H
key
��H K
=>
��L N
key
��O R
!=
��S U
null
��V Z
)
��Z [
)
��[ \
{
�� 
var
�� 
value
�� 
=
�� 
viewContext
�� '
.
��' (
HttpContext
��( 3
.
��3 4
Request
��4 ;
.
��; <
Query
��< A
[
��A B
key
��B E
]
��E F
.
��F G
ToString
��G O
(
��O P
)
��P Q
;
��Q R
if
�� 
(
�� #
renderEmptyParameters
�� )
&&
��* ,
string
��- 3
.
��3 4

��4 A
(
��A B
value
��B G
)
��G H
)
��H I
{
�� '
parametersWithEmptyValues
�� -
.
��- .
Add
��. 1
(
��1 2
key
��2 5
)
��5 6
;
��6 7
}
�� 
else
�� 
{
�� 
if
�� 
(
�� #
booleanParameterNames
�� -
.
��- .
Contains
��. 6
(
��6 7
key
��7 :
,
��: ;
StringComparer
��< J
.
��J K(
InvariantCultureIgnoreCase
��K e
)
��e f
)
��f g
{
�� 
if
�� 
(
�� 
!
�� 
string
�� #
.
��# $

��$ 1
(
��1 2
value
��2 7
)
��7 8
&&
��9 ;
value
��< A
.
��A B
Equals
��B H
(
��H I
$str
��I U
,
��U V
StringComparison
��W g
.
��g h)
InvariantCultureIgnoreCase��h �
)��� �
)��� �
{
�� 
value
�� !
=
��" #
$str
��$ *
;
��* +
}
�� 
}
�� 
routeValues
�� 
[
��  
key
��  #
]
��# $
=
��% &
value
��' ,
;
��, -
}
�� 
}
�� 
if
�� 
(
�� 

pageNumber
�� 
>
�� 
$num
�� 
)
�� 
{
�� 
routeValues
�� 
[
�� 

�� )
]
��) *
=
��+ ,

pageNumber
��- 7
;
��7 8
}
�� 
else
�� 
{
�� 
if
�� 
(
�� 
routeValues
�� 
.
��  
ContainsKey
��  +
(
��+ ,

��, 9
)
��9 :
)
��: ;
{
�� 
routeValues
�� 
.
��  
Remove
��  &
(
��& '

��' 4
)
��4 5
;
��5 6
}
�� 
}
�� 
var
�� 	
	webHelper
��
 
=
�� 

�� #
.
��# $
Current
��$ +
.
��+ ,
Resolve
��, 3
<
��3 4

IWebHelper
��4 >
>
��> ?
(
��? @
)
��@ A
;
��A B
var
�� 	
url
��
 
=
�� 
	webHelper
�� 
.
�� 
GetThisPageUrl
�� (
(
��( )
false
��) .
)
��. /
;
��/ 0
foreach
�� 
(
�� 
var
�� 

routeValue
�� 
in
��  
routeValues
��! ,
)
��, -
{
�� 
url
��
 
=
�� 
	webHelper
�� 
.
�� 
ModifyQueryString
�� +
(
��+ ,
url
��, /
,
��/ 0

routeValue
��1 ;
.
��; <
Key
��< ?
,
��? @

routeValue
��A K
.
��K L
Value
��L Q
?
��Q R
.
��R S
ToString
��S [
(
��[ \
)
��\ ]
)
��] ^
;
��^ _
}
�� 
if
�� 
(
�� #
renderEmptyParameters
�� %
&&
��& ('
parametersWithEmptyValues
��) B
.
��B C
Any
��C F
(
��F G
)
��G H
)
��H I
{
�� 
foreach
�� 
(
�� 
var
�� 
key
��  
in
��! #'
parametersWithEmptyValues
��$ =
)
��= >
{
�� 
url
�� 
=
�� 
	webHelper
�� #
.
��# $
ModifyQueryString
��$ 5
(
��5 6
url
��6 9
,
��9 :
key
��; >
)
��> ?
;
��? @
}
�� 
}
�� 
return
�� 	
url
��
 
;
��
}
�� 
}
�� 
}�� �
}C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\UI\ResourceLocation.cs
	namespace 	
Nop
 
.
Web 
. 
	Framework 
. 
UI 
{ 
public 

enum 
ResourceLocation  
{ 
Head 
, 
Footer 
, 
} 
} �E
�C:\Users\leosorio\source\repos\Release\FeatureParentChildPartialPayment\Presentation\Nop.Web.Framework\Validators\BaseNopValidator.cs
	namespace

 	
Nop


 
.


Web

 
.

 
	Framework

 
.

 

Validators

 &
{ 
public 

abstract 
class 
BaseNopValidator *
<* +
TModel+ 1
>1 2
:3 4
AbstractValidator5 F
<F G
TModelG M
>M N
whereO T
TModelU [
:\ ]
class^ c
{ 
	protected 
BaseNopValidator "
(" #
)# $
{ 	
PostInitialize 
( 
) 
; 
} 	
	protected   
virtual   
void   
PostInitialize   -
(  - .
)  . /
{!! 	
}"" 	
	protected** 
virtual** 
void** &
SetDatabaseValidationRules** 9
<**9 :
TEntity**: A
>**A B
(**B C

IDbContext**C M
	dbContext**N W
,**W X
params**Y _
string**` f
[**f g
]**g h&
filterStringPropertyNames	**i �
)
**� �
where++ 
TEntity++ 
:++ 

BaseEntity++ &
{,, 	(
SetStringPropertiesMaxLength-- (
<--( )
TEntity--) 0
>--0 1
(--1 2
	dbContext--2 ;
,--; <%
filterStringPropertyNames--= V
)--V W
;--W X
SetDecimalMaxValue.. 
<.. 
TEntity.. &
>..& '
(..' (
	dbContext..( 1
)..1 2
;..2 3
}// 	
	protected77 
virtual77 
void77 (
SetStringPropertiesMaxLength77 ;
<77; <
TEntity77< C
>77C D
(77D E

IDbContext77E O
	dbContext77P Y
,77Y Z
params77[ a
string77b h
[77h i
]77i j
filterPropertyNames77k ~
)77~ 
where88 
TEntity88 
:88 

BaseEntity88 &
{99 	
if:: 
(:: 
	dbContext:: 
==:: 
null:: !
)::! "
return;; 
;;; 
var>> 
modelPropertyNames>> "
=>># $
typeof>>% +
(>>+ ,
TModel>>, 2
)>>2 3
.>>3 4

(>>A B
)>>B C
.?? 
Where?? 
(?? 
property?? 
=>??  "
property??# +
.??+ ,
PropertyType??, 8
==??9 ;
typeof??< B
(??B C
string??C I
)??I J
&&??K M
!??N O
filterPropertyNames??O b
.??b c
Contains??c k
(??k l
property??l t
.??t u
Name??u y
)??y z
)??z {
.@@ 
Select@@ 
(@@ 
property@@  
=>@@! #
property@@$ ,
.@@, -
Name@@- 1
)@@1 2
.@@2 3
ToList@@3 9
(@@9 :
)@@: ;
;@@; <
varCC 
propertyMaxLengthsCC "
=CC# $
	dbContextCC% .
.CC. /
GetColumnsMaxLengthCC/ B
<CCB C
TEntityCCC J
>CCJ K
(CCK L
)CCL M
.DD 
WhereDD 
(DD 
propertyDD 
=>DD  "
modelPropertyNamesDD# 5
.DD5 6
ContainsDD6 >
(DD> ?
propertyDD? G
.DDG H
NameDDH L
)DDL M
&&DDN P
propertyDDQ Y
.DDY Z
	MaxLengthDDZ c
.DDc d
HasValueDDd l
)DDl m
;DDm n
varGG  
maxLengthExpressionsGG $
=GG% &
propertyMaxLengthsGG' 9
.GG9 :
SelectGG: @
(GG@ A
propertyGGA I
=>GGJ L
newGGM P
{HH 
	MaxLengthII 
=II 
propertyII $
.II$ %
	MaxLengthII% .
.II. /
ValueII/ 4
,II4 5

ExpressionJJ 
=JJ #
DynamicExpressionParserJJ 4
.JJ4 5
ParseLambdaJJ5 @
<JJ@ A
TModelJJA G
,JJG H
stringJJI O
>JJO P
(JJP Q
nullJJQ U
,JJU V
falseJJW \
,JJ\ ]
propertyJJ^ f
.JJf g
NameJJg k
)JJk l
}KK 
)KK
.KK 
ToListKK 
(KK 
)KK 
;KK 
foreachNN 
(NN 
varNN 

expressionNN #
inNN$ & 
maxLengthExpressionsNN' ;
)NN; <
{OO 
RuleForPP 
(PP 

expressionPP "
.PP" #

ExpressionPP# -
)PP- .
.PP. /
LengthPP/ 5
(PP5 6
$numPP6 7
,PP7 8

expressionPP9 C
.PPC D
	MaxLengthPPD M
)PPM N
;PPN O
}QQ 
}RR 	
	protectedYY 
virtualYY 
voidYY 
SetDecimalMaxValueYY 1
<YY1 2
TEntityYY2 9
>YY9 :
(YY: ;

IDbContextYY; E
	dbContextYYF O
)YYO P
whereYYQ V
TEntityYYW ^
:YY_ `

BaseEntityYYa k
{ZZ 	
if[[ 
([[ 
	dbContext[[ 
==[[ 
null[[ !
)[[! "
return\\ 
;\\ 
var__ 
modelPropertyNames__ "
=__# $
typeof__% +
(__+ ,
TModel__, 2
)__2 3
.__3 4

(__A B
)__B C
.`` 
Where`` 
(`` 
property`` 
=>``  "
property``# +
.``+ ,
PropertyType``, 8
==``9 ;
typeof``< B
(``B C
decimal``C J
)``J K
)``K L
.aa 
Selectaa 
(aa 
propertyaa  
=>aa! #
propertyaa$ ,
.aa, -
Nameaa- 1
)aa1 2
.aa2 3
ToListaa3 9
(aa9 :
)aa: ;
;aa; <
vardd $
decimalPropertyMaxValuesdd (
=dd) *
	dbContextdd+ 4
.dd4 5%
GetDecimalColumnsMaxValuedd5 N
<ddN O
TEntityddO V
>ddV W
(ddW X
)ddX Y
.ee 
Whereee 
(ee 
propertyee 
=>ee  "
modelPropertyNamesee# 5
.ee5 6
Containsee6 >
(ee> ?
propertyee? G
.eeG H
NameeeH L
)eeL M
&&eeN P
propertyeeQ Y
.eeY Z
MaxValueeeZ b
.eeb c
HasValueeec k
)eek l
;eel m
varhh 
maxValueExpressionshh #
=hh$ %$
decimalPropertyMaxValueshh& >
.hh> ?
Selecthh? E
(hhE F
propertyhhF N
=>hhO Q
newhhR U
{ii 
MaxValuejj 
=jj 
propertyjj #
.jj# $
MaxValuejj$ ,
.jj, -
Valuejj- 2
,jj2 3

Expressionkk 
=kk #
DynamicExpressionParserkk 4
.kk4 5
ParseLambdakk5 @
<kk@ A
TModelkkA G
,kkG H
decimalkkI P
>kkP Q
(kkQ R
nullkkR V
,kkV W
falsekkX ]
,kk] ^
propertykk_ g
.kkg h
Namekkh l
)kkl m
}ll 
)ll
.ll 
ToListll 
(ll 
)ll 
;ll 
varoo 
localizationServiceoo #
=oo$ %

.oo3 4
Currentoo4 ;
.oo; <
Resolveoo< C
<ooC D 
ILocalizationServiceooD X
>ooX Y
(ooY Z
)ooZ [
;oo[ \
foreachpp 
(pp 
varpp 

expressionpp #
inpp$ &
maxValueExpressionspp' :
)pp: ;
