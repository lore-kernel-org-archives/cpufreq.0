From: yves piel <yvespiel@free.fr>
Subject: Re: [VIA][C3] bad frequencies found
Date: Mon, 14 Nov 2005 23:10:01 +0100
Message-ID: <1132006201.4650.3.camel@linimi.narma.net>
References: <1132003582.7446.7.camel@linimi.narma.net>
	<20051114213909.GC16506@redhat.com>
Reply-To: yvespiel@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
In-Reply-To: <20051114213909.GC16506@redhat.com>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="iso-8859-1"
To: Dave Jones <davej@redhat.com>
Cc: cpufreq@lists.linux.org.uk

Le lundi 14 novembre 2005 =E0 16:39 -0500, Dave Jones a =E9crit :
> On Mon, Nov 14, 2005 at 10:26:22PM +0100, yves piel wrote:
>  >=20
>  > So I should can scale my cpu frequency between 533Mhz and 1.2Ghz. But,
>  > when I load longhaul module, the available cpu frquencies are 800000 f=
or
>  > the min, and 180000 for the max.
>  > How can I tell t the longhaul driver than mys cpu can scale down to
>  > 533Mhz and only up to 1.2Ghz ?
>=20
> My first guess is that we've guessed the FSB incorrectly.
> Can you boot with cpufreq.debug=3D7 and paste the extended
> debug messages that end up in dmesg after loading the module ?
>=20
> 		Dave
>=20
>=20
ho :( I add the option "cpufreq.debug=3D7" into the grub boot line (e for
edition and b to boot), I boot so, but when I load longhaul I have no
more infos into dmesg....

I try this to :
-------------------------------------------------------
linimi:/home/narma# modprobe longhaul cpufreq.debug=3D7
FATAL: Error inserting longhaul
(/lib/modules/2.6.14-1-386/kernel/arch/i386/kernel/cpu/cpufreq/longhaul.ko)=
: Unknown symbol in module, or unknown parameter (see dmesg)
linimi:/home/narma# dmesg |tail
ReiserFS: sda8: checking transaction log (sda8)
ReiserFS: sda8: Using r5 hash to sort names
kjournald starting.  Commit interval 5 seconds
EXT3-fs warning: maximal mount count reached, running e2fsck is
recommended
EXT3 FS on sda9, internal journal
EXT3-fs: mounted filesystem with ordered data mode.
longhaul: VIA C3 'Nehemiah C' [C5N] CPU detected.  Powersaver supported.
longhaul: Unknown parameter `cpufreq.debug'
longhaul: VIA C3 'Nehemiah C' [C5N] CPU detected.  Powersaver supported.
longhaul: Unknown parameter `cpufreq.debug'
-------------------------------------------------------

What should I do ? (maybe I don't know how to pass parameter to the
kernel at boot time...)
