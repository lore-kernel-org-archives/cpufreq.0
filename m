From: "Mateusz Mielnicki" <matim@wp.pl>
Subject: Re: Intel T2250
Date: Thu, 26 Oct 2006 19:38:13 +0200
Message-ID: <4540f2857c34d@wp.pl>
References: <4536b0c818197@wp.pl> <200610190136.48254.len.brown@intel.com>
	<45372f425dbf5@wp.pl> <20061026023405.GE32048@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-reply-to: <4536b0c818197@wp.pl> <200610190136.48254.len.brown@intel.com>
	<45372f425dbf5@wp.pl> <20061026023405.GE32048@dominikbrodowski.de>
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
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq <cpufreq@lists.linux.org.uk>

Well, I don't think so... sadly.

This is what I get in console:

MatiM matim # modprobe speedstep-centrino
FATAL: Error inserting speedstep_centrino (/lib/modules/2.6.17-gentoo-r8-w/=
kernel/arch/i386/kernel/cpu/cpufreq/speedstep-centrino.ko): No such device
MatiM matim # modprobe cpufreq_userspace
MatiM matim # modprobe cpufreq_powersave
MatiM matim # modprobe cpufreq_ondemand
MatiM matim # modprobe cpufreq_conservative
MatiM matim # cpufreq-info
cpufrequtils 001: cpufreq-info (C) Dominik Brodowski 2004-2006
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  no or unknown cpufreq driver is active on this CPU
analyzing CPU 1:
  no or unknown cpufreq driver is active on this CPU
MatiM matim #
MatiM matim # ls /sys/devices/system/cpu/cpu*
/sys/devices/system/cpu/cpu0:
cache  topology

/sys/devices/system/cpu/cpu1:
cache  topology
MatiM matim #
MatiM matim # /etc/init.d/cpufrequtils start
 * Enabling ondemand cpufreq governor ...  [ !! ]unknown or unhandled CPU?
MatiM matim #


As you can see there is nothing that would say it is working...
Is my processor T2250 really supported? I saw that speedstep-centrino conta=
ins clock and voltage information of certain processor's, and this one is n=
ot even mentioned on intel's page. What can I do with it ?
Mateusz


Dnia 26-10-2006 o godz. 4:34 Dominik Brodowski napisa=B3(a):
> On Thu, Oct 19, 2006 at 09:54:42AM +0200, Mateusz Mielnicki wrote:
> > Yes, every module of cpufreq loads, acpi-cpufreq, cpufreq_powersave,
> > cpufreq_conservative, freq_table and so on, excepting speedstep-centrino
> > which gives "No such device".
>=20
> Well, this means that speedstep is working just fine; it uses the
> (preferred) acpi-cpufreq module.
>=20
> 	Dominik
>=20


----------------------------------------------------
Nowa Gra Zakr=EAcone Dynie - sprwd=BC i kliknij:
http://klik.wp.pl/?adr=3Dhttp%3A%2F%2Fadv.reklama.wp.pl%2Fas%2Fd24.html&sid=
=3D911
Czy zakr=EAcisz nimi jeszcze bardziej i zbijesz wszystkie z planszy?
