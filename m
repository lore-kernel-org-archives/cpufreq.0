From: ncrfgs <ncrfgs@tin.it>
Subject: CPU Frequency Scaling
Date: Thu, 2 Sep 2004 01:01:03 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040901230103.GB4175@ncrfgs3.ncrfgs>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2003757663=="
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
To: cpufreq@www.linux.org.uk


--===============2003757663==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I'm running a vanilla 2.6.8.1 Linux kernel on an iBook 2.2 G3
900 MHz and I'd like to try the CPU frequency scaling.

Is it required to enable "/proc/sys/cpu/ interface (2.4. / OLD)"
in order to be able to use CPU frequency scaling efectively?

The kernel I'm running doesn't include it, I'm using powernowd
as userspace governor and the CPU frequency scaling seems to
work as far as I know from what I read in /proc/cpu* and
/sys/devices/system/cpu/cpu0/cpufreq/* files.

Unfortunately even when /proc/cpuinfo reports a clock of 900MHz
and /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq is set
to 900000 the system looks quite slow to me, for example during
compilation processes, as if the current frequency was 400 MHz.

Do I have to enable "Support for Apple PowerBooks", too?


Some days ago I argued about this issue with a guy from the
debian-powerpc mailing list, too and I faced a strange situation
I didn't understand. According to his kernel config he is using
'performance' as Default CPUFreq governor but as far as I can see
from the 'performance' governor Help it shouldn't allow CPU
Frequency scaling:

  CONFIG_CPU_FREQ_GOV_PERFORMANCE:

  This cpufreq governors set the frequency statically to the
  highest available CPU frequency.


He said that's strange indeed. Nevertheless, He's sure that his frequency is
changing...

"Because the battery life increase by 1 hour with cpufreqd. And Battery
load derivative decrease (absolute value increase) when I use some cpu
intensive programs. Less formally, the more cpu I use the faster my
battery load decrease."

Is it just an impression of his?


Here a portion of his kernel .config file follows.

  CONFIG_CPU_FREQ=3Dy
  # CONFIG_CPU_FREQ_PROC_INTF is not set
  CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
  # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
  CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
  CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dm
  CONFIG_CPU_FREQ_GOV_USERSPACE=3Dm
  # CONFIG_CPU_FREQ_24_API is not set
  CONFIG_CPU_FREQ_PMAC=3Dy
  CONFIG_CPU_FREQ_TABLE=3Dy


As far as I could see from the section of the kernel config he sent me
last time, he compiled 'userspace' governor as a module. So I asked him
if was it loeaded but he answered that is was not.

> cat devices/system/cpu/cpu0/cpufreq/scaling_available_governors
> performance



Thanks in advance.

Best regards.
--=20
Value your freedom, or you will lose it, teaches history.=20
``Don't bother us with politics,'' respond those who don't=20
want to learn.

 -- Richard M. Stallman
    http://www.gnu.org/philosophy/linux-gnu-freedom.html

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFBNlSv8UJozN0kXhkRAnFgAKCGJSlhPJ66db3YBY6kcwnDh9cdLgCg0msL
cZfIvRCk9ynxzoofrNhkffI=
=Qpps
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--


--===============2003757663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cpufreq mailing list
Cpufreq@www.linux.org.uk
http://www.linux.org.uk/mailman/listinfo/cpufreq

--===============2003757663==--

