From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Re: [RFC] cpufreqtools
Date: Mon, 25 Oct 2004 14:42:43 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20041025124242.GA14371@dominikbrodowski.de>
References: <20041021172227.GA24663@dominikbrodowski.de>
	<20041025090139.GC2998@inferi.kami.home>
	<20041025111150.GA7655@dominikbrodowski.de>
	<20041025121743.GH2998@inferi.kami.home>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <20041025121743.GH2998@inferi.kami.home>
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
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

On Mon, Oct 25, 2004 at 02:17:43PM +0200, Mattia Dongili wrote:
> so:
>   if libsysfs present and not --disable-sysfs-interface
>     #define INTERFACE_SYSFS
>   if --enable-proc-interface
>     #define INTERFACE_PROC
> 
>   if neither INTERFACE_SYSFS nor INTERFACE_PROC are defined
>     fail
> 
> does it sound good?

It sounds excellent. Somewhere later
if (--enable-sysfs-interface) && INTERFACE_SYSFS not defined
  fail
if (--disable-proc-interface)
  ignore -- disabled by default, unless --enable-proc-interface is passed

> Also, do you agree in splitting your package in libcpufreq-VERSION and
> cpufreqtools (that depends on the former)?

Yes, at least for the meantime. They may be re-merged into one before
{lib,}cpufreq{,tools}-0.1 is released, though...

Many thanks,
	Dominik
