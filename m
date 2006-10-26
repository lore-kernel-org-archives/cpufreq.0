From: "Mateusz Mielnicki" <matim@wp.pl>
Subject: Odp: RE: Intel T2250
Date: Thu, 26 Oct 2006 20:58:22 +0200
Message-ID: <4541054e17553@wp.pl>
References: <EB12A50964762B4D8111D55B764A8454C966B1@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-reply-to: <EB12A50964762B4D8111D55B764A8454C966B1@scsmsx413.amr.corp.intel.com>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Pallipadi Venkatesh <venkatesh.pallipadi@intel.com>
Cc: cpufreq <cpufreq@lists.linux.org.uk>, Dominik Brodowski <linux@dominikbrodowski.net>

With acpi-cpufreq it is as below:

MatiM matim # modprobe acpi_cpufreq
MatiM matim # modprobe cpufreq_stats
MatiM matim # modprobe cpufreq_powersave
MatiM matim # modprobe cpufreq_ondemand
MatiM matim # modprobe cpufreq_userspace
MatiM matim # modprobe cpufreq_conservative
MatiM matim # lsmod
Module                  Size  Used by
cpufreq_conservative     6152  0
cpufreq_userspace       3816  0
cpufreq_ondemand        5324  0
cpufreq_powersave       1728  0
cpufreq_stats           4748  0
acpi_cpufreq            6868  0
freq_table              4744  2 cpufreq_stats,acpi_cpufreq
snd_pcm_oss            38688  0
snd_mixer_oss          14208  2 snd_pcm_oss
i915                   17152  2
usbhid                 30916  0
snd_hda_intel          13972  2
snd_hda_codec         146112  1 snd_hda_intel
thermal                10760  0
processor              22712  2 acpi_cpufreq,thermal
battery                 7620  0
ac                      3588  0
MatiM matim #
MatiM matim # cpufreq-info
cpufrequtils 001: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  no or unknown cpufreq driver is active on this CPU
analyzing CPU 1:
  no or unknown cpufreq driver is active on this CPU
MatiM matim # ls /sys/devices/system/cpu/cpu*
/sys/devices/system/cpu/cpu0:
cache  topology

/sys/devices/system/cpu/cpu1:
cache  online  topology
MatiM matim # /etc/init.d/cpufrequtils start
 * Enabling ondemand cpufreq governor ...  [ !! ]unknown or unhandled CPU?
MatiM matim #

------------------------------------------
Only difference I see is "online" in second processor directory.

MatiM proc # ls -l /proc/cpufreq
ls: /proc/cpufreq: Nie ma takiego pliku ani katalogu
MatiM proc #

-----------------------------------------
But I also found:

MatiM CPU0 # cat /proc/acpi/processor/CPU0/throttling
state count:             8
active state:            T0
states:
   *T0:                  00%
    T1:                  12%
    T2:                  25%
    T3:                  37%
    T4:                  50%
    T5:                  62%
    T6:                  75%
    T7:                  87%
MatiM CPU0 #


Any guess?

Thanks
Mateusz


Dnia 26-10-2006 o godz. 19:48 Pallipadi Venkatesh napisa=B3(a):
>=20
> Can you try the same thing with 'modprobe acpi-cpufreq' instead of=20
> 'modprobe speedstep-centrino' in first line below.
>=20
> Thanks,
> Venki=20
>=20
> >-----Original Message-----
> >From: cpufreq-bounces@lists.linux.org.uk=20
> >[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
> >Mateusz Mielnicki
> >Sent: Thursday, October 26, 2006 10:38 AM
> >To: Dominik Brodowski
> >Cc: cpufreq
> >Subject: Re: Intel T2250
> >
> >Well, I don't think so... sadly.
> >
> >This is what I get in console:
> >
> >MatiM matim # modprobe speedstep-centrino
> >FATAL: Error inserting speedstep_centrino=20
> >(/lib/modules/2.6.17-gentoo-r8-w/kernel/arch/i386/kernel/cpu/cp
> >ufreq/speedstep-centrino.ko): No such device
> >MatiM matim # modprobe cpufreq_userspace
> >MatiM matim # modprobe cpufreq_powersave
> >MatiM matim # modprobe cpufreq_ondemand
> >MatiM matim # modprobe cpufreq_conservative
> >MatiM matim # cpufreq-info
> >cpufrequtils 001: cpufreq-info (C) Dominik Brodowski 2004-2006
> >Report errors and bugs to linux@brodo.de, please.
> >analyzing CPU 0:
> >  no or unknown cpufreq driver is active on this CPU
> >analyzing CPU 1:
> >  no or unknown cpufreq driver is active on this CPU
> >MatiM matim #
> >MatiM matim # ls /sys/devices/system/cpu/cpu*
> >/sys/devices/system/cpu/cpu0:
> >cache  topology
> >
> >/sys/devices/system/cpu/cpu1:
> >cache  topology
> >MatiM matim #
> >MatiM matim # /etc/init.d/cpufrequtils start
> > * Enabling ondemand cpufreq governor ...  [ !! ]unknown or=20
> >unhandled CPU?
> >MatiM matim #
> >
> >
> >As you can see there is nothing that would say it is working...
> >Is my processor T2250 really supported? I saw that=20
> >speedstep-centrino contains clock and voltage information of=20
> >certain processor's, and this one is not even mentioned on=20
> >intel's page. What can I do with it ?
> >Mateusz
> >
> >
> >Dnia 26-10-2006 o godz. 4:34 Dominik Brodowski napisa=B3(a):
> >> On Thu, Oct 19, 2006 at 09:54:42AM +0200, Mateusz Mielnicki wrote:
> >> > Yes, every module of cpufreq loads, acpi-cpufreq,=20
> >cpufreq_powersave,
> >> > cpufreq_conservative, freq_table and so on, excepting=20
> >speedstep-centrino
> >> > which gives "No such device".
> >>=20
> >> Well, this means that speedstep is working just fine; it uses the
> >> (preferred) acpi-cpufreq module.
> >>=20
> >> 	Dominik
> >>=20
> >
> >
> >----------------------------------------------------
> >Nowa Gra Zakr=EAcone Dynie - sprwd=BC i kliknij:
> >http://klik.wp.pl/?adr=3Dhttp%3A%2F%2Fadv.reklama.wp.pl%2Fas%2Fd2
> >4.html&sid=3D911
> >Czy zakr=EAcisz nimi jeszcze bardziej i zbijesz wszystkie z planszy?
> >
> >
> >
> >_______________________________________________
> >Cpufreq mailing list
> >Cpufreq@lists.linux.org.uk
> >http://lists.linux.org.uk/mailman/listinfo/cpufreq
> >
>=20


----------------------------------------------------
Trzy wesela... i niez=B3y cyrk: brytyjska komedia "Confetti"=20
- przeb=F3j Warszawskiego Festiwalu Filmowego: w kinach!
http://klik.wp.pl/?adr=3Dhttp%3A%2F%2Fadv.reklama.wp.pl%2Fas%2Fconfetti.htm=
l&sid=3D912
