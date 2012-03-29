From: =?UTF-8?B?TsOpbWV0aCBNw6FydG9u?= <nm127@freemail.hu>
Subject: Re: synchronize gnome applets update interval?
Date: Thu, 29 Mar 2012 08:25:55 +0200
Message-ID: <4F740073.5020302@freemail.hu>
References: <4F7297D2.1050109@freemail.hu> <4F72EF01.1060408@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <4F72EF01.1060408@gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Alex Murray <murray.alex@gmail.com>, Dave Jones <davej@redhat.com>, cpufreq@vger.kernel.org
Cc: pkg-gnome-maintainers@lists.alioth.debian.org, Sam Morris <sam@robots.org.uk>, Filippo Giunchedi <filippo@esaurito.net>, Josselin Mouette <joss@debian.org>, Michael Biebl <biebl@debian.org>, "Guilherme de S. Pastore" <gpastore@debian.org>, Emilio Pozuelo Monfort <pochu@debian.org>, Gustavo Noronha Silva <kov@debian.org>, =?UTF-8?B?U2ViYXN0aWFuIERyw7ZnZQ==?= <slomo@debian.org>, Carlos Garcia Campos <carlosgc@gnome.org>, Martin Baulig <martin@home-of-linux.org>, Todd Kulesza <fflewddur@dropline.net>, =?UTF-8?B?QmVub8OudCBEZWplYW4=?= <tazforever@dlfp.org>, Davyd Madeley <davyd@madeley.id.au>, gnome-devel-list@gnome.org, discuss@lesswatts.org

Hi Alex,
Alex Murray wrote:
> On Wed 28 Mar 2012 15:17:14 CST, N=C3=A9meth M=C3=A1rton wrote:
>> Hi Alex, Carlos, Martin, Todd, Beno=C3=AEt and Davyd,
>>
>> I'm using your gnome applets to monitor the following things on my l=
aptop:
>>   - CPU temperature (sensors-applet, http://sensors-applet.sourcefor=
ge.net/ )
>>   - CPU usage (multiload-applet-2)
>>   - CPU frequency (cpufreq-applet)
>>
>> My primary goal is to keep the CPU fan quiet as far as possible. Thi=
s can
>> be achieved if the CPU temperature is kept low which depends on the =
CPU
>> usage and on CPU frequency.
>>
>> Then I run powertop 1.13 ( http://www.lesswatts.org/projects/powerto=
p/ )
>> to see what processes are causing wakeups. I realized that the apple=
ts I
>> run in order to have an overview on the CPU usage causes additional =
CPU wakeups.
>>
>> So I modified the refresh interval of sensors-applet to 5.0s.
>> The cpufreq-applet does not have any possibility to reduce the updat=
e interval.
>> I also modified the default update interval of multiload-applet-2 to=
 5000ms.
>>
>> As you can see I can set up two of the applets to wake up the CPU on=
ce in
>> 5 seconds, but these two alone will wake up the CPU worst case every=
 2.5 seconds.
>>
>> I don't know if there is any possibility to synchronize the gnome ap=
plets
>> so that they wakes up one after the other causing only one wakeup ev=
ery 5 seconds.
>>
>> Here is the list of software versions I used:
>>
>> $ lsb_release -a
>> LSB Version:
>> core-2.0-ia32:core-2.0-noarch:core-3.0-ia32:core-3.0-noarch:core-3.1=
-ia32:core-3.1-noarch:core-3.2-ia32:core-3.2-noarch:cxx-3.0-ia32:cxx-3.=
0-noarch:cxx-3.1-ia32:cxx-3.1-noarch:cxx-3.2-ia32:cxx-3.2-noarch:deskto=
p-3.1-ia32:desktop-3.1-noarch:desktop-3.2-ia32:desktop-3.2-noarch:graph=
ics-2.0-ia32:graphics-2.0-noarch:graphics-3.0-ia32:graphics-3.0-noarch:=
graphics-3.1-ia32:graphics-3.1-noarch:graphics-3.2-ia32:graphics-3.2-no=
arch:qt4-3.1-ia32:qt4-3.1-noarch
>> Distributor ID: Debian
>> Description:    Debian GNU/Linux 6.0.4 (squeeze)
>> Release:        6.0.4
>> Codename:       squeeze
>> $ dpkg -l gnome-power-manager gnome-applets sensors-applet
>> Desired=3DUnknown/Install/Remove/Purge/Hold
>> | Status=3DNot/Inst/Conf-files/Unpacked/halF-conf/Half-inst/trig-aWa=
it/Trig-pend
>> |/ Err?=3D(none)/Reinst-required (Status,Err: uppercase=3Dbad)
>> ||/ Name                             Version                        =
  Description
