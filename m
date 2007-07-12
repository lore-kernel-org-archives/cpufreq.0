From: Karel =?iso-8859-2?q?Voln=FD?= <kavol@seznam.cz>
Subject: cpufrequtils Czceh translation
Date: Thu, 12 Jul 2007 12:35:53 +0200
Message-ID: <200707121235.53354.kavol@seznam.cz>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_JQglG2loBk8F6WB"
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@lists.linux.org.uk

--Boundary-00=_JQglG2loBk8F6WB
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


Hello,

I would like to contribute the Czech translation of the cpufrequtils package - 
see the attachment

for the Czech users on this list (if any?) - please test, and do not beat me 
for the use of "regulator" for "governor" ... it seems to be the prevalent 
translation

K.

--Boundary-00=_JQglG2loBk8F6WB
Content-Type: application/x-gettext;
  name="cs.po"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="cs.po"

# Czech translation for cpufrequtils package
# Czech messages for cpufrequtils.
# Copyright (C) 2007 kavol
# This file is distributed under the same license as the cpufrequtils packa=
ge.
#
# Karel Voln=C3=BD <kavol@seznam.cz>, 2007.
msgid ""
msgstr ""
"Project-Id-Version: cs\n"
"Report-Msgid-Bugs-To: \n"
"POT-Creation-Date: 2006-03-26 12:01+0200\n"
"PO-Revision-Date: 2007-07-12 12:25+0200\n"
"Last-Translator: Karel Voln=C3=BD <kavol@seznam.cz>\n"
"Language-Team: =C4=8De=C5=A1tina <cs@li.org>\n"
"MIME-Version: 1.0\n"
"Content-Type: text/plain; charset=3DUTF-8\n"
"Content-Transfer-Encoding: 8bit\n"
"Plural-Forms:  nplurals=3D3; plural=3D(n=3D=3D1) ? 0 : (n>=3D2 && n<=3D4) =
? 1 : 2;\n"
"X-Generator: KBabel 1.11.4\n"

#: utils/info.c:36
#, c-format
msgid "Couldn't count the number of CPUs (%s: %s), assuming 1\n"
msgstr "Nelze zjistit po=C4=8Det CPU (%s: %s), p=C5=99edpokl=C3=A1d=C3=A1 s=
e 1.\n"

#: utils/info.c:67
#, c-format
msgid "          minimum CPU frequency  -  maximum CPU frequency  -  govern=
or\n"
msgstr "         minim=C3=A1ln=C3=AD frekvence CPU - maxim=C3=A1ln=C3=AD fr=
ekvence CPU -  regul=C3=A1tor\n"

#: utils/info.c:125
#, c-format
msgid "couldn't analyze CPU %d as it doesn't seem to be present\n"
msgstr "nelze analyzovat CPU %d, vypad=C3=A1 to, =C5=BEe nen=C3=AD p=C5=99=
=C3=ADtomen\n"

#: utils/info.c:129
#, c-format
msgid "analyzing CPU %d:\n"
msgstr "analyzuji CPU %d:\n"

#: utils/info.c:136
#, c-format
msgid "  no or unknown cpufreq driver is active on this CPU\n"
msgstr "  pro tento CPU nen=C3=AD aktivn=C3=AD =C5=BE=C3=A1dn=C3=BD zn=C3=
=A1m=C3=BD ovlada=C4=8D cpufreq\n"

#: utils/info.c:138
#, c-format
msgid "  driver: %s\n"
msgstr "  ovlada=C4=8D: %s\n"

#: utils/info.c:144
#, c-format
msgid "  CPUs which need to switch frequency at the same time: "
msgstr "  CPU, kter=C3=A9 mus=C3=AD m=C4=9Bnit frekvenci z=C3=A1rove=C5=88:=
 "

#: utils/info.c:154
#, c-format
msgid "  hardware limits: "
msgstr "  hardwarov=C3=A9 meze: "

