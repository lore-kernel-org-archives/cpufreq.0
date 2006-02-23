From: "=?ISO-8859-1?Q?Jes=FAs_Velazquez?=" <jesus.velazquez@gmail.com>
Subject: help acpi-cpufreq
Date: Wed, 22 Feb 2006 18:35:52 -0600
Message-ID: <5876e7e80602221635w52dad6abk36dca5d35d54fe70@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi, Our names are Emmanuel and Jesus

We are trying to load the module acpi_cpufreq unsuccessfully, We have
been trying different Linux Kernel Versions: 2.6.12, 2.6.12.6,
2.6.13.1, 2.6.15.3, 2.6.9, 2.6.10 but in all the cases the error is
the same (also the p4-clockmod):

FATAL: Error inserting acpi_cpufreq
(/lib/modules/XXXXX/kernel/arch/x86_64/kernel/cpufreq/acpi-cpufreq.ko):
No such device

and dmesg command doesn't show anything.

The platform we are using is an Intel Xeon Processor at 2.0 Ghz for 64bits

We are running Suse Linux Enterprise Server 9 service pack 3.

Are there any patch for that problem?

Suffering the web we found that there is a regression for acpi-cpufreq
module, is it correct?, what version of Linux Kernel do we use?, How
can we get more information about this problem?, What "no such device"
means? What other information do you need in order to figure out the
problem?

Thanks
