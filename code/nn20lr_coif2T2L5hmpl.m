function [y1] = nn20lr_coif2T2L5hmpl(x1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 08-Feb-2019 14:46:17.
%
% [y1] = myNeuralNetworkFunction(x1) takes these arguments:
%   x = Qx49 matrix, input #1
% and returns:
%   y = Qx1 matrix, output #1
% where Q is the number of samples.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [8.4718274733549;8.60749340888036;8.19191901234894;5.42697835928001;3.86363061969977;4.37968050381648;4.29644651111338;3.65710402770299;3.52763699952954;3.52137800024971;3.58056350256031;3.60488763949699;3.52287357563713;3.77134713320569;3.68959373181685;3.75176712129566;3.7368141953549;3.63439241857686;3.62569971988679;3.5089076660535;3.51116097791856;3.64118597803612;3.52099305461753;3.41912207646335;3.41472628101244;3.59260004101534;3.85099066262768;3.98354763344265;3.99993562244383;4.20285523638413;4.24946177336205;4.37877440052751;4.15133623979688e-10;2.27668819567629e-10;2.22298057057336e-10;1.61139605560773e-09;1.29489265098287e-08;6.84832093695734e-07;2.36567346063721e-05;3.01238782572742e-05;3.35867399918165e-05;4.23556758841535e-05;0.000127743781272286;0.000159809275969921;0.000511628734309763;0.000635517459580215;-79393.3105830797;-24794.2467999318;-14118.0756890911];
x1_step1.gain = [0.743767470740217;0.880825134268259;0.758250798138956;0.370629687558059;0.287533418241055;0.310862724837821;0.306766806099488;0.279182634764549;0.274271598544455;0.274120533512356;0.276495435714852;0.277350325280625;0.274246109013963;0.284028134950302;0.28083028766524;0.282823506549433;0.281985120987475;0.278533819507413;0.278120302228679;0.273755930142762;0.273603196525216;0.278487937058839;0.273996124050726;0.270153332602435;0.269908186258219;0.276313948691083;0.286273971224317;0.292340301157758;0.292358754951909;0.301336342256502;0.288436358870461;0.29301850534453;133380.99063608;1983.15431818527;315.58597734067;925.389569003757;309.259460829284;37.3660790369326;70.7785314390506;31.5149381883378;15.8272716429321;8.89090477650183;13.8385846058186;10.9346753676349;5.81955952625445;4.37588665353381;2.45632758176022e-05;1.18845612711051e-05;7.90477330624013e-05];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.135560589246670693;1.6300300499259354758;3.1552772222254636958;-0.16446917373341235491;1.4101595924077225952;-1.1140138269656676417;-0.58755534567570777416;0.48485152457661517822;-0.69488081130661594198;-0.2538782961767280244;0.50871907586335540774;-0.49085700302242685211;-1.0717954450254880694;-0.0022437775453669935033;-0.66670072947708369782;1.2514222667070964423;2.3346836082118977984;0.3131481244463242275;2.3589402897084492672;1.4434651600668062521];
IW1_1 = [-0.23162987670054407952 -0.37549063125105153205 0.66159257014318706425 -0.32707797924732895378 -0.21270434606027613378 0.19729109025450447534 -0.20221048926017398673 -0.086756349624958248312 0.11778220298120407883 -0.049297416095671155178 0.10954712390887884343 0.1661344524609588702 -0.22462813209918150448 0.56228075128420262896 0.047429943147842205942 0.32584737995774398778 -1.072327555812977895 -0.53154140146563200187 0.20787295109100478729 -0.001693008623241894911 0.34426876440768489074 -0.67346451267339535462 0.6153596481879304303 0.66988229241140440084 0.24522819823860980692 -0.19795802934967821063 -0.14690807683175835519 -0.035986452940575064385 0.042232558246826243376 0.13611378540460061792 -0.028334944817838145226 0.55995826503850953948 -0.29503876417063745752 -0.183050222297967774 0.32877763712861912682 0.17237438324732926032 -0.019288695531138454198 0.75647004192909594877 0.62629305550211700204 -0.15757815460024574006 0.57984847354235746764 0.22542587482352313688 0.060680795001076565098 0.29179532203110136734 0.0040960565296253165224 0.072749736662789624142 0.20939062613979922411 -0.48413399867745604555 -0.6004940491788879342;0.44610393484318461299 0.8733133229428939881 1.0528129988891115065 -1.6967908200651908857 0.56014979400979869606 0.095171730680115224077 0.24027005596375861085 -0.7207599438790147639 -0.28500267645836868668 -0.14016268502739964719 0.21468134667258617632 -0.20752608475386841169 -0.6848431355392611275 -0.065087646152445333136 -0.87572304752289575891 0.22724294177131798556 0.55800800563538299759 0.11923842657940945944 0.49937632933213904618 -0.46826273145194424741 0.38416105392929789097 -0.91957125457816712988 -0.65863348027947832275 0.024405854947636362873 -0.12566236481492704113 -0.0055960928442391720539 -0.16164494667039985831 0.22479294035358410309 -0.75149413784648744219 -0.30799518669607151011 0.1659537764371486479 0.15922658301522760183 -0.34572630372809748378 0.27211426975750963031 -0.53359845391061644371 0.40092339147834193946 -0.71931806086121108379 0.44369872698822132584 -0.70865410290846297947 0.0128419066542615843 -0.024623667447464935021 -0.064791401399895448554 -0.027652634492022480639 0.34229103692794776714 0.013368501370170135512 0.22753404224440035297 0.47684759281537797415 0.054641265120051414617 0.30570594608582524199;0.057155447259830044482 -1.1236019710235503055 0.26097472783583552935 0.72138670585967368254 -1.8630435612459470551 -0.67246977398250029623 -0.44297543768782798868 -0.41720365496379580028 0.32220602311503138138 -0.011046637833455368732 -0.60137753288810191776 0.16084451857183715284 1.8115421527742658903 -0.22862318902377126717 0.59243630502936417415 -0.0018926813210743131943 -0.78938560347137842754 0.13794373048861430231 -1.0246754470392736014 -0.14756950359449022558 -1.850997536080552841 -0.00062947053851628714805 1.1601133172712532193 -0.69967110777204211125 0.32616415066405723966 -0.38318152904660096603 -0.89032931070038345833 -0.84063037928373440799 0.61697519434187086951 -1.2415572660686837736 -1.2855290547339182083 -2.3564118822473085757 -1.6921668521516284311 -0.77468159126142166482 -1.7574926524644953751 -1.0686305668832518645 -0.68080895588665724105 -0.040006352799327890568 -2.1146354683562100796 -0.65325130877121362349 -0.86618554938851677338 0.39183065281359674703 0.57763086116466499931 1.8038471704756089409 0.86644131632204379745 1.0136422613371993684 1.5382533153003807858 -1.2197232301505773755 0.7286338860765337877;0.72481443003208090303 1.1414172961795427952 -0.62776147595784870248 -0.40780180645974301035 -3.1428636666971496716 0.81686347915382961915 -0.13181570217453422722 0.41118190643161267595 -1.1348785880512608504 0.14954116645457349311 0.10527024185085231966 -0.93027562339751945775 1.0190229739235066031 -0.20644453165328985333 -1.1202399609739690511 0.5683355905171225686 0.50625781893651489174 0.77456170657949463543 -1.1851051041043536571 0.07286359863724115038 0.70808308908538419857 -1.1481661682156725224 -1.0585773295873042166 1.2862131975864061761 0.93847915829792927234 0.91412149501729778045 0.28232991858661588003 -0.40730898352283534392 0.2242733786408564467 -1.3175095133747345422 -0.048571049165544055715 -0.27520427567476019037 0.40672280858432241502 -0.22899122347450201476 -0.41469186124632217982 0.12567509094351259069 -0.20261360192287428128 0.60071925499821132721 -0.12810155880112378268 0.032323635556289281867 -0.29141809808266166959 -0.21938330237376285625 -0.65206197943195609579 -1.242759887335917135 0.41480956361333359839 0.42323948076493345116 0.58375461145580664901 -0.24763253953962302556 -0.36801520584935504266;0.25072835640039414784 -0.74974918990014649545 0.63777765232837657638 0.56191681352594446963 -1.3209391652408213336 0.40574772137337089539 0.45178472838798877653 -2.4666228811165766821 -0.39797131826631032547 -0.083442260470155335539 -0.6670240970625220811 1.1104540091269139435 0.93077374577100946418 0.45704869464915487409 -1.618968173058785931 -0.26285275047264278214 -0.31439382613571081881 1.1558678556723114283 1.1426330044282337894 -0.013034404738260988235 -1.7314392111643184258 0.61652177872037094986 -0.54639526678564520612 -1.2234621611006832875 -0.66280026637693423286 -0.6980174593581762732 1.1952345640024342188 0.14743876189183341419 0.7071269043306422919 1.551355419839700378 -0.54736885400575163718 -0.079073908683961621757 0.18822835890079200882 -0.10057153386666006778 -0.24659328690927323491 0.30065666848589633897 -1.8388768318373394095 -0.10858927856110353605 -0.27376751235558455244 0.24006171130413056503 0.32961745678287907024 0.77032941914087482704 -0.82397622167517148295 -0.33928246000034006924 0.81685694470163427994 0.68680313856594388255 0.61200378404589439452 -0.59081669563220373664 0.41585510026627087177;-0.012325575978258819509 -0.28400296870173280528 -0.25816367231960396511 -0.076579956785784580875 1.5598559015858588506 -0.18197950357076425609 0.13124890287620860629 0.52719103119896171261 0.028156647876833959532 -0.46645212704645894197 0.77370079421505200123 0.16629054916496821548 -0.78230479274955044833 -0.45278018772796124747 -0.82281205465978524138 0.064499679940080517637 -0.81301331204550586484 -0.58700058190335657748 -0.54397668980854929632 0.319404872862397049 0.98553182893083279836 0.12056389392412394934 0.90316838728214832166 1.530649353599345508 0.56220424854582295993 0.62179236317875141715 -0.28902746124587008758 0.32839666413369211773 -1.2281792698868907454 -0.54540858486774623781 0.34335612534009679608 0.42326867109757604357 -0.30083288186269480091 0.64553159703285878379 -0.59843629468820147554 1.0580845742252600328 0.16233403092949116875 0.076144633247382437213 -0.13805569244168500176 0.19488731860974106702 -0.25330122744480071395 -0.092736386594837447173 0.58862741971813581365 0.76482577374717319874 -0.12161161963434338751 -0.62505556815023666228 -0.50186931144948621064 -0.15082386275383380392 -0.69587799306620312656;0.26414190814332821899 0.21116751770270886235 -0.16776479649469855371 0.22987354350462421704 -0.058623401417703079053 -0.50444201575357505707 0.39326773055685460001 1.040660209971961514 -0.48808423153674018735 -0.45941798359622948444 0.55337326069952219587 -0.59583833373167938152 -0.28105283315017332013 -0.013848090484802219602 -0.18804779749063854632 -0.69007139185400567793 -1.8396705890807181216 -1.4032295527627109966 -1.476207485346844539 0.22742308247786163777 1.1921232492469002739 0.064134563986714049344 0.54315653507752226226 0.34425127656682813493 0.64138478345193983277 -0.09813455542621529748 -0.24500149574240681627 0.36779763701987877589 -0.46885225938053459727 -0.094427761689205955142 -0.22179313603236991415 0.13524970887060316915 0.80779715369873983377 0.63805095870645212042 0.24336063630946414005 -0.90570024506192703395 0.20615060995499298602 0.12411499279662777107 0.052315260118214523821 0.12518699835827984401 0.12410643942437561693 -0.13762505014817147386 0.46379010836229395132 -0.13379483069787528882 -0.11845538116172887877 -0.12298633646011128406 -0.99471190073156734446 0.6000478088353324857 0.37791107982809196697;-0.25830156441398488543 -0.38271667878484311176 -0.058827472843271097491 0.32537851410864532253 0.025067757913179375406 -0.30151303900954851134 0.47941242357617014358 -0.045165937166076960962 -0.72264340272179683478 0.17483869116146935618 0.041118878226019998923 -0.16139886336624856278 -0.050987889862406259034 0.15207494183050793146 -0.25855002195200216253 0.1490600738004292658 0.62452264015715475143 0.061560969130976500585 -0.045546225758224138935 -0.58785079755987235117 -0.40493648258710235321 0.23968171609461719207 0.048279807441041169835 0.21459300331669922679 0.47211552354512464902 0.38381711934733159231 -0.43195178268308181968 -0.23626628238419125627 -0.3736803707702477384 0.35106857972557470315 0.4281276012309552792 0.080116815544316849484 0.0101647886711108415 -0.15484957291275117108 0.29950153481097396835 -1.4903381493048515338 -0.58270651118703897797 -0.36832334773821967522 0.2302555089160759072 0.14339895490995357985 -0.38535147466533525851 -0.25650212304365649363 -1.055546585568328366 -1.0356527486042355068 -0.32758890250489913765 -0.031680908989482933769 0.22132585698890996917 -0.3180053692300641166 0.38012681631307243535;-0.18984015980584895145 1.0519558024190027723 -0.56098880497807479539 0.99952447606854943896 1.9954548820136177589 -1.4275989543921705494 0.043886155873647511583 -0.035801766518303163034 0.25680689136323764377 -0.16211440970436724607 1.4503985751911068203 0.42208846815509454276 -2.2273449305764230211 0.29365041622442022984 -0.093006744076395447829 0.62052992678619633971 0.61411262768578889215 0.48859884911594714252 -0.73434821184923160242 0.53804921555376972186 0.9426544955770014278 0.41966807947281747904 -0.10504872978279206075 -0.6072183820324743575 0.010051822649857461434 0.47595868047378492305 1.5058035399799836185 -2.9727956950437843808 -0.44915926482072410231 0.48985214366936724595 11.426886666360504208 5.5545422120912713027 1.5981872581043328196 4.1776563625870455354 4.1831738265777476116 3.0463237861700473985 3.0774324463651439032 -0.39261815819253936821 0.7707666970443993737 2.4423533532419545722 1.4613062379146308789 2.4059070234884796236 -2.268040345779745337 -1.9400404785807301433 -0.4997832984819765012 -0.5364063715959266343 -1.2886764595648532161 1.2257341649100104153 -0.78376864516276056882;0.46071117499873620593 -0.71446752161206361631 0.70452494677474553075 0.037634661872583727305 0.71146163119199701264 0.047350448173582374012 -0.27047488963615606838 -0.32898954239343503048 0.24247753107558253638 0.34606700728103118037 -0.23627658716134217198 0.91247929861050303124 0.035280008289550766898 -0.18795017516644219047 0.36837832230990330551 -1.3201382850136540448 0.49695841382261818353 -0.46026622657897747759 -0.45537862871004136656 0.19715878366541236821 0.13700442474233789913 0.12562243219182772647 0.50112486428649194448 -0.26915307412594113856 -0.57239153861830416314 -0.18341707746187149719 0.17854043794284379931 0.91563166823657904381 0.13779880760723706157 -0.40963521216594633856 -0.024716124327192889876 -0.30313455794647636843 0.80858429581612900616 0.32634142805216448391 0.23235233222093645833 -0.046095320870571082628 0.26339669901885331971 -0.063797113846983624641 -0.044065530868058200298 0.54404801702988614398 0.26246405860615518169 -0.2196093579591522349 0.30642212545600777673 -0.48137327439104093951 0.086662512553006193494 -0.46688181561725750068 0.090361657508745210632 0.055114072459805360515 0.42900379040241626294;1.1528304378745992675 0.74824087453988430418 -0.43921968095443453262 0.49068309874028326334 0.57626022236135265864 -2.3344680505850483598 -2.0802852810098277914 -0.2613299734886811998 0.58388879762308409926 -1.1411133100057624379 0.60765134015477706431 -0.9528266982661619533 0.90321832533857282499 0.41267796908950510337 0.29618751439397178471 1.8579627275865016056 -1.2167400168406810046 -1.2935274422557816454 0.073675860590993985655 -0.18157088872334004037 -0.18610832744663985405 -0.13455310748907917118 0.12055477634619846117 0.1068957295929172796 -0.11628397693821190817 0.47321229730138969494 -1.9295639556429584616 -0.31741071090488071071 -0.3972593506523285356 -0.32300101434858830007 1.2928072983284368824 -0.55599216023977315881 -0.5915881252893862019 -0.5938278587250079843 -1.1762571251548958884 -1.5350012884957178194 -1.5221093891533186149 0.551335040175124802 -0.59279659698749453955 0.35103623453830345991 0.44719487994786244478 0.74645070203744612325 0.13437223975293380307 0.36644399721348142052 -0.5127768274380833935 -0.31672853982025445108 0.082043490681555628075 -0.3002849389930239421 -0.1028835311819884385;-0.60401562114260887171 0.50242869249858579384 -0.15375935101913071335 -0.56060198611111855538 -0.28557354622436770253 0.45070640337524481289 -0.0012680532475977911167 -0.41484716613730709955 0.15796158448176589317 -0.15477995220311990821 -0.15374833615802954712 -0.83766348412556346226 1.3330286101648269881 -0.57933108317665493736 0.90192322032063099169 -0.34851328047582402769 -0.93072677836530404161 -0.54275432686892111089 -0.36957790616688163121 -0.87472819435523496701 0.4042114781183510086 -0.45099386533459695503 1.4266644410738043014 0.57002063089716104027 0.58833208791400670723 0.26989483629191790559 0.13682273269112987801 0.30726276773073757376 0.5824449061417374951 -0.66609325496083826579 0.93393673873310234512 1.7289213611360521039 0.30760792030673866915 0.97028345797546000639 0.9801423963711198839 0.80284826047795898596 0.47326379958249842339 0.35817973615692572098 -1.1372748102580403362 0.48485363572086553896 -0.29152190798324578713 0.10295351239898620221 -0.30663293073346936657 0.1235901125601071987 -0.49842664584176965548 -0.36713503548805420662 -0.40481268007394505259 0.63323935129527586518 -0.21753397657079126537;-0.16069295696716595634 2.0035375515819739967 0.014360031352786493258 0.68261300666046242913 -1.7974135675210032304 0.35363471785934080804 0.16988661694732501428 0.26266540848617025983 -0.52856308455616274333 0.72272545886893424516 -1.007361631042529293 0.81760898021127814683 -0.9882017104161809895 1.4635859552254770755 0.58351434733130203014 -0.28978499023430887016 -1.069886877683894788 0.4490441299441754186 -0.65118647492541459343 0.35717838408475738321 0.32371648354316795437 -0.3302215775800779185 0.15610987663071312914 0.2388446009629377198 -0.12315512700569233862 0.21654710953612285596 0.76707979015372029785 -1.1026348481276506686 0.44147800081287774665 0.0069150011650826806453 -0.1822543285365393062 -0.81211322933376750566 -0.72552277934272324522 1.4577924226040761546 1.4228806519377104056 2.9167319350318643423 1.6865418567060959099 0.014378245437163567066 -1.9403803587795800389 -0.89321229132130797179 -0.33083988144895953853 0.11341049209059364533 -1.2302476653004277285 -1.0106194750288217676 -0.89716499380635694738 -0.90910111107436497591 -0.33817739435965649131 0.43300703706657839298 -0.61673218624511971786;-0.4481106713935607555 -0.66251409398984706378 -0.69031542985483673736 2.0478899296252213169 -0.35319281954224901465 -0.60323216474654584029 0.1840983697313299805 0.56486695770641115466 -0.1231318669434915275 0.037795878392438836402 -0.63893095885349016072 0.77535771823440025052 -0.39462231369716505025 0.27791470955411706756 0.16749547826873370515 0.91525208775313304788 -0.020943455835538346554 0.24800788948216928587 0.13514644762546285106 0.52373059739273020163 -0.48596450649484190798 1.1646273197623346896 -0.23971676333736546827 -0.49478880756920728956 -0.22534543730533546091 -1.2440453200770715814 0.00035956492236870196688 -0.55487430412694793702 0.15938280026897544417 -0.043284842127004605206 0.64587775281993264898 0.7023650162932035812 0.10439172256021711505 0.47195767322632792284 -0.072395150988070408604 -0.090607062566490093047 -0.58390316583910162329 -0.54220226203342536397 -0.074833595002849750966 0.4453474586562776727 0.87299202739383452432 0.28790620663158073 0.56955398897186926277 0.067192307289079461485 0.23470380913004584844 -0.1465748470501190559 0.74276785106467113629 -0.99920706141150894553 -0.51210606902700284149;-0.59433964877890044232 -1.0116972000254185193 -0.1084655345225299522 -0.5416162700624710391 1.5765102427010362351 -0.056732005713671554425 1.2569871713074558528 1.9669947232643798518 1.3038278949542307927 -1.3738025019610604627 0.73095713532141437518 -1.3678208765473853781 -0.82212500037003566344 -0.78413394574836181583 0.43532524244672965441 0.73969067298488389017 -0.58320197259609207752 -0.11803832440836181661 0.087146337058731329628 0.18018099515330643356 0.28321732597761350991 -0.48612148800762855494 0.27459070164771454126 -0.19395648933124612356 0.079352417179267692449 1.3120159665954640449 0.55355598399788741304 0.9356865045647784207 0.16082952455329840857 0.14063528324463087094 -0.22876831264353886253 -0.70580785938108325794 0.76163319417354302665 0.47732885797581842136 0.095055029674821989172 -0.31229892738979581068 -0.4703901673561899921 -0.021141861472628586949 0.19993486967978227331 0.33228945185184094457 -0.44807757945435883196 0.49842521753707358378 -0.30238120181374877893 0.22408960155404172854 0.69910795973345696286 1.0717800815032341166 -0.23431703719679111697 -0.15434548220823418596 -0.097468453481236450031;-0.11281869335336823512 -1.877910238807105392 -0.073245131473738067651 -0.28665801820367797781 1.0927813792687883776 0.26259486365848550005 -0.409534169038281326 -1.1095894377444532886 0.88070598595115723306 -0.18454383723944600693 0.41047231308361747937 -0.31532716423668516459 0.56448240497681601013 -0.74453082239550705257 -0.24418351795643344904 0.83003996899595722248 -0.037675096634409412089 0.80514300939970584459 0.59529592610043990941 0.006220188695850496774 -1.0543249871901971826 0.18467030918805990569 -0.093288768515942255277 -0.11769620574985105443 -0.45475683329152671863 -0.41598337724162215423 -0.1149962786209646759 0.24959939118817900394 0.72194041429602096027 -0.13250144110801007069 0.75229870274495058702 -0.15424639539629766971 -0.15501433791494600989 0.24736242584665613098 -0.81716347092893570903 -0.5492625001728169698 0.3592089010905948343 -0.10270032689488164945 -0.21654265506433681421 -0.034136508690966509139 -0.062173957167942953128 -0.035573057837368173006 0.58117207483752775232 0.14015070028327275553 0.40294783429654723594 0.64226151909646955751 0.46078603355090103078 -0.98354047310998105047 0.88474990828936950216;0.41331017013200127552 -0.12381505679756862892 -0.47921908162602039338 0.77262133853135439576 -3.0430950579108033693 -0.084135809876789230399 -0.48759143335397969743 -0.33507669047217236713 0.19975779740010038421 -0.5488259186146378088 -0.29191139532042675864 0.31252213181356874871 1.536408354956084521 0.72222915010833832472 -0.42475692013393279156 -0.14908251445972098281 0.81122774366291250381 0.9041608971910406467 -0.78366057724617688152 -0.76884602057357276372 -1.7703844781813646847 -0.93848678281124731093 2.2166869076067179378 -1.5876696042931048858 -1.4631352183316923554 -1.0586250927659861532 -1.1165149775814400268 0.28962273672374883038 -1.2810871389817788391 -2.0445831362262674169 3.1054538396039110815 1.1163321226570763756 0.25771340119761093623 -2.4936744456512993651 -0.68121449320183591336 -1.0587115185543860552 -2.0616570124924931129 0.080759473190119862585 1.4643464880816050577 -0.23004334591908726093 0.63233442379680937506 -0.14882874794496520066 0.70616470636431194485 -0.28454434673236772557 0.72684736456842236052 0.57228109918117597843 1.5724912533028156947 -0.80246419305128546817 -0.011868987600804216387;0.051902246434436277722 0.72121232584247518815 -0.41374382241020279949 0.22550813431929708774 -1.0026587816325496227 0.77058069734753498192 -0.029437438340762914213 -0.16827256095046513873 -0.16244428391888568464 0.10646330671557178993 -0.47729990462468913082 -0.77297763701287236504 1.1284683700956381625 -0.47438060856834379786 1.1340642564551182137 -0.49674588548259196452 -0.4985827556175827513 -0.67262664456323917328 -1.7008736924895997422 0.017776710776239351697 0.70878785433729818433 0.33931423288324336074 0.58791710857187573502 1.2515015753627476425 0.19217518182746107236 0.62830975328200466823 0.42696559986577187207 1.0424096971497307518 -0.42799235877672453521 -1.1506157398256180446 1.4561652795274910854 1.3624225904795879138 2.0086613809306119727 0.28925927968645304134 1.2568373183444905283 1.7073325543537767324 0.50808948154336452951 0.13893948113714368886 0.23671580038486761399 -0.6375409413855416263 -0.38981109707475736226 -0.29872366411934198061 -0.14386769002052526845 -0.47336948156792812981 -0.32763078341400131421 -1.0917706495686898549 -1.0849597597966755824 0.18762288064269280752 0.33887412011352840979;0.061107617504733147129 0.0091209189323300399882 1.3882618928169108141 -0.25105021441565289475 0.5653700694526172521 -1.0963991420943679511 -0.66730817495650995852 -0.50150494866358419355 0.2763074032415948067 -0.36008683115939754682 0.1202967015603413764 0.034781605285550243334 -0.64213204732817052989 -0.41915545221551464561 -1.849271423095024014 -0.19195871831446051359 0.028846255536160950173 0.63429094419493958767 0.62260529208051318406 -0.026254463450918884282 -0.24670504783870911281 -1.0369235936710066159 0.33180966722367122301 -0.39556705212052056808 0.072884861670208522799 -0.034185679241843215659 -0.054708602647555101828 0.018332278227716637675 -0.31333897166224622399 0.040148263943326538417 -0.40224204293486659489 -0.54788663381555491316 0.0047117990276535903771 -0.64229648138703610005 -1.0829459792371542992 -1.3033626003426403983 -0.33765904254876510926 -0.09652481806843320189 0.38190695602060498182 0.19945742018406042995 -0.29744639048548582316 0.2284864080653398466 0.73602913243654788378 1.1133501652663515546 -0.074476532279038443196 0.14615310330038355779 0.60213683826775754593 -0.59094087569596143172 0.35259618173381540585;0.17040806877205411096 0.12645963583877178893 0.228353335790197981 -0.26509660576634236362 -0.059334246607222626557 -0.3293609177566007018 0.098572850052351543293 0.19423281982255277689 -0.35117882591020660454 -0.08424170704141605015 0.27638814086940488579 0.053580684143955059628 0.21644526195015439951 0.15377451158485744287 0.15971247393922996527 -0.14995786280336831364 0.31873600096749354904 -0.0960260438208095507 0.077069951449477855365 -0.27309357464316769137 -0.18785970935163093243 -0.34897523804988755947 0.15619622506313310395 -0.13048032706442752593 0.096203802569175433934 -0.14179993934784471121 0.17705053378514509776 -0.39918050193017190486 0.13118360456430835925 0.078288192967720160453 0.045512259314501174456 -0.35491497496140378409 -0.33469747854144377142 -0.12001180383290746545 0.14693699978980712118 -0.22880950582031678309 0.27671629394929231349 -0.043134296263339540201 -0.20128582963935237604 -0.29498501760867607002 -0.41701437063123120152 -0.38427569190912641561 0.0014017168883270697891 -0.25632107335726483921 -0.21913467724303778428 -0.28957563353122867111 0.20668934580268916168 0.1904177913476132189 -0.057043455249384374117];

% Layer 2
b2 = -2.182578234154899377;
LW2_1 = [2.4054808017517075314 -2.7356198798916881998 -5.651140412803362878 -1.3106297254441874323 -2.9264357569679368964 -2.4707839860412637023 -2.9182691330141898867 -2.7564502828276200574 -8.2233237987085665566 -2.0011657363976413926 -3.2061116788624013374 -3.8439274965102754322 -3.2005251735946158576 -1.8030183167393745158 -1.4053078609765463636 -3.4203903332593537101 5.7515360936468260533 2.8696347457173843054 2.2185166453022064914 -1.5484088803881137508];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 2;
y1_step1.xoffset = 0;

% ===== SIMULATION ========

% Dimensions
Q = size(x1,1); % samples

% Input 1
x1 = x1';
xp1 = mapminmax_apply(x1,x1_step1);

% Layer 1
a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*xp1);

% Layer 2
a2 = repmat(b2,1,Q) + LW2_1*a1;

% Output 1
y1 = mapminmax_reverse(a2,y1_step1);
y1 = y1';
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end