#: utils/info.c:163
#, c-format
msgid "  available frequency steps: "
msgstr "  dostupn=C3=A9 frekvence: "

#: utils/info.c:176
#, c-format
msgid "  available cpufreq governors: "
msgstr "  dostupn=C3=A9 regul=C3=A1tory: "

#: utils/info.c:187
#, c-format
msgid "  current policy: frequency should be within "
msgstr "  sou=C4=8Dasn=C3=A1 taktika: frekvence by m=C4=9Bla b=C3=BDt mezi "

#: utils/info.c:189
#, c-format
msgid " and "
msgstr " a "

#: utils/info.c:193
#, c-format
msgid ""
"The governor \"%s\" may decide which speed to use\n"
"                  within this range.\n"
msgstr ""
"  Regul=C3=A1tor \"%s\" m=C5=AF=C5=BEe rozhodnout jakou frekvenci pou=C5=
=BE=C3=ADt\n"
"                    v t=C4=9Bchto mez=C3=ADch.\n"

#: utils/info.c:200
#, c-format
msgid "  current CPU frequency is "
msgstr "  sou=C4=8Dasn=C3=A1 frekvence CPU je "

#: utils/info.c:203
#, c-format
msgid " (asserted by call to hardware)"
msgstr "  (zji=C5=A1t=C4=9Bno hardwarov=C3=BDm vol=C3=A1n=C3=ADm)"

#: utils/info.c:320 utils/set.c:30
#, c-format
msgid "Report errors and bugs to %s, please.\n"
msgstr ""
"Chyby v programu pros=C3=ADm hlaste na %s (anglicky).\n"
"Chyby v p=C5=99ekladu pros=C3=ADm hlaste na kavol@seznam.cz (=C4=8Desky ;-=
)\n"

#: utils/info.c:324
#, c-format
msgid "Usage: cpufreq-info [options]\n"
msgstr "U=C5=BEit=C3=AD: cpufreq-info [p=C5=99ep=C3=ADna=C4=8De]\n"

#: utils/info.c:325 utils/set.c:35
#, c-format
msgid "Options:\n"
msgstr "P=C5=99ep=C3=ADna=C4=8De:\n"

#: utils/info.c:326
#, c-format
msgid ""
"  -c CPU, --cpu CPU    CPU number which information shall be determined "
"about\n"
msgstr "  -c CPU, --cpu CPU    =C4=8C=C3=ADslo CPU, o kter=C3=A9m se maj=C3=
=AD zjistit informace\n"

#: utils/info.c:327
#, c-format
msgid "  -e, --debug          Prints out debug information\n"
msgstr "  -e, --debug          Vyp=C3=AD=C5=A1e ladic=C3=AD informace\n"

#: utils/info.c:328
#, c-format
msgid ""
"  -f, --freq           Get frequency the CPU currently runs at, according\=
n"
"                       to the cpufreq core *\n"
msgstr ""
"  -f, --freq           Zjist=C3=AD aktu=C3=A1ln=C3=AD frekvenci, na kter=
=C3=A9 CPU b=C4=9B=C5=BE=C3=AD\n"
"                       podle cpufreq *\n"

#: utils/info.c:330
#, c-format
msgid ""
"  -w, --hwfreq         Get frequency the CPU currently runs at, by reading=
\n"
"                       it from hardware (only available to root) *\n"
msgstr ""
"  -w, --hwfreq         Zjist=C3=AD aktu=C3=A1ln=C3=AD frekvenci, na kter=
=C3=A9 CPU b=C4=9B=C5=BE=C3=AD\n"
"                       z hardware (dostupn=C3=A9 jen u=C5=BEivateli root) =
*\n"

#: utils/info.c:332
#, c-format
msgid ""
"  -l, --hwlimits       Determine the minimum and maximum CPU frequency "
"allowed *\n"
msgstr ""
"  -l, --hwlimits       Zjist=C3=AD minim=C3=A1ln=C3=AD a maxim=C3=A1ln=C3=
=AD dostupnou frekvenci CPU "
"*\n"

