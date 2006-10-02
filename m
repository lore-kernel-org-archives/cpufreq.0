From: Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: Unsupported CPU by Linux-PHC 0.2.6
Date: Mon, 2 Oct 2006 04:47:00 +0200
Message-ID: <20061002024700.GI19253@isilmar.linta.de>
References: <200609202151.11879.nils.huebner@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <200609202151.11879.nils.huebner@gmx.de>
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
To: Nils =?iso-8859-1?Q?H=FCbner?= <nils.huebner@gmx.de>
Cc: cpufreq@lists.linux.org.uk

Hi,

On Wed, Sep 20, 2006 at 09:51:11PM +0200, Nils H=FCbner wrote:
> Hi everyone,
>=20
> i tried to install Linux-PHC 0.2.6 on my Suse Linux 10.1 with Kernel 2.6.=
18=20
> final.
>=20
> I got this error-message:
> -----------Begin
> Si1520:/home/nils # dmesg|grep speedstep
> speedstep-centrino: found unsupported CPU with Enhanced SpeedStep:=20
> send /proc/cpuinfo to cpufreq@lists.linux.org.u
> -----------End

Does "modprobe acpi-cpufreq" help?

	Dominik
