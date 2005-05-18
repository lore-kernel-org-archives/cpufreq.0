From: Daniel Bonniot <Daniel.Bonniot@inria.fr>
Subject: Centrino: undervolting and further reducing heat
Date: Wed, 18 May 2005 13:36:04 +0200
Message-ID: <d6f982$h87$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: cpufreq@lists.linux.org.uk


Hi,

I have a dothan 1.6 GHz processor, and i've been investigating how to reduc=
e=20
heat to minimize fan usage. One very promising avenue is undervolting.=20
According to several online articles, there is a large potential for=20
undervolting. I ended up modifying speedstep-centrino.c to test it out.=20
Results are very positive: it can run under heavy load at 1.6Ghz with only =

972mV (down from 1340mV). This decreased temperature by 10=B0C! At 600MHz, =
the=20
minimum 700mV was sufficient.

I understand that the driver needs to be conservative by default, but given=
=20
the huge benefits, it would make a lot of sense to offer a way to specify=20
lower voltages to those who want to. Has anybody investigated this=20
possibility, or already started working on it? What would be a good interfa=
ce=20
to specify the voltages?


Independently of this feature, I wonder how it's possible to further reduce=
=20
consumption when the system is mostly ideal, and even 600MHz is more than=20
needed. The idea being to let the system cool down even more in that case. =
Is=20
there any existing way to achive this on linux? One possibility I found in =
the=20
intel docs is the IA32_THERM_CONTROL MSR, which can reduce clock speed by=20
12.5% to 87.5%. Am I right in thinking that it could be combined with=20
speedstep to achieve even lower power consumption states? Are there other=20
possibilities?

Cheers,

Daniel
