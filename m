From: Stefan Eder <ederstefan@gmx.de>
Subject: Re: Intel Core2Quad Q6600 2,4 GHz Socket775 FSB1066
Date: Thu, 27 Sep 2007 23:33:14 +0200
Message-ID: <200709272333.14046.ederstefan@gmx.de>
References: <200709272259.18445.ederstefan@gmx.de>
	<46FC1E3E.6070200@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <46FC1E3E.6070200@redhat.com>
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
To: cpufreq@lists.linux.org.uk

Am Donnerstag, 27. September 2007 23:18:54 schrieb Jarod Wilson:
> Stefan Eder wrote:
> > Hallo everyone,
> > ist there a chance for powersaving with the following CPU?
>
> Yes.
>
> > And if so, what are
> > the related modules to load?
>
> acpi-cpufreq for freq scaling support, cpufreq-ondemand for your
> governor (may be built-in though)

Hallo, tried this module on openSUSE 10.3 RC1:

modprobe acpi-cpufreq
FATAL: Error inserting acpi_cpufreq 
(/lib/modules/2.6.22.5-29-bigsmp/kernel/arch/i386/kernel/cpu/cpufreq/acpi-cpufreq.ko): 
No such device

Thank you.