#: utils/info.c:333
#, c-format
msgid "  -d, --driver         Determines the used cpufreq kernel driver *\n"
msgstr "  -d, --driver         Zjist=C3=AD aktivn=C3=AD ovlada=C4=8D cpufre=
q *\n"

#: utils/info.c:334
#, c-format
msgid "  -p, --policy         Gets the currently used cpufreq policy *\n"
msgstr "  -p, --policy         Zjist=C3=AD aktu=C3=A1ln=C3=AD taktiku cpufr=
eq *\n"

#: utils/info.c:335
#, c-format
msgid "  -g, --governors      Determines available cpufreq governors *\n"
msgstr "  -g, --governors      Zjist=C3=AD dostupn=C3=A9 regul=C3=A1tory cp=
ufreq *\n"

#: utils/info.c:336
#, c-format
msgid ""
"  -a, --affected-cpus  Determines which CPUs can only switch frequency at "
"the\n"
"                       same time *\n"
msgstr "  -a, --affected-cpus  Zjist=C3=AD, kter=C3=A9 CPU mus=C3=AD m=C4=
=9Bnit frekvenci z=C3=A1rove=C5=88 *\n"

#: utils/info.c:338
#, c-format
msgid ""
"  -o, --proc           Prints out information like provided by the /proc/"
"cpufreq\n"
"                       interface in 2.4. and early 2.6. kernels\n"
msgstr ""
"  -o, --proc           Vyp=C3=AD=C5=A1e informace ve form=C3=A1tu, jak=C3=
=BD pou=C5=BE=C3=ADvalo rozhran=C3=AD"
"                            /proc/cpufreq v kernelech =C5=99ady 2.4 a =C4=
=8Dasn=C3=A9 2.6\n"

#: utils/info.c:340
#, c-format
msgid "  -m, --human          human-readable output for the -f and -w param=
eters\n"
msgstr ""
"  -m, --human          Vyp=C3=AD=C5=A1e v=C3=BDstup parametr=C5=AF -f a -w=
 v =E2=80=9Elidmi =C4=8Diteln=C3=A9m=E2=80=9C\n"
"                       form=C3=A1tu (MHz, GHz)\n"

#: utils/info.c:341 utils/set.c:42
#, c-format
msgid "  -h, --help           Prints out this screen\n"
msgstr "  -h, --help           Vyp=C3=AD=C5=A1e tuto n=C3=A1pov=C4=9Bdu\n"

#: utils/info.c:344
#, c-format
msgid ""
"If no argument or only the -c, --cpu parameter is given, debug output abou=
t\n"
"cpufreq is printed which is useful e.g. for reporting bugs.\n"
msgstr ""
"Nen=C3=AD-li zad=C3=A1n =C5=BE=C3=A1dn=C3=BD parametr nebo je-li zad=C3=A1=
n pouze p=C5=99ep=C3=ADna=C4=8D -c, --cpu, jsou\n"
"vyps=C3=A1ny ladic=C3=AD informace, co=C5=BE m=C5=AF=C5=BEe b=C3=BDt u=C5=
=BEite=C4=8Dn=C3=A9 nap=C5=99=C3=ADklad p=C5=99i hl=C3=A1=C5=A1en=C3=AD chy=
b.\n"

#: utils/info.c:346
#, c-format
msgid ""
"For the arguments marked with *, omitting the -c or --cpu argument is\n"
"equivalent to setting it to zero\n"
msgstr ""
"Nen=C3=AD-li p=C5=99i pou=C5=BEit=C3=AD p=C5=99ep=C3=ADna=C4=8D=C5=AF ozna=
=C4=8Den=C3=BDch * zad=C3=A1n parametr -c nebo --cpu,\n"
"p=C5=99edpokl=C3=A1d=C3=A1 se jeho hodnota 0.\n"

