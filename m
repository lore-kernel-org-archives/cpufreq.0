From: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Subject: RE: new p4-clockmod capable CPUs
Date: Mon, 2 Oct 2006 16:23:17 -0700
Message-ID: <EB12A50964762B4D8111D55B764A8454ABC291@scsmsx413.amr.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>, cpufreq@lists.linux.org.uk

=20

>-----Original Message-----
>From: Dominik Brodowski [mailto:linux@dominikbrodowski.net]=20
>Sent: Sunday, October 01, 2006 7:06 PM
>To: cpufreq@lists.linux.org.uk; Pallipadi, Venkatesh
>Subject: new p4-clockmod capable CPUs
>
>Hi!
>
>A couple of people have contacted me during my absence from=20
>Linux coding
>regarding new p4-clockmod capable CPUs. These are:
>
>Intel(R) Celeron(R) M CPU 410
>cpu family      : 6
>model           : 14
>stepping        : 8
>
>Intel(R) CPU T2050 [dualcore?]
>cpu family      : 6
>model           : 14
>stepping        : 8
>flags		: ... est ...
>
>Intel(R) Xeon(TM) CPU @ 2.00 GHz [dualcore?]
>cpu family      : 6
>model           : 14
>stepping        : 8
>flags		: ... est ...
>
>Intel(R) Core(TM)2 CPU [dualcore!]
>cpu family      : 6
>model           : 15
>stepping        : 6
>flags		: ... est ...
>
>
>A few questions to the Intel guys:
>
>- Is the method in pentiumM_get_frequency() for these CPUs?
May not work and will need change. The bus speed will not be 100 on all
these CPUs..

>- Is the p4-clockmod algorithm valid (though mostly useless)=20
>for these CPUs?=20
Yes.

>- Is the TSC running continuously even if doing=20
>p4-clockmod-type modulation
>  on these CPUs?
Yes.


Thanks,
Venki
