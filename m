From: Simon Braunschmidt <brasimon@web.de>
Subject: Re: [QUESTION] 3 frequency steps for p3 on windows
Date: Tue, 17 May 2005 17:11:44 +0200
Message-ID: <200505171711.45444.brasimon@web.de>
References: <200505122253.18630.brasimon@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <200505122253.18630.brasimon@web.de>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@lists.linux.org.uk

Am Donnerstag, 12. Mai 2005 22:53 schrieb Simon Braunschmidt:
> Hi,
>
> I have a compaq armada m300 with a speedstep-enabled 600mhz pentium.
> It is running ubuntu so its essentialy a 2.6.10 kernel.
> Scaling the frequency dynamically works very good so far, i can choose
> between ~500mhz and ~600mhz.
>
> However, when i boot into windows xp sp2, after installing some enabler
> programm from the compaq website, the freqency of the cpu is scaled
> dynamically with the THREE steps  ~413mhz, ~500mhz and ~600mhz, the exact
> values for 500 and 600 being the same as in linux.
>
> So in windows i get an extra frequency option for 413mhz not available in
> linux.
>
> Is there any chance of supporting this in linux? Since i only ever heard =
of
> 2 frequency steps for the early p3's, i think this will be a
> compaq-specific behaviour. Is compaq giving out documentation?
>
> please cc me
>
> Greetings
> Simon Braunschmidt
>

After some (random) experimentation (changing from ac to battery while in s=
3=20
state, maybe something more, didnt take notes, seems all unrelated), the=20
frequency steping in linux was ~415mhz and ~500mhz. The values=20
in /sys=AD=AD/.../cpufreq stayed the same, and the max. frequency was now ~=
500mhz=20
(the 600mhz diddnt seem to work anymore).

This behaviour was gone after a reboot and i hadnt been able to reproduce i=
t,=20
strange.

So in principle it is possible under linux to use the "compaq 3 steps=20
behaviour", but the inner workings need to be understood. Any pointers wher=
e=20
i could start?

Greetings
Simon Braunschmidt

>
> simon@heimdal:/sys/devices/system/cpu/cpu0/cpufreq$ uname -a
> Linux heimdal 2.6.10-5-686 #1 Tue Apr 5 12:27:02 UTC 2005 i686 GNU/Linux
>
> simon@heimdal:/sys/devices/system/cpu/cpu0/cpufreq$ cat /proc/cpuinfo
> processor       : 0
> vendor_id       : GenuineIntel
> cpu family      : 6
> model           : 8
> model name      : Pentium III (Coppermine)
> stepping        : 3
> cpu MHz         : 498.115
> cache size      : 256 KB
> fdiv_bug        : no
> hlt_bug         : no
> f00f_bug        : no
> coma_bug        : no
> fpu             : yes
> fpu_exception   : yes
> cpuid level     : 2
> wp              : yes
> flags           : fpu vme de pse tsc msr pae mce cx8 sep mtrr pge mca cmov
> pat pse36 mmx fxsr sse
> bogomips        : 986.45
>
> simon@heimdal:/sys/devices/system/cpu/cpu0/cpufreq$ sudo cat *
> Password:
> 0
> 500000
> 600000
> 500000
> 600000 500000
> userspace ondemand powersave performance
> 500000
> speedstep-smi
> userspace
> 600000
> 500000
> 500000
> simon@heimdal:/sys/devices/system/cpu/cpu0/cpufreq$