#: utils/info.c:434
#, c-format
msgid ""
"The argument passed to this tool can't be combined with passing a --cpu "
"argument\n"
msgstr "Zadan=C3=BD parametr nem=C5=AF=C5=BEe b=C3=BDt pou=C5=BEit z=C3=A1r=
ove=C5=88 s p=C5=99ep=C3=ADna=C4=8Dem -c nebo --cpu\n"

#: utils/info.c:447
#, c-format
msgid ""
"You can't specify more than one --cpu parameter and/or\n"
"more than one output-specific argument\n"
msgstr ""
"Nelze zadat v=C3=ADce ne=C5=BE jeden parametr -c nebo --cpu\n"
"anebo v=C3=ADce ne=C5=BE jeden parametr ur=C4=8Duj=C3=ADc=C3=AD v=C3=BDstu=
p\n"

#: utils/info.c:453 utils/set.c:79
#, c-format
msgid "invalid or unknown argument\n"
msgstr "neplatn=C3=BD nebo nezn=C3=A1m=C3=BD parametr\n"

#: utils/set.c:34
#, c-format
msgid "Usage: cpufreq-set [options]\n"
msgstr "U=C5=BEit=C3=AD: cpufreq-set [p=C5=99ep=C3=ADna=C4=8De]\n"

#: utils/set.c:36
#, c-format
msgid ""
"  -c CPU, --cpu CPU        number of CPU where cpufreq settings shall be "
"modified\n"
msgstr "  -c CPU, --cpu CPU        =C4=8C=C3=ADslo CPU pro kter=C3=BD se m=
=C3=A1 prov=C3=A9st nastaven=C3=AD cpufreq\n"

#: utils/set.c:37
#, c-format
msgid ""
"  -d FREQ, --min FREQ      new minimum CPU frequency the governor may "
"select\n"
msgstr "  -d FREQ, --min FREQ      Nov=C3=A1 nejni=C5=BE=C5=A1=C3=AD frekve=
nce, kterou m=C5=AF=C5=BEe regul=C3=A1tor vybrat\n"

#: utils/set.c:38
#, c-format
msgid ""
"  -u FREQ, --max FREQ      new maximum CPU frequency the governor may "
"select\n"
msgstr "  -u FREQ, --max FREQ      Nov=C3=A1 nejvy=C5=A1=C5=A1=C3=AD frekve=
nce, kterou m=C5=AF=C5=BEe regul=C3=A1tor zvolit\n"

#: utils/set.c:39
#, c-format
msgid "  -g GOV, --governor GOV   new cpufreq governor\n"
msgstr "  -g GOV, --governors GOV  Nov=C3=BD regul=C3=A1tor cpufreq\n"

#: utils/set.c:40
#, c-format
msgid ""
"  -f FREQ, --freq FREQ     specific frequency to be set. Requires userspac=
e\n"
"                           governor to be available and loaded\n"
msgstr ""
"  -f FREQ, --freq FREQ     Frekvence, kter=C3=A1 m=C3=A1 b=C3=BDt nastaven=
a. Vy=C5=BEaduje, aby byl\n"
"                           v j=C3=A1d=C5=99e nahr=C3=A1n regul=C3=A1tor =
=E2=80=9Auserspace=E2=80=98.\n"

