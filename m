From: "Moore, Robert" <robert.moore@intel.com>
Subject: RE: [ANNOUNCE] cpufreqd-1.1-rc1 released
Date: Thu, 30 Oct 2003 09:46:02 -0800
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <CFF522B18982EA4481D3A3E23B83141C24B50B@orsmsx407.jf.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
content-class: urn:content-classes:message
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: dongili@supereva.it, CPUFreq Mailing List <cpufreq@www.linux.org.uk>

Does this support the new ondemand governor?
Bob


-----Original Message-----
From: Mattia Dongili [mailto:dongili@supereva.it]=20
Sent: Sunday, October 26, 2003 8:57 AM
To: CPUFreq Mailing List
Subject: [ANNOUNCE] cpufreqd-1.1-rc1 released

cpufreqd-1.1-rc1 has been released.

This release adds 2 major feature like cpu monitoring and PMU support,
plus a bunch of fixes and a workaround to avoid reading
/proc/acpi/battery/*/info if your ACPI implementation is very cpu
consuming.

packages (clean source, debian-src and debian-i386) are available at:

http://www.sourceforge.net/projects/cpufreqd

cpufreqd is meant to be a replacement of the speedstep applet you can
find on some other OS, it monitors CPU, battery level, AC state and
running programs and adjusts the frequency governor according to a set
of rules specified in the config file.

The only enhancement I'll add before 1.1 is a paremeter to select which
resources to poll.
 =20
thanks (and sorry for the noise)
--=20
mattia
:wq!

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq
