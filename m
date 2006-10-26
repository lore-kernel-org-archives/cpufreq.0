From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: Intel T2250
Date: Thu, 26 Oct 2006 10:48:09 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454C966B1@scsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-class: urn:content-classes:message
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
content-type: text/plain
To: Mateusz Mielnicki <matim@wp.pl>, Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq <cpufreq@lists.linux.org.uk>


Can you try the same thing with 'modprobe acpi-cpufreq' instead of =
'modprobe speedstep-centrino' in first line below.

Thanks,
Venki=20

>-----Original Message-----
>From: cpufreq-bounces@lists.linux.org.uk=20
>[mailto:cpufreq-bounces@lists.linux.org.uk] On Behalf Of=20
>Mateusz Mielnicki
>Sent: Thursday, October 26, 2006 10:38 AM
>To: Dominik Brodowski
>Cc: cpufreq
>Subject: Re: Intel T2250
>
>Well, I don't think so... sadly.
>
>This is what I get in console:
>
>MatiM matim # modprobe speedstep-centrino
>FATAL: Error inserting speedstep_centrino=20
>(/lib/modules/2.6.17-gentoo-r8-w/kernel/arch/i386/kernel/cpu/cp
>ufreq/speedstep-centrino.ko): No such device
>MatiM matim # modprobe cpufreq_userspace
>MatiM matim # modprobe cpufreq_powersave
>MatiM matim # modprobe cpufreq_ondemand
>MatiM matim # modprobe cpufreq_conservative
>MatiM matim # cpufreq-info
>cpufrequtils 001: cpufreq-info (C) Dominik Brodowski 2004-2006
>Report errors and bugs to linux@brodo.de, please.
>analyzing CPU 0:
>  no or unknown cpufreq driver is active on this CPU
>analyzing CPU 1:
>  no or unknown cpufreq driver is active on this CPU
>MatiM matim #
>MatiM matim # ls /sys/devices/system/cpu/cpu*
>/sys/devices/system/cpu/cpu0:
>cache  topology
>
>/sys/devices/system/cpu/cpu1:
>cache  topology
>MatiM matim #
>MatiM matim # /etc/init.d/cpufrequtils start
> * Enabling ondemand cpufreq governor ...  [ !! ]unknown or=20
>unhandled CPU?
>MatiM matim #
>
>
>As you can see there is nothing that would say it is working...
>Is my processor T2250 really supported? I saw that=20
>speedstep-centrino contains clock and voltage information of=20
>certain processor's, and this one is not even mentioned on=20
>intel's page. What can I do with it ?
>Mateusz
>
>
>Dnia 26-10-2006 o godz. 4:34 Dominik Brodowski napisa=B3(a):
>> On Thu, Oct 19, 2006 at 09:54:42AM +0200, Mateusz Mielnicki wrote:
>> > Yes, every module of cpufreq loads, acpi-cpufreq,=20
>cpufreq_powersave,
>> > cpufreq_conservative, freq_table and so on, excepting=20
>speedstep-centrino
>> > which gives "No such device".
>>=20
>> Well, this means that speedstep is working just fine; it uses the
>> (preferred) acpi-cpufreq module.
>>=20
>> 	Dominik
>>=20
>
>
>----------------------------------------------------
>Nowa Gra Zakr=EAcone Dynie - sprwd=BC i kliknij:
>http://klik.wp.pl/?adr=3Dhttp%3A%2F%2Fadv.reklama.wp.pl%2Fas%2Fd2
>4.html&sid=3D911
>Czy zakr=EAcisz nimi jeszcze bardziej i zbijesz wszystkie z planszy?
>
>
>
>_______________________________________________
>Cpufreq mailing list
>Cpufreq@lists.linux.org.uk
>http://lists.linux.org.uk/mailman/listinfo/cpufreq
>
