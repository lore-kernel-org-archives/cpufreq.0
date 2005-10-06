From: Dave Jones <davej@redhat.com>
Subject: Re: Ondemand governor not working with kernel-2.6.12-12mdk
Date: Thu, 6 Oct 2005 14:13:08 -0400
Message-ID: <20051006181308.GB31529@redhat.com>
References: <20051006125246.56683.qmail@web32704.mail.mud.yahoo.com>
	<43453B80.5060604@tremplin-utc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <43453B80.5060604@tremplin-utc.net>
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
To: Eric Piel <Eric.Piel@tremplin-utc.net>
Cc: cpufreq@www.linux.org.uk, Alex Simonov <a_simonov@yahoo.com>

On Thu, Oct 06, 2005 at 04:58:08PM +0200, Eric Piel wrote:
 > 10/06/2005 02:52 PM, Alex Simonov wrote/a =E9crit:
 > >Hello everybody,
 > >
 > >Recently I installed Mandrake Linux with kernel
 > >2.6.12 on my laptop, and noticed, that the
 > >ondemand governor is not working, only the
 > >powersave, and performance governors.
 > >
 > >Anyone has an idea what could be the reason?
 > >Please tell me if you need any other info for
 > >better diagnosing the problem.
 > >
 > >The System is:
 > >
 > >HP Omnibook 510
 > >Pentium III CPU 1133 Mhz/440BX chipset.
 > >Cpufreq modules are compiled directly in the
 > >kernel.
 > Which driver does it use? Check it by doing:
 >=20
 > cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_driver
 >=20
 > My guess is that you use a driver which doesn't know the transition=20
 > latency and therefore the ondemand governor doesn't want to take the=20
 > job. The easiest workaround is to use any userspace program (like=20
 > cpufreqd), they are not as shy as the ondemand governor...
 >=20
 > The real way to fix it will be to find the correct transition latency of=
=20
 > your processor and update the driver. (If the driver is speedstep-ich,=20
 > I'm already working on it with Venki and I can send you a patch for tria=
l)

That's first generation speedstep. Speedstep-ich driver uses CPUFREQ_ETERNA=
L.

		Dave