#: utils/set.c:44
#, c-format
msgid ""
"Notes:\n"
"1. Omitting the -c or --cpu argument is equivalent to setting it to zero\n"
"2. The -f FREQ, --freq FREQ parameter cannot be combined with any other "
"parameter\n"
"   except the -c CPU, --cpu CPU parameter\n"
"3. FREQuencies can be passed in Hz, kHz (default), MHz, GHz, or THz\n"
"   by postfixing the value with the wanted unit name, without any space\n"
"   (FREQuency in kHz =3D^ Hz * 0.001 =3D^ MHz * 1000 =3D^ GHz * 1000000).\=
n"
msgstr ""
"Pozn=C3=A1mky:\n"
"1. Vynech=C3=A1n=C3=AD parametru -c nebo --cpu je ekvivalentn=C3=AD jeho n=
astaven=C3=AD na 0\n"
"2. P=C5=99ep=C3=ADna=C4=8D -f nebo --freq nem=C5=AF=C5=BEe b=C3=BDt pou=C5=
=BEit z=C3=A1rove=C5=88 s =C5=BE=C3=A1dn=C3=BDm jin=C3=BDm vyjma -c\n"
"   nebo --cpu\n"
"3. Frekvence (FREQ) mohou b=C3=BDt zad=C3=A1ny v Hz, kHz (v=C3=BDchoz=C3=
=AD), MHz, GHz nebo THz\n"
"   p=C5=99ipojen=C3=ADm n=C3=A1zvu jednotky bez mezery mezi =C4=8D=C3=ADsl=
em a jednotkou\n"
"   (FREQ v kHz =3D^ Hz * 0,001 =3D ^ MHz * 1000 =3D^ GHz * 1000000)\n"

#: utils/set.c:251
#, c-format
msgid ""
"the -f/--freq parameter cannot be combined with -d/--min, -u/--max or\n"
"-g/--governor parameters\n"
msgstr ""
"p=C5=99ep=C3=ADna=C4=8D -f/--freq nem=C5=AF=C5=BEe b=C3=BDt pou=C5=BEit z=
=C3=A1rove=C5=88\n"
"s p=C5=99ep=C3=ADna=C4=8Dem -d/--min, -u/--max nebo -g/--governor\n"

#: utils/set.c:262
#, c-format
msgid ""
"At least one parameter out of -f/--freq, -d/--min, -u/--max, and\n"
"-g/--governor must be passed\n"
msgstr ""
"Mus=C3=AD b=C3=BDt zad=C3=A1n alespo=C5=88 jeden p=C5=99ep=C3=ADna=C4=8D\n"
"-f/--freq, -d/--min, -u/--max nebo -g/--governor\n"

#: utils/set.c:282
#, c-format
msgid "wrong, unknown or unhandled CPU?\n"
msgstr "nezn=C3=A1m=C3=BD nebo nepodporovan=C3=BD CPU?\n"

#: utils/set.c:306
#, c-format
msgid ""
"Error setting new values. Common errors:\n"
"- Do you have proper administration rights? (super-user?)\n"
"- Is the governor you requested available and modprobed?\n"
"- Trying to set an invalid policy?\n"
"- Trying to set a specific frequency, but userspace governor is not "
"available,\n"
"   for example because of hardware which cannot be set to a specific "
"frequency\n"
"   or because the userspace governor isn't loaded?\n"
msgstr ""
"Chyba p=C5=99i nastavov=C3=A1n=C3=AD nov=C3=BDch hodnot. Obvykl=C3=A9 prob=
l=C3=A9my:\n"
"- M=C3=A1te pat=C5=99i=C4=8Dn=C3=A1 administr=C3=A1torsk=C3=A1 pr=C3=A1va?=
 (root?)\n"
"- Je po=C5=BEadovan=C3=BD regul=C3=A1tor dostupn=C3=BD v j=C3=A1d=C5=99e? =
(modprobe?)\n"
"- Sna=C5=BE=C3=ADte se nastavit neplatnou taktiku?\n"
"- Sna=C5=BE=C3=ADte se nastavit ur=C4=8Ditou frekvenci, ale nen=C3=AD dost=
upn=C3=BD\n"
"  regul=C3=A1tor =E2=80=9Auserspace=E2=80=98, nap=C5=99=C3=ADklad proto=C5=
=BEe nen=C3=AD nahr=C3=A1n v j=C3=A1d=C5=99e,\n"
"  nebo nelze na tomto hardware nastavit ur=C4=8Ditou frekvenci?\n"


--Boundary-00=_JQglG2loBk8F6WB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@lists.linux.org.uk
http://lists.linux.org.uk/mailman/listinfo/cpufreq

--Boundary-00=_JQglG2loBk8F6WB--