>> +++-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D-=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
>> ii  gnome-applets                    2.30.0-3                       =
  Various applets for the GNOME panel - binary files
>> ii  gnome-power-manager              2.32.0-2                       =
  power management tool for the GNOME desktop
>> ii  sensors-applet                   2.2.5-4                        =
  Display readings from hardware sensors in your Gnome panel
>>
>> Regards,
>>
>> 	M=C3=A1rton N=C3=A9meth
>>
>=20
> Hi M=C3=A1rton,
>=20
> Thankfully you needn't worry too much about unsynchronised wakeups=20
> since the glib developers already thought of this and there exists th=
e=20
> function g_timeout_add_seconds() [1] which causes the wakeups to occu=
r=20
> in whole second amounts AT whole second intervals - so multiple wakeu=
ps=20
> are synchronised for exactly the reason you want.
>=20
> sensors-applet already uses this [2] as does cpufreq [3] however it=20
> looks like multiload doesn't [4] - but a simple patch to change this =
to=20
> the seconds variant shouldn't be too hard and should then allow all 3=
=20
> to be in sync (as far as I can tell).
>=20
> Cheers
> Alex
>=20
> [1]=20
> http://developer.gnome.org/glib/2.30/glib-The-Main-Event-Loop.html#g-=
timeout-add-seconds-full
> [2]=20
> http://sensors-applet.git.sourceforge.net/git/gitweb.cgi?p=3Dsensors-=
applet/sensors-applet;a=3Dblob;f=3Dsensors-applet/sensors-applet.c;h=3D=
e9801a05f2be8631c2bfa59ed299e338a7be57c5;hb=3DHEAD#l1415
> [3]=20
> http://git.gnome.org/browse/gnome-applets/tree/cpufreq/src/cpufreq-mo=
nitor.c#n319
> [4]=20
> http://git.gnome.org/browse/gnome-applets/tree/multiload/load-graph.c=
#n377

Thanks for your quick and into deep description of this question.

Reading [1] rises some more questions for me. To summarize:

 - sensors-applet uses g_timeout_add_seconds() [2], shouldn't it use g_=
timeout_add_seconds_full()?
 - cpufreq-monitor uses g_timeout_add_seconds() [3], this has to be rep=
laced with g_timeout_add_seconds_full()
 - multiload uses g_timeout_add(): if the interval parameter is multipl=
e of 1000ms
   then the g_timeout_add_seconds_full() can be used.

The function g_timeout_add_seconds_full() [1] solves the problem when d=
ifferent
applets are required to run at 1000ms intervals. As I can see, however,=
 this does
not solve the case when the interval is set up for example to 5000ms. W=
orst case
I can have the following scenario with three applets, each of them is s=
et up to
5000ms refresh time assuming all of them uses g_timeout_add_seconds_ful=
l():

t =3D 0ms: sensors-applet runs
t =3D 1000ms: cpufreq-monitor runs
t =3D 2000ms: multiload runs
t =3D 3000ms: IDLE
t =3D 4000ms: IDLE
t =3D 5000ms: sensors-applet runs
t =3D 6000ms: cpufreq-monitor runs
t =3D 7000ms: multiload runs
t =3D 8000ms: IDLE
t =3D 9000ms: IDLE
t =3D 10000ms: sensors-applet runs
=2E..

So in a 10 second interval the system will wake up six times instead of=
 two.
This problem leads us to the "gratest common divider" problem [5] in ge=
neral
cases.

By the way, do you know about an applet which can query the registered
processes which used the g_timeout_add*() functions from glib and show =
a graph
or a text representation when they are due (like above)? This could giv=
e a good
overview on a given system.

Another thing is that in case of the cpufreq-monitor applet, which disp=
lays
the actual CPU frequency the polling is not the most efficient way disp=
laying this
information. Assuming that the "ondemand" CPU frequency scaling governo=
r is active
the CPU will only scale up if there is a load on the CPU. This happens =
when the
CPU is active. The frequency downscaling is also happening when the CPU=
 is active.
So in the kernel there is an exact place when this happens. I don't kno=
w if this
kind of information is available for user-space processes, maybe the CP=
UFreq
notifiers [6] can be used for this?

[5] http://en.wikipedia.org/wiki/Greatest_common_divisor

[6] http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;=
a=3Dblob;f=3DDocumentation/cpu-freq/core.txt;hb=3DHEAD#l43

Regards,

	M=C3=A1rton N=C3=A9meth
